
import 'package:vietjet_tool/common/local_storage/my_storage.dart';
import 'package:vietjet_tool/controllers/my_controller.dart';
import 'package:vietjet_tool/models/fuel/fuel.dart';

class FuelCalcController extends MyController{

  FuelCalcController(super.myState);

   Fuel fuel=Fuel();
  @override
  Future<void> loadData() async{
    fuel=await MyStorage().getFuel()??Fuel();
  }

  void setFuel(Fuel value){
    fuel=value;
    calcTotal();
   // update();
  }

  void calcTotal(){
    int upliftL=(fuel.afterL??0)-(fuel.beforeL??0);
    int upliftC=(fuel.afterC??0)-(fuel.beforeC??0);
    int upliftR=(fuel.afterR??0)-(fuel.beforeR??0);
    int upliftOr=(fuel.afterOr??0)-(fuel.beforeOr??0);
    int afterTotal =(fuel.afterL??0)+(fuel.afterC??0)+(fuel.afterR??0)+(fuel.afterOr??0);
    int beforeTotal=(fuel.beforeL??0)+(fuel.beforeC??0)+(fuel.beforeR??0) +(fuel.beforeOr??0);
    int upliftTotal= afterTotal-beforeTotal;
    double kg=(fuel.gaLon??0)*3.785411784*(fuel.density??0);
    double discrepancy=kg-(fuel.upliftTotal??0);

    fuel=fuel.copyWith(
      upliftC: upliftC,
      upliftL: upliftL,
      upliftR: upliftR,
      upliftOr: upliftOr,
      upliftTotal: upliftTotal,
      afterTotal: afterTotal,
      beforeTotal: beforeTotal,
      kg: kg,
      discrepancy: discrepancy
    );
    MyStorage().setFuel(fuel);

    }

  }



