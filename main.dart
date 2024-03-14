import 'dart:async';

// Class untuk merepresentasikan sebuah kue
class Cake {
  String flavor;
  int bakingTime;

  Cake(this.flavor, this.bakingTime);

  // Method untuk memanggang kue secara asynchronous
  Future<void> bakeCake() async {
    print('Memulai memanggang kue $flavor...');
    await Future.delayed(Duration(seconds: bakingTime));
    print('Kue $flavor selesai dipanggang!');
  }
}

// Class untuk merepresentasikan proses pemanggangan beberapa kue
class Bakery {
  List<Cake> cakes;

  Bakery(this.cakes);

  // Method untuk memanggang semua kue secara asynchronous
  Future<void> bakeCakes() async {
    print('Memulai proses pemanggangan kue...');
    await Future.forEach(cakes, (Cake cake) async {
      await cake.bakeCake();
    });
    print('Semua kue selesai dipanggang!');
  }
}

void main() {
  // Membuat objek kue
  Cake chocolateCake = Cake('Cokelat', 3);
  Cake vanillaCake = Cake('Vanila', 2);

  // Membuat objek toko roti dan menambahkan kue ke dalamnya
  Bakery bakery = Bakery([chocolateCake, vanillaCake]);

  // Memanggang semua kue
  bakery.bakeCakes();
}
