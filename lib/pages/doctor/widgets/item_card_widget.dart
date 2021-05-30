import 'package:flutter/material.dart';
import 'package:medical_challenge/core/core.dart';
import 'package:medical_challenge/pages/doctor/widgets/item_options_widget.dart';
import 'dart:math' as math;
import 'package:medical_challenge/shared/models/doctor_model.dart';

class ItemCardWidget extends StatelessWidget {
  final Doctor item;

  const ItemCardWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Center(
                        child: Text(
                      item.doctorDetails.name[0].toUpperCase(),
                      style: AppTextStyles.cFirstCaracterTextStyle,
                    )),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.doctorDetails.name,
                          style: AppTextStyles.cTitleTextstyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CRM:  ${item.doctorDetails.crm}",
                            style: AppTextStyles.cSubTextStyle,
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                              "Valor: ${item.doctorDetails.amount.toStringAsFixed(2).replaceAll('.', ',')}",
                              style: AppTextStyles.cSubTextStyle),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemOptionsWidget(
                      color: Colors.amber,
                      onTap: () {},
                      title: 'Editar',
                    ),
                    SizedBox(width: 2),
                    ItemOptionsWidget(
                      color: Colors.red,
                      onTap: () {},
                      title: 'Excluir',
                    ),
                    SizedBox(width: 2),
                    ItemOptionsWidget(
                      color: Colors.blue,
                      onTap: () {},
                      title: 'Info',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
