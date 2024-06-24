class CatalogModel {
  static final items = [
    Item(
        id: "code_01",
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th Pro",
        price: 75000,
        color: "#333505a",
        imgUrl:
            ""),
    Item(
      id: "code_02",
      name: "Samsung Galaxy S21",
      desc: "Samsung Galaxy S21 Ultra",
      price: 85000,
      color: "#000000",
      imgUrl: "https://example.com/s21ultra.png",
    ),
    Item(
      id: "code_03",
      name: "Google Pixel 5",
      desc: "Google Pixel 5 with stock Android",
      price: 65000,
      color: "#00FF00",
      imgUrl: "https://example.com/pixel5.png",
    ),
    Item(
      id: "code_04",
      name: "OnePlus 9 Pro",
      desc: "OnePlus 9 Pro with Hasselblad Camera",
      price: 70000,
      color: "#FF0000",
      imgUrl: "https://example.com/oneplus9pro.png",
    ),
    Item(
      id: "code_05",
      name: "Xiaomi Mi 11",
      desc: "Xiaomi Mi 11 with Snapdragon 888",
      price: 60000,
      color: "#FFFF00",
      imgUrl: "https://example.com/mi11.png",
    ),
    Item(
      id: "code_06",
      name: "Sony Xperia 1 II",
      desc: "Sony Xperia 1 II with 4K HDR display",
      price: 90000,
      color: "#800080",
      imgUrl: "https://example.com/xperia1ii.png",
    ),
    Item(
      id: "code_07",
      name: "LG Wing",
      desc: "LG Wing with Swivel Screen",
      price: 80000,
      color: "#00FFFF",
      imgUrl: "https://example.com/lgwing.png",
    ),
    Item(
      id: "code_08",
      name: "Huawei P40 Pro",
      desc: "Huawei P40 Pro with Leica Camera",
      price: 85000,
      color: "#FF00FF",
      imgUrl: "https://example.com/p40pro.png",
    ),
    Item(
      id: "code_09",
      name: "Motorola Edge Plus",
      desc: "Motorola Edge Plus with 108 MP Camera",
      price: 78000,
      color: "#FFA500",
      imgUrl: "https://example.com/edgeplus.png",
    ),
    Item(
      id: "code_10",
      name: "Oppo Find X3 Pro",
      desc: "Oppo Find X3 Pro with 10-bit Display",
      price: 73000,
      color: "#A52A2A",
      imgUrl: "https://example.com/findx3pro.png",
    ),
    Item(
      id: "code_11",
      name: "Vivo X60 Pro",
      desc: "Vivo X60 Pro with Zeiss Optics",
      price: 72000,
      color: "#000080",
      imgUrl: "https://example.com/x60pro.png",
    ),
    Item(
      id: "code_12",
      name: "Realme GT",
      desc: "Realme GT with Snapdragon 888",
      price: 68000,
      color: "#8B0000",
      imgUrl: "https://example.com/realmegt.png",
    ),
    Item(
      id: "code_13",
      name: "Nokia 8.3 5G",
      desc: "Nokia 8.3 5G with PureView Camera",
      price: 50000,
      color: "#008000",
      imgUrl: "https://example.com/nokia83.png",
    ),
    Item(
      id: "code_14",
      name: "Asus ROG Phone 5",
      desc: "Asus ROG Phone 5 for Gaming",
      price: 95000,
      color: "#FFD700",
      imgUrl: "https://example.com/rogphone5.png",
    ),
    Item(
      id: "code_15",
      name: "ZTE Axon 30",
      desc: "ZTE Axon 30 with Under-display Camera",
      price: 68000,
      color: "#FF4500",
      imgUrl: "https://example.com/axon30.png",
    ),
    Item(
      id: "code_16",
      name: "Lenovo Legion Duel 2",
      desc: "Lenovo Legion Duel 2 for Gaming",
      price: 93000,
      color: "#4682B4",
      imgUrl: "https://example.com/legionduel2.png",
    ),
    Item(
      id: "code_17",
      name: "TCL 20 Pro 5G",
      desc: "TCL 20 Pro 5G with NXTVISION",
      price: 60000,
      color: "#DA70D6",
      imgUrl: "https://example.com/tcl20pro.png",
    ),
    Item(
      id: "code_18",
      name: "Alcatel 5V",
      desc: "Alcatel 5V with FullView Display",
      price: 25000,
      color: "#CD5C5C",
      imgUrl: "https://example.com/alcatel5v.png",
    ),
    Item(
      id: "code_19",
      name: "Micromax IN Note 1",
      desc: "Micromax IN Note 1 with Stock Android",
      price: 12000,
      color: "#4B0082",
      imgUrl: "https://example.com/innote1.png",
    ),
    Item(
      id: "code_20",
      name: "Infinix Zero 8",
      desc: "Infinix Zero 8 with 90Hz Display",
      price: 14000,
      color: "#00CED1",
      imgUrl: "https://example.com/zero8.png",
    ),
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imgUrl;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.imgUrl,
  });
}
