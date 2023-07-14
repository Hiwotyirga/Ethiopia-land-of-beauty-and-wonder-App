import 'package:exhange_rates_flutter/screens/bahireHasab.dart';
import 'package:exhange_rates_flutter/screens/calander.dart';
import 'package:exhange_rates_flutter/size_config.dart';
import 'package:flutter/material.dart';
import 'package:abushakir/abushakir.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ethcalander/blocs/blocs.dart';
// import 'package:ethcalander/screens/calendar.dart';
// import 'package:ethcalander/screens/bahireHasab.dart';
// import 'package:ethcalander/size_config.dart';
// import 'package:ethcalander/blocs/calendar/calendar.dart';

import 'blocs/calender/calander_bloc.dart';
void main() => runApp(MyApp2());

// const List<String> _weekdays = [
//   "ሰ",
//   "ማ",
//   "ረ",
//   "ሐ",
//   "አ",
//   "ቅ",
//   "እ",
// ];
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //used to create the widget tree for the entire app based
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Ethiopian Calendar',
              theme: ThemeData(
                primarySwatch: Colors.amber,
              ),
              home: MultiBlocProvider(
                providers: [
                  BlocProvider<CalendarBloc>(
                    create: (BuildContext context) =>
                        CalendarBloc( currentMoment: ETC.today()),
                    // CalendarBloc(CalendarInitial(), currentMoment: ETC.today()),
                  ),
                ],
                child: MyHomePage(title: 'Abushakir'),
              ),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  EtDatetime a = EtDatetime.now();

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[MyCalendar(), MyBahireHasab()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          widget.title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 3.1 * SizeConfig.textMultiplier!),
        ),

      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'BahireHasab',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[900],
        onTap: _onItemTapped,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 1.96 * SizeConfig.textMultiplier!,
        ),
      ),
    );
  }
}
