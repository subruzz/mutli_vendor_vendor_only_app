import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_only_app/vendor/providers/vendor_form_provider.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              color: Colors.red,
              child: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.yellow.shade900, Colors.yellow]),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Consumer<VendorFormProvider>(
                            builder: (context, value, child) {
                              if (value.selectedImage == null) {
                                return IconButton(
                                  icon: const Icon(Icons.camera),
                                  onPressed: () {
                                    value.selecteImage();
                                  },
                                );
                              } else {
                                return Image.file(
                                  value.selectedImage!,
                                  fit: BoxFit.cover,
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}