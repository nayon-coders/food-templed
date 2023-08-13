import 'package:flutter/material.dart';
import 'package:forjobtest/utility/colors.dart';

import '../index.dart';
import 'home/home.dart';

class FlasScreen extends StatefulWidget {
  const FlasScreen({Key? key}) : super(key: key);

  @override
  State<FlasScreen> createState() => _FlasScreenState();
}

class _FlasScreenState extends State<FlasScreen> {
  double _width = 20;
  double _height = 20;

   _animateImage(){
     setState(() {
       _width = 100;
       _height = 100;
     });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animateImage();
    Future.delayed(Duration(milliseconds: 2000), () {
      // Do something
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Index()));
    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor,
                  AppColors.secColor
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Column(
              children: [
                Spacer(),
                Center(
                  child: AnimatedContainer(
                    width: _width,
                      height: _height,
                      duration: Duration(milliseconds: 5000),
                      child: Image.asset("assets/images/icons/logo.png",)),
                ),
                Spacer(),
                Center(
                  child: Text("v 1.0",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.white,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
