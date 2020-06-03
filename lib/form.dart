import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _phoneNumber;
  String _dropdownValue;
  String _installments;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildphoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Number is required';
        }
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildDream() {
    return DropdownButton<String>(
      isExpanded: true,
      value: _dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          _dropdownValue = newValue;
        });
      },
      items: <String>['Moto', 'Carro', 'Licencia', 'Pase']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildInstallments() {
    return DropdownButton<String>(
      isExpanded: true,
      value: _installments,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          _installments = newValue;
        });
      },
      items: <String>['12', '24', '36']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Llena tus datos")),
        body: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildName(),
                  _buildEmail(),
                  _buildphoneNumber(),
                  Text(
                    'What for',
                    style: TextStyle(),
                  ),
                  _buildDream(),
                  _buildInstallments(),
                  SizedBox(height: 100),
                  RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
            )));
  }
}
