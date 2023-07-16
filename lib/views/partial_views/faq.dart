import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  final String? question;
  final String? answer;
  final String? index;

  const Faq({Key? key, this.question, this.answer, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 320,
      width: size.width * 0.6,
      child: ListTile(
        leading: const Icon(Icons.lightbulb),
        title: Text(
          "Question : ${question!}",
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          answer!,
          style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
