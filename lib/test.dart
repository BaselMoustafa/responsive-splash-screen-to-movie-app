import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_screen/assets_manager.dart';
import 'package:responsive_screen/color_manager.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screeHeight = MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    

   
    return Scaffold(
      backgroundColor: ColorManager.black,
      appBar: _getAppBarDesign(),
      extendBodyBehindAppBar: true,
      //y3ne nazeyn fe app bar bs 3amlyn l body wa5d mkano w ana 3aml app bar 34an at7km fl l status
      body: _getBodyDesign(screeHeight:screeHeight , screenWidth:screenWidth),
    );
  }

  AppBar _getAppBarDesign() {
    return AppBar(
      backgroundColor:ColorManager.transParent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.transParent,
        statusBarIconBrightness: Brightness.light,
      ),
      elevation: 0,
    );
  }

  Widget _getBodyDesign({required screeHeight , required screenWidth}){
    return Stack(
      children: [
        _getBackGroundPinkShadow(screeHeight: screeHeight,screenWidth: screenWidth),
        _getBackGroundTrkwazShadow(screeHeight: screeHeight,screenWidth: screenWidth),
        _getTheActualBody(screeHeight: screeHeight,screenWidth: screenWidth),

      ],
    );
  }

  Positioned _getBackGroundTrkwazShadow({required screeHeight , required screenWidth}) {
    return Positioned(
        top: 0.2*screeHeight,
        left: 0.6*screenWidth,
        child:Container(  
              width: screenWidth,
              height: screenWidth,
              decoration: BoxDecoration(
                color: ColorManager.trkwaz,
                shape: BoxShape.circle,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200,sigmaY: 200),
                child: SizedBox(),
              ),
            ),
               
      );
  }

  Positioned _getBackGroundPinkShadow({required screeHeight , required screenWidth}) {
    return Positioned(
        top: -(30/533)*screeHeight,
        left: -(30/320)*screenWidth,
        child: Container(
          width: (150/320)*screenWidth,
          height: (150/533)*screeHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.pink,
          ),
          //DE LMA A3OZ A3ML BLUR
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 200,sigmaY: 200),
            //MAKN4 HAU3ML BLUR 2LA B CHILD
            child: SizedBox(),
          ),
        ),
      );
  }

  _getTheActualBody({required screeHeight , required screenWidth}){
    return SafeArea(
      child: Column(
        children: [
          _getStartSpace(screeHeight, screenWidth),
          _getImage(screeHeight, screenWidth),
          _getSecondSpace(screeHeight, screenWidth),
          _getLabelText(screeHeight),
          getSpace(screeHeight),
          _getSubTitleText(screeHeight),
          Expanded(flex: 1,child: SizedBox()),
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment(0,-0.5),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.white.withOpacity(0.4),
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    stops: [
                      0.01,
                      0.65
                    ],
                    colors: [
                      ColorManager.trkwaz.withOpacity(0.5),
                      ColorManager.pink.withOpacity(0.5),
                    ],
                    
                  )
                ),
                child: InkWell(
                  onTap: (){},
                  child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: screeHeight<667?14:18,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.white,
                      ),
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded getSpace(screeHeight) => Expanded(flex: 1,child: SizedBox( ));

  Expanded _getSubTitleText(screeHeight) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
              "watch online movies whenever you are",
              style: TextStyle(
                fontSize: screeHeight<677?14:18,
                color: Color.fromARGB(255, 187, 175, 175),
              ),
              textAlign: TextAlign.center,
            ),
      ),
    );
  }

  Expanded _getLabelText(screeHeight) {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
            "Watch movies from your home",
            style: TextStyle(
              color: ColorManager.white,
              fontSize: screeHeight<677?26:30,
              fontWeight: FontWeight.w700
            ),
            textAlign: TextAlign.center,
          ),
      ),
    );
  }

  Expanded _getStartSpace(screeHeight, screenWidth) {
    return Expanded(
          flex: 1,
          child: SizedBox(),
        );
  }

  Expanded _getImage(screeHeight, screenWidth) {
    return Expanded(
          flex: 15,
          child: Container(
            padding: EdgeInsets.all(2),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorManager.trkwazFromMe,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.transParent
              ),
              child: Center(
                child: Image.asset(
                  AssetsManager.onBoardingImagePath,
                ),
              ),
            ),
          ),
        );
  }
  _getSecondSpace(ScreenHight,screenWidht){
    return Expanded( flex: 1,child: SizedBox());
  }
  
}