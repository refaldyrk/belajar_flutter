import 'package:belajar_flutter/main_screen.dart';
import 'package:belajar_flutter/model/tourism_place.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wisata Bandung'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(place.imageUrls[0]),
                Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: Text(place.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
                Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: Text(place.location,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MainScreen();
                    }));
                  }, child:  IconButton(onPressed: (){}, icon: Icon(
                    Icons.arrow_back,
                  )
                  )
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                              place.openDays
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            place.openTime
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            place.ticketPrice,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child:  Text(
                   place.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: place.imageUrls.map((url) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(url),
                          ),
                        );
                      }).toList(),
                )
                )
              ],
            ),
          ),
        )
    );
  }
}
