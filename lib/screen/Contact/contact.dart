import 'package:exam/screen/Contact/modal_class.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


List<Data> contactList=[
  Data(name: 'Dixit',phone: '7845212962'),
  Data(name: 'jay',phone: '5487896532'),
  Data(name: 'savan',phone: '8965325487'),
  Data(name: 'kunal',phone: '7845213265'),
  Data(name: 'dhruv',phone: '8754212559'),
  Data(name: 'krish',phone: '6932548712'),

];
class Contact_Screen extends StatefulWidget {
  const Contact_Screen({Key? key}) : super(key: key);

  @override
  State<Contact_Screen> createState() => _Contact_ScreenState();
}

class _Contact_ScreenState extends State<Contact_Screen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("My Contact"),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintText: 'Serch the contact',
              ),
            ),
          ),
          Divider(height: 10),

          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return mywidget(
                  contactList[index].name, contactList[index].phone,index);
            },
              itemCount: contactList.length,),
          ),
        ],
      ),
          floatingActionButton: IconButton(onPressed: () {
            Navigator.pushNamed(context, 'add').then((value) {
              setState(() {

              });
            });
          }, icon: Icon(Icons.add)),
    ));
  }
  Widget mywidget(String? data, String? pho,int index)
  {
    return ExpansionTile(
      title: Text("$data", style: TextStyle(color: Colors.black),),
    leading:IconButton(onPressed: () async {
      String link = "tel: ${contactList[index].phone}";
      await launchUrl(Uri.parse(link));
    }, icon: Icon(Icons.call)),
    subtitle: Text("$pho", style: TextStyle(color: Colors.blueGrey),),
      children: [
        IconButton(onPressed: () async {

          Uri uri = Uri(scheme: "sms",
              path: "${contactList[index].phone}",
              queryParameters: {"body": "Contact app"});
          await launchUrl(uri);
        }, icon: Icon(Icons.message, color: Colors.amber,)),
        IconButton(onPressed: () {


          Share.share(
              "${contactList[index].name}\n ${contactList[index].phone}");


        }, icon: Icon(Icons.share, color: Colors.green,)),
        IconButton(onPressed: () async {


          String link = "https://www.amazon.in/";
          await launchUrl(Uri.parse(link));


        }, icon: Icon(Icons.web, color: Colors.black,)),

      ],
    );
  }
}
