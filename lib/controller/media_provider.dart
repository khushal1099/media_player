import 'package:flutter/cupertino.dart';

class MediaProvider extends ChangeNotifier{

  void refresh(){
    notifyListeners();
  }

}