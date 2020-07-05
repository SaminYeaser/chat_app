import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction{
   static String sharePreferencedLoggedInkey = 'ISLOGGEDIN';
   static String sharePreferencedUserNamekey = 'USERNAMEKEY';
   static String sharePreferencedEmailkey = 'USEREMAILKEY';

   static Future<bool> saveUserLoggedInSharePreferences(bool isUserLoggedIn) async{
     SharedPreferences pref = await SharedPreferences.getInstance();
     return await pref.setBool(sharePreferencedLoggedInkey, isUserLoggedIn);
   }

   static Future<bool> saveUserNameInSharePreferences(String userName) async{
     SharedPreferences pref = await SharedPreferences.getInstance();
     return await pref.setString(sharePreferencedUserNamekey, userName);
   }

   static Future<bool> saveUserEmailInSharePreferences(String userEmail) async{
     SharedPreferences pref = await SharedPreferences.getInstance();
     return await pref.setString(sharePreferencedEmailkey, userEmail);
   }
//geting data
   static Future<bool> getUserLoggedInSharePreferences() async{
     SharedPreferences pref = await SharedPreferences.getInstance();
     return pref.getBool(sharePreferencedLoggedInkey);
   }

   static Future<String> getUserNameInSharePreferences() async{
     SharedPreferences pref = await SharedPreferences.getInstance();
     return pref.getString(sharePreferencedUserNamekey);
   }

   static Future<String> getUserEmailInSharePreferences() async{
     SharedPreferences pref = await SharedPreferences.getInstance();
     return pref.getString(sharePreferencedEmailkey);
   }
}