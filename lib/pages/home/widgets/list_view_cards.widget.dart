import 'package:flutter/material.dart';

class ListViewCards extends StatelessWidget {
  const ListViewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 10,
          child: Row(
            children: [
              Image.asset("assets/images/rick.png", height: 200, width: 100),
            ],
          ),
        );
      },
    );
  }
}
