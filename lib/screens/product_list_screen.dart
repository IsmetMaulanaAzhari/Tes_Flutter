import 'package:flutter/material.dart';
import '../controllers/ProductController.dart';
import '../models/products.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController _productController = ProductController();
  List<Product> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      setState(() => isLoading = true);
      final loadedProducts = await _productController.getAllProducts();
      setState(() {
        products = loadedProducts;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal memuat produk: $e')),
        );
      }
    }
  }

  String _getProductImage(String productName) {
    if (productName.toLowerCase().contains('selada')) {
      return 'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?ixlib=rb-4.0.3&auto=format&fit=crop&w=300&q=80';
    } else if (productName.toLowerCase().contains('kangkung')) {
      return 'https://images.unsplash.com/photo-1576045057995-568f588f82fb?ixlib=rb-4.0.3&auto=format&fit=crop&w=300&q=80';
    } else {
      return 'https://images.unsplash.com/photo-1540420773420-3366772f4999?ixlib=rb-4.0.3&auto=format&fit=crop&w=300&q=80';
    }
  }

  Future<void> _deleteProduct(int id) async {
    try {
      await _productController.deleteProduct(id);
      await _loadProducts();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Produk berhasil dihapus')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menghapus: $e')),
        );
      }
    }
  }

  Future<void> _addProduct(Product newProduct) async {
    try {
      await _productController.createProduct(newProduct);
      await _loadProducts();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Produk berhasil ditambahkan')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menambah produk: $e')),
        );
      }
    }
  }

  Future<void> _updateProduct(Product updatedProduct) async {
    try {
      await _productController.updateProduct(updatedProduct.id!, updatedProduct);
      await _loadProducts();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Produk berhasil diupdate')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengupdate: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4CAF50), 
              Color(0xFF2E7D32), 
              Color(0xFF1B5E20), 
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // FreshBite Title with Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restaurant_menu, color: Colors.white.withOpacity(0.9), size: 20),
                        const SizedBox(width: 8),
                        const Text(
                          "FreshBite",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.eco, color: Colors.white.withOpacity(0.9), size: 20),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Header with logout
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.store, color: Colors.white.withOpacity(0.8), size: 20),
                            const SizedBox(width: 8),
                            const Text(
                              "Daftar Produk",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
                          },
                          icon: const Icon(Icons.logout, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _loadProducts,
                  color: const Color(0xFF4CAF50),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: isLoading
                    ? const Center(child: CircularProgressIndicator(color: Color(0xFF4CAF50)))
                    : products.isEmpty 
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_bag_outlined, 
                                 size: 80, color: Colors.grey.shade400),
                            const SizedBox(height: 16),
                            Text("Belum ada produk",
                                 style: TextStyle(
                                   fontSize: 18,
                                   color: Colors.grey.shade600,
                                 )),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final p = products[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.green.shade50,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16),
                              leading: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    _getProductImage(p.name),
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.green,
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Icon(
                                          Icons.local_grocery_store,
                                          color: Colors.green.shade600,
                                          size: 30,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              title: Text(
                                p.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                "Rp ${p.price}",
                                style: const TextStyle(
                                  color: Color(0xFF4CAF50),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.blue),
                                    tooltip: "Edit Produk",
                                    onPressed: () async {
                                      final result = await Navigator.pushNamed(
                                        context, 
                                        "/product-edit", 
                                        arguments: p.toJson()
                                      );
                                      if (result != null && result is Map) {
                                        final updated = Product.fromJson(Map<String, dynamic>.from(result));
                                        await _updateProduct(updated);
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    tooltip: "Hapus Produk",
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text("Hapus Produk"),
                                          content: Text("Yakin ingin menghapus ${p.name}?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context),
                                              child: const Text("Batal"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                _deleteProduct(p.id!);
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Hapus", style: TextStyle(color: Colors.red)),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                                ],
                              ),
                              onTap: () async {
                                final result = await Navigator.pushNamed(context, "/product-detail", arguments: p.toJson());
                                if (result != null && result is Map) {
                                  final updated = Product.fromJson(Map<String, dynamic>.from(result));
                                  await _updateProduct(updated);
                                }
                              },
                            ),
                          );
                        },
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF4CAF50),
              Color(0xFF2E7D32),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.pushNamed(context, "/product-edit");
            if (result != null && result is Map) {
              final newProduct = Product.fromJson(Map<String, dynamic>.from(result));
              await _addProduct(newProduct);
            }
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
