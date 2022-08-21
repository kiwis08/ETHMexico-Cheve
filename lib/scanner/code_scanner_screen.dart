import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ethmexico/model/wallet_manager.dart';
import 'package:wallet_connect/wallet_connect.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:go_router/go_router.dart';

class CodeScannerScreen extends StatefulWidget {
  const CodeScannerScreen({Key? key}) : super(key: key);

  @override
  State<CodeScannerScreen> createState() => _CodeScannerScreenState();
}
const maticRpcUri =
    'https://rpc-mainnet.maticvigil.com/v1/140d92ff81094f0f3d7babde06603390d7e581be';

enum MenuItems {
  PREVIOUS_SESSION,
  KILL_SESSION,
  SCAN_QR,
  PASTE_CODE,
  CLEAR_CACHE,
}

class _CodeScannerScreenState extends State<CodeScannerScreen> {
  late WCClient _wcClient;
  late TextEditingController _textEditingController;
  late String walletAddress, privateKey;
  bool connected = false;
  WCSessionStore? _sessionStore;
  final _web3client = Web3Client(
    maticRpcUri,
    http.Client(),
  );

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  _initialize() async {
    _wcClient = WCClient(
      onSessionRequest: _onSessionRequest,
      onFailure: _onSessionError,
      onDisconnect: _onSessionClosed,
      onEthSign: _onSign,
      onEthSignTransaction: _onSignTransaction,
      onEthSendTransaction: _onSendTransaction,
      onCustomRequest: (_, __) {},
      onConnect: _onConnect,
    );
    walletAddress = '';
    privateKey = '';
    _textEditingController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, arguments) {
          if (barcode.rawValue != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(barcode.rawValue!)));
            final value = barcode.rawValue!;
            _qrScanHandler(value);
          }
        },
      ),
    );
  }

  _qrScanHandler(String value) {
    final session = WCSession.from(value);
    debugPrint('session $session');
    final peerMeta = WCPeerMeta(
      name: "Example Wallet",
      url: "https://example.wallet",
      description: "Example Wallet",
      icons: [
        "https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png"
      ],
    );
    _wcClient.connectNewSession(session: session, peerMeta: peerMeta);
  }

  _connectToPreviousSession() {
  }

  _onConnect() {
    setState(() {
      connected = true;
    });
  }

  _onSessionRequest(int id, WCPeerMeta peerMeta) {
    showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          title: Column(
            children: [
              if (peerMeta.icons.isNotEmpty)
                Container(
                  height: 100.0,
                  width: 100.0,
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Image.network(peerMeta.icons.first),
                ),
              Text(peerMeta.name),
            ],
          ),
          contentPadding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
          children: [
            if (peerMeta.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(peerMeta.description),
              ),
            if (peerMeta.url.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Connection to ${peerMeta.url}'),
              ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () async {
                      _wcClient.approveSession(
                        accounts: [walletAddress],
                        // TODO: Mention Chain ID while connecting
                        chainId: 1,
                      );
                      _sessionStore = _wcClient.sessionStore;
                      Navigator.pop(context);
                    },
                    child: Text('APPROVE'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {
                      _wcClient.rejectSession();
                      Navigator.pop(context);
                    },
                    child: Text('REJECT'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ).then((value) => context.pop());
  }

  _onSessionError(dynamic message) {
    setState(() {
      connected = false;
    });
    showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          title: Text("Error"),
          contentPadding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Some Error Occured. $message'),
            ),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('CLOSE'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _onSessionClosed(int? code, String? reason) {

  }

  _onSignTransaction(
      int id,
      WCEthereumTransaction ethereumTransaction,
      ) {
  }

  _onSendTransaction(
      int id,
      WCEthereumTransaction ethereumTransaction,
      ) {

  }

  _onTransaction({
    required int id,
    required WCEthereumTransaction ethereumTransaction,
    required String title,
    required VoidCallback onConfirm,
    required VoidCallback onReject,
  }) async {
  }

  _onSign(
      int id,
      WCEthereumSignMessage ethereumSignMessage,
      ) {
    final decoded = (ethereumSignMessage.type == WCSignType.TYPED_MESSAGE)
        ? ethereumSignMessage.data!
        : ascii.decode(hexToBytes(ethereumSignMessage.data!));
    showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          title: Column(
            children: [
              if (_wcClient.remotePeerMeta!.icons.isNotEmpty)
                Container(
                  height: 100.0,
                  width: 100.0,
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Image.network(_wcClient.remotePeerMeta!.icons.first),
                ),
              Text(
                _wcClient.remotePeerMeta!.name,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          contentPadding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Sign Message',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Theme(
              data:
              Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    'Message',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  children: [
                    Text(
                      decoded,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () async {

                      Navigator.pop(context);
                    },
                    child: Text('SIGN'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {
                      _wcClient.rejectRequest(id: id);
                      Navigator.pop(context);
                    },
                    child: Text('REJECT'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
