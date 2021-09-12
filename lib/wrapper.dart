import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorplanner/NavBar.dart';
import 'package:tutorplanner/screen/Onboarding.dart';
import 'package:tutorplanner/services/auth_service.dart';

import 'model/user_model.dart';

class Wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if(snapshot.connectionState == ConnectionState.active){
          final User? user = snapshot.data;
          return user == null ? Onboarding() : nav();
        }else {
          return Scaffold(body: Center(child: CircularProgressIndicator(),),);
        }
      });
  }
}