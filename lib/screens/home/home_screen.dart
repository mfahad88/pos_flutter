import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_flutter/providers/home_provider.dart';
import 'package:pos_flutter/screens/dashboard/dashboard_screen.dart';
import 'package:pos_flutter/screens/home/side_bar.dart';
import 'package:pos_flutter/screens/inventory/inventory_screen.dart';
import 'package:pos_flutter/screens/report/report_screen.dart';
import 'package:pos_flutter/screens/sales/sales_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    if (Platform.isWindows) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.blue.shade400,
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            final provider=context.read<HomeProvider>();
            return Row(
              children: [
                Container(
                  width: constraints.maxWidth*0.15,
                  height: constraints.maxHeight,
                  color: Colors.grey.shade300,
                  child: sideBar(context,provider),
                ),

                SizedBox(
                    width: constraints.maxWidth*0.8,
                    height: constraints.maxHeight,
                    child: navigator(provider)
                )
              ],
            );
          },)
      );
    } else {
   /*   SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);*/
      final provider=context.read<HomeProvider>();
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
        ),
        drawer: Drawer(
          child: sideBar(context,provider),
        ),
        body: navigator(provider),
      );
    }
  }

  Widget sideBar(BuildContext context,HomeProvider provider){

    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: const Text('Home'),
          onTap: () {
            if(!Platform.isWindows) {
              Navigator.pop(context);
            }
            provider.navigatorKey.currentState?.pushReplacementNamed('/Dashboard');
          },
        ),
        ListTile(
          title: const Text('Sales'),
          onTap: () {
            if(!Platform.isWindows) {
              Navigator.pop(context);
            }
            provider.navigatorKey.currentState?.pushReplacementNamed('/Sales');
          },
        ),
        ListTile(
          title: const Text('Inventory'),
          onTap: () {
            if(!Platform.isWindows) {
              Navigator.pop(context);
            }
            provider.navigatorKey.currentState?.pushReplacementNamed('/Inventory');
          },
        ),
        ListTile(
          title: const Text('Report'),
          onTap: () {
            if(!Platform.isWindows) {
              Navigator.pop(context);
            }
            provider.navigatorKey.currentState?.pushReplacementNamed('/Report');
          },
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {
            if(!Platform.isWindows) {
              Navigator.pop(context);
            }
            provider.navigatorKey.currentState?.pushReplacementNamed('/Logout');
          },

        )
      ],
    );
  }

  Widget navigator(HomeProvider provider){
    return Navigator(

      initialRoute: '/Dashboard',
      key: provider.navigatorKey,
      onGenerateRoute: (settings) {
        switch (settings.name){
          case'/Dashboard': return MaterialPageRoute(builder: (context) => const DashboardScreen(),);
          case'/Sales': return MaterialPageRoute(builder: (context) => const SalesScreen(),);
          case'/Inventory': return MaterialPageRoute(builder: (context) => const InventoryScreen(),);
          case'/Report': return MaterialPageRoute(builder: (context) => const ReportScreen(),);
        // case'/Logout': return null;
        }
      },
    );
  }
}
