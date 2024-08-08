import 'package:flutter/material.dart';
import 'package:interview_flutter/theme/colors.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      surfaceTintColor: colorScheme.background,
      color: colorScheme.background,
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.surface),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [_buildTitle(context), _buildTimeStamp(context)],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Flexible(
        flex: 2,
        fit: FlexFit.tight,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Miami', style: textTheme.titleMedium),
              Text(
                'This is my favourite city',
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ));
  }

  Widget _buildTimeStamp(BuildContext context) {
    return Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Container(
            color: ThemeColors.secondary,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/img/SunIcon.png'),
                Text(
                  '11:00 A.M',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),
        ));
  }
}
