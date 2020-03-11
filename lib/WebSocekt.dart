import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket extends StatefulWidget {
  String title;
  WebSocketChannel channel;

  WebSocket({Key key, @required this.title, @required this.channel})
      : super(key: key);


  @override
  WebSocketState createState() => WebSocketState();

}

class WebSocketState extends State<WebSocket> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),

      body:Padding(padding: EdgeInsets.all(20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Form(child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(labelText: "Send a message"),
        )),
        StreamBuilder(stream: widget.channel.stream,
        builder: (context, snapshot){
          return Padding(padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Text(snapshot.hasData ? '${snapshot.data}':''),);
        },)

      ],),),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send Message',
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}