import 'package:flutter/material.dart';

class NoDataMaps extends StatefulWidget {
  const NoDataMaps({Key? key}) : super(key: key);

  @override
  State<NoDataMaps> createState() => _NoDataMapsState();
}

class _NoDataMapsState extends State<NoDataMaps> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Vous n'avez pas accès à la carte"),
    );
  }
}
