import 'package:flutter/material.dart';
import 'package:harvest_app/components/general/appBar.dart';
import 'package:harvest_app/components/general/harvestButton.dart';
import 'package:harvest_app/components/input/dropdownInput.dart';
import 'package:harvest_app/components/input/textInput.dart';
import 'package:harvest_app/utils/theme.dart';

class Goals extends StatefulWidget {
  @override
  _Goals createState() => _Goals();
}

class _Goals extends State<Goals> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HarvestAppBarWithBack(title: 'Buat Perencanaan'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 26, right: 26, top: 31),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text('Judul Rencana'),
                  ),
                  HarvestTextInputForm(
                    label: 'Label Rumah',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, bottom: 5, top: 20),
                    child: Text('Target Dana'),
                  ),
                  HarvestTextInputForm(
                    keyboardType: TextInputType.number,
                    label: '100000',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, bottom: 5, top: 20),
                    child: Text('Target Waktu'),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: HarvestTextInputForm(
                          keyboardType: TextInputType.number,
                          label: '5',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some number';
                            }

                            if (int.parse(value) == null) {
                              return 'not a valid integer';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      Expanded(
                        child: HarvestDropdownInputForm(
                          onChanged: (value) {},
                          items: [
                            DropdownMenuItem<int>(
                              child: Text(
                                'Tahun',
                                style: TextStyle(fontSize: 14),
                              ),
                              value: 1,
                            ),
                            DropdownMenuItem<int>(
                              child: Text(
                                'Bulan',
                                style: TextStyle(fontSize: 14),
                              ),
                              value: 2,
                            ),
                            DropdownMenuItem<int>(
                              child: Text(
                                'Hari',
                                style: TextStyle(fontSize: 14),
                              ),
                              value: 3,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            child: Container(
              width: double.infinity,
              child: HarvestButton(
                child: Text('Buat Goals'),
                color: HarvestTheme.purple,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
