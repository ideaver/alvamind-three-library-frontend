import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppMaps extends StatefulWidget {
  final MapType mapType;
  final bool zoomControlsEnabled;
  final bool mapToolbarEnabled;
  final bool myLocationEnabled;
  final bool myLocationButtonEnabled;
  final double lat;
  final double lng;
  final double zoom;
  final Set<Marker> markers;
  final EdgeInsets padding;
  final Function(GoogleMapController)? onMapCreated;
  final Function(CameraPosition)? onCameraMove;

  const AppMaps({
    super.key,
    this.mapType = MapType.normal,
    this.zoomControlsEnabled = true,
    this.mapToolbarEnabled = false,
    this.myLocationEnabled = true,
    this.myLocationButtonEnabled = true,
    required this.lat,
    required this.lng,
    this.zoom = 14,
    this.markers = const {},
    this.padding = EdgeInsets.zero,
    this.onMapCreated,
    this.onCameraMove,
  });

  @override
  State<AppMaps> createState() => AppMapsState();
}

class AppMapsState extends State<AppMaps> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: widget.zoomControlsEnabled,
      mapType: widget.mapType,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.lat, widget.lng),
        zoom: widget.zoom,
      ),
      mapToolbarEnabled: widget.mapToolbarEnabled,
      myLocationEnabled: widget.myLocationEnabled,
      myLocationButtonEnabled: widget.myLocationButtonEnabled,
      padding: widget.padding,
      markers: widget.markers,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        if (widget.onMapCreated != null) {
          widget.onMapCreated!(controller);
        }
      },
      onCameraMove: (camera) {
        if (widget.onCameraMove != null) {
          widget.onCameraMove!(camera);
        }
      },
    );
  }
}
