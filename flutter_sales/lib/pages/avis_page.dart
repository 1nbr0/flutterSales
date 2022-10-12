import 'package:flutter/material.dart';

import '../model/review_model.dart';
import '../model/product_model.dart';

final List<Review> lsReview = [
  Review(
      1, "DarkSasuke", "https://picsum.photos/80/80", "⭐️⭐️⭐️", "Bon produit"),
  Review(2, "Naruto", "https://picsum.photos/80/80", "⭐️⭐️⭐️⭐️⭐️",
      "INCROYABLEEEEE, sasuke revient au village stp✌🏻"),
  Review(3, "Lolipop", "https://picsum.photos/80/80", "⭐️⭐️", "pas fou fou"),
  Review(
      4, "Yululuu", "https://picsum.photos/80/80", "⭐️", "Nul ! Nul ! Nul !"),
  Review(5, "Lokaa", "https://picsum.photos/80/80", "⭐️⭐️⭐️", "Ok Tier"),
  Review(6, "Trinity", "https://picsum.photos/80/80", "⭐️⭐️⭐️",
      "franchement c'est OK"),
  Review(7, "Cassoulet", "https://picsum.photos/80/80", "⭐️⭐️⭐️",
      "ça fait plasir"),
  Review(8, "Fritus", "https://picsum.photos/80/80", "⭐️⭐️⭐️⭐️",
      "Bon produit, peut faire mieux"),
  Review(9, "TesLaOuTesPasLa", "https://picsum.photos/80/80", "⭐️⭐️⭐️⭐️⭐️",
      "Très bon produit"),
  Review(10, "JeSuisLa", "https://picsum.photos/80/80", "⭐️⭐️",
      "Le produit est pas ouf"),
];

class ListAvisPage extends StatelessWidget {
  final Product product;
  const ListAvisPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Avis")),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: lsReview.length,
          itemBuilder: (BuildContext context, int index) {
            final Review review = lsReview[index];
            return Card(
              child: ListTile(
                minVerticalPadding: 15,
                leading: ClipOval(
                  child: Image.network(
                    review.image,
                    width: 50,
                    height: 50,
                  ),
                ),
                title: Text(review.userName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.note),
                    Text(review.avis),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
