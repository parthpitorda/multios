
import 'dart:convert';

PropertyData propertyDataFromJson(String str) => PropertyData.fromJson(json.decode(str));

String propertyDataToJson(PropertyData data) => json.encode(data.toJson());

class PropertyData {
  int status;
  String message;
  Result result;
  int statusCode;

  PropertyData({
    this.status,
    this.message,
    this.result,
    this.statusCode,
  });

  factory PropertyData.fromJson(Map<String, dynamic> json) => PropertyData(
    status: json["status"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result.toJson(),
    "statusCode": statusCode,
  };
}

class Result {
  int totalPages;
  int totalProeprtyCount;
  List<PropertyList> propertyList;
  int itemsPerPage;
  List<dynamic> mapRecordList;

  Result({
    this.totalPages,
    this.totalProeprtyCount,
    this.propertyList,
    this.itemsPerPage,
    this.mapRecordList,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    totalPages: json["total_pages"],
    totalProeprtyCount: json["total_proeprty_count"],
    propertyList: List<PropertyList>.from(json["property_list"].map((x) => PropertyList.fromJson(x))),
    itemsPerPage: json["items_per_page"],
    mapRecordList: List<dynamic>.from(json["map_record_list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "total_pages": totalPages,
    "total_proeprty_count": totalProeprtyCount,
    "property_list": List<dynamic>.from(propertyList.map((x) => x.toJson())),
    "items_per_page": itemsPerPage,
    "map_record_list": List<dynamic>.from(mapRecordList.map((x) => x)),
  };
}

class PropertyList {
  int user;
  String street;
  String unitNumber;
  StateName stateName;
  String cityName;
  String zipcodeCode;
  double homePrice;
  int bedroom;
  double fullBath;
  int partialBath;
  String livingArea;
  String lotSize;
  PropertyType propertyType;
  PropertyStyle propertyStyle;
  String propertyDescription;
  int yearBuilt;
  String builder;
  String parcelId;
  List<String> parking;
  List<Water> water;
  String parkingTotalSpace;
  List<String> security;
  List<String> accessibility;
  int condoFloorNo;
  int buildingUnitCount;
  int buildingFloors;
  List<String> viewType;
  List<BuildingConstruction> buildingConstruction;
  String district;
  String school1Name;
  School1Type school1Type;
  String school2Name;
  School2Type school2Type;
  String school3Name;
  School3Type school3Type;
  String neighborhood;
  String subdivision;
  County county;
  String directions;
  String elevation;
  double latitude;
  double longitude;
  int id;
  String propertyFile;
  String location;
  bool isFavourite;
  List<dynamic> eventList;
  PropertyStatus propertyStatus;
  DateTime onOpentoclose;
  int totalEventCount;
  bool isRemove;

  PropertyList({
    this.user,
    this.street,
    this.unitNumber,
    this.stateName,
    this.cityName,
    this.zipcodeCode,
    this.homePrice,
    this.bedroom,
    this.fullBath,
    this.partialBath,
    this.livingArea,
    this.lotSize,
    this.propertyType,
    this.propertyStyle,
    this.propertyDescription,
    this.yearBuilt,
    this.builder,
    this.parcelId,
    this.parking,
    this.water,
    this.parkingTotalSpace,
    this.security,
    this.accessibility,
    this.condoFloorNo,
    this.buildingUnitCount,
    this.buildingFloors,
    this.viewType,
    this.buildingConstruction,
    this.district,
    this.school1Name,
    this.school1Type,
    this.school2Name,
    this.school2Type,
    this.school3Name,
    this.school3Type,
    this.neighborhood,
    this.subdivision,
    this.county,
    this.directions,
    this.elevation,
    this.latitude,
    this.longitude,
    this.id,
    this.propertyFile,
    this.location,
    this.isFavourite,
    this.eventList,
    this.propertyStatus,
    this.onOpentoclose,
    this.totalEventCount,
    this.isRemove,
  });

  factory PropertyList.fromJson(Map<String, dynamic> json) => PropertyList(
    user: json["user"],
    street: json["street"],
    unitNumber: json["unit_number"],
    stateName: stateNameValues.map[json["state_name"]],
    cityName: json["city_name"],
    zipcodeCode: json["zipcode_code"],
    homePrice: json["home_price"],
    bedroom: json["bedroom"],
    fullBath: json["full_bath"].toDouble(),
    partialBath: json["partial_bath"],
    livingArea: json["living_area"],
    lotSize: json["lot_size"],
    propertyType: propertyTypeValues.map[json["property_type"]],
    propertyStyle: propertyStyleValues.map[json["property_style"]],
    propertyDescription: json["property_description"],
    yearBuilt: json["year_built"],
    builder: json["builder"],
    parcelId: json["parcel_id"],
    parking: List<String>.from(json["parking"].map((x) => x)),
    water: List<Water>.from(json["water"].map((x) => waterValues.map[x])),
    parkingTotalSpace: json["parking_total_space"],
    security: List<String>.from(json["security"].map((x) => x)),
    accessibility: List<String>.from(json["accessibility"].map((x) => x)),
    condoFloorNo: json["condo_floor_no"],
    buildingUnitCount: json["building_unit_count"],
    buildingFloors: json["building_floors"],
    viewType: List<String>.from(json["view_type"].map((x) => x)),
    buildingConstruction: List<BuildingConstruction>.from(json["building_construction"].map((x) => buildingConstructionValues.map[x])),
    district: json["district"],
    school1Name: json["school_1_name"],
    school1Type: school1TypeValues.map[json["school_1_type"]],
    school2Name: json["school_2_name"],
    school2Type: school2TypeValues.map[json["school_2_type"]],
    school3Name: json["school_3_name"],
    school3Type: school3TypeValues.map[json["school_3_type"]],
    neighborhood: json["neighborhood"],
    subdivision: json["subdivision"],
    county: countyValues.map[json["county"]],
    directions: json["directions"],
    elevation: json["elevation"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    id: json["id"],
    propertyFile: json["property_file"],
    location: json["location"],
    isFavourite: json["is_favourite"],
    eventList: List<dynamic>.from(json["event_list"].map((x) => x)),
    propertyStatus: propertyStatusValues.map[json["property_status"]],
    onOpentoclose: DateTime.parse(json["on_opentoclose"]),
    totalEventCount: json["total_event_count"],
    isRemove: json["is_remove"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "street": street,
    "unit_number": unitNumber,
    "state_name": stateNameValues.reverse[stateName],
    "city_name": cityName,
    "zipcode_code": zipcodeCode,
    "home_price": homePrice,
    "bedroom": bedroom,
    "full_bath": fullBath,
    "partial_bath": partialBath,
    "living_area": livingArea,
    "lot_size": lotSize,
    "property_type": propertyTypeValues.reverse[propertyType],
    "property_style": propertyStyleValues.reverse[propertyStyle],
    "property_description": propertyDescription,
    "year_built": yearBuilt,
    "builder": builder,
    "parcel_id": parcelId,
    "parking": List<dynamic>.from(parking.map((x) => x)),
    "water": List<dynamic>.from(water.map((x) => waterValues.reverse[x])),
    "parking_total_space": parkingTotalSpace,
    "security": List<dynamic>.from(security.map((x) => x)),
    "accessibility": List<dynamic>.from(accessibility.map((x) => x)),
    "condo_floor_no": condoFloorNo,
    "building_unit_count": buildingUnitCount,
    "building_floors": buildingFloors,
    "view_type": List<dynamic>.from(viewType.map((x) => x)),
    "building_construction": List<dynamic>.from(buildingConstruction.map((x) => buildingConstructionValues.reverse[x])),
    "district": district,
    "school_1_name": school1Name,
    "school_1_type": school1TypeValues.reverse[school1Type],
    "school_2_name": school2Name,
    "school_2_type": school2TypeValues.reverse[school2Type],
    "school_3_name": school3Name,
    "school_3_type": school3TypeValues.reverse[school3Type],
    "neighborhood": neighborhood,
    "subdivision": subdivision,
    "county": countyValues.reverse[county],
    "directions": directions,
    "elevation": elevation,
    "latitude": latitude,
    "longitude": longitude,
    "id": id,
    "property_file": propertyFile,
    "location": location,
    "is_favourite": isFavourite,
    "event_list": List<dynamic>.from(eventList.map((x) => x)),
    "property_status": propertyStatusValues.reverse[propertyStatus],
    "on_opentoclose": onOpentoclose.toIso8601String(),
    "total_event_count": totalEventCount,
    "is_remove": isRemove,
  };
}

enum BuildingConstruction { FRW, BLK, BRK, SFI }

final buildingConstructionValues = EnumValues({
  "BLK": BuildingConstruction.BLK,
  "BRK": BuildingConstruction.BRK,
  "FRW": BuildingConstruction.FRW,
  "SFI": BuildingConstruction.SFI
});

enum County { MARICOPA, YAVAPAI, EMPTY }

final countyValues = EnumValues({
  "": County.EMPTY,
  "Maricopa": County.MARICOPA,
  "Yavapai": County.YAVAPAI
});

enum PropertyStatus { ACTIVE, PRE_MLS_COMING_SOON }

final propertyStatusValues = EnumValues({
  "Active": PropertyStatus.ACTIVE,
  "PRE-MLS/Coming Soon": PropertyStatus.PRE_MLS_COMING_SOON
});

enum PropertyStyle { DETACHED, ATTACHED, EMPTY }

final propertyStyleValues = EnumValues({
  "Attached": PropertyStyle.ATTACHED,
  "Detached": PropertyStyle.DETACHED,
  "": PropertyStyle.EMPTY
});

enum PropertyType { SINGLE_FAMILY_DETACHED, LOFT_STYLE }

final propertyTypeValues = EnumValues({
  "Loft Style": PropertyType.LOFT_STYLE,
  "Single Family - Detached": PropertyType.SINGLE_FAMILY_DETACHED
});

enum School1Type { ELEMENTARY_SCHOOL, EMPTY }

final school1TypeValues = EnumValues({
  "Elementary School": School1Type.ELEMENTARY_SCHOOL,
  "": School1Type.EMPTY
});

enum School2Type { JR_HIGH_SCHOOL, EMPTY }

final school2TypeValues = EnumValues({
  "": School2Type.EMPTY,
  "Jr. High School": School2Type.JR_HIGH_SCHOOL
});

enum School3Type { HIGH_SCHOOL, EMPTY }

final school3TypeValues = EnumValues({
  "": School3Type.EMPTY,
  "High School": School3Type.HIGH_SCHOOL
});

enum StateName { ARIZONA }

final stateNameValues = EnumValues({
  "Arizona": StateName.ARIZONA
});

enum Water { NON, PVO, COM }

final waterValues = EnumValues({
  "COM": Water.COM,
  "NON": Water.NON,
  "PVO": Water.PVO
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
