class UserModel{
  String? userName;
  String? userEmail;
  String? userprofileUrl;
  String? userPhoneNumber;
  String? userAddress;
  String? userUID;
  String? userPassword;

  UserModel({this.userName,this.userEmail,this.userAddress,
    this.userPhoneNumber,this.userPassword,this.userUID,this.userprofileUrl});


  factory UserModel.getDataFromMap( data){
    return UserModel(
      userName: data['name'],
      userEmail: data['email'],
      userprofileUrl: data['url'],
      userPhoneNumber: data['phoneNumber'],
      userAddress: data['address'],
      userUID: data['uid'],
      userPassword: data['password']
    );
  }

  Map<String,dynamic> toMap(){
    return{
      "name":userName,
      "email":userEmail,
      "phoneNumber":userPhoneNumber,
      "address":userAddress,
      "uid":userUID,
      "password":userPassword,
      "url":userprofileUrl,
    };
  }

}