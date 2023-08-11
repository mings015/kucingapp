import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../../controllers/page_index_controller.dart';

class MinumController extends GetxController {
  final pageC = Get.find<PageIndexController>();
  final DatabaseReference historyMakan =
      FirebaseDatabase.instance.ref('AlatMinum/History/');

  final DatabaseReference wadah =
      FirebaseDatabase.instance.ref('AlatMinum/LevelWadah');
  final DatabaseReference timbangan =
      FirebaseDatabase.instance.ref('AlatMinum/Timbangan');

  final DatabaseReference getSet1 =
      FirebaseDatabase.instance.ref('AlatMinum/SetWaktu/');

  var selectedTimeSet1 = "Pilih waktu".obs;
  var selectedTimeSet2 = "Pilih waktu".obs;

  void showTimePickerSet1() {
    DatePicker.showTimePicker(
      Get.context!,
      showSecondsColumn: true,
      currentTime: DateTime.now(),
      onConfirm: (DateTime time) {
        String hour = time.hour.toString();
        String minute = time.minute.toString();
        String second = time.second.toString();

        selectedTimeSet1.value = "$hour-$minute-$second";
      },
    );
  }

  void showTimePickerSet2() {
    DatePicker.showTimePicker(
      Get.context!,
      showSecondsColumn: true,
      currentTime: DateTime.now(),
      onConfirm: (DateTime time) {
        String hour = time.hour.toString();
        String minute = time.minute.toString();
        String second = time.second.toString();

        selectedTimeSet2.value = "$hour-$minute-$second";
      },
    );
  }

  void sendToFirebaseSet1() {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    databaseReference
        .child('AlatMinum')
        .child('SetWaktu')
        .child('Set1')
        .update({
      'Detik': selectedTimeSet1.value.split('-')[2],
      'Jam': selectedTimeSet1.value.split('-')[0],
      'Menit': selectedTimeSet1.value.split('-')[1],
      'set': "1"
    });
  }

  void sendToFirebaseSet2() {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    databaseReference
        .child('AlatMinum')
        .child('SetWaktu')
        .child('Set2')
        .update({
      'Detik': selectedTimeSet2.value.split('-')[2],
      'Jam': selectedTimeSet2.value.split('-')[0],
      'Menit': selectedTimeSet2.value.split('-')[1],
      'set': "2"
    });
  }
}
