class Order {
  String _id;
  String _name;
  String _description;
  String _percentage;
  String _noOfServices;
  String _status;


// ignore: non_constant_identifier_names
  Order(id, name, description, percentage, no_of_services, status) {
    this._id = id.toString();
    this._name = name.toString();
    this._description = description.toString();
    this._percentage = percentage.toString();
    this._noOfServices = no_of_services.toString();
    this._status = status.toString();
  }


  String get no_of_services => _noOfServices;

  set no_of_services(String value) {
    _noOfServices = value;
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(json['id'], json['name'], json['description'], json['percentage'],json['no_of_services'], json['status']);
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }



  String get percentage => _percentage;

  set percentage(String value) {
    _percentage = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}


