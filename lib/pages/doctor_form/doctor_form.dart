import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:medical_challenge/core/core.dart';
import 'package:medical_challenge/pages/doctor_form/stores/doctor_form_store.dart';
import 'package:medical_challenge/pages/doctor_form/widgets/custom_text_field.dart';
import 'package:medical_challenge/pages/doctor_form/widgets/custom_buttom_widget.dart';

class DoctorForm extends StatefulWidget {
  final String id;

  const DoctorForm({
    Key? key,
    this.id = '',
  }) : super(key: key);

  @override
  _DoctorFormState createState() => _DoctorFormState();
}

class _DoctorFormState extends State<DoctorForm> {
  DoctorFormStore store = GetIt.instance<DoctorFormStore>();

  final cFormKey = GlobalKey<FormState>();

  late FocusNode focusNodeName;
  late FocusNode focusNodeCrm;
  late FocusNode focusNodeAddress;
  late FocusNode focusNodePhone;
  late FocusNode focusNodeAmount;

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerCrm = TextEditingController();
  final TextEditingController controllerAddress = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerAmount = TextEditingController();

  @override
  void initState() {
    focusNodeName = FocusNode();
    focusNodeCrm = FocusNode();
    focusNodeAddress = FocusNode();
    focusNodePhone = FocusNode();
    focusNodeAmount = FocusNode();

    super.initState();
    store.setupValidations();
    if (widget.id != '') {
      store.getDoctor(widget.id).then((value) {
        controllerName.text = store.name;
        controllerCrm.text = store.crm;
        controllerAddress.text = store.address;
        controllerPhone.text = store.phone;
        controllerAmount.text = store.amount.toString();
      });
    }
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Doctor Detail'),
          backgroundColor: AppColors.cPrimaryGradientColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Observer(
                    builder: (_) => CustomTextField(
                      controller: controllerName,
                      onChanged: (value) => store.name = value,
                      label: 'Nome',
                      maxLength: 100,
                      currentNode: focusNodeName,
                      errorText: store.error.name,
                      nextNode: focusNodeCrm,
                      state: store.cStateForm,
                    ),
                  ),
                  Observer(
                    builder: (_) => CustomTextField(
                        controller: controllerCrm,
                        onChanged: (value) => store.crm = value,
                        label: 'CRM',
                        maxLength: 10,
                        currentNode: focusNodeCrm,
                        errorText: store.error.crm,
                        nextNode: focusNodeAddress,
                        state: store.cStateForm),
                  ),
                  Observer(
                    builder: (_) => CustomTextField(
                        controller: controllerAddress,
                        onChanged: (value) => store.address = value,
                        label: 'Endereço',
                        maxLength: 200,
                        currentNode: focusNodeAddress,
                        errorText: store.error.address,
                        nextNode: focusNodePhone,
                        state: store.cStateForm),
                  ),
                  Observer(
                    builder: (_) => CustomTextField(
                        controller: controllerPhone,
                        onChanged: (value) => store.phone = value,
                        label: 'Telefone',
                        maxLength: 20,
                        onlyNumber: true,
                        phone: true,
                        currentNode: focusNodePhone,
                        errorText: store.error.phone,
                        nextNode: focusNodeAmount,
                        state: store.cStateForm),
                  ),
                  Observer(
                    builder: (_) => CustomTextField(
                        controller: controllerAmount,
                        decimal: true,
                        onChanged: (value) {
                          double cValue = 0;
                          try {
                            cValue = double.parse(value);
                          } finally {
                            store.amount = cValue;
                          }
                        },
                        label: 'Valor da Consulta R\$',
                        maxLength: 0,
                        currentNode: focusNodeAmount,
                        errorText: store.error.amount,
                        nextNode: focusNodeAmount,
                        onlyNumber: true,
                        state: store.cStateForm),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomButton(
          title: 'Confirmar',
          onTap: () {
            store.save(context);
          },
        ),
      ),
    );
  }
}
