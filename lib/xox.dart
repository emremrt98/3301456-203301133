import 'package:flutter/material.dart';

class XOXHomePage extends StatefulWidget {
  @override
  _XOXHomePageState createState() => _XOXHomePageState();
}

class _XOXHomePageState extends State<XOXHomePage> {
  List<String> _board = List.filled(9, '');
  String _currentPlayer = "X";
  String? _winner;

  @override
  void initState() {
    super.initState();
    _newGame();
  }

  void _newGame() {
    setState(() {
      _board = List.filled(9, '');
      _currentPlayer = 'X';
      _winner = null;
    });
  }

  void _play(int index) {
    if (_winner != null || _board[index].isNotEmpty) return;
    setState(() {
      _board[index] = _currentPlayer;
      if (_checkWin()) {
        _winner = _currentPlayer;
      } else if (!_board.any((cell) => cell.isEmpty)) {
        _winner = 'draw';
      } else {
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      }
    });
  }

  bool _checkWin() {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (_board[i].isNotEmpty &&
          _board[i] == _board[i + 1] &&
          _board[i + 1] == _board[i + 2]) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (_board[i].isNotEmpty &&
          _board[i] == _board[i + 3] &&
          _board[i + 3] == _board[i + 6]) {
        return true;
      }
    }

    // Check diagonals
    if (_board[0].isNotEmpty &&
        _board[0] == _board[4] &&
        _board[4] == _board[8]) {
      return true;
    }
    if (_board[2].isNotEmpty &&
        _board[2] == _board[4] &&
        _board[4] == _board[6]) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XOX Oyunu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: _board.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _play(index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        _board[index],
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            if (_winner != null)
              Column(
                children: [
                  Text(
                    _winner == 'draw' ? 'Oyun Berabere' : 'Kazanan: $_winner',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _newGame,
                    child: Text('Yeni Oyun Başlat'),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
