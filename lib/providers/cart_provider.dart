import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import '../models/category.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount =>
      _items.fold(0, (sum, item) => sum + item.totalPrice);

  void addItem(Product product) {
    final existingIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (quantity > 0) {
        _items[index].quantity = quantity;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // Sample data
  static List<Category> getCategories() {
    return [
      Category(
        id: '1',
        name: 'Appliances',
        icon:
            'https://numalis.com/wp-content/uploads/2023/10/Maxx-Studio-Shutterstock.jpg',
      ),
      Category(
        id: '2',
        name: 'Appliances Parts & Accessories',
        icon:
            'https://img500.exportersindia.com/product_images/bc-500/dir_76/2267801/electrical-appliance-parts-1487137957-2724612.jpeg',
      ),
      Category(
        id: '4',
        name: 'Drywall & Cement Walls',
        icon:
            'https://dam.thdstatic.com/content/production/berelVTxxVu6HJ1sUeIxaA/oFP-flAi8dC_4lza9ir0Iw/Original%20file/types-of-drywall-section-3.jpg',
      ),
      Category(
        id: '5',
        name: 'Electrical',
        icon:
            'https://images.unsplash.com/photo-1621905251918-48416bd8575a?w=400',
      ),
      Category(
        id: '6',
        name: 'Fencing Siding & Cladding',
        icon:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReau4arpdvmpqzCCeUfslguCk3e1dMhLG8tA&s',
      ),
      Category(
        id: '7',
        name: 'Flooring',
        icon:
            'https://www.colibrirealestate.com/wp-content/uploads/2024/03/laminate-wood-floor.jpg',
      ),
      Category(
        id: '8',
        name: 'Gutters',
        icon:
            'https://cdn-media.buildersmart.in/media/catalog/product/cache/1/image/200x200/9df78eab33525d08d6e5fb8d27136e95/l/u/luxron-gutter-image-01-scaled.jpg',
      ),
    ];
  }

  static List<Product> getProducts(String categoryId) {
    // Sample products for each category
    final products = {
      '1': [
        Product(
          id: 'p1_1',
          name: 'LG Refrigerator',
          description:
              'High-efficiency refrigerator with energy-saving features. Perfect for modern kitchens.',
          price: 299.99,
          image:
              'https://images-cdn.ubuy.co.in/6880933be69630cdb60fae0e-3-5cu-ft-compact-refrigerator-mini.jpg',
          categoryId: '1',
        ),
        Product(
          id: 'p1_2',
          name: 'IFB Washing Machine',
          description:
              'Front-load washing machine with multiple wash cycles and quick wash option.',
          price: 199.99,
          image:
              'https://images.unsplash.com/photo-1626806787461-102c1bfaaea1?w=500',
          categoryId: '1',
        ),
        Product(
          id: 'p1_3',
          name: 'Samsung Microwave Oven',
          description:
              'Convection microwave with multiple cooking modes and timer functionality.',
          price: 99.99,
          image:
              'https://www.bramptonappliances.com/cdn/shop/files/814624_1_800x.jpg?v=1728462866',
          categoryId: '1',
        ),
      ],
      '2': [
        Product(
          id: 'p2_1',
          name: 'Refrigerator Water Filter',
          description:
              'Compatible replacement water filter for most refrigerator models.',
          price: 66.99,
          image:
              'https://u-mercari-images.mercdn.net/photos/m41285046547_1.jpg',
          categoryId: '2',
        ),
        Product(
          id: 'p2_2',
          name: 'Washing Machine Belt',
          description:
              'Durable replacement belt for washing machines. Universal fit.',
          price: 220.99,
          image:
              'https://m.media-amazon.com/images/I/41rGY4LiaNL._AC_UF1000,1000_QL80_.jpg',
          categoryId: '2',
        ),
      ],
      '3': [
        Product(
          id: 'p3_1',
          name: 'Bathtub',
          description:
              'Modern acrylic bathtub with ergonomic design and slip-resistant surface.',
          price: 499.99,
          image:
              'https://images.unsplash.com/photo-1620626011761-996317b8d101?w=500',
          categoryId: '3',
        ),
        Product(
          id: 'p3_2',
          name: 'Shower Head',
          description:
              'Multi-function shower head with adjustable spray patterns and water-saving mode.',
          price: 79.99,
          image:
              'https://images.unsplash.com/photo-1620626011761-996317b8d101?w=500',
          categoryId: '3',
        ),
        Product(
          id: 'p3_3',
          name: 'Bathroom Faucet',
          description:
              'Chrome finish bathroom faucet with ceramic disc valve for drip-free performance.',
          price: 129.99,
          image:
              'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=500',
          categoryId: '3',
        ),
      ],
      '4': [
        Product(
          id: 'p4_1',
          name: 'Drywall Sheets',
          description:
              'Standard 1/2" thick drywall sheets, 4x8 feet. Ideal for walls and ceilings.',
          price: 14.99,
          image:
              'https://static.homeguide.com/assets/images/content/homeguide-pile-of-greenboard-drywall-sheets.jpg',
          categoryId: '4',
        ),
        Product(
          id: 'p4_2',
          name: 'Joint Compound',
          description:
              'Ready-mixed joint compound for taping and finishing drywall joints.',
          price: 18.99,
          image:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Drywall.jpg/250px-Drywall.jpg',
          categoryId: '4',
        ),
      ],
      '5': [
        Product(
          id: 'p5_1',
          name: 'LED Light Bulbs',
          description:
              'Energy-efficient LED bulbs, 60W equivalent, 800 lumens. Pack of 4.',
          price: 24.99,
          image:
              'https://img.freepik.com/free-vector/three-saving-light-bulbs-white-background_613284-44.jpg?semt=ais_hybrid&w=740&q=80',
          categoryId: '5',
        ),
        Product(
          id: 'p5_2',
          name: 'Electrical Wire',
          description:
              '14/2 NM-B electrical wire, 250 feet. UL listed, copper conductor.',
          price: 89.99,
          image:
              'https://static.vecteezy.com/system/resources/thumbnails/052/366/812/small/coils-of-colored-electrical-wires-on-white-background-photo.jpg',
          categoryId: '5',
        ),
        Product(
          id: 'p5_3',
          name: 'Circuit Breaker',
          description:
              '20-Amp single-pole circuit breaker for residential electrical panels.',
          price: 12.99,
          image:
              'https://upload.wikimedia.org/wikipedia/commons/f/fd/Jtecul.jpg',
          categoryId: '5',
        ),
      ],
      '6': [
        Product(
          id: 'p6_1',
          name: 'Vinyl Siding',
          description:
              'Premium vinyl siding panels, weather-resistant and low maintenance.',
          price: 149.99,
          image:
              'https://images.ctfassets.net/79nimht05j33/1a60zeku7N5QNaKz7U9gGf/4f266e50fae726e4122746973fdaf44b/types-of-vinyl-siding.jpeg?w=1500&h=1000&fl=progressive&q=70&fm=jpg&bg=transparent',
          categoryId: '6',
        ),
        Product(
          id: 'p6_2',
          name: 'Fence Posts',
          description:
              'Treated wood fence posts, 4x4 inches, 8 feet long. Rot resistant.',
          price: 19.99,
          image:
              'https://m.media-amazon.com/images/I/91qY7KOfcsL._AC_UF350,350_QL80_.jpg',
          categoryId: '6',
        ),
      ],
      '7': [
        Product(
          id: 'p7_1',
          name: 'Laminate Flooring',
          description:
              'High-quality laminate flooring with realistic wood texture. Easy installation.',
          price: 2.99,
          image:
              'https://5.imimg.com/data5/SELLER/Default/2024/8/443006962/KF/VP/PN/28628091/wooden-laminate-flooring.jpg',
          categoryId: '7',
        ),
        Product(
          id: 'p7_2',
          name: 'Carpet Tiles',
          description:
              'Commercial-grade carpet tiles, 20x20 inches. Stain resistant and durable.',
          price: 3.49,
          image:
              'https://monstershop.co.uk/cdn/shop/files/24910.11_7a28f215-ca34-4ded-b5de-d64e458b0396.jpg?v=1745652764&width=1214',
          categoryId: '7',
        ),
        Product(
          id: 'p7_3',
          name: 'Vinyl Plank Flooring',
          description:
              'Waterproof vinyl plank flooring with click-lock installation system.',
          price: 3.99,
          image:
              'https://d91ztqmtx7u1k.cloudfront.net/ClientContent/Images/Catalogue/20230210082950-7debaba3-a01b-4b65-b887-b735a05e0fd9.jpg',
          categoryId: '7',
        ),
      ],
      '8': [
        Product(
          id: 'p8_1',
          name: 'Rain Gutters',
          description:
              'Aluminum rain gutters, 10 feet sections. Rust-resistant and durable.',
          price: 29.99,
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6281YmLsKyGm6wPDRqZ3CwpfTkBCcmTbGXw&s',
          categoryId: '8',
        ),
        Product(
          id: 'p8_2',
          name: 'Downspouts',
          description:
              'Aluminum downspouts with elbows. Complete drainage solution.',
          price: 24.99,
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7w_wk86PCwF0PjJO0AyyRjtoJuUUFYy4gcw&s',
          categoryId: '8',
        ),
      ],
    };

    return products[categoryId] ?? [];
  }
}
