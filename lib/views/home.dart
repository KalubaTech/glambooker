import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quicksale_super_admin/components/menu_item.dart';
import 'package:quicksale_super_admin/models/store_model.dart';
import 'package:quicksale_super_admin/styles/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quicksale_super_admin/views/store/stores.dart';

class Home extends StatelessWidget {
  Home({super.key});

  GlobalKey<ScaffoldState> _sk = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sk,
      endDrawer: Container(
        margin: EdgeInsets.all(20),
        width: 280,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor:Colors.grey.withOpacity(0.5),
                    child: Icon(Icons.person, color: Karas.primary,),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kaluba Chakanga'),
                      Text('kalubachakanga@gmail.com', style: TextStyle(fontSize: 10, color: Colors.grey),),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SUPER ADMIN", style: GoogleFonts.aDLaMDisplay(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Karas.primary)),),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                       onTap: (){
                          _sk.currentState!.openEndDrawer();
                       },
                        child: Container(
                           padding: EdgeInsets.all(4),
                            child: Icon(Icons.menu)
                        )
                    )
                  ],
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Karas.secondary
              ),
              child: Row(
                children: [
                  MenuItem(
                    title: 'STORES',
                    icon: Icon(Icons.store),
                    tap: ()=>null,
                  ),
                  SizedBox(width: 20,),
                  MenuItem(
                    tap: ()=>null,
                    title: 'AGENTS',
                    icon: Icon(Icons.real_estate_agent, color: Colors.orange,),
                  ),
                  SizedBox(width: 20,),
                  MenuItem(
                    tap: ()=>null,
                    title: 'FINANCE',
                    icon: Icon(Icons.account_balance_wallet, color: Colors.green,),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Stores()
            )
          ],
        ),
      ),
    );
  }
}
