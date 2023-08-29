import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_button.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/state_management/providers/counter_provider.dart';
import 'package:grocery_app/state_management/screen_two.dart';
import 'package:provider/provider.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  // int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText("Screen one"),
          SizedBox(height: 30),
          CustomButton(
            onTap: () {
              // setState(() {
              //   _counter++;
              // });
              Provider.of<CounterProvider>(context, listen: false)
                  .increaseCounter();
            },
            text: "Add +",
          ),
          SizedBox(height: 30),
          CustomText(Provider.of<CounterProvider>(context).counter.toString()),
          SizedBox(height: 30),
          CustomButton(
            onTap: () {
              // setState(() {
              //   _counter--;
              // });
              Provider.of<CounterProvider>(context, listen: false)
                  .decreaseCounter();
            },
            text: "Sub -",
          ),
          SizedBox(height: 30),
          CustomButton(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScreenTwo()));
            },
            text: "go to screeen two",
          ),
        ],
      )),
    );
  }
}
