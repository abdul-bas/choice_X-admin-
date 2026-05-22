import 'package:choice_x_admin/services/admin_auth_service/admin_register_services.dart';
import 'package:flutter/material.dart';

class AdminAuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  String? errorMessage;
  bool isLoading = false;
  AdminAuthService auth = AdminAuthService();
  adminAccess({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    errorMessage = await auth.loginAdmin(
      email: email,
      password: password,
    );
    if (errorMessage != null && errorMessage == 'Admin login successful') {
      isAuthenticated = true;
    }
    isLoading = false;
    notifyListeners();
  }

  logOut() async {
    await AdminAuthService().logOut();
    isAuthenticated = false;
    notifyListeners();
  }

  clear() {
    errorMessage = null;
    notifyListeners();
  }
}
