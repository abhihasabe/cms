import 'package:cms/models/employee_resp_model.dart';
import 'package:flutter/material.dart';

class HREmployeeWidget extends StatefulWidget {
  HREmployeeWidget({this.empData, Key? key}) : super(key: key);
  List<Data>? empData;

  @override
  State<HREmployeeWidget> createState() => _HREmployeeWidgetState();
}

class _HREmployeeWidgetState extends State<HREmployeeWidget> {
  List<DataRow> rows = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.empData?.forEach((element) {
      rows.add(DataRow(cells: [
        DataCell(
          Text(element.employeeName != null ? element.employeeName! : ""),
        ),
        DataCell(
          Text(element.employeeEmail != null ? element.employeeEmail! : ""),
        ),
        DataCell(
          Text(element.employeeMobileno != null
              ? element.employeeMobileno!
              : ""),
        ),
        DataCell(
          Text(element.employeeDob != null ? element.employeeDob! : ""),
        ),
        DataCell(
          Text(element.employeeGender != null ? element.employeeGender! : ""),
        ),
        DataCell(
          Text(element.employeeAddress != null ? element.employeeAddress! : ""),
        ),
        DataCell(
          Text(element.companyTypesName != null
              ? element.companyTypesName!
              : ""),
        ),
        DataCell(
          Text(element.companyName != null ? element.companyName! : ""),
        ),
        DataCell(
          Text(element.employeeAlternateMobileno != null
              ? element.employeeAlternateMobileno!
              : ""),
        ),
        DataCell(
          Text(element.usersTypeName != null ? element.usersTypeName! : ""),
        ),
      ]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 2,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "NAME",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "EMAIL",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "NUMBER",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "DATE OF BIRTH",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "GENDER",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "ADDRESS",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "DEPARTMENT",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "COMPANY NAME",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "ALTERNATE NUMBER",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "USER TYPE",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                ],
                rows: rows,
              ),
            ),
          )),
    );
  }
}
