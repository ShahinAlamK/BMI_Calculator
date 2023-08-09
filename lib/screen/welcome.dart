import 'package:bmi/screen/home.dart';
import 'package:bmi/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value){
                  setState(() {
                    currentIndex=value;
                  });
                },
                itemCount:OnboardList.length,
                itemBuilder: (_,index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex:2),
                      SvgPicture.asset(OnboardList[index]['logo']!,
                          height: 200,
                          fit:BoxFit.fitWidth),

                      Spacer(flex: 1,),
                      Text(OnboardList[index]['title']!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: size.width/100*5,fontWeight: FontWeight.w600),
                      ),

                      SizedBox(height:30,),
                      Text(OnboardList[index]['des']!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: size.width/100*3.2),
                      ),

                      Spacer(),
                    ],
                  );
                },
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(OnboardList.length, (index){
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 10,
                  width: currentIndex==index?20:10,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: currentIndex==index?Colors.orange:Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(20)
                  ),
                );
              }),
            ),
            SizedBox(height: 30),

            SizedBox(
              height:55,
              width: size.width,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=>Home()), (route) => false);
                  },
                  child: Text("Start",style:GoogleFonts.poppins(fontSize: 18,color: Colors.white),)),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
