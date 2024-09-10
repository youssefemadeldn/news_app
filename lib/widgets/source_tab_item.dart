import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';

class SourceTabItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  SourceTabItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.green,
        ),
      ),
    );
  }
}
