import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  String _getProductImage(String productName) {
    if (productName.toLowerCase().contains('selada')) {
      return 'data:image/jpeg;base64,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'; // Lettuce image
    } else if (productName.toLowerCase().contains('kangkung')) {
      return 'https://images.unsplash.com/photo-1576045057995-568f588f82fb?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80'; // Water spinach image
    } else {
      return 'https://images.unsplash.com/photo-1540420773420-3366772f4999?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80'; // Default vegetables image
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Map?;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4CAF50), // Light Green
              Color(0xFF2E7D32), // Dark Green
              Color(0xFF1B5E20), // Very Dark Green
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(
                        "Detail Produk",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), 
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(32),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                            _getProductImage(product?["name"] ?? ""),
                            fit: BoxFit.contain,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.cyan.shade100,
                                      Colors.purple.shade100,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.cyan,
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.cyan.shade100,
                                      Colors.purple.shade100,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      size: 50,
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Gagal memuat gambar",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        product?["name"] ?? "Produk",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4CAF50),
                              Color(0xFF2E7D32),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Rp ${product?["price"] ?? 0}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Deskripsi Produk",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Produk segar dan berkualitas tinggi. Cocok untuk berbagai kebutuhan masak Anda.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                      ),
                      
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF4CAF50),
                                Color(0xFF2E7D32),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              final result = await Navigator.pushNamed(context, "/product-edit", arguments: product);
                              if (result != null && result is Map) {
                                // Return the updated product to the list screen
                                Navigator.pop(context, result);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              "EDIT PRODUK",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
