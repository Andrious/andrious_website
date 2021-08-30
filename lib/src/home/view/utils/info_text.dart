import 'package:andrious/src/view.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    Key? key,
    required this.type,
    required this.text,
    this.selectable = false,
  }) : super(key: key);
  final String type;
  final String text;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    //
    final style = TextStyle(
      color: Colors.blueGrey[100],
      fontSize: 16,
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
              fontSize: 16,
            ),
          ),
        Flexible(child: _text)
      ],
    );
  }
}
