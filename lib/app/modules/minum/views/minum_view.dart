import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/minum_controller.dart';

class MinumView extends GetView<MinumController> {
  const MinumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageC = Get.find<PageIndexController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minum'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                StreamBuilder(
                    stream: controller.wadah.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!.snapshot.value;

                        return ListTile(
                          title: Text("Level Wadah : ${data.toString()}"),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                StreamBuilder(
                    stream: controller.timbangan.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!.snapshot.value;

                        return ListTile(
                          title: Text("Timbangan : ${data.toString()}"),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                FirebaseAnimatedList(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    query: controller.getSet1,
                    itemBuilder: (context, snapshot, animation, index) {
                      print(snapshot.value.toString());
                      return ListTile(
                        title: Text(
                            "Set ${snapshot.child('set').value.toString()}"),
                        subtitle: Text(
                            "Jam ${snapshot.child('Jam').value.toString()} , Menit ${snapshot.child('Menit').value.toString()},  Detik ${snapshot.child('Detik').value.toString()}"),
                      );
                    }),
                Divider(color: Colors.grey[500]),
                const SizedBox(height: 10),
                const Text(
                  "Set 1",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Text(
                    controller.selectedTimeSet1.value,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: controller.showTimePickerSet1,
                  child: Text("Pilih Waktu"),
                ),
                ElevatedButton(
                  onPressed: controller.sendToFirebaseSet1,
                  child: Text("Kirim ke Firebase"),
                ),
                Divider(color: Colors.grey[500]),
                const SizedBox(height: 10),
                const Text(
                  "Set 2",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Text(
                    controller.selectedTimeSet2.value,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: controller.showTimePickerSet2,
                  child: Text("Pilih Waktu"),
                ),
                ElevatedButton(
                  onPressed: controller.sendToFirebaseSet2,
                  child: Text("Kirim ke Firebase"),
                ),
                Divider(color: Colors.grey[500]),
                const SizedBox(height: 20),
                const Text(
                  "History",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                FirebaseAnimatedList(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    query: controller.historyMakan,
                    itemBuilder: (context, snapshot, animation, index) {
                      //print(snapshot.value.toString());
                      return ListTile(
                        title: Text(
                            "Jam ${snapshot.child('Jam').value.toString()}"),
                        subtitle: Text(
                            "Tanggal ${snapshot.child('Tanggal').value.toString()}"),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.titled,
        items: [
          TabItem(icon: Icons.restaurant, title: 'Makan'),
          TabItem(icon: Icons.water_drop, title: 'Minum'),
          //TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: pageC.pageIndex.value,
        onTap: (int i) => pageC.changePage(i),
      ),
    );
  }
}
