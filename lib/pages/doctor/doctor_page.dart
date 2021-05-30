import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_challenge/core/core.dart';
import 'package:medical_challenge/pages/doctor/widgets/item_card_widget.dart';
import 'package:medical_challenge/shared/stores/doctor_store.dart';

class DoctorPage extends StatefulWidget {
  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  DoctorStore cData = GetIt.instance<DoctorStore>();

  @override
  void initState() {
    // if (cData.cStatusList != StatusList.error) cData.getItems();
    cData.getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Doctors'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: AppColors.cBackGroundAddButton,
        ),
        body: Observer(
          builder: (BuildContext context) {
            switch (cData.cStatusList) {
              case StatusList.empty:
                return Center(
                  child: Text('Não há doutores cadastrados'),
                );
              case StatusList.error:
                return Center(
                  child: Text(cData.messageError),
                );
              case StatusList.initial:
                return Center(
                  child: Text(''),
                );
              case StatusList.loaded:
                return ListView.builder(
                  itemCount: cData.cItems.length,
                  itemBuilder: (context, index) {
                    return ItemCardWidget(
                      item: cData.cItems[index],
                    );
                  },
                );
              case StatusList.loading:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}
