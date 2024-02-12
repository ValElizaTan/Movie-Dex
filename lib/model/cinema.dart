class Cinema {
  String uid;
  String name;
  String address;
  String latitude;
  String longitude;

  Cinema({this.uid, this.name, this.latitude, this.address, this.longitude});

  Cinema.fromMap(Map<String, dynamic> data) {  //formMap = data -> value
    uid = data['uid'];
    name = data['name'];
    address = data['address'];
    latitude = data['latitude'];
    longitude = data['longitude'];
  }

  Map<String, dynamic> toMap() {  //toMap = key : value pair
    return {
      'uid': uid,
      'name': name,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
