class Review {
  num id;
  String userName;
  String image;
  String note;
  String avis;

  Review(this.id, this.userName, this.image, this.note, this.avis);

  Review.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        userName = map["userName"],
        image = map["image"],
        note = map["note"],
        avis = map["avis"];
}
