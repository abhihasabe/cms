import 'package:cms/models/employee_resp_model.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatefulWidget {
  EmployeeCard({this.empData, Key? key}) : super(key: key);

  Data? empData;

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
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
