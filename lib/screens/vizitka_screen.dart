import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VizitkaScreen extends StatelessWidget {
  const VizitkaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    // фото 50*50pxs, фио, увлечения, навыки в разработке (можно сильно не увлекаться, перечисления 4-5 навыков достаточно)
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/selfie.png',
            width: 50,
            height: 50,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 10),
          Text(
            'Зеленько Илья Алексеевич',
            style: theme.headline5,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'Увлекаюсь фитнесом, fullstack разработкой, выращиваю дома питона.'
            '\n\n 3 года с Vue, написание большого проекта с нуля в соло и выпуск в prod, стресоустойчивость.',
            // style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
