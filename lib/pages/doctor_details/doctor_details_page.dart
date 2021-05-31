import 'package:flutter/material.dart';

import 'package:medical_challenge/core/core.dart';
import 'package:medical_challenge/pages/doctor_details/widgets/text_sub_detail_widget.dart';
import 'package:medical_challenge/pages/doctor_details/widgets/text_title_detail_widget.dart';
import 'package:medical_challenge/shared/models/doctor_model.dart';

class DoctorDetailsPage extends StatelessWidget {
  final DoctorModel item;

  const DoctorDetailsPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Doctor Detail'),
          backgroundColor: AppColors.cPrimaryGradientColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitleDetailWidget(title: "Médico"),
              TextSubDetailWidget(description: item.name),
              TextTitleDetailWidget(title: "CRM"),
              TextSubDetailWidget(description: item.crm),
              TextTitleDetailWidget(title: "Endereço"),
              TextSubDetailWidget(description: item.address),
              TextTitleDetailWidget(title: "Telefone"),
              TextSubDetailWidget(description: item.phone),
              TextTitleDetailWidget(title: "Valor da Consulta"),
              TextSubDetailWidget(
                  description:
                      item.amount.toStringAsFixed(2).replaceAll('.', ','))
            ],
          ),
        ),
      ),
    );
  }
}
