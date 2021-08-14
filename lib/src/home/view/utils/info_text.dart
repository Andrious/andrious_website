import 'package:andrious/src/view.dart';

class InfoText extends StatelessWidget {
  const InfoText({required this.type, required this.text, Key? key})
      : super(key: key);
  final String type;
  final String text;

  @override
  Widget build(BuildContext context) {
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
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.blueGrey[100],
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
