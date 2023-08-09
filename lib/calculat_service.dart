class CalculateBMI{
  CalculateBMI({
    required this.feet,
    required this.inch,
    required this.weight,
});
  final int feet;
  final int inch;
  final int weight;

  var bmi;

  String calculate(){
    final height=(feet*12)+inch;
    final _height=(height*0.0254);
    bmi=weight/(_height*_height);
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