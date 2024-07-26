import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  late double _bmiNum;

  String bmiCalculate() {
    _bmiNum = weight / pow(height / 100, 2);
    print(_bmiNum);
    return _bmiNum.toStringAsFixed(2);
  }

  String getResultText() {
    if (_bmiNum >= 25) {
      return 'OverWeight';
    } else if (_bmiNum > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getResultInterpretation() {
    if (_bmiNum >= 25) {
      return 'Avoid junk & exercise more';
    } else if (_bmiNum > 18.5) {
      return "Maintain this fit";
    } else {
      return "Eat more & healthy";
    }
  }
}
