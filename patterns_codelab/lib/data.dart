import 'dart:convert';

class Document {
  final Map<String, Object?> _json;
  Document() : _json = jsonDecode(documentJson);

  (String, {DateTime modified}) getMetadata1() {
    var tittle = "My Document > Heui Yong!";
    var now = DateTime.now();

    return (tittle, modified: now);
  }

  (String, {DateTime modified}) getMetadata2() {
    if (_json.containsKey('metadata')) {
      var metadataJson = _json['metadata'];

      if (metadataJson is Map) {
        var tittle = "${metadataJson['title'] as String} > Read JSON values without patterns";
        var localModified = DateTime.parse(metadataJson['modified'] as String);

        return (tittle, modified: localModified);
      }
    }
    throw const FormatException('Unexpected JSON');
  }

  (String, {DateTime modified}) getMetadata3() {
    if (_json
        case{
          'metadata': {
            'title': String title,
            'modified': String localModified,
          }
        }) {
      return ("$title > Read JSON values using a map pattern", modified: DateTime.parse(localModified));
    } else {
      throw const FormatException('Unexpected JSON');
    }
  }

  List<Block> getBlock() {
    if (_json case {'blocks' : List blocksJson}) {
      return <Block>[
        for (var blockJson in blocksJson) Block.fromJson(blockJson)
      ];
    } else {
      throw const FormatException('Unexpected JSON');
    }
  }
}

sealed class Block {
  Block();

  factory Block.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {'type': 'h1', 'text': String text} => HeaderBlock(text),
      {'type': 'p', 'text': String text} => ParagraphBlock(text),
      {'type': 'checkbox', 'text': String text, 'checked': bool checked} =>
          CheckboxBlock(text, checked),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }
}

class HeaderBlock extends Block {
  final String text;
  HeaderBlock(this.text);
}

class ParagraphBlock extends Block {
  final String text;
  ParagraphBlock(this.text);
}

class CheckboxBlock extends Block {
  final String text;
  final bool isChecked;
  CheckboxBlock(this.text, this.isChecked);
}

const documentJson = '''
{
  "metadata": {
    "title": "My Document",
    "modified": "2024-01-18"
  },
  "blocks": [
    {
      "type": "h1",
      "text": "Chapter 1"
    },
    {
      "type": "p",
      "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      "type": "checkbox",
      "checked": true,
      "text": "Learn Dart 3"
    }
  ]
}
''';