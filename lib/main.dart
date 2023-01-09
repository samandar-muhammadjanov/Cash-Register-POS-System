import 'package:cash_register/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cash Register',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: size(context).width,
        height: size(context).height,
        decoration: BoxDecoration(color: Color.fromARGB(255, 5, 23, 37)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            navigationrail(context),
            Container(
              margin: EdgeInsets.only(right: size(context).width * 0.025),
              width: size(context).width * .85,
              height: size(context).height * .95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order No. #001", style: Theme.of(context).textTheme.titleMedium,),
                      Text(DateFormat("EE, dd LLL yyyy, ").format(time) + DateFormat.jm().format(time), style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  ),
                  Card()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox navigationrail(BuildContext context) {
    return SizedBox(
      height: size(context).height * 0.8,
      child: NavigationRail(
        backgroundColor: Colors.blue,
        indicatorColor: Colors.white,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedLabelTextStyle: TextStyle(color: Colors.blue),
        useIndicator: true,
        destinations: const [
          NavigationRailDestination(
              icon: RotatedBox(quarterTurns: 3, child: Icon(Icons.home)),
              label: Text(
                "Home",
                style: TextStyle(color: Colors.black),
              )),
          NavigationRailDestination(
              icon: RotatedBox(quarterTurns: 3, child: Icon(Icons.home)),
              label: Text("Home")),
          NavigationRailDestination(
              icon: RotatedBox(quarterTurns: 3, child: Icon(Icons.home)),
              label: Text("Home")),
          NavigationRailDestination(
              icon: RotatedBox(quarterTurns: 3, child: Icon(Icons.home)),
              label: Text("Home")),
        ],
        selectedIndex: selectedIndex,
      ),
    );
  }
}
