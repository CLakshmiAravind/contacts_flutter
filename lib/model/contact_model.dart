class ContactModel {
  int? id;
  String? phone;
  String? name;
  String? company;


  toMap(){
    var map=Map<String,dynamic>();
    map['id']=id??null;
    map['name']=name!;
    map['phone']=phone!;
    map['company']=company!;
    return map;
  }
}