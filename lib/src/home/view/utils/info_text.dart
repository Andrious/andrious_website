import 'package:andrious/src/view.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
    required this.type,
    required this.text,
    this.fontSize = 16,
    this.selectable = false,
  }) : super(key: key);
  final String type;
  final String text;
  final double fontSize;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    //
    final style = TextStyle(
      color: Colors.blueGrey[100],
      fontSize: fontSize,
    );

    Widget _text;

    if (selectable) {
      _text = SelectableText(
        text,
        style: style,
      );
    } else {
      _text = Text(
        text,
        style: style,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (type.isNotEmpty)
          Text(
            '$type: ',
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: fontSize,
            ),
          ),
        Flexible(child: _text)
      ],
    );
  }
}
