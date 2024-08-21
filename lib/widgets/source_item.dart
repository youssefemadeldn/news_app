import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';

class SourceItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  SourceItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.green),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            source.name ?? "",
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
