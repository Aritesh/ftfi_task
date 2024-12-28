import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    final headlineSmallStyle =
        Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: isDarkMode ? Colors.grey : Colors.white,
              fontWeight: FontWeight.w400,
            );

    final headlineLargeStyle =
        Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            );

    final titleSmallStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          color: isDarkMode ? Colors.grey : Colors.white,
        );

    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: screenWidth < 900
          ? MainAxisAlignment.center // Center vertically for small devices
          : MainAxisAlignment.start, // Align to start for larger devices
      crossAxisAlignment: screenWidth < 900
          ? CrossAxisAlignment.center // Center horizontally for small devices
          : CrossAxisAlignment.start, // Align to start for larger devices
      children: [
        Text(
          'HEY THERE.',
          style: headlineSmallStyle,
        ),
        const SizedBox(height: 20.0),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'I AM ',
                style: headlineLargeStyle?.copyWith(color: Colors.grey),
              ),
              TextSpan(
                text: 'SMITH WILLS',
                style: headlineLargeStyle?.copyWith(color: Colors.blue),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        Text(
          'Welcome to my site! I am a UI/UX designer willing to\n'
          'work with you to make your idea brilliant.',
          style: titleSmallStyle,
        ),
      ],
    );
  }
}
