import 'package:flutter/material.dart';

void main() => runApp(Myconvert());

class Myconvert extends StatefulWidget {
  Myconvert({Key key}) : super(key: key);

  @override
  _MyconvertState createState() => _MyconvertState();
}

class _MyconvertState extends State<Myconvert> {
  double _numberFrom;
  String _startMeasure;
  String _convertedMeasure;
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'Kilograms',
    'feet',
    'milles',
    'pounds (lbs)',
    'ounces',
  ];
  final TextStyle inputStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );
  final TextStyle LabelStyle = TextStyle(
    fontSize: 20,
    color: Colors.grey[700],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converidor de medidas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Converidor de medidas'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'value',
                style: LabelStyle,
              ),
              Spacer(),
              TextField(
                style: inputStyle,
                decoration: InputDecoration(
                    hintText: "Por favor ingrese la medida a convertir"),
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberFrom = rv;
                    });
                  }
                },
              ),
              Spacer(),
              Text(
                'From',
                style: LabelStyle,
              ),

              
              
              DropdownButton(
                isExpanded: true,
                style: inputStyle,
                items: _measures.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _startMeasure = value;
                  });
                },
                value: _startMeasure,
              ),
              Spacer(),
              Text(
                'To',
                style: LabelStyle,
              ),
              DropdownButton(//
                isExpanded: true,
                style: inputStyle,
                items: _measures.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _convertedMeasure = value;
                  });
                },
                value: _convertedMeasure,
              ),
              Spacer(//
                flex:2 ,
              ),
              RaisedButton(
                child: Text(
                  'Convert',
                  style: inputStyle,
                ),
                onPressed:()=>true,
              )  ,
              Spacer(
                flex: 2,
              ),
              
              Text((_numberFrom == null) ? '' : _numberFrom.toString(),
              style: LabelStyle),
              Spacer(
                flex: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }
}
