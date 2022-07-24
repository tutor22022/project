class StudentModel {
  String? id;
  String? name;
  String?  phone;
  String? email;
  String? password;
  String? address;
  bool is_enabeld = true;



  StudentModel( 
    {

     this.id, 
     this.name,
     this.phone,
     this.email,
     this.password,
     this.address,
    
    
    });

  StudentModel.fromJson(Map<String, dynamic> map) {
     is_enabeld = map['is_enabeld'];
    id = map['id'];
    name = map['name'];
    phone = map['phone'];
    email = map['email'];
    password = map['password'];
    address = map['address'];
    

  }

  Map<String, dynamic> toJson() {
    return {
       "is_enabeld": is_enabeld,
      "id": id,
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "address" : address,

    };
  }
}