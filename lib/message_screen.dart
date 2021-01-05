import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mm_message_qr/const.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  ScrollController controller = new ScrollController();
  TextEditingController getText = TextEditingController();
  FocusNode focusNode;
  String formattedDate =
      DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 160,
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: message.length,
                        scrollDirection: Axis.vertical,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(90,10,10,10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              width:50 ,
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                          child: SingleChildScrollView(
                                        child: Text(
                                          message[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        formattedDate,
                                        style: TextStyle(color: Colors.white60),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    child: TextFormField(
                      focusNode: focusNode,
                      autofocus: true,
                      onFieldSubmitted: (String str) {
                        setState(() {
                          getText.text = str;
                          message.add(getText.text);
                          controller.jumpTo(controller.position.maxScrollExtent);

                        });

                      },
                      controller: getText,
                      decoration: InputDecoration(
                          labelText: "Your Message",
                          suffixIcon: Container(
                              width: 20,
                              height: 20,
                              child: IconButton(
                                icon: Icon(
                                  Icons.send,
                                ),
                                onPressed: () {
                                  setState(() {
                                    message.add(getText.text);
                                    controller.animateTo(
                                        controller.position.maxScrollExtent);
                                  });

                                },
                              )),
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
