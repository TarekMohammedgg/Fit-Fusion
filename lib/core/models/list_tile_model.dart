import 'package:flutter/widgets.dart';

class ListTileModel {
  final String title ; 
  final IconData icon ;
  final String trialing ; 

  const ListTileModel({required this.title,required this.icon , this.trialing = "" } ); 

}