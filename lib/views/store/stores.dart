import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:customizable_dropdown/customizable_dropdown.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../models/store_model.dart';
import '../../styles/colors.dart';

class Stores extends StatelessWidget {
  Stores({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('store').snapshots(),
          builder: (c,snapshot){
            if (snapshot.hasData) {
              
              List<StoreModel> stores = snapshot.data!.docs.map((st)=>
                  StoreModel(
                      uid: st.id, 
                      storeName: st.get('name'), 
                      email: st.get('email'), 
                      location: st.get('location'), 
                      logo: st.get('logo'), 
                      datetime: st.get('datetime'), 
                      district: st.get('district'),
                       printerMac: st.get('printer_mac'),
                      status: st.get('status')
                  )).toList();
              
              return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.grey,size: 16,),
                            SizedBox(width: 2,),
                            Container(
                              width: 200,
                               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                child:   CustomizableDropdown(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    icon: const Icon(
                                  Icons.keyboard_arrow_right,color: Colors.black,),
                                    titleAlign: TextAlign.start,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [ BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 5,
                                          offset:
                                          const Offset(1, 1)),],),
                                    itemList: stores.map((title)=>title.district).toSet().toList(),
                                    onSelectedItem: (selected) {},
                                    placeholder: const Text("Districts"),

                                )
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.size,
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                              var data = snapshot.data!.docs[index];
                              StoreModel _store = StoreModel(
                                  uid: data.id,
                                  storeName: data.get('name'),
                                  email: data.get('email'),
                                  location: data.get('location'),
                                  logo: data.get('logo'),
                                  datetime: data.get('datetime'), 
                                  district: '${data.get('district')}', 
                                  printerMac: data.get('printer_mac'),
                                  status: data.get('status')
                              );

                              return InkWell(
                                onTap: (){
                                  Get.bottomSheet(
                                    Container(
                                      color: Karas.background,
                                    ),
                                    backgroundColor: Colors.white
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: CachedNetworkImage(
                                          width: 40,
                                          height: 40,
                                          imageUrl: '${_store.logo}',
                                          fit: BoxFit.cover,
                                          errorWidget: (e,c,w)=>Icon(Icons.store, size: 40,color: Karas.primary,),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text('${_store.storeName}'),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Karas.primary,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.2)
                    ),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(
                      child: Container(
                          child: SfCartesianChart(

                              primaryXAxis: CategoryAxis(),
                              // Chart title
                              title: ChartTitle(text: 'Half yearly Usage analysis'),
                              // Enable legend
                              legend: Legend(isVisible: false),

                              series: <LineSeries<SalesData, String>>[
                                LineSeries<SalesData, String>(
                                    dataSource:  <SalesData>[
                                      SalesData('Jan', 35),
                                      SalesData('Feb', 28),
                                      SalesData('Mar', 34),
                                      SalesData('Apr', 32),
                                      SalesData('May', 40)
                                    ],
                                    xValueMapper: (SalesData sales, _) => sales.year,
                                    yValueMapper: (SalesData sales, _) => sales.sales,
                                    // Enable data label
                                    dataLabelSettings: DataLabelSettings(isVisible: true)
                                )
                              ]
                          )
                      )
                  ),
                )
              ],
            );
            } else {
              return Container();
            }
          }
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}