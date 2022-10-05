import 'dart:async';

import 'package:booking_app/app/explore/presentation/controller/cubit/explore_cubit.dart';
import 'package:booking_app/app/search/presentation/widgets/card_of_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late ExploreCubit cubit;
  int markerIdCounter = 1;
  final Set<Marker> _markers = <Marker>{};
  final Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    cubit = BlocProvider.of<ExploreCubit>(context);
    super.initState();
  }

// Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              buildingsEnabled: true,
              mapType: MapType.hybrid,
              initialCameraPosition: const CameraPosition(
                  zoom: 16, target: LatLng(27.049302, 33.900214))),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 2.w, top: 4.h),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 4.h),
            height: 22.h,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              // physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  gotoSearchedPlace(
                      double.parse(cubit.data!.hotelData[index].latitude),
                      double.parse(cubit.data!.hotelData[index].longitude),
                      cubit.data!.hotelData[index].name);
                },
                child: CardOfMap(hotel: cubit.data!.hotelData[index]),
              ),
              itemCount: cubit.data!.hotelData.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> gotoSearchedPlace(double lat, double lng, String title) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));

    _setMarker(LatLng(lat, lng), title);
  }

  void _setMarker(point, String title) {
    var counter = markerIdCounter++;

    final Marker marker = Marker(
      markerId: MarkerId('marker_$counter'),
      position: point,
      infoWindow: InfoWindow(
        title: title,
      ),
      onTap: () {},
      icon: BitmapDescriptor.defaultMarker,
    );

    setState(() {
      _markers.add(marker);
    });
  }
}
