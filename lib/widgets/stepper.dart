import 'package:flutter/material.dart';

class Stepper extends StatefulWidget{
  @override
  State<Stepper> createState() => _StepperState();
}

class _StepperState extends State<Stepper> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: index>=0?Colors.blue:Colors.red,
                      shape: BoxShape.circle
                  ),
                ),

                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                    color: index>=1?Colors.blue:Colors.red,
                  ),
                ),



                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color:index>=1?Colors.blue:Colors.red ,
                      shape: BoxShape.circle
                  ),
                ),



                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                    color:index>=2?Colors.blue:Colors.red ,
                  ),
                ),


                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color:index>=2?Colors.blue:Colors.red ,
                      shape: BoxShape.circle
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: (){
                index=index+1;
                setState(() {

                });
              },
              child: Text("Click"),
            )
          ],
        ),
      ),
    );
  }
}