import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const textColor = Color(0xFF5E5D5D);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/img/No_data.svg',
              semanticsLabel: 'No data image'),
          const SizedBox(
            height: 10,
          ),
          Text(
            'No data found',
            style: textTheme.titleMedium!.copyWith(
              color: textColor,
              fontSize: 16,
              letterSpacing: 0
            ),
          ),
          Text(
            'Please add a city to track it’s weather',
            style: textTheme.bodyMedium!.copyWith(
              color: textColor,
              fontSize: 12,
              letterSpacing: 0
            ),
          )
        ],
      ),
    );
  }
}
