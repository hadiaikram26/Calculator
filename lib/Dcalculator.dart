import 'package:dynamic_calculator/color.dart';
import 'package:flutter/material.dart';

class Dcal extends StatelessWidget {
  const Dcal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dcal_STF();
  }
}

class Dcal_STF extends StatefulWidget {
  const Dcal_STF({Key? key}) : super(key: key);

  @override
  State<Dcal_STF> createState() => _Dcal_STFState();
}

class _Dcal_STFState extends State<Dcal_STF> {
  late int first, second; //Two values for calculation
  late String operator;
  late String result,
      text = "0";

  void btnClicked(String btnText) {
    if (btnText == "AC") {
      print("case 1");
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "Del") {
      result = "";
    } else if (btnText == ",") {
      result = ",";
    } else if (btnText == ".") {
      result = ".";
    } else
    if (btnText == "+" || btnText == "-" || btnText == "x" || btnText == "÷") {
      print("case 2");
      first = int.parse(text);
      result = "";
      operator = btnText;
    } else if (btnText == "=") {
      print("case 3");
      second = int.parse(text);
      if (operator == "+") {
        result = (first + second).toString();
      } else if (operator == "-") {
        result = (first - second).toString();
      } else if (operator == "x") {
        result = (first * second).toString();
      } else if (operator == "÷") {
        result = (first ~/ second).toString();
      }
    } else {
      print("case 4");
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }

  Widget customOutlinedButton(String value, color) {
    return MaterialButton(
      onPressed: () => btnClicked(value),
      child: Card(
        elevation: 6.0,
        color: Colors.transparent,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.background3,
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Calculator",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                height: height * 0.6,
                width: width,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(30.0)),
                  color: AppColors.background2,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customOutlinedButton("AC", AppColors.delete),
                        customOutlinedButton("Del", AppColors.delete),
                        customOutlinedButton(",", AppColors.numbers),
                        customOutlinedButton("+", AppColors.operators),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customOutlinedButton("7", AppColors.numbers),
                        customOutlinedButton("8", AppColors.numbers),
                        customOutlinedButton("9", AppColors.numbers),
                        customOutlinedButton("x", AppColors.operators),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customOutlinedButton("4", AppColors.numbers),
                        customOutlinedButton("5", AppColors.numbers),
                        customOutlinedButton("6", AppColors.numbers),
                        customOutlinedButton("-", AppColors.operators),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customOutlinedButton("1", AppColors.numbers),
                        customOutlinedButton("2", AppColors.numbers),
                        customOutlinedButton("3", AppColors.numbers),
                        customOutlinedButton("÷", AppColors.operators),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customOutlinedButton("0", AppColors.numbers),
                        customOutlinedButton(".", AppColors.numbers),
                        customOutlinedButton("", AppColors.numbers),
                        customOutlinedButton("=", AppColors.operators),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}