import 'package:get/get.dart';

class BottomNavController extends GetxController implements GetxService{

  int currentIndex = 0;

  void updateCurrentIndex(int index){
    currentIndex = index;
    update();
  }
}