// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:test_flutter/hive/chat_history.dart';
import 'package:test_flutter/hive/settings.dart';

import '../constants.dart';

class Boxes {
  static Box<ChatHistory> getChatHistory() =>
      Hive.box<ChatHistory>(Constants.chatHistoryBox);

  static Box<Settings> getSettings() =>
      Hive.box<Settings>(Constants.settingsBox);
}
