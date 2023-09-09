import 'package:flutter/material.dart';
import '../Constants/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Search',style: TextStyle(color: Colors.black)),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined,color: Colors.black,))],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
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
          SizedBox(height: 10,),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                '15 Saturday',
                style: MainHeading2,
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 2.4),
              Text('Oct 2022'),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 25),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blueAccent,),

                height: 90,width: 50,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Sat',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),Text('15',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))]),
              ),
              SizedBox(width: 30),
              Container(decoration:
              BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),width: MediaQuery.of(context).size.width/1.5,height: MediaQuery.of(context).size.height/7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(radius: 30,backgroundColor: Colors.grey.shade200,
                    backgroundImage: NetworkImage('https://img.freepik.com/free-photo/cheerful-medic-standing-with-arms-crossed_23-2147767252.jpg?w=740&t=st=1687531492~exp=1687532092~hmac=cb8e721342cb26c43505bd35f89740188acaf8058ad315fae693e0d115926f11'
                    ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(Icons.star,color: Colors.yellow,),Text('5.0')],),
                          const Text('Dr. Hans Down',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                          const Text('General Surgery',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey),)
                        ]),
                    Row(
                      children: [
                        Container(decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(10)),height: MediaQuery.of(context).size.height/10,width: MediaQuery.of(context).size.width/6,child: Center(child: Icon(Icons.pin_drop_outlined,color: Colors.blue,)),),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
