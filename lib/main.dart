import 'dart:io';

import 'package:exam/screen/Contact/add.dart';
import 'package:exam/screen/Contact/contact.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=> Contact_Screen(),
        'add':(context)=> Add_Screen(),

      },
    )
  );

}
