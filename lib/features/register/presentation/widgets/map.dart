import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pharma/features/register/presentation/bloc/register_bloc.dart';

import '../../../../injection.dart';

class MapLocation extends StatefulWidget {
  MapLocation({Key key}) : super(key: key);

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  Position initialLocation;
  LatLng currentPostion;
  RegisterBloc registerBloc = sl<RegisterBloc>();

  @override
  void initState() {
    registerBloc.add(GetLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> controller = Completer();

    return 
  initialLocation!=null?  BlocBuilder(
      bloc:  registerBloc,
      builder: (context, state) {
        if (state is GetLocaionState){
          initialLocation = state.position;
        }
        return mapWidget(context, controller, initialLocation);
      },
    ):Center(child: CircularProgressIndicator());
  }
}

mapWidget(context, controller, initialLocation) {
  showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: initialLocation,
            onMapCreated: (GoogleMapController controller) {},
          ),
        );
      });
}
