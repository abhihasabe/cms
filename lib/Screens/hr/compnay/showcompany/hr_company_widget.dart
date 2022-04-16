import 'package:cms/models/company_resp_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HRCompanyWidget extends StatefulWidget {
  HRCompanyWidget({Key? key, this.companyData}) : super(key: key);
  List<Data>? companyData;

  @override
  State<HRCompanyWidget> createState() => _HRCompanyWidgetState();
}

class _HRCompanyWidgetState extends State<HRCompanyWidget> {
  List<DataRow> rows = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.companyData?.forEach((element) {
      rows.add(DataRow(cells: [
        DataCell(
          Text(element.companyName != null ? element.companyName! : ""),
        ),
        DataCell(
          Text(element.companyEmail != null ? element.companyEmail! : ""),
        ),
        DataCell(
          Text(element.companyPhone != null ? element.companyPhone! : ""),
        ),
        DataCell(
          Text(element.companyTypesName != null
              ? element.companyTypesName!
              : ""),
        ),
        DataCell(
          Text(element.companyWebsite != null ? element.companyWebsite! : ""),
        ),
        DataCell(
          Text(element.companyAddress != null ? element.companyAddress! : ""),
        ),
        DataCell(
          Text(element.companyPincode != null ? element.companyPincode! : ""),
        ),
        DataCell(
          Text(element.countryName != null ? element.countryName! : ""),
        ),
        DataCell(
          Text(element.cityName != null ? element.cityName! : ""),
        ),
        DataCell(
          Text(element.companyInfo != null ? element.companyInfo! : ""),
        ),
        DataCell(
          Text(element.companyFax != null ? element.companyFax! : ""),
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
                    "DEPARTMENT",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "WEBSITE",
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
                    "PINCODE",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "COUNTRY",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "CITY",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "COMPANY INFORMATION",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
                  DataColumn(
                      label: Expanded(
                          child: Text(
                    "COMPANY FAX",
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
