import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.result, required this.status, required this.suggest});
  final String result;
  final String status;
  final String suggest;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        title: Text("Your Results", style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey.shade700
        ),),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:25),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Text(status,
                style:GoogleFonts.poppins(
                    fontSize:width/100*6,
                    fontWeight: FontWeight.w600,
                  color: Colors.green
                ),),

              Spacer(),
              Text(result,
                style:GoogleFonts.poppins(
                    fontSize:width/100*15,
                    fontWeight: FontWeight.w600,
                  color: Colors.blueGrey.shade700
                ),),

              Spacer(flex: 1),
              Text(suggest,
                textAlign: TextAlign.center,
                style:GoogleFonts.poppins(
                    fontSize:width/100*4.5,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey.shade700
                ),),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
