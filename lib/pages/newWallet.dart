import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web3dart/credentials.dart';

// ignore: must_be_immutable
class NewWallet extends StatefulWidget {
  const NewWallet({Key? key, required this.storage}) : super(key: key);
  final WalletStorage storage;
  @override
  _NewWalletState createState() => _NewWalletState();
}

class _NewWalletState extends State<NewWallet> {
  void createWallet() {
    print('Creating a new key');
    var privateKey = EthPrivateKey.createRandom(Random.secure());
    var wallet = Wallet.createNew(privateKey, 'password123', Random.secure(),
        scryptN: 2);
    var walletJson = wallet.toJson();
    widget.storage.storeWallet(walletJson);
  }

  void openRecentWallet() async {
    var walletJson = await widget.storage.readWallet();
    print(walletJson);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('New Wallet'),
        ),
        body: Column(
          children: [
            ElevatedButton(
                child: Text('Create Now'), onPressed: () => createWallet()),
            ElevatedButton(
                onPressed: () => {openRecentWallet()},
                child: Text('Open Recent'))
          ],
        ),
      ),
    );
  }
}

class WalletStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/counter.txt');
  }

  Future<String> readWallet() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  Future<File> storeWallet(String walletData) async {
    final file = await _localFile;

    // Write the file
    print('wrinting $walletData');
    return file.writeAsString(walletData);
  }
}
