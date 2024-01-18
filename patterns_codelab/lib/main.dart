import 'package:flutter/material.dart';

import 'data.dart';

void main() {
  runApp(const DocumentApp());
}

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: DocumentScreen(
        document: Document(),
      ),
    );
  }
}

class DocumentScreen extends StatelessWidget {
  final Document document;

  const DocumentScreen({
    required this.document,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var (tittle, :modified) = document.getMetadata3();
    var blocks = document.getBlock();
    var formattedModifiedDate = formatDate(modified);

    return Scaffold(
      appBar: AppBar(
        title: Text(tittle),
      ),
      body: Column(
        children: [
          Text('Last modified: $formattedModifiedDate'),
          Expanded(
            child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context, index) {
                return BlockWidget(block: blocks[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class BlockWidget extends StatelessWidget {
  final Block block;

  const BlockWidget({
    required this.block,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: switch (block) {
        HeaderBlock(:var text) => Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        ParagraphBlock(:var text) => Text(text),
        CheckboxBlock(:var text, :var isChecked) => Row(
          children: [
            Checkbox(value: isChecked, onChanged: (_) {}),
            Text(text)
          ],
        ),
      }
    );
  }
}

String formatDate(DateTime dateTime) {
  var today = DateTime.now();
  var difference = dateTime.difference(today);

  return switch(difference) {
    Duration(inDays: 0) => 'today',
    Duration(inDays: 1) => 'tomorrow',
    Duration(inDays: -1) => 'yesterday',
    Duration(inDays: var days) when days > 7 => '${days ~/ 7} weeks from now',
    Duration(inDays: var days) when days < -7 => '${days.abs() ~/ 7} weeks ago',
    Duration(inDays: var days, isNegative: true) => '${days.abs()} days ago',
    Duration(inDays: var days) => '$days days from now',
  };
}