import 'dart:convert';

import 'package:notekeeper/api/helpers.dart';

class AuthRequest{
   String url = '';
   Helpers helpers = Helpers();

   signUp(data){
     var item = helpers.postRequest('auth/register', data);
     print('this is item $item');
     return item;
   }

   login(data){
     var response = helpers.postRequest('auth/login', data);
     return response;
   }

   getUser(){
     var response = helpers.getRequest('auth/getUser');
   }

}