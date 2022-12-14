import 'package:flutter/material.dart';

import '../../Data/initmock_data.dart';
import '../../Models/Category Items/category_items.dart';
import '../../Models/item_product.dart';
import '../Button UI/add_subtract_button.dart';
import '../Routes/detail_item_page6.dart';

class ItemShoppingCart extends StatefulWidget {
  late ItemProduct item;
  late Function notifyParent;

  ItemShoppingCart({required this.notifyParent, required this.item});

  @override
  State<StatefulWidget> createState() {
    return _ItemShoppingCartState();
  }
}

class _ItemShoppingCartState extends State<ItemShoppingCart> {
  int limitedProduct = 100;

  @override
  void initState() {
    super.initState();
  }

  ItemProduct _findItemById(int id) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].id == id) return items[i];
    }
    return ItemProduct(
        category: CategoryItem.Fruits,
        nutritions: [],
        score: 0,
        imagePath: '',
        id: -1,
        isFavourited: false,
        detailProduct: '',
        name: '',
        price: '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailItem(item: widget.item)),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            //////////////////////////cot 1//////////////////////////

            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:
              Image.network(
                widget.item.imagePath,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            //   Image.asset(
            //     widget.item.imagePath,
            //     fit: BoxFit.cover,
            //     width: 100,
            //     height: 100,
            //   ),
            ),

            SizedBox(
              width: 15,
            ),

            //////////////////////////cot 2//////////////////////////
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 90,
                  child: Text(
                    widget.item.name,
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "RS "+widget.item.price,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.item.price+" Per / kg",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            //////////////////////////cot 3//////////////////////////
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Rs " +
                      (int.parse(widget.item.price) - 160).toString() +
                      " Saved",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ),
            ),

            //////////////////////////cot 4//////////////////////////

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      print("You have deleted item ${widget.item.name}");
                      setState(() {
                        shoppingCartList.removeWhere(
                            (element) => element.id == widget.item.id);
                        widget.item.setNumberShoppingSelected = 0;
                        widget.notifyParent();
                      });
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.delete),
                    ),
                  ),
                  Row(
                    children: [
                      //dau tru

                      Container(
                        width: 25,
                        height: 25,
                        child: MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            setState(() {
                              if (widget.item.getNumberShoppingSelected > 1) {
                                widget.item.setNumberShoppingSelected =
                                    widget.item.getNumberShoppingSelected - 1;
                                shoppingCartList;
                                widget.notifyParent();
                              }
                            });
                          },
                          child: IconDecIncButton(
                                  signButton: '_', topPos: -1, leftPos: 8)
                              .genIcon(),
                        ),
                      ),

                      //bien count
                      Container(
                        width: 35,
                        height: 25,
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              widget.item.getNumberShoppingSelected.toString()),
                        ),
                      ),

                      //dau cong
                      Container(
                        width: 25,
                        height: 25,
                        child: MaterialButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            setState(() {
                              if (widget.item.getNumberShoppingSelected <
                                  limitedProduct) {
                                widget.item.setNumberShoppingSelected =
                                    widget.item.getNumberShoppingSelected + 1;
                                shoppingCartList;
                                widget.notifyParent();
                              }
                            });
                          },
                          child: IconDecIncButton(
                                  signButton: '+', topPos: 4, leftPos: 8)
                              .genIcon(),
                        ),
                      ),

                      ////////////
                    ],
                  ),
                ],
              ),
            ),

            //////////////////////////end content//////////////////////////
          ],
        ),
      ),
    );
  }
}
