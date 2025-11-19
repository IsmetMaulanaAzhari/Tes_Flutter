import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Map<String, dynamic>> products = [
    {"id": 1, "name": "Kangkung Segar", "price": 8000},
    {"id": 2, "name": "Selada Keriting", "price": 12000},
  ];

  void _deleteProduct(int id) {
    setState(() {
      products.removeWhere((product) => product["id"] == id);
    });
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
              Color(0xFF00D4E6), 
              Color(0xFF8B5CF6), 
              Color(0xFFE91E63), 
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Daftar Produk",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
                      },
                      icon: const Icon(Icons.logout, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
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
                  child: products.isEmpty 
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
                                  Colors.cyan.shade50,
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
                              title: Text(
                                p["name"].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                "Rp ${p["price"]}",
                                style: const TextStyle(
                                  color: Color(0xFF00D4E6),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text("Hapus Produk"),
                                          content: Text("Yakin ingin menghapus ${p["name"]}?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context),
                                              child: const Text("Batal"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                _deleteProduct(p["id"]);
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
                              onTap: () {
                                Navigator.pushNamed(context, "/product-detail", arguments: p);
                              },
                            ),
                          );
                        },
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
              Color(0xFF00D4E6),
              Color(0xFFE91E63),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, "/product-edit"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
