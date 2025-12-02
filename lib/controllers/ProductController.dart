import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/products.dart';
import 'UserController.dart';

class ProductController {
  static const String _baseUrl = 'http://127.0.0.1:8000';
  final UserController _userController = UserController();

  /// Get semua produk dari server
  Future<List<Product>> getAllProducts() async {
    final uri = Uri.parse('$_baseUrl/api/v1/products');
    final headers = await _userController.getAuthHeaders();
    
    print('=== GET Products ===');
    print('URL: $uri');
    print('Headers: $headers');

    final response = await http.get(uri, headers: headers);
    
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data produk: ${response.statusCode}');
    }
  }

  /// Tambah produk baru
  Future<Product> createProduct(Product product) async {
    final uri = Uri.parse('$_baseUrl/api/v1/products');
    final headers = await _userController.getAuthHeaders();
    headers['Content-Type'] = 'application/json';

    final response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Product.fromJson(data);
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error['message'] ?? 'Gagal menambah produk');
    }
  }

  /// Update produk
  Future<Product> updateProduct(int id, Product product) async {
    final uri = Uri.parse('$_baseUrl/api/v1/products/$id');
    final headers = await _userController.getAuthHeaders();
    headers['Content-Type'] = 'application/json';

    final response = await http.put(
      uri,
      headers: headers,
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Product.fromJson(data);
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error['message'] ?? 'Gagal mengupdate produk');
    }
  }

  /// Hapus produk
  Future<void> deleteProduct(int id) async {
    final uri = Uri.parse('$_baseUrl/api/v1/products/$id');
    final headers = await _userController.getAuthHeaders();

    final response = await http.delete(uri, headers: headers);

    if (response.statusCode != 200) {
      final error = jsonDecode(response.body);
      throw Exception(error['message'] ?? 'Gagal menghapus produk');
    }
  }
}
