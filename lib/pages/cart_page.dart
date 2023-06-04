import 'package:firstapp/core/store.dart';
import 'package:firstapp/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal()
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
              // ignore: non_constant_identifier_names
              builder: (context, _, VxStatus) {
                return "\$${_cart!.totalPrice}"
                    .text
                    .xl5
                    .color(context.theme.colorScheme.secondary)
                    .make();
              },
              mutations: const {RemoveMutation}),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying Not Supported Yet".text.color(context.accentColor).make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.splashColor)),
                  child: "Buy".text.bold.xl3.white.make())
              .w32(context).h8(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;
    return _cart!.items.isEmpty
        ? "Nothing to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                      onPressed: () {
                        RemoveMutation(_cart.items[index]);
                      },
                      icon: const Icon(Icons.remove_circle_outline)),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
