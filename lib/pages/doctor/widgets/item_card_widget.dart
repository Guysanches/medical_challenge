import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_challenge/core/core.dart';
import 'package:medical_challenge/pages/doctor/widgets/item_options_widget.dart';
import 'dart:math' as math;
import 'package:medical_challenge/shared/models/doctor_model.dart';
import 'package:medical_challenge/shared/stores/doctor_store.dart';

class ItemCardWidget extends StatelessWidget {
  final DoctorModel item;

  const ItemCardWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorStore cData = GetIt.instance<DoctorStore>();

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
                      item.name[0].toUpperCase(),
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
                      Text(item.name, style: AppTextStyles.cTitleTextstyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CRM:  ${item.crm}",
                            style: AppTextStyles.cSubTextStyle,
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Text(
                              "Valor R\$: ${item.amount.toStringAsFixed(2).replaceAll('.', ',')}",
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
                      onTap: () async {
                        await Navigator.of(context).pushNamed('/doctorform',
                            arguments: FormArg(item.id));
                      },
                      title: 'Editar',
                    ),
                    SizedBox(width: 2),
                    ItemOptionsWidget(
                      color: Colors.red,
                      onTap: () async {
                        await cData.delete(item);
                      },
                      title: 'Excluir',
                    ),
                    SizedBox(width: 2),
                    ItemOptionsWidget(
                      color: Colors.blue,
                      onTap: () async {
                        await Navigator.of(context).pushNamed('/doctordetails',
                            arguments: Details(item));
                      },
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
