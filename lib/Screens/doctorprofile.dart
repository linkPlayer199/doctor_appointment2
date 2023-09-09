import 'package:doctor_appointment2/Screens/slotsscreen.dart';
import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Models/allslots.dart';
import '../Widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
Set<AllSlots> appointments={};
class DoctorProfile extends StatefulWidget {
  final String doctorName;
  final String doctorProfileURL;
  const DoctorProfile({required this.doctorName,required this.doctorProfileURL});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {

  fetchdata()async{
    var data= await http.get(Uri.parse("https://doclive.info/api/allslots"));
    final datas=json.decode(data.body);
    for(Map<String,dynamic> asas in datas){
      appointments.add(AllSlots.fromJson(asas));
    }
  }
  @override
  void initState() {fetchdata();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Doctor Profile',style: TextStyle(color: Colors.black)),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined,color: Colors.black,))],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 0,top: 5,bottom: 15),
            child: Container(
            width: MediaQuery.of(context).size.width/1.1,
            height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
              child: Column(
                  children: [
                    Row(
                      children: [
                        //SizedBox(width: MediaQuery.of(context).size.width/15),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 20,right: 0),

                          child: CircleAvatar(radius: 40,backgroundColor: Colors.grey.shade200,backgroundImage: NetworkImage(
                            widget.doctorProfileURL
                          )),
                        ),
                        Flexible(child: SizedBox(width: MediaQuery.of(context).size.width/15)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         // SizedBox(width: MediaQuery.of(context).size.height/5),
                          Text(widget.doctorName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                          SizedBox(height:  MediaQuery.of(context).size.height/99),
                          const Text('Orthopedics & Tramatology',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey),)
                        ]),
                        SizedBox(width: MediaQuery.of(context).size.width/15),
                  Icon(Icons.more_vert,color: Colors.grey.shade700,)
                  ],
                ),
                    SizedBox(height:  MediaQuery.of(context).size.height/55),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Container(decoration: BoxDecoration(color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width/2.5,
                        height: MediaQuery.of(context).size.height/10,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                           // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width/15),
                          Icon(Icons.medical_services_outlined,color: Colors.grey,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Experience'),Text('10 Years+',style: TextStyle(fontWeight: FontWeight.bold)),],)
                        ]),
                      ),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width/2.5,
                          height: MediaQuery.of(context).size.height/10,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width/15),
                                Icon(Icons.star,color: Colors.yellow,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('5.0',style: TextStyle(color: Colors.grey,fontSize: 16)),Text('Rating',style: TextStyle(color: Colors.grey,fontSize: 16)),],)
                              ]),
                        ),
                    ],),
                    SizedBox(height:  MediaQuery.of(context).size.height/30),
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/5,
                      child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition:
                          CameraPosition(target: LatLng(37.432, -122.088),),
                      ),

                      // child:
                      // Center(
                      //     child:
                      // Icon(Icons.location_on_outlined,color: Colors.blue,size: 36,)),
                      decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(10)),
                    ),

              ]),
        ),
          ),
          Row(children: [Text('    Upcoming Schedule',style: MainHeading2,)],),
          SizedBox(height: 10,),
          Container(
            decoration:
            BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width/1.1,height: MediaQuery.of(context).size.height/6,
            child: Column(
              children: [
                //SizedBox(height: MediaQuery.of(context).size.height/55),
                Flexible(child: SizedBox(height: 10,)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(radius: 40,backgroundColor: Colors.grey.shade200,backgroundImage: NetworkImage('https://img.freepik.com/premium-photo/medical-concept-indian-beautiful-female-doctor-white-coat-with-stethoscope-waist-up-medical-student-woman-hospital-worker-looking-camera-smiling-studio-blue-background_185696-621.jpg?size=626&ext=jpg&ga=GA1.2.1828602063.1656991324&semt=sph')),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(Icons.star,color: Colors.yellow,),Text('5.0')],),
                          const Text('Dr. Hans Down',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                          const Text('General Surgery',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey),)
                        ]),
                    Container(decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(10)),
                      height: MediaQuery.of(context).size.height/10,
                      width: MediaQuery.of(context).size.width/3,
                      child:
                      GoogleMap(
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,
                        initialCameraPosition:
                        CameraPosition(target: LatLng(31.5204, 74.3587),zoom: 15),
                      )
                    )
                  ],
                ),
                Divider(
                  indent: 15,endIndent: 15,
                  thickness: 2,
                ),
                Row(children: [SizedBox(width: 15,),Icon(Icons.medical_services_outlined,color: Colors.grey),Text(' 15 October 2022, 01:30 PM',style: TextStyle(color: Colors.grey),)],)
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(children: [Text('    Biography',style: MainHeading2,)],),
        ],
      ),
      floatingActionButton:
      InkWell(
        onTap: (){
         // fetchdata();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SlotsScreen()),
          );
         //  showModalBottomSheet<void>(
         //    context: context,
         //    builder: (BuildContext context) {
         //      return BottomSheetInsideCW(
         //        doctorProfileURL: widget.doctorProfileURL,
         //        doctorName: widget.doctorName,
         //      );
         //    },
         //  );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: primarycolor
          ),
          height: 50,width: MediaQuery.of(context).size.width/1.1,
          child: Center(child: Text('MAKE APPOINTMENT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}


