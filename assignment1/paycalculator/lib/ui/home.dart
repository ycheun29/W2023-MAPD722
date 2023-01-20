import 'package:flutter/material.dart';

class PayCal extends StatefulWidget {
  const PayCal({super.key});

  @override
  State<PayCal> createState() => _PayCalState();
}

class _PayCalState extends State<PayCal> {
  double _rate = 0;
  double _hour = 0;
  String _result = "";

  void _showResult() {
    setState(() {
      if (_rate < 0 || _hour < 0) {
        _result = 'Please check the input!';
      } else {
        _result = '''
Regular pay: ${calRegularPay(_hour, _rate).toStringAsFixed(1)}
Overtime pay: ${calOvertimePay(_hour, _rate).toStringAsFixed(1)}
Total pay: ${calTotalPay(_hour, _rate).toStringAsFixed(1)}
Tax: ${calTax(_hour, _rate).toStringAsFixed(1)}''';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(1.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Number of hours',
                        ),
                        onChanged: (String value) {
                          try {
                            _hour = double.parse(value);
                          } catch (exception) {
                            _hour = -1;
                          }
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(1.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Hourly rate',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                          try {
                            _rate = double.parse(value);
                          } catch (exception) {
                            _rate = -1;
                          }
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: _showResult,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      margin: EdgeInsets.only(top: 20, left: 50, right: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.blue.shade300),
                      child: Center(
                          child: Text(
                        "Calculate",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40, bottom: 40),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(1.0)),
                    child: Column(
                      children: [
                        Row(children: [
                          RichText(
                            text: TextSpan(
                              text: 'Report',
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ]),
                        Row(children: [
                          RichText(
                            text: TextSpan(
                              text: '$_result',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
              ),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Yuk Sing Cheung',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text(
                          '301230209',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calRegularPay(double hour, double rate) {
    if (hour >= 40.0) {
      return 40.0 * rate;
    } else {
      return hour * rate;
    }
  }

  calOvertimePay(double hour, double rate) {
    if (hour >= 40.0) {
      return (hour - 40) * 1.5 * rate;
    } else {
      return 0;
    }
  }

  calTotalPay(double hour, double rate) {
    return calRegularPay(hour, rate) + calOvertimePay(hour, rate);
  }

  calTax(double hour, double rate) {
    return calTotalPay(hour, rate) * 0.18;
  }
}
