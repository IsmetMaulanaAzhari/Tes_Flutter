import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class UserController {
  static const String _baseUrl =
      'https://blowsiest-zaiden-unsmoothly.ngrok-free.dev';

  static const String _tokenKey = 'access_token';
  static const String _tokenTypeKey = 'token_type';
  
  // Demo mode untuk testing tanpa server
  static const bool _demoMode = true;
  
  // Users untuk testing
  static final List<Map<String, dynamic>> _demoUsers = [
    {
      'id': 1,
      'name': 'Ahmed',
      'email': 'Ahmed@gmail.com',
      'password': 'Ahmed123'
    },
  ];

  /// ================== LOGIN ==================
  ///
  /// return: User kalau sukses
  /// throw Exception kalau gagal (bisa kamu tangkap di UI)
  Future<User> login({required String email, required String password}) async {
    // Demo mode untuk testing
    if (_demoMode) {
      await Future.delayed(const Duration(seconds: 1)); // Simulasi loading
      
      final demoUser = _demoUsers.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => throw Exception('Email atau password tidak valid'),
      );
      
      // Simpan token dummy
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, 'demo_token_${demoUser['id']}');
      await prefs.setString(_tokenTypeKey, 'Bearer');
      
      return User.fromJson(demoUser);
    }
    
    // Mode server asli
    final uri = Uri.parse('$_baseUrl/api/v1/login');

    final response = await http.post(
      uri,
      headers: {'Accept': 'application/json'},
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);

      // Simpan token ke SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, data['access_token'] ?? '');
      await prefs.setString(_tokenTypeKey, data['token_type'] ?? 'Bearer');

      // Parse user
      final userJson = data['user'] as Map<String, dynamic>;
      final user = User.fromJson(userJson);

      return user;
    } else {
      // Ambil pesan error dari body kalau ada
      try {
        final data = jsonDecode(response.body);
        final message = data['message'] ?? 'Login gagal';
        print('Login error response: ${response.body}'); // Debug
        throw Exception(message);
      } catch (e) {
        print('Login error - Status: ${response.statusCode}, Body: ${response.body}'); // Debug
        throw Exception('Login gagal: ${response.statusCode}');
      }
    }
  }

  /// ================== REGISTER ==================
  ///
  /// Asumsi endpoint: POST /api/v1/register
  /// body: name, email, password, password_confirmation
  /// return: User kalau sukses
  Future<User> register({
    required String name,
    required String email,
    required String password,
    String? passwordConfirmation,
  }) async {
    // Demo mode untuk testing
    if (_demoMode) {
      await Future.delayed(const Duration(seconds: 1)); // Simulasi loading
      
      // Cek apakah email sudah ada
      final existingUser = _demoUsers.where((user) => user['email'] == email);
      if (existingUser.isNotEmpty) {
        throw Exception('Email sudah terdaftar');
      }
      
      // Buat user baru
      final newUser = {
        'id': _demoUsers.length + 1,
        'name': name,
        'email': email,
        'password': password,
      };
      
      _demoUsers.add(newUser);
      
      // Simpan token dummy
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, 'demo_token_${newUser['id']}');
      await prefs.setString(_tokenTypeKey, 'Bearer');
      
      return User.fromJson(newUser);
    }
    
    // Mode server asli
    final uri = Uri.parse('$_baseUrl/api/v1/register');

    final response = await http.post(
      uri,
      headers: {'Accept': 'application/json'},
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation ?? password,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);

      // Simpan token kalau responsenya sama seperti login
      if (data['access_token'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_tokenKey, data['access_token'] ?? '');
        await prefs.setString(_tokenTypeKey, data['token_type'] ?? 'Bearer');
      }

      final userJson = data['user'] as Map<String, dynamic>;
      final user = User.fromJson(userJson);

      return user;
    } else {
      try {
        final data = jsonDecode(response.body);
        // Handle validation errors
        if (data['errors'] != null) {
          final errors = data['errors'] as Map<String, dynamic>;
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            throw Exception(firstError[0]);
          }
        }
        final message = data['message'] ?? 'Register gagal';
        print('Register error response: ${response.body}'); // Debug
        throw Exception(message);
      } catch (e) {
        print('Register error - Status: ${response.statusCode}, Body: ${response.body}'); // Debug
        if (e is Exception) rethrow;
        throw Exception('Register gagal: ${response.statusCode}');
      }
    }
  }

  /// ================== HELPER TOKEN ==================

  /// Ambil token dari SharedPreferences
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Ambil header Authorization siap pakai untuk request lain
  Future<Map<String, String>> getAuthHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    final tokenType = prefs.getString(_tokenTypeKey) ?? 'Bearer';

    if (token == null || token.isEmpty) {
      return {'Accept': 'application/json'};
    }

    return {'Accept': 'application/json', 'Authorization': '$tokenType $token'};
  }

  /// Optional: hapus token (logout lokal)
  Future<void> logoutLocal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_tokenTypeKey);
  }
}