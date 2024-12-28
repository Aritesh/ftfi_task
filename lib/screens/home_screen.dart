import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/hire_me_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Flex(
                  direction:
                      screenWidth < 900 ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: screenWidth < 900
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth < 1150 ? 10 : 150,
                        top: screenWidth < 1150 ? 10 : 0,
                      ),
                      child: Image.asset(
                        "assets/logo.png",
                        height: screenWidth < 900 ? 80 : 150,
                        width: screenWidth < 900 ? 80 : 150,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20, right: screenWidth < 900 ? 10 : 500),
                          child: Wrap(
                            spacing: screenWidth < 1150 ? 10 : 40,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: [
                              _buildMenuItem("Home", 0),
                              _buildMenuItem("Skills", 1),
                              _buildMenuItem("Services", 2),
                              _buildMenuItem("Contact", 3),
                            ],
                          ),
                        ),
                        if (screenWidth > 900)
                          Image.asset(
                            'assets/profile_image.png',
                            width: screenWidth / 3.5,
                            height: MediaQuery.of(context).size.height * 0.9,
                            fit: BoxFit.cover,
                          ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenWidth < 900 ? 20 : 300,
                      left: screenWidth < 900 ? 10 : 270),
                  child: Container(
                    width:
                        screenWidth < 900 ? screenWidth * 0.9 : screenWidth / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: screenWidth < 900
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        const Header(),
                        SizedBox(height: screenWidth < 700 ? 10 : 20),
                        HireMeButton(),
                        SizedBox(height: screenWidth < 700 ? 10 : 20),
                        Wrap(
                          spacing: 50,
                          alignment: WrapAlignment.center,
                          children: [
                            _buildCircle("281+", "TASK DONE"),
                            _buildCircle("OVER 2800", "CLIENTS"),
                            _buildCircle("50+", "COMPANIES"),
                          ],
                        ),
                        SizedBox(height: screenWidth < 600 ? 30 : 50),
                        Footer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: themeProvider.toggleTheme,
        child: Icon(
          themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? (Theme.of(context).brightness == Brightness.dark
                        ? Colors.blue.shade300
                        : Colors.blue)
                    : (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
              ),
            ),
            if (isSelected)
              Container(
                height: 2,
                width: 30,
                color: Colors.blue,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(String text1, String text2) {
    return Container(
      width: 95,
      height: 95,
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(60),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            text2,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
