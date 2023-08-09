import 'package:bmi/calculat_service.dart';
import 'package:bmi/screen/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/exit_dialog.dart';
import '../widget/re_usable.dart';
import '../widget/round_button.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int? selectGender;
  String? genderType;

  int feet=5;
  int inch=6;
  int weight=60;
  int age=25;

  _increment(int type){
    if(type==0){
      setState(() {
        feet++;
      });
    }else if(type==1){
        setState(() {
          inch++;
        });
    }else if(type==2){
      setState(() {
        weight++;
      });
    }else if(type==3){
      setState(() {
        age++;
      });
    }

  }

  _decrement(int type){
    if(type==0){
      if(feet>0){
        setState(() {
          feet--;
        });
      }

    }else if(type==1){
      if(inch>0){
        setState(() {
          inch--;
        });
      }
    }else if(type==2){
      if(weight>0){
        setState(() {
          weight--;
        });
      }
    }else if(type==3){
      if(age>0){
        setState(() {
          age--;
        });
      }
    }
  }

  updateGender(int gender) {
    if (gender == 1) {
      setState(() {
        selectGender=1;
        genderType="Male";
      });
    } if (gender == 2) {
      setState(() {
        selectGender=2;
        genderType="Female";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    return WillPopScope(
      onWillPop:()=> exitDialog(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("bmi calculator".toUpperCase(),
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey.shade700
            ),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Column(
            children: [

              Expanded(child: Row(
                children: [
                  Expanded(child:GestureDetector(
                        onTap: (){updateGender(1);},
                        child: ReUsable(
                          color:selectGender==1?Colors.blueGrey.shade100:Colors.grey.shade100,
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.male_outlined,size: 50, color: Colors.blueGrey.shade700),
                            SizedBox(height: 5,),
                            Text(
                              "Male",
                              style: GoogleFonts.poppins(
                                  color: Colors.blueGrey.shade700,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),),
                      )),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){updateGender(2);},
                        child: ReUsable(
                          color: selectGender==2?Colors.blueGrey.shade100:Colors.grey.shade100,
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.female_outlined,size: 50, color: Colors.blueGrey.shade700),
                            SizedBox(height: 5,),
                            Text(
                              "Female",
                              style: GoogleFonts.poppins(
                                  color: Colors.blueGrey.shade700,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),),
                      )),
                ],
              )),

              Expanded(child: ReUsable(
                  color: Colors.grey.shade100,
                  child: Row(
                    children: [
                      Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Feet",
                            style: GoogleFonts.roboto(
                                fontSize: width / 100 * 4.5,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(feet.toString(),
                            style: GoogleFonts.poppins(fontSize: width / 100 * 7,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey.shade700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundButton(
                                  press: () {_decrement(0);},
                                  icon: Text("-",
                                      style: GoogleFonts.poppins(
                                          fontSize: width / 100 * 7,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange.shade700))),

                              SizedBox(width: 10,),

                              RoundButton(
                                  press: () {_increment(0);},
                                  icon: Text("+",
                                      style: GoogleFonts.poppins(
                                          fontSize: width / 100 * 7,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey.shade700))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                      Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Inch",
                            style: GoogleFonts.roboto(
                                fontSize: width / 100 * 4.5,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(inch.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: width / 100 * 7,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey.shade700),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RoundButton(
                                  press: () {_decrement(1);},
                                  icon: Text("-",
                                      style: GoogleFonts.poppins(
                                          fontSize: width / 100 * 7,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange.shade700))),
                              SizedBox(width: 10,),
                              RoundButton(
                                  press: () {_increment(1);},
                                  icon: Text("+",
                                      style: GoogleFonts.poppins(
                                          fontSize: width / 100 * 7,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey.shade700))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                    ],
                  ))),

              Expanded(child: Row(
                children: [
                  Expanded(child: ReUsable(
                          color:Colors.grey.shade100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Weight",
                            style: GoogleFonts.poppins(
                                fontSize: width / 100 * 4.5,
                                fontWeight: FontWeight.bold),),
                                Text(weight.toString(),
                              style: GoogleFonts.poppins(fontSize: width / 100 * 7,
                                fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey.shade700),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RoundButton(
                                        press: () {_decrement(2);},
                                        icon: Text("-",
                                      style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange.shade700))),
                                    SizedBox(width: 10,),
                                    RoundButton(
                                        press: () {
                                          _increment(2);
                                        },
                                        icon: Text("+",
                                      style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey.shade700))),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),

                  Expanded(child: ReUsable(
                        color: Colors.grey.shade100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Age",
                                style: GoogleFonts.poppins(fontSize: width / 100 * 4.5,
                                fontWeight: FontWeight.bold),),
                              Text(age.toString(),
                                  style: GoogleFonts.poppins(fontSize: width / 100 * 7,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey.shade700)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RoundButton(
                                  press: () {_decrement(3);},
                                      icon: Text("-",
                                      style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange.shade700))),
                                  SizedBox(width: 10,),
                                  RoundButton(
                                  press: () {_increment(3);},
                                  icon: Text("+",
                                      style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey.shade700))),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              )),

              SizedBox(height: 10,),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: selectGender==null?null:() {
                      final bmi=CalculateBMI(feet:feet,inch:inch,weight:weight);
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>Details(
                          result: bmi.calculate(),
                          status: bmi.getResult(),
                          suggest: bmi.getSuggest()
                      )));
                    },
                    child: Text("calculate".toUpperCase(),
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(height: 15)

            ],
          ),
        ),
      ),
    );
  }
}








