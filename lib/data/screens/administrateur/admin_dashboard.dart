import 'package:flutter/material.dart';

import 'admin_before_dashboard.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * (isPortrait ? 0.03 : 0.1)),
          child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminBeforeDashboard(initialIndex: 1, tabIndex: 0,)));
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      width: screenWidth * (isPortrait ? 0.8 : 0.7),
                      child: Row(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                  color: Color(0xfffcbc1c)
                              ),
                              width: screenWidth * (isPortrait ? 0.5 : 0.4),
                              height: screenHeight * (isPortrait ? 0.15 : 0.3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.groups, color: Colors.white,),
                                  SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.05),),
                                  const Text('Nombre utililsateurs', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ],
                              )
                          ),
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      color: Colors.white,
                                      border: Border.all(color: const Color(0xfffcbc1c))
                                  ),
                                  height: screenHeight * (isPortrait ? 0.15 : 0.3),
                                  child: const Center(child: Text('10.000.000', style: TextStyle(fontWeight: FontWeight.bold)),)
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    width: screenWidth * (isPortrait ? 0.8 : 0.7),
                    child: Row(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                color: Color(0xff072858)
                            ),
                            width: screenWidth * (isPortrait ? 0.5 : 0.4),
                            height: screenHeight * (isPortrait ? 0.15 : 0.3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.group_add, color: Colors.white,),
                                SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.05),),
                                const Text('Nombre de parrainages', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              ],
                            )
                        ),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    color: Colors.white,
                                    border: Border.all(color: const Color(0xff072858))
                                ),
                                height: screenHeight * (isPortrait ? 0.15 : 0.3),
                                child: const Center(child: Text('170.000', style: TextStyle(fontWeight: FontWeight.bold)),)
                            )
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * (isPortrait ? 0.03 : 0.1),),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminBeforeDashboard(initialIndex: 1, tabIndex: 1,)));
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      width: screenWidth * (isPortrait ? 0.8 : 0.7),
                      child: Row(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                  color: Colors.orange
                              ),
                              width: screenWidth * (isPortrait ? 0.5 : 0.4),
                              height: screenHeight * (isPortrait ? 0.15 : 0.3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.campaign, color: Colors.white,),
                                  SizedBox(height: screenHeight * (isPortrait ? 0.02 : 0.05),),
                                  const Text('Nombre de campagnes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ],
                              )
                          ),
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                      color: Colors.white,
                                      border: Border.all(color: Colors.orange)
                                  ),
                                  height: screenHeight * (isPortrait ? 0.15 : 0.3),
                                  child: const Center(child: Text('234.000.000', style: TextStyle(fontWeight: FontWeight.bold)),)
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]
          ),
        )
    );
  }
}
