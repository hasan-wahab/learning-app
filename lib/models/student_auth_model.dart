import 'package:cloud_firestore/cloud_firestore.dart';

class StudentAuthModel {
  final String studentName;
  final String id;
  final String studentEmailId;
  final String? profileImage;
  final Timestamp createAt;
  final Timestamp? updateAt;
  final bool isAgree;
  final bool isGoogleSignIn;

  StudentAuthModel({
    required this.studentName,
    required this.id,
    required this.studentEmailId,
    this.profileImage,
    required this.createAt,
    this.updateAt,
    required this.isAgree,
    required this.isGoogleSignIn,
  });

  Map<String, dynamic> toMap() {
    return {
      'StudentName': studentName,
      'Id': id,
      'StudentEmailId': studentEmailId,
      'profileImage': profileImage,
      'createAt': createAt,
      'updateAt': updateAt,
      'IsAgree': isAgree,
      'IsGoogleSignIn': isGoogleSignIn,
    };
  }

  factory StudentAuthModel.fromMap(Map<String, dynamic> map) {
    return StudentAuthModel(
      studentName: map['StudentName'],
      id: map['Id'],
      studentEmailId: map['StudentEmailId'],
      createAt: map['createAt'],
      isAgree: map['IsAgree'],
      isGoogleSignIn: map['IsGoogleSignIn'],
    );
  }
}
