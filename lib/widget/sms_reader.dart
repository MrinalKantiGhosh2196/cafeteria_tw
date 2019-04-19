import 'package:flutter/material.dart';
import "package:sms/sms.dart";

class MySmsReceiver extends StatefulWidget {
  @override
  _MySmsReceiverState createState() => _MySmsReceiverState();
}

class _MySmsReceiverState extends State<MySmsReceiver> {
  List<String> receivedMessages = [];
  List<String> _smsAddress = [];



  void _startListening() {
    SmsReceiver receiver = SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) {
      print(receivedMessages.toString());
      print(_smsAddress.toString());
      setState(() {
        receivedMessages.add(msg.body);
        _smsAddress.add(msg.address);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SMS Listener App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: Text(receivedMessages.toString()),
            ),
            RaisedButton(
              child: Text("Start Listening"),
              onPressed: _startListening,
            ),
          ],
        ),
      ),
    );
  }
}
