import 'package:exam/screen/Contact/contact.dart';
import 'package:flutter/material.dart';

import 'modal_class.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({Key? key}) : super(key: key);

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  TextEditingController txtna=TextEditingController();
  TextEditingController txtcon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(controller: txtna,),
            TextField(controller: txtcon,),
            ElevatedButton(onPressed: () {

              String name =txtna.text;
              String contact =txtcon.text;
              Data d1 =Data(name: name,phone: contact);
              contactList.add(d1);
              Navigator.pop(context);


            }, child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
