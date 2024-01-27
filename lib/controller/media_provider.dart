import 'package:flutter/cupertino.dart';

import '../main.dart';

class MediaProvider extends ChangeNotifier {


  void refresh() {
    notifyListeners();
  }

  void restartCurrentSong() {
    assetsAudioPlayer.seek(Duration.zero, force: true);
    assetsAudioPlayer.play();
    notifyListeners();
  }


}
