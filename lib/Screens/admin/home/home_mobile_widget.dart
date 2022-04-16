import 'package:cms/models/count_model.dart';
import 'package:cms/routes/app_routes_names.dart';
import 'package:cms/widgets/card_view_widget.dart';
import 'package:cms/theme/app_dimension.dart';
import 'package:cms/theme/app_colors.dart';
import 'package:cms/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeMobileWidget extends StatelessWidget {
  HomeMobileWidget({this.countData, Key? key}) : super(key: key);
  List<Data>? countData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      VxNavigator.of(context).push(Uri.parse(employeeScreen));
                    },
                    child: CardViewWidget(
                      backgroundColor: Colors.cyan,
                      borderRadius: 6,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: DIMENSION_120,
                      elevation: DIMENSION_1,
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/employee.png",
                          width: 56,
                          height: 56,
                        ),
                        title: Text(
                            "${countData?.where((c) => c.tABLENAME == "employee_table").toList().first.sUMTABLEROWS}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 38)),
                        subtitle: const Text('Employees',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      VxNavigator.of(context).push(Uri.parse(leaveScreen));
                    },
                    child: CardViewWidget(
                      backgroundColor: primaryColor,
                      borderRadius: 6,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: DIMENSION_120,
                      elevation: DIMENSION_1,
                      child: ListTile(
                        leading: Image.asset("assets/images/leave.png"),
                        title: Text(
                            "${countData?.where((c) => c.tABLENAME == "leave_table").toList().first.sUMTABLEROWS}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 38)),
                        subtitle: const Text('Leaves',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      VxNavigator.of(context)
                          .push(Uri.parse(adminCompanyScreen));
                    },
                    child: CardViewWidget(
                      backgroundColor: Colors.cyan,
                      borderRadius: 6,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: DIMENSION_120,
                      elevation: DIMENSION_1,
                      child: ListTile(
                        leading: Image.asset("assets/images/attendance.png"),
                        title: Text('${countData?.where((c) => c.tABLENAME=="project_table").toList().first.sUMTABLEROWS}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 38)),
                        subtitle: const Text('Attendance',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      VxNavigator.of(context).push(Uri.parse(inventoryScreen));
                    },
                    child: CardViewWidget(
                      backgroundColor: primaryColor,
                      borderRadius: 6,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: DIMENSION_120,
                      elevation: DIMENSION_1,
                      child: ListTile(
                        leading: Image.asset("assets/images/inventory.png"),
                        title: Text(
                            "${countData?.where((c) => c.tABLENAME == "inventory_table").toList().first.sUMTABLEROWS}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 38)),
                        subtitle: const Text('Inventories',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      VxNavigator.of(context).push(Uri.parse(projectsScreen));
                    },
                    child: CardViewWidget(
                      backgroundColor: Colors.cyan,
                      borderRadius: 6,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: DIMENSION_120,
                      elevation: DIMENSION_1,
                      child: ListTile(
                        leading: Image.asset("assets/images/projects.png"),
                        title: Text(
                            "${countData?.where((c) => c.tABLENAME == "project_table").toList().first.sUMTABLEROWS}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 38)),
                        subtitle: const Text('Projects',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      VxNavigator.of(context).push(Uri.parse(adminCompanyScreen));
                    },
                    child: CardViewWidget(
                      backgroundColor: primaryColor,
                      borderRadius: 6,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: DIMENSION_120,
                      elevation: DIMENSION_1,
                      child: ListTile(
                        leading: Image.asset("assets/images/company.png"),
                        title: Text(
                            "${countData?.where((c) => c.tABLENAME == "company_table").toList().first.sUMTABLEROWS}",
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 38)),
                        subtitle: const Text('Company',
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      VxNavigator.of(context)
                          .push(Uri.parse(adminCompanyScreen));
                    },
                    child: CardViewWidget(
                      backgroundColor: Colors.cyan,
                      borderRadius: 6,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: DIMENSION_120,
                      elevation: DIMENSION_1,
                      child: ListTile(
                        leading: Image.asset("assets/images/client.png"),
                        title: Text('${countData?.where((c) => c.tABLENAME=="project_table").toList().first.sUMTABLEROWS}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 38)),
                        subtitle: const Text('Clients',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
