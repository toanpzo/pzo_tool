import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vietjet_tool/common/localizations/appLocalizations.dart';
import 'package:vietjet_tool/common/template/my_state.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/fuel/fuel.dart';
import 'package:vietjet_tool/ui/fuelCalc/fuel_calc_controller.dart';
import 'package:vietjet_tool/widgets/text_field/text_filed.dart';

class FuelCalcScreen extends StatefulWidget {
  const FuelCalcScreen({super.key});

  @override
  MyState createState() => _FuelCalcScreenState();
}

class _FuelCalcScreenState extends MyState<FuelCalcScreen> {
  @override
  MyController createController() {
    return FuelCalcController(this);
  }

  late FuelCalcController fuelCalcController;

  late Fuel fuel ;

  late TextEditingController _controllerBfL;
  late TextEditingController _controllerBfR;
  late TextEditingController _controllerBfC;
  late TextEditingController _controllerBfOr;

  late TextEditingController _controllerAfL;
  late TextEditingController _controllerAfR;
  late TextEditingController _controllerAfC;
  late TextEditingController _controllerAfOr;

  late TextEditingController _controllerGaLon;
  //late TextEditingController _controllerKg;
  late TextEditingController _controllerDensity;
  //late TextEditingController _controllerDiscrepancy;




  @override
  void initState() {
    super.initState();

  }



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  Future<void> afterLoadData() async{
    fuelCalcController=controller as FuelCalcController;
    fuel = fuelCalcController.fuel;
    _controllerBfL=TextEditingController(text: fuel.beforeL?.toString());
    _controllerBfC=TextEditingController(text: fuel.beforeC?.toString());
    _controllerBfR=TextEditingController(text: fuel.beforeR?.toString());
    _controllerAfL=TextEditingController(text: fuel.afterL?.toString());
    _controllerAfC=TextEditingController(text: fuel.afterC?.toString());
    _controllerAfR=TextEditingController(text: fuel.afterR?.toString());
    _controllerAfOr=TextEditingController(text: fuel.afterOr?.toString());
    _controllerBfOr=TextEditingController(text: fuel.beforeOr?.toString());

    _controllerGaLon=TextEditingController(text: fuel.gaLon?.toString());
    //_controllerKg=TextEditingController(text: fuel.kg?.toString());
     _controllerDensity=TextEditingController(text: fuel.density?.toString());

    //_controllerDiscrepancy=TextEditingController(text: fuel.discrepancy?.toString());
  }

  void onChangeFuel(){
    fuelCalcController.setFuel(fuel.copyWith(beforeL: int.parse(_controllerBfL.text),
    beforeOr: int.tryParse(_controllerBfOr.text),
    afterOr: int.tryParse(_controllerAfOr.text),
    beforeC: int.tryParse(_controllerBfC.text),
      beforeR: int.tryParse(_controllerBfR.text),
      afterL: int.tryParse(_controllerAfL.text),
      afterR: int.tryParse(_controllerAfR.text),
      afterC: int.tryParse(_controllerAfC.text),
      gaLon: int.tryParse(_controllerGaLon.text),
      density: double.tryParse(_controllerDensity.text),
    ));
  }

  @override
  Widget setBody() {
    fuel=fuelCalcController.fuel;
    double widthThree = MediaQuery.of(context).size.width * 0.25;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20,top: 20),
            //height: height*0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //before
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context).translate("Before"),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    MyTextFiled(
                      onChanged: (value)=> onChangeFuel(),// fuelCalcController.setFuel(fuel.copyWith(beforeL: int.tryParse(value))),
                      controller:_controllerBfL,
                      width: widthThree,
                      hintText: "Left",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      onChanged: (value)=> onChangeFuel(),// fuelCalcController.setFuel(fuel.copyWith(beforeC: int.tryParse(value))),
                      controller: _controllerBfC,
                      width: widthThree,
                      hintText: "Center",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      onChanged: (value)=> onChangeFuel(),// fuelCalcController.setFuel(fuel.copyWith(beforeR: int.tryParse(value))),
                      controller:_controllerBfR,
                      width: widthThree,
                      hintText: "Right",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      onChanged: (value)=> onChangeFuel(),// fuelCalcController.setFuel(fuel.copyWith(beforeR: int.tryParse(value))),
                      controller:_controllerBfOr,
                      width: widthThree,
                      hintText: "Other",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      readOnly: true,
                      controller: TextEditingController(text: fuel.beforeTotal?.toString()??""),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      width: widthThree,
                      hintText: "Total",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                //uplift
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context).translate("Uplift"),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    MyTextFiled(
                      readOnly: true,
                      controller: TextEditingController(text: fuel.upliftL?.toString()??""),
                      width: widthThree,
                      hintText: "Left",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      readOnly: true,
                      controller: TextEditingController(text: fuel.upliftC?.toString()??""),
                      width: widthThree,
                      hintText: "Center",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      readOnly: true,
                      controller: TextEditingController(text: fuel.upliftR?.toString()??""),
                      width: widthThree,
                      hintText: "Right",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      readOnly: true,
                      controller: TextEditingController(text: fuel.upliftOr?.toString()??""),
                      width: widthThree,
                      hintText: "Right",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      readOnly: true,
                      controller: TextEditingController(text: fuel.upliftTotal?.toString()??""),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      width: widthThree,
                      hintText: "Total",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                //after
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context).translate("After"),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    MyTextFiled(
                      onChanged: (value)=> onChangeFuel(),// fuelCalcController.setFuel(fuel.copyWith(afterL: int.tryParse(value))),
                      controller:_controllerAfL,
                      width: widthThree,
                      hintText: "Left",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      onChanged: (value)=> onChangeFuel(),// fuelCalcController.setFuel(fuel.copyWith(afterC: int.tryParse(value))),
                      controller:_controllerAfC,
                      width: widthThree,
                      hintText: "Center",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      onChanged: (value)=> onChangeFuel(),// fuelCalcController.setFuel(fuel.copyWith(afterR: int.tryParse(value))),
                      controller:_controllerAfR,
                      width: widthThree,
                      hintText: "Right",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      onChanged: (value)=> onChangeFuel(),// fuelCalcController.setFuel(fuel.copyWith(afterR: int.tryParse(value))),
                      controller:_controllerAfOr,
                      width: widthThree,
                      hintText: "Other",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextFiled(
                      readOnly: true,
                      controller: TextEditingController(text: fuel.afterTotal?.toString()??""),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      width: widthThree,
                      hintText: "Total",
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ],
            ),

          ),





          SizedBox(
            //height: height*0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Column(
                  children: [
                    Text(AppLocalizations.of(context).translate("GaLon"),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    MyTextFiled(
                      width: width*0.4,
                      controller: _controllerGaLon,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (p0) => onChangeFuel(),
                    ),
                    Text(AppLocalizations.of(context).translate("Kg"),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    MyTextFiled(
                      width: width*0.4,
                      readOnly: true,
                      controller: TextEditingController(text: fuel.kg?.toStringAsFixed(2)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(AppLocalizations.of(context).translate("Density"),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    MyTextFiled(
                      width: width*0.4,
                      controller: _controllerDensity,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (p0) => onChangeFuel(),
                    ),
                    Text(AppLocalizations.of(context).translate("Discrepancy"),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    MyTextFiled(
                      width: width*0.4,
                      readOnly: true,
                      controller: TextEditingController(text: fuel.discrepancy?.toStringAsFixed(2)),
                      textAlign: TextAlign.center,

                    ),
                  ],
                )

              ],
            ),
          ),


        ],
      )





      // ],
      //),
    );

    // return
  }

  @override
  String setTitle() {
    return "fuelCalc";

    //AppLocalizations.of(context).translate("Home");
  }
}
