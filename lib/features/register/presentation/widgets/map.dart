// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:pharma/features/register/presentation/bloc/register_bloc.dart';

// import '../../../../injection.dart';

// class MapLocation extends StatefulWidget {
//   MapLocation({Key key}) : super(key: key);

//   @override
//   State<MapLocation> createState() => _MapLocationState();
// }

// class _MapLocationState extends State<MapLocation> {
//   Position initialLocation;
//   LatLng currentPostion;

//   RegisterBloc registerBloc = sl<RegisterBloc>();
//    Completer<GoogleMapController> controller = Completer();

//   @override
//   void initState() {
//     registerBloc.add(GetLocationEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
   

//     return  Scaffold(body: 
//   initialLocation!=null?  BlocBuilder(
//       bloc:  registerBloc,
//       builder: (context, state) {
//         if (state is GetLocaionState){
//           initialLocation = state.position;
//         }
//         return  GoogleMap(
//             mapType: MapType.hybrid,
        
//             onMapCreated: (GoogleMapController controller) {}, initialCameraPosition: CameraPosition(target: LatLng(initialLocation.latitude , initialLocation.longitude)),
//           );
           
//       },
//     ):Center(child: CircularProgressIndicator()));
//   }
// }

// mapWidget(context, controller, initialLocation) {
//   showModalBottomSheet<void>(
//       isScrollControlled: true,
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           child: GoogleMap(
//             mapType: MapType.hybrid,
//             initialCameraPosition: initialLocation,
//             onMapCreated: (GoogleMapController controller) {},
//           ),
//         );
//       });
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma/App/app.dart';
import 'package:pharma/Core/Consts.dart';
import 'package:pharma/features/register/presentation/bloc/register_bloc.dart';

import '../../../../injection.dart';


class MyLocation extends StatefulWidget {
final Function function;

  const MyLocation({Key key, this.function}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyLocation> {
  
  RegisterBloc registerBloc = sl<RegisterBloc>();

  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();


    static  LatLng mainLocation ;
  GoogleMapController myMapController;
   Set<Marker> _markers ={};
 @override
  void initState() {
    registerBloc.add(GetLocationEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return 
       WillPopScope(onWillPop: () => willPopScope(),
         
         
         child: Scaffold(

           key: scaffoldkey,
          
              appBar: AppBar(
          leading: GestureDetector(
            onTap:()=> willPopScope(),
            child: Icon(Icons.check)),
                //  automaticallyImplyLeading: false,
                title: Text('حدد الموقع'),
                
                centerTitle: true,
                backgroundColor: Colors.blue[900],
              ),
           body:      BlocBuilder(
             bloc:  registerBloc,
             builder: (context, state) {
          if (state is GetLocaionState){
            mainLocation = LatLng( state.position.latitude , state.position.longitude);
               _markers.add(Marker(markerId: MarkerId('2'),position: mainLocation));
          }
       
          if (state is Loading){
            return Center(child: CircularProgressIndicator());
          }
          if (state is RegisterInitial){
             return Center(child: CircularProgressIndicator());
          }
           return    Stack(
             children: [
          Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: GoogleMap(
                          zoomControlsEnabled: false,
                          myLocationButtonEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: LatLng( mainLocation.latitude,mainLocation.longitude),
                            zoom: 17.0,
                          ),
                          markers: _markers,
                          mapType: MapType.normal,
                          onMapCreated: (controller) {
                            // setState(() {
                              myMapController = controller;
                            // });
                          },
                          onTap: (argument) {
                           
                            
                            mainLocation = argument;
                  
                            setState(() {
                              _markers.add(Marker(markerId: MarkerId('2'),position: argument));
                                 
                              
                            });
                     
       
                             
                          } ,
                        ),
                      ),
                    ],
                  ),

                Positioned(
                  right: w(10),
                  top: h(600),
                  child: GestureDetector(
                    onTap: (){
                      willPopScope();
                    },
                    child: Container(height: h(70),width: w(70),decoration: BoxDecoration(shape: BoxShape.circle,color: AppColor.blue),child: Icon(Icons.check,color: Colors.white,size: 40,),)),
                )

             ],
           );
         
         })),
       );}


  Future<bool> willPopScope() async {

    
   Navigator.of(context).pop();
   widget.function(mainLocation);
    return true;
    

  
  

  }
  
}

