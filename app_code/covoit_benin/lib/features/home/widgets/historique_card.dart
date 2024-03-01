import 'package:flutter/material.dart';

class MyHistoriqueCArd extends StatelessWidget {
  const MyHistoriqueCArd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor.withOpacity(.2)),
      child: Column(
        children: [
          Image.asset("assets/images/img.jpg",
              width: 250, height: 100, fit: BoxFit.cover),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Départ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Bohicon")
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Destination",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Bohicon")
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Conducteur",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Bohicon")
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
