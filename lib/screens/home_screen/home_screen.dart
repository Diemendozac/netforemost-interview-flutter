import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview_flutter/screens/home_screen/widgets/city_form.dart';
import 'package:interview_flutter/widgets/weather_card.dart';

class HomePage extends StatelessWidget {

  static const route = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Image.asset('assets/img/Icon.png'),
            SvgPicture.asset('assets/img/Title.svg')
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: WeatherCard(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => buildModalBottomSheet(context),
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 16, left: 50, right: 50),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Color(0xFF5E5D5D)
            )
          )
        ),
        child: BottomNavigationBar(
          iconSize: 32,
          elevation: 0,
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.location_pin), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }

  void buildModalBottomSheet (BuildContext context) {

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const AddCityForm();
      },
    );

  }
}
