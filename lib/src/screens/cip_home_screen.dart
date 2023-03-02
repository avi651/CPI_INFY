import 'dart:async';
import 'package:cip/src/components/cip_map_components.dart';
import 'package:cip/src/models/iss_data_model.dart';
import 'package:cip/src/widgets/cip_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bloc/cip_bloc.dart';
import '../widgets/error_widget.dart';

class CIPHomeScreen extends StatefulWidget {
  @override
  State<CIPHomeScreen> createState() => _CIPHomeScreenState();
}

class _CIPHomeScreenState extends State<CIPHomeScreen> {

  @override
  void initState() {
    super.initState();
    getCIPBloc.getCipData();
    _setUpTimedFetch();
  }

  _setUpTimedFetch() {
    Timer.periodic(Duration(seconds: 30), (timer) {
      setState(() {
        getCIPBloc.getCipData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CIPAppBar(
        title: 'CIP MAPS',
      ),
      body: StreamBuilder<ISSDataModel>(
          stream: getCIPBloc.subject,
          builder: (context, AsyncSnapshot<ISSDataModel> snapshot){
            if(snapshot.hasData) {
              if(snapshot.data == null){
                return Center(child: buildErrorWidget("No Data Found"));
              }
              return Container(
                child: CIPMapComponents(
                    lat: double.parse(snapshot.data!.issPosition!.latitude ?? ""),
                    lng: double.parse(snapshot.data!.issPosition!.longitude ?? ""),
                    timeStamp: snapshot.data!.timestamp ?? 0,
                ),
              );
            } else {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
      ),
    );
  }
}