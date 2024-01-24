class Theatre {
  String uid;
  String name;
  String address;
  String latitude;
  String longtitude;

  Theatre({this.uid, this.name, this.latitude, this.address, this.longtitude});

  Theatre.fromMap(Map<String, dynamic> data) {
    //formMap = data -> value
    uid = data['uid'];
    name = data['name'];
    address = data['address'];
    latitude = data['latitude'];
    longtitude = data['longtitude'];
  }

  Map<String, dynamic> toMap() {
    //toMap = key : value pair
    return {
      'uid': uid,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longtitude': longtitude,
    };
  }
}
