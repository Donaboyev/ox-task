class ProductsModel {
  int? _totalCount;
  int? _page;
  List<Variations>? _variations;
  List<BrandAttributes>? _brandAttributes;

  ProductsModel({
    int? totalCount,
    int? page,
    List<Variations>? variations,
    List<BrandAttributes>? brandAttributes,
  }) {
    _totalCount = totalCount;
    _page = page;
    _variations = variations;
    _brandAttributes = brandAttributes;
  }

  ProductsModel.fromJson(dynamic json) {
    _totalCount = json['totalCount'];
    _page = json['page'];
    if (json['variations'] != null) {
      _variations = [];
      json['variations'].forEach((v) {
        _variations?.add(Variations.fromJson(v));
      });
    }
    if (json['brandAttributes'] != null) {
      _brandAttributes = [];
      json['brandAttributes'].forEach((v) {
        _brandAttributes?.add(BrandAttributes.fromJson(v));
      });
    }
  }

  int? get totalCount => _totalCount;

  int? get page => _page;

  List<Variations>? get variations => _variations;

  List<BrandAttributes>? get brandAttributes => _brandAttributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalCount'] = _totalCount;
    map['page'] = _page;
    if (_variations != null) {
      map['variations'] = _variations?.map((v) => v.toJson()).toList();
    }
    if (_brandAttributes != null) {
      map['brandAttributes'] =
          _brandAttributes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class BrandAttributes {
  int? _brandId;
  String? _type;
  String? _propertyName;
  String? _propertyValue;
  dynamic _icon;
  String? _color;
  String? _property;
  Image? _image;

  BrandAttributes({
    int? brandId,
    String? type,
    String? propertyName,
    String? propertyValue,
    dynamic icon,
    String? color,
    String? property,
    Image? image,
  }) {
    _brandId = brandId;
    _type = type;
    _propertyName = propertyName;
    _propertyValue = propertyValue;
    _icon = icon;
    _color = color;
    _property = property;
    _image = image;
  }

  BrandAttributes.fromJson(dynamic json) {
    _brandId = json['brand_id'];
    _type = json['type'];
    _propertyName = json['property_name'];
    _propertyValue = json['property_value'];
    _icon = json['icon'];
    _color = json['color'];
    _property = json['property'];
    _image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  int? get brandId => _brandId;

  String? get type => _type;

  String? get propertyName => _propertyName;

  String? get propertyValue => _propertyValue;

  dynamic get icon => _icon;

  String? get color => _color;

  String? get property => _property;

  Image? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brand_id'] = _brandId;
    map['type'] = _type;
    map['property_name'] = _propertyName;
    map['property_value'] = _propertyValue;
    map['icon'] = _icon;
    map['color'] = _color;
    map['property'] = _property;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    return map;
  }
}

class Image {
  Image({
    Urls? urls,
  }) {
    _urls = urls;
  }

  Image.fromJson(dynamic json) {
    _urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
  }

  Urls? _urls;

  Urls? get urls => _urls;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_urls != null) {
      map['urls'] = _urls?.toJson();
    }
    return map;
  }
}

class Urls {
  Urls({
    String? x50,
    String? x100,
    String? x150,
    String? x300,
    String? x800,
    String? original,
  }) {
    _x50 = x50;
    _x100 = x100;
    _x150 = x150;
    _x300 = x300;
    _x800 = x800;
    _original = original;
  }

  Urls.fromJson(dynamic json) {
    _x50 = json['50x_'];
    _x100 = json['100x_'];
    _x150 = json['150x_'];
    _x300 = json['300x_'];
    _x800 = json['800x_'];
    _original = json['original'];
  }

  String? _x50;
  String? _x100;
  String? _x150;
  String? _x300;
  String? _x800;
  String? _original;

  String? get x50 => _x50;

  String? get x100 => _x100;

  String? get x150 => _x150;

  String? get x300 => _x300;

  String? get x800 => _x800;

  String? get original => _original;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['50x_'] = _x50;
    map['100x_'] = _x100;
    map['150x_'] = _x150;
    map['300x_'] = _x300;
    map['800x_'] = _x800;
    map['original'] = _original;
    return map;
  }
}

class Variations {
  Variation? _variation;
  int? _oldPrice;
  int? _discount;
  int? _discountPercent;
  int? _newPrice;
  int? _location;
  String? _count;
  Stock? _stock;

  Variations({
    Variation? variation,
    int? oldPrice,
    int? discount,
    int? discountPercent,
    int? newPrice,
    int? location,
    String? count,
    Stock? stock,
  }) {
    _variation = variation;
    _oldPrice = oldPrice;
    _discount = discount;
    _discountPercent = discountPercent;
    _newPrice = newPrice;
    _location = location;
    _count = count;
    _stock = stock;
  }

  Variations.fromJson(dynamic json) {
    _variation = json['variation'] != null
        ? Variation.fromJson(json['variation'])
        : null;
    _oldPrice = json['oldPrice'];
    _discount = json['discount'];
    _discountPercent = json['discountPercent'];
    _newPrice = json['newPrice'];
    _location = json['location'];
    _count = json['count'];
    _stock = json['stock'] != null ? Stock.fromJson(json['stock']) : null;
  }

  Variation? get variation => _variation;

  int? get oldPrice => _oldPrice;

  int? get discount => _discount;

  int? get discountPercent => _discountPercent;

  int? get newPrice => _newPrice;

  int? get location => _location;

  String? get count => _count;

  Stock? get stock => _stock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_variation != null) {
      map['variation'] = _variation?.toJson();
    }
    map['oldPrice'] = _oldPrice;
    map['discount'] = _discount;
    map['discountPercent'] = _discountPercent;
    map['newPrice'] = _newPrice;
    map['location'] = _location;
    map['count'] = _count;
    if (_stock != null) {
      map['stock'] = _stock?.toJson();
    }
    return map;
  }
}

class Stock {
  String? _id;
  int? _location;
  bool? _tracking;
  bool? _countable;
  SellPrice? _sellPrice;
  int? _supplier;
  int? _count;

  Stock({
    String? id,
    int? location,
    bool? tracking,
    bool? countable,
    SellPrice? sellPrice,
    int? supplier,
    int? count,
  }) {
    _id = id;
    _location = location;
    _tracking = tracking;
    _countable = countable;
    _sellPrice = sellPrice;
    _supplier = supplier;
    _count = count;
  }

  Stock.fromJson(dynamic json) {
    _id = json['id'];
    _location = json['location'];
    _tracking = json['tracking'];
    _countable = json['countable'];
    _sellPrice = json['sellPrice'] != null
        ? SellPrice.fromJson(json['sellPrice'])
        : null;
    _supplier = json['supplier'];
    _count = json['count'];
  }

  String? get id => _id;

  int? get location => _location;

  bool? get tracking => _tracking;

  bool? get countable => _countable;

  SellPrice? get sellPrice => _sellPrice;

  int? get supplier => _supplier;

  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['location'] = _location;
    map['tracking'] = _tracking;
    map['countable'] = _countable;
    if (_sellPrice != null) {
      map['sellPrice'] = _sellPrice?.toJson();
    }
    map['supplier'] = _supplier;
    map['count'] = _count;
    return map;
  }
}

class SellPrice {
  String? _first;
  Ratio? _ratio;
  List<String>? _order;
  int? _uzs;
  num? _usd;

  SellPrice({
    String? first,
    Ratio? ratio,
    List<String>? order,
    int? uzs,
    double? usd,
  }) {
    _first = first;
    _ratio = ratio;
    _order = order;
    _uzs = uzs;
    _usd = usd;
  }

  SellPrice.fromJson(dynamic json) {
    _first = json['first'];
    _ratio = json['ratio'] != null ? Ratio.fromJson(json['ratio']) : null;
    _order = json['order'] != null ? json['order'].cast<String>() : [];
    _uzs = json['UZS'];
    _usd = json['USD'];
  }

  String? get first => _first;

  Ratio? get ratio => _ratio;

  List<String>? get order => _order;

  int? get uzs => _uzs;

  num? get usd => _usd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = _first;
    if (_ratio != null) {
      map['ratio'] = _ratio?.toJson();
    }
    map['order'] = _order;
    map['UZS'] = _uzs;
    map['USD'] = _usd;
    return map;
  }
}

class Ratio {
  Ratio({
    double? uzsByUsd,
    int? usdByUzs,
  }) {
    _uzsByUsd = uzsByUsd;
    _usdByUzs = usdByUzs;
  }

  Ratio.fromJson(dynamic json) {
    _uzsByUsd = json['UZS/USD'];
    _usdByUzs = json['USD/UZS'];
  }

  double? _uzsByUsd;
  int? _usdByUzs;

  double? get uzsByUsd => _uzsByUsd;

  int? get usdByUzs => _usdByUzs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UZS/USD'] = _uzsByUsd;
    map['USD/UZS'] = _usdByUzs;
    return map;
  }
}

class Variation {
  Variation({
    String? sku,
    String? supplier,
    int? id,
    String? barcode,
    List<Stocks>? stocks,
    String? name,
    int? product,
    List<Images>? images,
    String? unit,
    List<Properties>? properties,
    List<ProductProperties>? productProperties,
  }) {
    _sku = sku;
    _supplier = supplier;
    _id = id;
    _barcode = barcode;
    _stocks = stocks;
    _name = name;
    _product = product;
    _images = images;
    _unit = unit;
    _properties = properties;
    _productProperties = productProperties;
  }

  Variation.fromJson(dynamic json) {
    _sku = json['sku'];
    _supplier = json['supplier'];
    _id = json['id'];
    _barcode = json['barcode'];
    if (json['stocks'] != null) {
      _stocks = [];
      json['stocks'].forEach((v) {
        _stocks?.add(Stocks.fromJson(v));
      });
    }
    _name = json['name'];
    _product = json['product'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _unit = json['unit'];
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    if (json['productProperties'] != null) {
      _productProperties = [];
      json['productProperties'].forEach((v) {
        _productProperties?.add(ProductProperties.fromJson(v));
      });
    }
  }

  String? _sku;
  String? _supplier;
  int? _id;
  String? _barcode;
  List<Stocks>? _stocks;
  String? _name;
  int? _product;
  List<Images>? _images;
  String? _unit;
  List<Properties>? _properties;
  List<dynamic>? _importProperties;
  List<ProductProperties>? _productProperties;

  String? get sku => _sku;

  String? get supplier => _supplier;

  int? get id => _id;

  String? get barcode => _barcode;

  List<Stocks>? get stocks => _stocks;

  String? get name => _name;

  int? get product => _product;

  List<Images>? get images => _images;

  String? get unit => _unit;

  List<Properties>? get properties => _properties;

  List<dynamic>? get importProperties => _importProperties;

  List<ProductProperties>? get productProperties => _productProperties;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sku'] = _sku;
    map['supplier'] = _supplier;
    map['id'] = _id;
    map['barcode'] = _barcode;
    if (_stocks != null) {
      map['stocks'] = _stocks?.map((v) => v.toJson()).toList();
    }
    map['name'] = _name;
    map['product'] = _product;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['unit'] = _unit;
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    if (_importProperties != null) {
      map['importProperties'] =
          _importProperties?.map((v) => v.toJson()).toList();
    }
    if (_productProperties != null) {
      map['productProperties'] =
          _productProperties?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductProperties {
  ProductProperties({
    String? id,
    String? name,
    String? value,
  }) {
    _id = id;
    _name = name;
    _value = value;
  }

  ProductProperties.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _value = json['value'];
  }

  String? _id;
  String? _name;
  String? _value;

  String? get id => _id;

  String? get name => _name;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['value'] = _value;
    return map;
  }
}

class Properties {
  Properties({
    String? name,
    String? value,
  }) {
    _name = name;
    _value = value;
  }

  Properties.fromJson(dynamic json) {
    _name = json['name'];
    _value = json['value'];
  }

  String? _name;
  String? _value;

  String? get name => _name;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['value'] = _value;
    return map;
  }
}

class Images {
  Images({
    int? id,
    int? sort,
    Urls? urls,
  }) {
    _id = id;
    _sort = sort;
    _urls = urls;
  }

  Images.fromJson(dynamic json) {
    _id = json['id'];
    _sort = json['sort'];
    _urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
  }

  int? _id;
  int? _sort;
  Urls? _urls;

  int? get id => _id;

  int? get sort => _sort;

  Urls? get urls => _urls;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sort'] = _sort;
    if (_urls != null) {
      map['urls'] = _urls?.toJson();
    }
    return map;
  }
}

class Stocks {
  Stocks({
    String? id,
    int? location,
    bool? tracking,
    bool? countable,
    SellPrice? sellPrice,
    int? supplier,
    int? count,
  }) {
    _id = id;
    _location = location;
    _tracking = tracking;
    _countable = countable;
    _sellPrice = sellPrice;
    _supplier = supplier;
    _count = count;
  }

  Stocks.fromJson(dynamic json) {
    _id = json['id'];
    _location = json['location'];
    _tracking = json['tracking'];
    _countable = json['countable'];
    _sellPrice = json['sellPrice'] != null
        ? SellPrice.fromJson(json['sellPrice'])
        : null;
    _supplier = json['supplier'];
    _count = json['count'];
  }

  String? _id;
  int? _location;
  bool? _tracking;
  bool? _countable;
  SellPrice? _sellPrice;
  int? _supplier;
  int? _count;

  String? get id => _id;

  int? get location => _location;

  bool? get tracking => _tracking;

  bool? get countable => _countable;

  SellPrice? get sellPrice => _sellPrice;

  int? get supplier => _supplier;

  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['location'] = _location;
    map['tracking'] = _tracking;
    map['countable'] = _countable;
    if (_sellPrice != null) {
      map['sellPrice'] = _sellPrice?.toJson();
    }
    map['supplier'] = _supplier;
    map['count'] = _count;
    return map;
  }
}
