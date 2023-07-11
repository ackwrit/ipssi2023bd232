import 'package:flutter/material.dart';

class DataMaps extends StatefulWidget {
  const DataMaps({Key? key}) : super(key: key);

  @override
  State<DataMaps> createState() => _DataMapsState();
}

class _DataMapsState extends State<DataMaps> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Vous avez accès à la carte"),
    );
  }
}
