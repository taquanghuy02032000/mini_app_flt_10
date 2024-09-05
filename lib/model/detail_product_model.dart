class DetailProductTotalModel {
  String? code;
  String? message;
  Result? result;

  DetailProductTotalModel({this.code, this.message, this.result});

  DetailProductTotalModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  Product? product;

  Result({this.product});

  Result.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  ProductInfo? productInfo;
  List<Promotions>? promotions;
  Null? totalAvailable;
  List<Prices>? prices;
  List<Null>? flashSales;
  ProductDetail? productDetail;
  Provider? provider;
  Status? status;
  Null? salePoint;
  List<Null>? warehouseStocks;
  ProductOptions? productOptions;
  Null? availableQuantity;
  List<Null>? siteStocks;

  Product(
      {this.productInfo,
      this.promotions,
      this.totalAvailable,
      this.prices,
      this.flashSales,
      this.productDetail,
      this.provider,
      this.status,
      this.salePoint,
      this.warehouseStocks,
      this.productOptions,
      this.availableQuantity,
      this.siteStocks});

  Product.fromJson(Map<String, dynamic> json) {
    productInfo = json['productInfo'] != null ? ProductInfo.fromJson(json['productInfo']) : null;
    if (json['promotions'] != null) {
      promotions = <Promotions>[];
      json['promotions'].forEach((v) {
        promotions!.add(Promotions.fromJson(v));
      });
    }
    totalAvailable = json['totalAvailable'];
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
    if (json['flashSales'] != null) {
      flashSales = <Null>[];
      json['flashSales'].forEach((v) {
        // flashSales!.add(Null.fromJson(v));
      });
    }
    productDetail =
        json['productDetail'] != null ? ProductDetail.fromJson(json['productDetail']) : null;
    provider = json['provider'] != null ? Provider.fromJson(json['provider']) : null;
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    salePoint = json['salePoint'];
    if (json['warehouseStocks'] != null) {
      warehouseStocks = <Null>[];
      json['warehouseStocks'].forEach((v) {
        // warehouseStocks!.add(Null.fromJson(v));
      });
    }
    productOptions =
        json['productOptions'] != null ? ProductOptions.fromJson(json['productOptions']) : null;
    availableQuantity = json['availableQuantity'];
    if (json['siteStocks'] != null) {
      siteStocks = <Null>[];
      json['siteStocks'].forEach((v) {
        // siteStocks!.add(Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productInfo != null) {
      data['productInfo'] = productInfo!.toJson();
    }
    if (promotions != null) {
      data['promotions'] = promotions!.map((v) => v.toJson()).toList();
    }
    data['totalAvailable'] = totalAvailable;
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    if (flashSales != null) {
      // data['flashSales'] = flashSales!.map((v) => v.toJson()).toList();
    }
    if (productDetail != null) {
      data['productDetail'] = productDetail!.toJson();
    }
    if (provider != null) {
      data['provider'] = provider!.toJson();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    data['salePoint'] = salePoint;
    if (warehouseStocks != null) {
      // data['warehouseStocks'] = warehouseStocks!.map((v) => v.toJson()).toList();
    }
    if (productOptions != null) {
      data['productOptions'] = productOptions!.toJson();
    }
    data['availableQuantity'] = availableQuantity;
    if (siteStocks != null) {
      // data['siteStocks'] = siteStocks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductInfo {
  String? sku;
  String? skuId;
  String? name;
  String? imageUrl;
  List<Null>? tags;
  Brand? brand;
  List<Categories>? categories;
  Seller? seller;
  Provider? provider;
  List<Null>? masterCategories;
  Tax? tax;
  Warranty? warranty;
  String? slug;
  String? sellerSku;
  String? canonical;
  String? uomCode;
  int? uomRatio;
  String? uomName;
  Null? manufacturer;
  String? barcode;
  String? shippingType;
  String? displayName;
  String? imageLabel;

  ProductInfo(
      {this.sku,
      this.skuId,
      this.name,
      this.imageUrl,
      this.tags,
      this.brand,
      this.categories,
      this.seller,
      this.provider,
      this.masterCategories,
      this.tax,
      this.warranty,
      this.slug,
      this.sellerSku,
      this.canonical,
      this.uomCode,
      this.uomRatio,
      this.uomName,
      this.manufacturer,
      this.barcode,
      this.shippingType,
      this.displayName,
      this.imageLabel});

  ProductInfo.fromJson(Map<String, dynamic> json) {
    sku = json['sku'];
    skuId = json['skuId'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    if (json['tags'] != null) {
      tags = <Null>[];
      json['tags'].forEach((v) {
        // tags!.add(Null.fromJson(v));
      });
    }
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    provider = json['provider'] != null ? Provider.fromJson(json['provider']) : null;
    if (json['masterCategories'] != null) {
      masterCategories = <Null>[];
      json['masterCategories'].forEach((v) {
        // masterCategories!.add(Null.fromJson(v));
      });
    }
    tax = json['tax'] != null ? Tax.fromJson(json['tax']) : null;
    warranty = json['warranty'] != null ? Warranty.fromJson(json['warranty']) : null;
    slug = json['slug'];
    sellerSku = json['sellerSku'];
    canonical = json['canonical'];
    uomCode = json['uomCode'];
    uomRatio = json['uomRatio'];
    uomName = json['uomName'];
    manufacturer = json['manufacturer'];
    barcode = json['barcode'];
    shippingType = json['shippingType'];
    displayName = json['displayName'];
    imageLabel = json['imageLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sku'] = sku;
    data['skuId'] = skuId;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    if (tags != null) {
      // data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    if (provider != null) {
      data['provider'] = provider!.toJson();
    }
    if (masterCategories != null) {
      // data['masterCategories'] = masterCategories!.map((v) => v.toJson()).toList();
    }
    if (tax != null) {
      data['tax'] = tax!.toJson();
    }
    if (warranty != null) {
      data['warranty'] = warranty!.toJson();
    }
    data['slug'] = slug;
    data['sellerSku'] = sellerSku;
    data['canonical'] = canonical;
    data['uomCode'] = uomCode;
    data['uomRatio'] = uomRatio;
    data['uomName'] = uomName;
    data['manufacturer'] = manufacturer;
    data['barcode'] = barcode;
    data['shippingType'] = shippingType;
    data['displayName'] = displayName;
    data['imageLabel'] = imageLabel;
    return data;
  }
}

class Brand {
  String? code;
  String? name;
  String? logo;
  int? id;

  Brand({this.code, this.name, this.logo, this.id});

  Brand.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    logo = json['logo'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['logo'] = logo;
    data['id'] = id;
    return data;
  }
}

class Categories {
  String? code;
  String? name;
  int? id;
  bool? isAdult;

  Categories({this.code, this.name, this.id, this.isAdult});

  Categories.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    id = json['id'];
    isAdult = json['isAdult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['id'] = id;
    data['isAdult'] = isAdult;
    return data;
  }
}

class Seller {
  int? id;
  String? name;
  String? displayName;
  String? logo;

  Seller({this.id, this.name, this.displayName, this.logo});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['displayName'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['displayName'] = displayName;
    data['logo'] = logo;
    return data;
  }
}

class Provider {
  int? id;
  String? name;
  String? logo;
  String? slogan;

  Provider({this.id, this.name, this.logo, this.slogan});

  Provider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    slogan = json['slogan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['slogan'] = slogan;
    return data;
  }
}

class Tax {
  int? taxOut;
  String? taxOutCode;

  Tax({this.taxOut, this.taxOutCode});

  Tax.fromJson(Map<String, dynamic> json) {
    taxOut = json['taxOut'];
    taxOutCode = json['taxOutCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxOut'] = taxOut;
    data['taxOutCode'] = taxOutCode;
    return data;
  }
}

class Warranty {
  int? months;
  String? description;

  Warranty({this.months, this.description});

  Warranty.fromJson(Map<String, dynamic> json) {
    months = json['months'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['months'] = months;
    data['description'] = description;
    return data;
  }
}

class Promotions {
  int? id;
  bool? isDefault;
  Condition? condition;
  Benefit? benefit;
  String? applyOn;
  String? description;
  String? endTimestampSec;
  String? name;
  String? type;
  Null? landing;

  Promotions(
      {this.id,
      this.isDefault,
      this.condition,
      this.benefit,
      this.applyOn,
      this.description,
      this.endTimestampSec,
      this.name,
      this.type,
      this.landing});

  Promotions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isDefault = json['isDefault'];
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    benefit = json['benefit'] != null ? Benefit.fromJson(json['benefit']) : null;
    applyOn = json['applyOn'];
    description = json['description'];
    endTimestampSec = json['endTimestampSec'];
    name = json['name'];
    type = json['type'];
    landing = json['landing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isDefault'] = isDefault;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    if (benefit != null) {
      data['benefit'] = benefit!.toJson();
    }
    data['applyOn'] = applyOn;
    data['description'] = description;
    data['endTimestampSec'] = endTimestampSec;
    data['name'] = name;
    data['type'] = type;
    data['landing'] = landing;
    return data;
  }
}

class Condition {
  String? coupon;
  Null? orderValueMin;
  Null? orderValueMax;
  int? blockSize;
  int? minQuantity;
  int? blockSizeDecimal;
  int? minQuantityDecimal;
  Null? groupBuyInfo;

  Condition(
      {this.coupon,
      this.orderValueMin,
      this.orderValueMax,
      this.blockSize,
      this.minQuantity,
      this.blockSizeDecimal,
      this.minQuantityDecimal,
      this.groupBuyInfo});

  Condition.fromJson(Map<String, dynamic> json) {
    coupon = json['coupon'];
    orderValueMin = json['orderValueMin'];
    orderValueMax = json['orderValueMax'];
    blockSize = json['blockSize'];
    minQuantity = json['minQuantity'];
    blockSizeDecimal = json['blockSizeDecimal'];
    minQuantityDecimal = json['minQuantityDecimal'];
    groupBuyInfo = json['groupBuyInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon'] = coupon;
    data['orderValueMin'] = orderValueMin;
    data['orderValueMax'] = orderValueMax;
    data['blockSize'] = blockSize;
    data['minQuantity'] = minQuantity;
    data['blockSizeDecimal'] = blockSizeDecimal;
    data['minQuantityDecimal'] = minQuantityDecimal;
    data['groupBuyInfo'] = groupBuyInfo;
    return data;
  }
}

class Benefit {
  Discount? discount;
  List<Null>? gifts;
  Voucher? voucher;
  Null? bulkDiscount;

  Benefit({this.discount, this.gifts, this.voucher, this.bulkDiscount});

  Benefit.fromJson(Map<String, dynamic> json) {
    discount = json['discount'] != null ? Discount.fromJson(json['discount']) : null;
    if (json['gifts'] != null) {
      gifts = <Null>[];
      json['gifts'].forEach((v) {
        // gifts!.add(Null.fromJson(v));
      });
    }
    voucher = json['voucher'] != null ? Voucher.fromJson(json['voucher']) : null;
    bulkDiscount = json['bulkDiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (discount != null) {
      data['discount'] = discount!.toJson();
    }
    if (gifts != null) {
      // data['gifts'] = gifts!.map((v) => v.toJson()).toList();
    }
    if (voucher != null) {
      data['voucher'] = voucher!.toJson();
    }
    data['bulkDiscount'] = bulkDiscount;
    return data;
  }
}

class Discount {
  int? percent;
  int? maxAmount;
  int? flat;
  Null? maxAmountPerOrder;

  Discount({this.percent, this.maxAmount, this.flat, this.maxAmountPerOrder});

  Discount.fromJson(Map<String, dynamic> json) {
    percent = json['percent'];
    maxAmount = json['maxAmount'];
    flat = json['flat'];
    maxAmountPerOrder = json['maxAmountPerOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['percent'] = percent;
    data['maxAmount'] = maxAmount;
    data['flat'] = flat;
    data['maxAmountPerOrder'] = maxAmountPerOrder;
    return data;
  }
}

class Voucher {
  String? name;
  int? quantity;
  int? maxQuantity;

  Voucher({this.name, this.quantity, this.maxQuantity});

  Voucher.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    maxQuantity = json['maxQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['quantity'] = quantity;
    data['maxQuantity'] = maxQuantity;
    return data;
  }
}

class Prices {
  String? supplierRetailPrice;
  String? terminalPrice;
  String? latestPrice;
  String? discountAmount;
  double? discountPercent;
  String? sellPrice;
  String? minLatestPrice;
  String? maxLatestPrice;
  String? bestComboDiscount;

  Prices(
      {this.supplierRetailPrice,
      this.terminalPrice,
      this.latestPrice,
      this.discountAmount,
      this.discountPercent,
      this.sellPrice,
      this.minLatestPrice,
      this.maxLatestPrice,
      this.bestComboDiscount});

  Prices.fromJson(Map<String, dynamic> json) {
    supplierRetailPrice = json['supplierRetailPrice'];
    terminalPrice = json['terminalPrice'];
    latestPrice = json['latestPrice'];
    discountAmount = json['discountAmount'];
    discountPercent = json['discountPercent'];
    sellPrice = json['sellPrice'];
    minLatestPrice = json['minLatestPrice'];
    maxLatestPrice = json['maxLatestPrice'];
    bestComboDiscount = json['bestComboDiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['supplierRetailPrice'] = supplierRetailPrice;
    data['terminalPrice'] = terminalPrice;
    data['latestPrice'] = latestPrice;
    data['discountAmount'] = discountAmount;
    data['discountPercent'] = discountPercent;
    data['sellPrice'] = sellPrice;
    data['minLatestPrice'] = minLatestPrice;
    data['maxLatestPrice'] = maxLatestPrice;
    data['bestComboDiscount'] = bestComboDiscount;
    return data;
  }
}

class ProductDetail {
  String? description;
  String? shortDescription;
  AttributeSet? attributeSet;
  Null? productLine;
  SeoInfo? seoInfo;
  List<AttributeGroups>? attributeGroups;
  List<Images>? images;
  ProductGroup? productGroup;
  String? barcode;
  List<Attributes>? attributes;
  String? clearanceTypeName;
  String? clearanceTypeDescription;
  String? clearanceTypeTag;

  ProductDetail(
      {this.description,
      this.shortDescription,
      this.attributeSet,
      this.productLine,
      this.seoInfo,
      this.attributeGroups,
      this.images,
      this.productGroup,
      this.barcode,
      this.attributes,
      this.clearanceTypeName,
      this.clearanceTypeDescription,
      this.clearanceTypeTag});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    shortDescription = json['shortDescription'];
    attributeSet =
        json['attributeSet'] != null ? AttributeSet.fromJson(json['attributeSet']) : null;
    productLine = json['productLine'];
    seoInfo = json['seoInfo'] != null ? SeoInfo.fromJson(json['seoInfo']) : null;
    if (json['attributeGroups'] != null) {
      attributeGroups = <AttributeGroups>[];
      json['attributeGroups'].forEach((v) {
        attributeGroups!.add(AttributeGroups.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    productGroup =
        json['productGroup'] != null ? ProductGroup.fromJson(json['productGroup']) : null;
    barcode = json['barcode'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    clearanceTypeName = json['clearanceTypeName'];
    clearanceTypeDescription = json['clearanceTypeDescription'];
    clearanceTypeTag = json['clearanceTypeTag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['shortDescription'] = shortDescription;
    if (attributeSet != null) {
      data['attributeSet'] = attributeSet!.toJson();
    }
    data['productLine'] = productLine;
    if (seoInfo != null) {
      data['seoInfo'] = seoInfo!.toJson();
    }
    if (attributeGroups != null) {
      data['attributeGroups'] = attributeGroups!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (productGroup != null) {
      data['productGroup'] = productGroup!.toJson();
    }
    data['barcode'] = barcode;
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    data['clearanceTypeName'] = clearanceTypeName;
    data['clearanceTypeDescription'] = clearanceTypeDescription;
    data['clearanceTypeTag'] = clearanceTypeTag;
    return data;
  }
}

class AttributeSet {
  int? id;
  String? name;

  AttributeSet({this.id, this.name});

  AttributeSet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class SeoInfo {
  String? description;
  String? shortDescription;
  String? metaTitle;
  String? metaKeyword;
  String? metaDescription;
  List<Faq>? faq;

  SeoInfo(
      {this.description,
      this.shortDescription,
      this.metaTitle,
      this.metaKeyword,
      this.metaDescription,
      this.faq});

  SeoInfo.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    shortDescription = json['shortDescription'];
    metaTitle = json['metaTitle'];
    metaKeyword = json['metaKeyword'];
    metaDescription = json['metaDescription'];
    if (json['faq'] != null) {
      faq = <Faq>[];
      json['faq'].forEach((v) {
        faq!.add(Faq.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['shortDescription'] = shortDescription;
    data['metaTitle'] = metaTitle;
    data['metaKeyword'] = metaKeyword;
    data['metaDescription'] = metaDescription;
    if (faq != null) {
      data['faq'] = faq!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Faq {
  String? question;
  String? answer;

  Faq({this.question, this.answer});

  Faq.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}

class AttributeGroups {
  int? id;
  String? name;
  String? value;
  int? priority;
  int? parentId;

  AttributeGroups({this.id, this.name, this.value, this.priority, this.parentId});

  AttributeGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    priority = json['priority'];
    parentId = json['parentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['value'] = value;
    data['priority'] = priority;
    data['parentId'] = parentId;
    return data;
  }
}

class Images {
  String? url;
  int? priority;
  String? label;

  Images({this.url, this.priority, this.label});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    priority = json['priority'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['priority'] = priority;
    data['label'] = label;
    return data;
  }
}

class ProductGroup {
  int? id;
  String? name;
  String? visible;
  List<Configurations>? configurations;
  List<Variants>? variants;
  bool? combineVariantSEO;

  ProductGroup(
      {this.id,
      this.name,
      this.visible,
      this.configurations,
      this.variants,
      this.combineVariantSEO});

  ProductGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    visible = json['visible'];
    if (json['configurations'] != null) {
      configurations = <Configurations>[];
      json['configurations'].forEach((v) {
        configurations!.add(Configurations.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(Variants.fromJson(v));
      });
    }
    combineVariantSEO = json['combineVariantSEO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['visible'] = visible;
    if (configurations != null) {
      data['configurations'] = configurations!.map((v) => v.toJson()).toList();
    }
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    data['combineVariantSEO'] = combineVariantSEO;
    return data;
  }
}

class Configurations {
  int? id;
  String? code;
  String? name;
  String? optionType;
  List<Options>? options;

  Configurations({this.id, this.code, this.name, this.optionType, this.options});

  Configurations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    optionType = json['optionType'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['optionType'] = optionType;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String? value;
  int? optionId;
  List<Null>? images;
  String? thumbnailUrl;

  Options({this.value, this.optionId, this.images, this.thumbnailUrl});

  Options.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    optionId = json['optionId'];
    if (json['images'] != null) {
      images = <Null>[];
      json['images'].forEach((v) {
        // images!.add(Null.fromJson(v));
      });
    }
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = this.value;
    data['optionId'] = this.optionId;
    if (this.images != null) {
      // data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}

class Variants {
  String? sku;
  List<AttributeValues>? attributeValues;

  Variants({this.sku, this.attributeValues});

  Variants.fromJson(Map<String, dynamic> json) {
    sku = json['sku'];
    if (json['attributeValues'] != null) {
      attributeValues = <AttributeValues>[];
      json['attributeValues'].forEach((v) {
        attributeValues!.add(AttributeValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sku'] = sku;
    if (attributeValues != null) {
      data['attributeValues'] = attributeValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttributeValues {
  int? id;
  String? code;
  String? value;
  int? optionId;

  AttributeValues({this.id, this.code, this.value, this.optionId});

  AttributeValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    value = json['value'];
    optionId = json['optionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['value'] = value;
    data['optionId'] = optionId;
    return data;
  }
}

class Attributes {
  String? code;
  String? name;
  List<String>? values;
  int? id;

  Attributes({this.code, this.name, this.values, this.id});

  Attributes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    values = json['values'].cast<String>();
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['values'] = values;
    data['id'] = id;
    return data;
  }
}

class Status {
  String? sellingCode;
  bool? sellable;

  Status({this.sellingCode, this.sellable});

  Status.fromJson(Map<String, dynamic> json) {
    sellingCode = json['sellingCode'];
    sellable = json['sellable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sellingCode'] = sellingCode;
    data['sellable'] = sellable;
    return data;
  }
}

class ProductOptions {
  List<Rows>? rows;

  ProductOptions({this.rows});

  ProductOptions.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  String? title;
  List<OptionsAnother>? options;

  Rows({this.title, this.options});

  Rows.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['options'] != null) {
      options = <OptionsAnother>[];
      json['options'].forEach((v) {
        options!.add(OptionsAnother.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionsAnother {
  String? label;
  bool? selected;
  String? sku;
  int? quantity;
  String? url;

  OptionsAnother({this.label, this.selected, this.sku, this.quantity, this.url});

  OptionsAnother.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    selected = json['selected'];
    sku = json['sku'];
    quantity = json['quantity'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['selected'] = selected;
    data['sku'] = sku;
    data['quantity'] = quantity;
    data['url'] = url;
    return data;
  }
}
