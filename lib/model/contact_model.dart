class ContactModel {
  int? id;
  String? name;
  String? company;


  toMap(){
    var map=Map<String,dynamic>();
    map['id']=id??null;
    map['name']=name!;
    map['company']=company!;
    return map;
  }
}