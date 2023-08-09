import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<bool>exitDialog(BuildContext context)async{
  return await showDialog(context: context, builder: (_){
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5)),
      title: Icon(Icons.info_outline_rounded),
      content: Text("Are you sure you want to exit",
        style: GoogleFonts.roboto(color: Colors.blueGrey.shade700,fontSize: 18),),
      actions: [
        Container(
          height: 45,
          width:double.infinity,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.redAccent),
                  child: Text('No',style: GoogleFonts.roboto(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.green),
                  child: Text('Yes',style: GoogleFonts.roboto(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  });
}