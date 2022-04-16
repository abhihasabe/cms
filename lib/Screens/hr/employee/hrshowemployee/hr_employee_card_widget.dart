import 'package:cms/models/employee_resp_model.dart';
import 'package:flutter/material.dart';

class HREmployeeCard extends StatefulWidget {
  HREmployeeCard({this.empData, Key? key}) : super(key: key);

  Data? empData;

  @override
  State<HREmployeeCard> createState() => _HREmployeeCardState();
}

class _HREmployeeCardState extends State<HREmployeeCard> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("${widget.empData?.employeeName}"),
      )
    ]);
  }
}
