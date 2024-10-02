import 'package:flutter/material.dart';
import 'package:pos_flutter/providers/sales_provider.dart';
import 'package:provider/provider.dart';

import '../models/Order.dart';

class OrderList extends StatefulWidget {
  final List<Order> orders;
  const OrderList({super.key,required this.orders});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  int? _edt_row;
  bool isEditable=false;
  TextEditingController editingController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    SalesProvider provider=context.watch<SalesProvider>();

    return Expanded(
      child: DataTable(
        headingRowColor: MaterialStateProperty.resolveWith((states) => Colors.yellow.shade400,),
        border: TableBorder.all(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.grey.shade400,
          width: 2.0
        ),
          columns: const [
        DataColumn(label: Text('Product Name')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Qty')),
        DataColumn(label: Text('Amount')),
        DataColumn(label: Text('Profit'))
      ], rows: widget.orders.asMap().entries.map((e) {
        int index=e.key;
        Order order=e.value;
      
        return DataRow(cells: [
          DataCell(Text(order.product!.name.toString())),
          DataCell(Text(order.product!.sellPrice.toString())),
          DataCell(GestureDetector(
            onTap: () => setState(() {
              _edt_row = index;
              editingController.text=order.qty.toString();
              isEditable=!isEditable;
      
            }),
            child: (isEditable==true && _edt_row==index)?SizedBox(width: 40,
              child: TextField(
                controller: editingController,
                onSubmitted: (value) {
                  setState(() {
                    isEditable=!isEditable;
                    _edt_row = index;
                    provider.orders.where((e) => e.product?.name == order.product?.name,).first.qty=int.parse(editingController.text);
                  });
                },
              ),
            ):SizedBox(width:40,child: Text(order.qty.toString())),
          )),
          DataCell(Text('${order.product!.sellPrice! * order.qty!}')),
          DataCell(Text('${order.product!.sellPrice! - order.product!.actualPrice! }')),
        ]);
      },).toList()
      ),
    );
  }
}
