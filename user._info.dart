import 'package:shared_preferences/shared_preferences.dart'; 

const String USERNAME= "username"; 
const String TANGGAL = "tanggal"; 
const String STATUS = "status"; 

class UserInfo { 
Future setToken(String value) async { 
final SharedPreferences pref = await SharedPreferences.getInstance(); 
    return pref.setString(USERNAME, value); 
  } 
  
  Future<String?> getToken() async { 
    final SharedPreferences pref = await SharedPreferences.getInstance(); 
    return pref.getString(USERNAME); 
  } 
  
  Future setUserID(String value) async { 
    final SharedPreferences pref = await SharedPreferences.getInstance(); 
    return pref.setString(TANGGAL, value); 
  } 
  
  Future<String> getUserID() async { 
    final SharedPreferences pref = await SharedPreferences.getInstance(); 
    return pref.getString(TANGGAL).toString(); 
  } 
  
  Future setUsername(String value) async { 
    final SharedPreferences pref = await SharedPreferences.getInstance(); 
    return pref.setString(STATUS, value); 
  } 
  
  Future<String> getUsername() async { 
    final SharedPreferences pref = await SharedPreferences.getInstance(); 
    return pref.getString(STATUS).toString(); 
  } 
  
  Future<void> logout() async { 
    final SharedPreferences pref = await SharedPreferences.getInstance(); 
    pref.clear(); 
  } 
}