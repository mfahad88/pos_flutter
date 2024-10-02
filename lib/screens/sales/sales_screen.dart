import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_flutter/models/Order.dart';
import 'package:pos_flutter/models/Product.dart';
import 'package:pos_flutter/providers/sales_provider.dart';
import 'package:pos_flutter/widgets/order_list.dart';
import 'package:pos_flutter/widgets/total_card.dart';
import 'package:provider/provider.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider=context.watch<SalesProvider>();
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                  Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.5,
                        height: 40,
                        child: Autocomplete<String>(optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<String>.empty();
                          }

                          return provider.products.where((element) {

                            return element.name!.toLowerCase().startsWith(textEditingValue.text.toLowerCase());
                          },).map((e) => e.name.toString(),);
                        },
                          fieldViewBuilder: (context, textEditingController, focusNode, onEditingComplete) {
                            provider.item_controller=textEditingController;
                            return TextField(
                              textInputAction: TextInputAction.next,
                              controller: provider.item_controller,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              decoration:  InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                          width: 2.0,
                                          color: Colors.grey.shade300
                                      )
                                  ),
                                  hintText: 'Please Search Product',
                                  suffixIcon: Icon(Icons.search,color: Colors.blue.shade400,)
                              ),

                            );
                          },
                          onSelected: (option) {
                            provider.selectedItem=option;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            controller: provider.qty_controller,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                        width: 2.0,
                                        color: Colors.grey.shade300
                                    )
                                )
                            ),
                            onChanged: (value) => provider.selectedQty=int.parse(value)
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        child: FilledButton(onPressed: () {
                          provider.addItems(Order(provider.products.where((element) => element.name==provider.selectedItem,).map((e) => e,).first, provider.selectedQty));
                          provider.qty_controller.clear();
                          provider.item_controller.clear();
                        }, child: Text('Add'),style: FilledButton.styleFrom(

                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)
                            )
                        ),),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    OrderList(orders: provider.orders),
                    TotalCard()
                  ],
                )
              ],
            ),
          );
        },),
      )
    );
  }
}
