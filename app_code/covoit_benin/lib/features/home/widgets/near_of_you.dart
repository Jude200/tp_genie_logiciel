import 'package:flutter/material.dart';

class NearOfYouCard extends StatelessWidget {
  const NearOfYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor.withOpacity(.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Départ : ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Bohicon")
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("Destination : ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Bohicon")
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Conducteur : ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Bohicon")
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
          Column(
            children: [
              Image.asset("assets/images/img.jpg",
                  width: 70, height: 70, fit: BoxFit.cover),
            ],
          )
        ],
      ),
    );
  }
}
