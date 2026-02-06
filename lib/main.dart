import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine_frontend/api/contract_linking.dart';
import 'package:vaccine_frontend/pages/newWallet.dart';
import 'package:vaccine_frontend/pages/registration.dart';
import 'package:vaccine_frontend/pages/vaccinationStatus.dart';
import 'package:vaccine_frontend/pages/stats.dart';
import 'package:vaccine_frontend/pages/walletSetup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<ContractLinking>(
      create: (_) => ContractLinking(),
      child: MaterialApp(
        routes: {
          '/': (context) => Home(),
          '/stats': (context) => Stats(),
          '/vaccinationStatus': (context) => VaccinationStatus(),
          '/registration': (context) => Registration(),
          '/walletSetup': (context) => WalletSetup(),
          '/newWallet': (context) => NewWallet(storage: WalletStorage()),
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vaccination'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text('VaccinationStatus'),
                        onPressed: () => {
                          Navigator.pushNamed(context, '/vaccinationStatus')
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Registration'),
                        onPressed: () =>
                            {Navigator.pushNamed(context, '/registration')},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Stats'),
                        onPressed: () =>
                            {Navigator.pushNamed(context, '/stats')},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Wallet Setup'),
                        onPressed: () =>
                            {Navigator.pushNamed(context, '/walletSetup')},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
