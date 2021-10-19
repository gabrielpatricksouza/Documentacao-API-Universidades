import 'package:flutter/material.dart';

class Responsive{
  static builder(context, double valor){
    return MediaQuery.of(context).size.width * valor;
  }
}