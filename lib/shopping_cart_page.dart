import 'package:flutter/material.dart';

const cartBlue = Color(0xFF1769F3);
const cartInk = Color(0xFF111F47);
const cartBorder = Color(0xFFDCE4F0);
const cartPaleBlue = Color(0xFFDCEBFF);

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: cartInk,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        leading: IconButton(
          tooltip: 'Back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  tooltip: 'Shopping bag',
                  icon: const Icon(Icons.shopping_bag_outlined),
                  onPressed: () => debugPrint('Cart clicked'),
                ),
                Positioned(
                  top: 3,
                  right: 2,
                  child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: cartBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Introduction
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: cartPaleBlue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'CAMPUS STORE',
                      style: TextStyle(
                        color: cartBlue,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 7),

                  const Text(
                    'Ready for checkout',
                    style: TextStyle(
                      color: cartInk,
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 3),

                  const Text(
                    'Review your items before placing your order.',
                    style: TextStyle(color: Color(0xFF66718B), fontSize: 12),
                  ),

                  const SizedBox(height: 15),

                  // Delivery card
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: _cardDecoration(),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: cartBlue,
                          size: 25,
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deliver to Earth Justin Lim',
                                style: TextStyle(
                                  color: cartInk,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Matina, Davao City',
                                style: TextStyle(
                                  color: Color(0xFF64708A),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              debugPrint('Change delivery address clicked'),
                          child: const Text('Change'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 17),

                  // Order heading
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Items',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: cartInk,
                        ),
                      ),
                      Text(
                        '3 items',
                        style: TextStyle(
                          color: Color(0xFF64708A),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 9),

                  // Product cards
                  const CartItemCard(
                    productName: 'Wireless Mouse',
                    price: 450,
                    quantity: 1,
                    icon: Icons.mouse_outlined,
                  ),

                  const SizedBox(height: 8),

                  const CartItemCard(
                    productName: 'USB-C Hub',
                    price: 850,
                    quantity: 1,
                    icon: Icons.hub_outlined,
                  ),

                  const SizedBox(height: 8),

                  const CartItemCard(
                    productName: 'Laptop Stand',
                    price: 700,
                    quantity: 1,
                    icon: Icons.laptop_mac_outlined,
                  ),

                  const SizedBox(height: 12),

                  // Discount banner
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: cartPaleBlue,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.local_offer_outlined, color: cartBlue),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'STUDENT10 applied',
                                style: TextStyle(
                                  color: cartInk,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '10% discount on items',
                                style: TextStyle(
                                  color: Color(0xFF64708A),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.check_circle, color: cartBlue, size: 23),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Payment summary
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: _cardDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Payment Summary',
                          style: TextStyle(
                            color: cartInk,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        const SizedBox(height: 8),

                        _summaryRow('Subtotal', 'PHP 2,000.00'),

                        const SizedBox(height: 5),

                        _summaryRow('Discount (10%)', '- PHP 200.00'),

                        const SizedBox(height: 5),

                        _summaryRow('Delivery Fee', 'PHP 50.00'),

                        const Divider(height: 18, color: cartBorder),

                        _summaryRow('Total', 'PHP 1,850.00', isTotal: true),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Place Order button
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          debugPrint('Place order clicked! Total: PHP 1850.00'),
                      icon: const Icon(Icons.lock, size: 18),
                      label: const Text(
                        'Place Order',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cartBlue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Reusable card styling
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: cartBorder),
      borderRadius: BorderRadius.circular(10),
    );
  }

  // Reusable payment summary row
  Widget _summaryRow(String label, String amount, {bool isTotal = false}) {
    final style = TextStyle(
      color: cartInk,
      fontSize: isTotal ? 14 : 12,
      fontWeight: isTotal ? FontWeight.w800 : FontWeight.w400,
    );

    return Row(
      children: [
        Expanded(child: Text(label, style: style)),
        const SizedBox(width: 8),
        Text(amount, style: style),
      ],
    );
  }
}

// Reusable StatelessWidget for cart items
class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  final String productName;
  final double price;
  final int quantity;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cartBorder),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product icon
          Container(
            width: 54,
            height: 65,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: cartPaleBlue,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: const Color(0xFF175497), size: 32),
          ),

          const SizedBox(width: 10),

          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    color: cartInk,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  'PHP ${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: cartBlue,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 7),

                // Quantity controls
                Row(
                  children: [
                    _quantityButton(
                      Icons.remove,
                      'Decrease $productName',
                      () => debugPrint('Decrease quantity: $productName'),
                    ),

                    SizedBox(
                      width: 36,
                      child: Text(
                        '$quantity',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: cartInk,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    _quantityButton(
                      Icons.add,
                      'Increase $productName',
                      () => debugPrint('Increase quantity: $productName'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Delete button
          IconButton(
            tooltip: 'Remove $productName',
            onPressed: () => debugPrint('Remove item: $productName'),
            icon: const Icon(Icons.delete_outline, size: 19),
            color: const Color(0xFF707988),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
          ),
        ],
      ),
    );
  }

  // Reusable plus and minus button
  Widget _quantityButton(
    IconData icon,
    String tooltip,
    VoidCallback onPressed,
  ) {
    return Tooltip(
      message: tooltip,
      child: SizedBox(
        width: 29,
        height: 27,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: const BorderSide(color: cartBlue),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Icon(icon, color: cartBlue, size: 15),
        ),
      ),
    );
  }
}
