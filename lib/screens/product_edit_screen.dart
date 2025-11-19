import 'package:flutter/material.dart';

class ProductEditScreen extends StatelessWidget {
  const ProductEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Map?;

    final nameController =
        TextEditingController(text: product != null ? product["name"] : "");
    final priceController = TextEditingController(
        text: product != null ? product["price"].toString() : "");

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
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(
                        product == null ? "Tambah Produk" : "Edit Produk",
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
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.cyan.shade50,
                              Colors.purple.shade50,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Tambah Foto Produk",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Masukkan nama produk",
                          labelText: "Nama Produk",
                          prefixIcon: Icon(Icons.shopping_bag_outlined, color: Colors.grey.shade600),
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Masukkan harga produk",
                          labelText: "Harga Produk",
                          prefixIcon: Icon(Icons.attach_money, color: Colors.grey.shade600),
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
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
                                Color(0xFF00D4E6),
                                Color(0xFFE91E63),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(product == null 
                                    ? "Produk berhasil ditambahkan!" 
                                    : "Produk berhasil diperbarui!"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              product == null ? "SIMPAN" : "PERBARUI",
                              style: const TextStyle(
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
