class Data_showroom {
  static List<Car> showroom1 = [
    Car(
      sellername: 'Mohammed',
      id: '1',
      P_number: 'N 22',
      plate_number: 'N 22',
      Insurance: '  2023/8/12 ',
      licensestatus: '  2023/10/13 ',
      Model: '2022',
      Price: '77000',
      image: 'https://img4cdn.haraj.com.sa/userfiles30/2023-02-15/800x515-1_-GO__MTY3NjQ0NTk5NDEwMDA2MTI2NTM3Mg.jpg',
      name: 'كامري',
    ),
    Car(
      sellername: 'Mohammed',
      id: '2',
      P_number: 'N 22',
      plate_number: 'N 22',
      Insurance: '  2023/8/12 ',
      licensestatus: '  2023/10/13 ',
      Model: '2022',
      Price: '77000',
      image: 'https://img4cdn.haraj.com.sa/userfiles30/2023-02-15/800x515-1_-GO__MTY3NjQ0NTk5NDEwMDA2MTI2NTM3Mg.jpg',
      name: 'كامري',
    ),
    Car(
      sellername: 'Mohammed',
      id: '3',
      P_number: 'N 22',
      plate_number: 'N 22',
      Insurance: '  2023/8/12 ',
      licensestatus: '  2023/10/13 ',
      Model: '2022',
      Price: '77000',
      image: 'https://img4cdn.haraj.com.sa/userfiles30/2023-02-15/800x515-1_-GO__MTY3NjQ0NTk5NDEwMDA2MTI2NTM3Mg.jpg',
      name: 'كامري',
    ),
  ];
  static List<Icons_1> iconss = [
    Icons_1(
        pic: 'https://image.shutterstock.com/image-vector/quote-icon-260nw-278670944.jpg', description: 'description'),
    Icons_1(
        pic:
            'https://img.icons8.com/external-doodle-bomsymbols-/1x/external-add-doodle-web-design-device-set-2-doodle-bomsymbols-.png',
        description: "add"),
    Icons_1(
        pic: 'https://image.shutterstock.com/image-vector/management-icon-teamwork-business-team-260nw-1051689107.jpg',
        description: 'description'),
  ];
}

class Car {
  String plate_number;
  String id;
  String licensestatus;
  String P_number;
  String sellername;
  String image;
  String name;
  String Model;
  String Price;
  String Insurance;
  Car({
    required this.id,
    required this.plate_number,
    required this.licensestatus,
    required this.P_number,
    required this.sellername,
    required this.image,
    required this.Model,
    required this.Price,
    required this.Insurance,
    required this.name,
  });
  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      plate_number: map['plate_number'],
      licensestatus: map['licensestatus'],
      P_number: map['parknumber'],
      sellername: map['sellername'],
      id: map['id'],
      name: map['name'],
      image: map['image'],
      Model: map['Model'],
      Price: map['Price'],
      Insurance: map['Insurance'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'plate_number': plate_number, //
      'licensestatus': licensestatus, //
      'sellername': sellername, //
      'parknumber': P_number,
      'id': id,
      'name': name, //
      'image': image,
      'Model': Model, //
      'Price': Price, //
      'Insurance': Insurance, //
    };
  }
}

class Icons_1 {
  String pic;
  String description;
  Icons_1({
    required this.pic,
    required this.description,
  });
}
