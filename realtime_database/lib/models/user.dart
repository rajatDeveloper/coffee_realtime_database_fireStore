class UserModel{

  final String uid;
  UserModel({required this.uid});

}

//UserData class for every particular member
class UserData{
  final String uid;
  final String name;
  final String sugars;
  final String strength;

  UserData({
    required this.uid,
    required this.name,
    required this.sugars,
    required this.strength
          });

}