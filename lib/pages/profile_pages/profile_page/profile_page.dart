import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile_page';

  final int? id;

  const ProfilePage({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
