class TeachertModel {
  bool is_enabeld = false;
  String? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? address;
  late final like;
  List<String> subjects = [];
 // List? subject;

   TeachertModel(
      {
       this.id,
       this.name,
       this.phone,
        this.email,
       this.password,
     this.address,
     this.like,
    //  required this.subject
    });

  TeachertModel.fromJson(Map<String, dynamic> map) {
    is_enabeld = map['is_enabeld'];
    id = map['id'];

    name = map['name'];
    phone = map['phone'];
    email =map['email'];
    password = map['password'];
    address = map['address'];
    subjects = map['subjects'].cast<String>();
    like = map['like'];

   // subject = map['subject'];
  }

  Map<String, dynamic> toJson() {
    return {
      "is_enabeld": is_enabeld,
      "id": id,

      "name": name,
      "phone": phone,
      "email" :email,
      "password": password,
      "address": address,
      "subjects": subjects,
      "like":like,
    };
  }
}
