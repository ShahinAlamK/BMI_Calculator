import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';


class BimScreen extends StatefulWidget {
  const BimScreen({super.key});

  @override
  _BimScreenState createState() => _BimScreenState();
}

class _BimScreenState extends State<BimScreen>{

  //BMI Controller
  double kg=60;
  int feet=5;
  int inches=6;

  int? selectGender;
  String? genderType;

  void increaseValue(String type){
    if(type=="feet"){
      if(feet<12){
        feet++;
      }
    }else if(type=="inches"){
      if(inches<11){
        inches++;
      }
    }
    setState(() {

    });
  }
  void decreaseValue(String type){
    if(type=="feet"){
      if(feet>0){
        feet--;
      }
    }else if(type=="inches"){
      if(inches>0){
        inches--;
      }
    }
    setState(() {

    });
  }
  updateGender(int gender) {
    if (gender == 1) {
      selectGender=1;
      genderType="Male";
    } if (gender == 2) {
      selectGender=2;
      genderType="Female";
    }
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);

    return Scaffold(
        appBar:AppBar(title: Text("BMI Calculator".toUpperCase()),),

        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
          child: Column(
            children: [

              SizedBox(height: getHeight(25)),
              Row(
                children: [
                  Expanded(
                    child: CardView(
                      color:selectGender==1?Colors.orange.shade100:Colors.grey.shade100,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.male_rounded,
                            size:getWidth(50),
                            color:Colors.black),
                        SizedBox(height: getHeight(5)),
                        Text("Male",style: theme.textTheme.bodyLarge!)
                      ],
                    ),
                      press: (){
                        updateGender(1);
                      },
                    ),
                  ),

                  SizedBox(width: getWidth(20)),
                  Expanded(
                    child: CardView(
                      color:selectGender==2?Colors.orange.shade100:Colors.grey.shade100,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.female_rounded,
                            size:getWidth(50),
                            color:Colors.black),
                        SizedBox(height: getHeight(5)),
                        Text("Female",style: theme.textTheme.bodyLarge!)
                      ],
                    ),
                      press: (){updateGender(2);},
                    ),
                  ),
                ],
              ),

              SizedBox(height: getHeight(25)),
              Expanded(child: CardView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your Weight",style: theme.textTheme.bodyLarge,),
                    Text("${kg.toStringAsFixed(0)} kg",style: theme.textTheme.bodyLarge,),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Colors.orange,
                        thumbColor: Colors.orange
                      ),
                      child: Slider(
                        min: 0.0,
                          max: 120,
                          value:kg,
                          onChanged:  (value){
                          setState(() {
                            kg=value.toDouble();
                          });
                          }),
                    ),
                  ],
                ),
              )),

              SizedBox(height: getHeight(25)),

              Row(
                children: [
                  Expanded(
                    child: CardView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Feet",style: theme.textTheme.bodyLarge,),
                          Text("$feet",style: theme.textTheme.bodyMedium!.copyWith(fontSize: getWidth(22)),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RoundButton(icon: Icon(Icons.remove), press:(){decreaseValue("feet");}),
                              RoundButton(icon: Icon(Icons.add), press:(){increaseValue("feet");}),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: getWidth(20)),
                  Expanded(
                    child: CardView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Inches",style: theme.textTheme.bodyLarge,),
                          Text("$inches",style: theme.textTheme.bodyMedium!.copyWith(fontSize: getWidth(22)),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RoundButton(icon: Icon(Icons.add), press:(){increaseValue("inches");}),
                              RoundButton(
                                  icon: Icon(Icons.remove),
                                  press:(){decreaseValue("inches");}),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: getHeight(30)),

              SizedBox(
                  height: getHeight(50),
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed:genderType==null?null:(){
                        showCupertinoDialog(context: context, builder: (_){
                          final bmi=CalculateBMI(feet: feet, inch: inches, weight: kg.toInt(), gender: genderType!);
                        return ResultDialog(
                          bmi: bmi.calculate(),
                          result: bmi.getResult(),
                          gender:bmi.gender,
                          height:[bmi.feet,bmi.inch],
                          weight:bmi.weight,
                        );
                      });},
                      child: Text("calculate".toUpperCase(),
                        style: theme.textTheme.bodyLarge))),

              SizedBox(height: getHeight(25)),
            ],
          ),
        )
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.icon, required this.press, this.colo});
  final Widget icon;
  final VoidCallback press;
  final Color? colo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child:Material(
        color:colo?? Colors.white,
        child: InkWell(
          onTap:press,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle
            ),
            padding: EdgeInsets.all(getWidth(7)),
            child:icon,
          ),
        ),
      ),
    );
  }
}

class ResultDialog extends StatelessWidget {
  const ResultDialog({super.key,
    required this.bmi,
    required this.gender,
    required this.weight,
    required this.height,
    required this.result});

  final String bmi;
  final String result;
  final String gender;
  final int weight;
  final List<int> height;

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);

    return Dialog(
      child: Container(
        padding: EdgeInsets.all(getWidth(20)),
        width:double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text("Your Result",style:theme.textTheme.bodyLarge,),
              const Divider(),

              SizedBox(height: getHeight(20)),
              Text(bmi,style: theme.textTheme.bodyLarge!.copyWith(fontSize:getWidth(50))),

              SizedBox(height: getHeight(20)),
              Text(result,style:theme.textTheme.bodyLarge,),

              SizedBox(height: getHeight(30)),

              Row(
                children: [
                  Expanded(child: Text("Gender : $gender",style: theme.textTheme.bodySmall,)),
                  Expanded(child: Text("Weight : $weight kg",style: theme.textTheme.bodySmall)),
                  Expanded(child: Text("Height : ${height[0]} .${height[1]} inch",style: theme.textTheme.bodySmall)),
                ],
              ),

              SizedBox(height: getHeight(20)),

              SizedBox(
                  height: getHeight(45),
                  width: AppSize.width,
                  child: ElevatedButton(
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      child:Text("Re-calculate".toUpperCase()))),

              SizedBox(height: getHeight(10)),

            ],
          ),
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({super.key, this.child, this.press, this.color});
  final Widget? child;
  final VoidCallback? press;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(getWidth(10)),
      child: Material(
        color: color??Colors.grey.shade100,
        child: InkWell(
          onTap:press,
          child: Container(
            height: getHeight(180),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getWidth(10))
            ),
            padding: EdgeInsets.symmetric(horizontal: getWidth(20),vertical: getHeight(15)),
            child:child,
          ),
        ),
      ),
    );
  }
}

class CalculateBMI{
  CalculateBMI({
    required this.feet,
    required this.inch,
    required this.weight,
    required this.gender
  });
  final int feet;
  final int inch;
  final int weight;
  final String gender;

  var bmi;

  String calculate(){
    final height=(feet*12)+inch;
    final h=(height*0.0254);
    bmi=weight/(h*h);
    return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(bmi>=25){
      return "Overweight";
    }else if(bmi>18.5){
      return "Normal";
    }
    return "Underweight";
  }

  String getSuggest(){
    if(bmi>=25){
      return "You have higher then normal body weight. Try to exercise more.";
    }else if(bmi>18.5){
      return "You have normal body weight. Good job!";
    }
    return "You have a lower then normal body weight. You can eat a bit more.";
  }
}
