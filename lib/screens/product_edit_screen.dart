import 'package:flutter/material.dart';

class ProductEditScreen extends StatefulWidget {
  const ProductEditScreen({super.key});

  @override
  State<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final product = ModalRoute.of(context)?.settings.arguments as Map?;
      if (product != null) {
        nameController.text = product["name"] ?? "";
        priceController.text = product["price"].toString();
        descriptionController.text = product["description"] ?? "";
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _saveProduct() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
    });

    final product = ModalRoute.of(context)?.settings.arguments as Map?;
    
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    final productData = {
      'id': product?['id'] ?? DateTime.now().millisecondsSinceEpoch,
      'name': nameController.text.trim(),
      'price': int.tryParse(priceController.text) ?? 0,
      'description': descriptionController.text.trim(),
    };
    
    setState(() {
      _isLoading = false;
    });
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 8),
              Text(product == null 
                ? "Produk berhasil ditambahkan!" 
                : "Produk berhasil diperbarui!"),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      Navigator.pop(context, productData);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Map?;

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.green.shade50,
                              Colors.green.shade100,
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
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Nama produk tidak boleh kosong';
                            }
                            if (value.trim().length < 3) {
                              return 'Nama produk minimal 3 karakter';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Masukkan nama produk",
                            labelText: "Nama Produk",
                            prefixIcon: Icon(Icons.shopping_bag_outlined, color: Colors.grey.shade600),
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Harga produk tidak boleh kosong';
                            }
                            final price = int.tryParse(value);
                            if (price == null || price <= 0) {
                              return 'Harga harus berupa angka positif';
                            }
                            if (price > 1000000) {
                              return 'Harga tidak boleh lebih dari 1.000.000';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Masukkan harga produk",
                            labelText: "Harga Produk",
                            prefixIcon: Icon(Icons.attach_money, color: Colors.grey.shade600),
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      
                      const SizedBox(height: 16),
                      
                      // Description Field
                      TextFormField(
                        controller: descriptionController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: "Masukkan deskripsi produk (opsional)",
                          labelText: "Deskripsi",
                          prefixIcon: Icon(Icons.description, color: Colors.grey.shade600),
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
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
              Color(0xFF4CAF50),
              Color(0xFF2E7D32),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _saveProduct,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : Text(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
