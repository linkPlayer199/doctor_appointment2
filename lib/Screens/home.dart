import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../Constants/constants.dart';
import '../Models/doctorsdata.dart';
import 'aboutus.dart';
import 'doctorprofile.dart';
import 'login.dart';
import 'myappointments.dart';
import 'privacypolicy.dart';
import 'setting.dart';
import 'viewappointment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var lenth = 3;
 // final List<String> titles = [
 //   '  Dr. Valenito Morse',
 //   '  Dr. Rebecca',
 //   '  Dr. Elizabeth ',
 //   '  Dr. Mary Edwards',
 //   '  Dr. Edward Jenner',
 // ];
 //
 // final List<String> imageUrls = [
 //   'https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg?w=360&t=st=1688379318~exp=1688379918~hmac=f4a91775ecf2792d8f0ea047141ec166df2ce4aa7f7f78ffe4f4768c5df312d5',
 //   'https://img.freepik.com/premium-photo/portrait-beautiful-mature-woman-doctor-lab-coat-hospital-shooting-studio_114579-92666.jpg?w=740',
 //   'https://img.freepik.com/premium-photo/medical-concept-asian-beautiful-female-doctor-white-coat-with-glasses-waist-high-medical-student-female-hospital-worker-looks-into-camera-smiles-studio-blue-background_185696-615.jpg?w=740',
 //   'https://img.freepik.com/free-photo/female-doctor-hospital-with-stethoscope_23-2148827776.jpg?w=360&t=st=1688379394~exp=1688379994~hmac=61e701449e912d312ce2c05d8a33866a5a59c050af95bffaf1f19f476322304b',
 //   'https://img.freepik.com/premium-photo/confidence-is-everything-my-career-studio-portrait-confident-mature-doctor-against-gray-background_590464-55938.jpg?w=740',
 // ];
Set<DoctorsData> doc= {};
String baseurl="https://doclive.info/assets/doctorImages/";
Future getdata()async{
 var data= await http.get(Uri.parse("https://doclive.info/api/doctors"));
 final datas=json.decode(data.body);
for(Map<String,dynamic> ass in datas){
  doc.add(DoctorsData.fromJson(ass));
}
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: Drawer(
        backgroundColor: Colors.grey.shade100,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: Container(
               // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 50,
                        backgroundImage: NetworkImage(GoogleUserImageurl ??
                            'https://img.freepik.com/free-photo/front-view-smiley-nurse_23-2148501062.jpg?w=740&t=st=1688458789~exp=1688459389~hmac=5e9ceaa08ca9f298a32b1059274bb06ce9fa81d49afd543e361981170fc48fe5')
                    ),
                    Text('${displayGname    ?? "Dr. Angela   "}')
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book_online),
              title: Text('My Appointments'),
              onTap: () {
                // Handle drawer item tap
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyAppiontmentsScreen()));
                //// Close the drawer
                // Add any navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('About Us'),
              onTap: () {
                // Handle drawer item tap
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUsScreen()));
                //Navigator.pop(context); // Close the drawer
                // Add any navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle drawer item tap
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen()));
                // Close the drawer
                // Add any navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              title: Text('Privacy Policy'),
              onTap: () {
                // Handle drawer item tap
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
                //// Close the drawer
                // Add any navigation logic here
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Text('Home',style: TextStyle(
          color: Colors.black
        )),
        actions: const [Icon(Icons.person_outlined),SizedBox(width: 15,)],
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text('   Hi, ${displayGname ?? "Eden"}',style: MainHeading1),
            const SizedBox(height: 5,),
            Text('     Find your suitable doctor',style: SubHeading1,),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('    Lets Find Your Doctor',style: MainHeading2),const Text('See all      ',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search...',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.tune_outlined),
                    onPressed: (){},
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              child: FutureBuilder(
                future: getdata(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                  return ListView.builder(
                    itemCount: doc.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {

                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: (){
                            print('${baseurl}+${doc.elementAt(index).image.toString()}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorProfile(doctorName: doc.elementAt(index).name.toString(),doctorProfileURL: "${baseurl}${doc.elementAt(index).image.toString()}")));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            width: MediaQuery.of(context).size.width/2.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(child: const SizedBox(height: 30,)),
                                Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Text(doc.elementAt(index).name.toString(),style: MainHeading2),
                                  ],
                                ),
                                const SizedBox(height: 2,),
                                Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Text(doc.elementAt(index).speciality.toString(),style: SubHeading1,),
                                  ],
                                ),
                                Flexible(child: const SizedBox(height: 10,)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(height: MediaQuery.of(context).size.height/5,width: MediaQuery.of(context).size.width/2.5,
                                    decoration: BoxDecoration(
                                        image:  DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                            NetworkImage("${baseurl}${doc.elementAt(index).image.toString()}"),
                                        ),
                                        color: Colors.grey.shade300,borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    const SizedBox(width:  9,),
                                    const Icon(Icons.medical_services_outlined,color: Colors.grey,),
                                    Container(child: Column(children:  [Text('Experience',style: TextStyle(fontSize: 12,color: Colors.grey)),Text('${doc.elementAt(index).experience.toString()} Years',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)],)),
                                    const SizedBox(width:  5,),
                                    const Icon(Icons.star,color: Colors.yellow,),
                                    Container(child: Column(children: const [Text('5.0',style: TextStyle(fontSize: 12,color: Colors.grey)),Text('Rating',style: TextStyle(fontSize: 12,color: Colors.grey))],))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('    Your Appointment',style: MainHeading2),const Text('See all      ',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)],
            ),
            Container(
              height: lenth.toDouble() * 145,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                itemCount: lenth,
                  itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ViewAppointmentScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),width: MediaQuery.of(context).size.width/1.5,
                      height: MediaQuery.of(context).size.height/7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(radius: 40,backgroundColor: Colors.grey.shade200,backgroundImage: NetworkImage(
                            'https://img.freepik.com/premium-photo/confidence-is-everything-my-career-studio-portrait-confident-mature-doctor-against-gray-background_590464-55938.jpg?w=740')),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                          Icon(Icons.star,color: Colors.yellow,),Text('5.0')],),
                          const Text('Dr. Hans Down',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                          const Text('General Surgery',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey),)
                        ]),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,borderRadius: BorderRadius.circular(10)),
                          height: MediaQuery.of(context).size.height/10,
                          width: MediaQuery.of(context).size.width/3,
                          child:
                          GoogleMap(
                            zoomControlsEnabled: false,
                            mapType: MapType.normal,
                            initialCameraPosition:
                            CameraPosition(
                              zoom: 15.0,
                              target: LatLng(31.5204, 74.3587),),
                          ),
                        )
                      ],
                    ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
