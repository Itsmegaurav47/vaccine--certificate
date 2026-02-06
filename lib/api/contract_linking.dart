import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://192.168.0.5:7545";
  final String _wsUrl = "ws://192.168.0.5:7545/";
  final String _privateKey =
      "fbc95226f68e497f4feeca3fa0c735eb315682cc2d2cd1a97a4cca03db511eca";
  late Web3Client _client;
  bool isLoading = true;

  late String _abiCode;
  late EthereumAddress _contractAddress;

  late Credentials _credentials;

  late DeployedContract _contract;

  late ContractFunction _getApprovedVaccinesLength;
  late ContractFunction _approveVaccine;
  late ContractFunction _getRequiredVaccineCount;

  late String deployedName;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {
    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websocket instead of
    // http-polls. However, the socketConnector property is experimental.
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    // Reading the contract abi
    String abiStringFile =
        await rootBundle.loadString("assets/Vaccination.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);

    //
    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }

  Future<void> getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {
    // Telling Web3dart where our contract is declared.
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Vaccination"), _contractAddress);

    // Extracting the functions, declared in contract.
    _approveVaccine = _contract.function("approveVaccine");
    _getApprovedVaccinesLength =
        _contract.function("getApprovedVaccinesLength");
    _getRequiredVaccineCount = _contract.function("getRequiredVaccineCount");
    getApprovedVaccinesLength();
  }

  getApprovedVaccinesLength() async {
    // Getting the current name declared in the smart contract.
    var currentName = await _client.call(
        contract: _contract, function: _getApprovedVaccinesLength, params: []);
    return currentName[0];
  }

  approveVaccine(String vaccineName, List<BigInt> schedule) async {
    // Setting the name to nameToSet(name defined by user)
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _approveVaccine,
            parameters: [vaccineName, schedule]));
    return 'Verocell';
  }

  getRequiredVaccineCount(String vaccineName) async {
    var result = await _client.call(
        contract: _contract,
        function: _getRequiredVaccineCount,
        params: [vaccineName]);
    return result[0].toString();
  }
}
