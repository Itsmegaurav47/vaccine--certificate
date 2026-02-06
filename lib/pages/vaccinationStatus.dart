import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaccine_frontend/api/contract_linking.dart';

class VaccinationStatus extends StatelessWidget {
  void getApprovedVaccinesLength(BuildContext context) async {
    final contractLinking =
        Provider.of<ContractLinking>(context, listen: false);
    final len = await contractLinking.getApprovedVaccinesLength();
    print(len);
  }

  void approveVaccine(
      BuildContext context, String vaccineName, List<BigInt> schedule) async {
    final contractLinking =
        Provider.of<ContractLinking>(context, listen: false);
    final len = await contractLinking.approveVaccine(vaccineName, schedule);
    print(len);
  }

  void getRequiredVaccineCount(BuildContext context, String vaccineName) async {
    final contractLinking =
        Provider.of<ContractLinking>(context, listen: false);
    final len = await contractLinking.getRequiredVaccineCount(vaccineName);
    print(len);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vaccination Status'),
          automaticallyImplyLeading: true,
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
                        child: Text('Total Vaccines'),
                        onPressed: () => {getApprovedVaccinesLength(context)},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Approve Vaccine'),
                        onPressed: () => {
                          approveVaccine(context, 'Verocell',
                              [BigInt.from(0), BigInt.from(24)])
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Get Approved Vaccines Length'),
                        onPressed: () =>
                            {getRequiredVaccineCount(context, 'Verocell')},
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
