import 'package:flutter/material.dart';
import "package:sms/sms.dart";

class MySmsReceiver extends StatefulWidget {
  @override
  _MySmsReceiverState createState() => _MySmsReceiverState();
}

class _MySmsReceiverState extends State<MySmsReceiver> {
  String receivedMessages;
  String _smsAddress;

  @override
  void initState() {
    super.initState();
    _startListening();
  }



  void _startListening() {
    SmsReceiver receiver = SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) {
      setState(() {
        receivedMessages = msg.body;
        _smsAddress = msg.address;
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
              child: _printMessage(),
            ),
            RaisedButton(
              child: Text("Send Message"),
              onPressed: _sendMessage,
            ),
            
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    SmsSender sender = new SmsSender();
    String address = "9886765684";
    sender.sendSms(new SmsMessage(address, 'Hello flutter!'));
  }

  Widget _printMessage() {
    if(receivedMessages != null) {
      return Text(receivedMessages + " from " + _smsAddress);
    }
    return Container();
  }
}
