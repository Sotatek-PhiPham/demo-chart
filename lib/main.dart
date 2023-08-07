import 'package:demo_chart/main_chart.dart';
import 'package:demo_chart/x_axis_widget.dart';
import 'package:demo_chart/y_axis_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('chart'),
        ),
        body: Container(
          color: Color(0xff070E45),
          width: double.infinity,
          height: 800,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue,
                height: 20,
                width: double.infinity,
              ),
              Row(
                children: [
                  YAxisWidget(width: 50, height: 400),
                  Expanded(child: MainChartWidget(width: double.infinity, height: 400, data: [],)),
                  Container(
                    color: Colors.transparent,
                    width: 20,
                    height: 400,
                  ),
                ],
              ),

              SizedBox(height: 5,),
              XAxisWidget(
                  width: double.infinity,
                  height: 50,
                  distanceFromStartToFirstLabel: 50,
                  data: []),


            ],
          ),
        ));
  }
}
