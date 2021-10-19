import 'package:flutter/material.dart';

 getDataRow({
   required String text1,
   required String text2,
   required String text3,}){

  return DataRow(
      cells: [
        DataCell(Text(text1, style: TextStyle(color: Colors.white70),)),
        DataCell(Text(text2, style: TextStyle(color: Colors.white70),)),
        DataCell(Text(text3, style: TextStyle(color: Colors.white70),)),
      ]);

 }