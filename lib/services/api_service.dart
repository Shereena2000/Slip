import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'https://devv2dapi.myslip.co';
  static const String loginEndpoint = '/profile/login-app/';
  static const String salesEndpoint = '/clients/sales';

  // Login API call
  static Future<Map<String, dynamic>> login(String mobile, String mpin) async {
    try {
      print('💁🏻 Attempting login with mobile: $mobile');
      final response = await http.post(
        Uri.parse('$baseUrl$loginEndpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'mobile': mobile,
          'mpin': mpin,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        // Store token if available
         if (data['data']?['access'] != null) {
        print('✌🏻 Access token received: ${data['data']['access']}');
        await _saveToken(data['data']['access']);
        print('💕 Token saved successfully');
        
        // Optional: Save refresh token if needed
        if (data['data']?['refresh'] != null) {
          await _saveRefreshToken(data['data']['refresh']);
        }
      } else {
        print('😑 No access token in response');
      }
        
        return {
          'success': true,
          'data': data,
        };
      } else {
        return {
          'success': false,
          'error': 'Login failed: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': 'Network error: $e',
      };
    }
  }

  // Sales API call
  static Future<Map<String, dynamic>> getSales() async {
    try {
      final token = await _getToken();
      if (token == null) {
        return {
          'success': false,
          'error': 'No authentication token found',
        };
      }

      final response = await http.get(
        Uri.parse('$baseUrl$salesEndpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'success': true,
          'data': data,
        };
      } else {
        return {
          'success': false,
          'error': 'Failed to fetch sales: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': 'Network error: $e',
      };
    }
  }

  // Token management
  static Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
  static Future<void> _saveRefreshToken(String refreshToken) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('refresh_token', refreshToken);
}
}