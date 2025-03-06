import 'dart:convert';

class OptionGroupModel {
    Data data;

    OptionGroupModel({
        required this.data,
    });

    OptionGroupModel copyWith({
        Data? data,
    }) => 
        OptionGroupModel(
            data: data ?? this.data,
        );

    factory OptionGroupModel.fromRawJson(String str) => OptionGroupModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OptionGroupModel.fromJson(Map<String, dynamic> json) => OptionGroupModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    List<OptionGroupsLi> optionGroupsLis;
    AvailableOptionLis availableOptionLis;

    Data({
        required this.optionGroupsLis,
        required this.availableOptionLis,
    });

    Data copyWith({
        List<OptionGroupsLi>? optionGroupsLis,
        AvailableOptionLis? availableOptionLis,
    }) => 
        Data(
            optionGroupsLis: optionGroupsLis ?? this.optionGroupsLis,
            availableOptionLis: availableOptionLis ?? this.availableOptionLis,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        optionGroupsLis: List<OptionGroupsLi>.from(json["optionGroupsLis"].map((x) => OptionGroupsLi.fromJson(x))),
        availableOptionLis: AvailableOptionLis.fromJson(json["availableOptionLis"]),
    );

    Map<String, dynamic> toJson() => {
        "optionGroupsLis": List<dynamic>.from(optionGroupsLis.map((x) => x.toJson())),
        "availableOptionLis": availableOptionLis.toJson(),
    };
}

class AvailableOptionLis {
    List<Possibility> possibilities;

    AvailableOptionLis({
        required this.possibilities,
    });

    AvailableOptionLis copyWith({
        List<Possibility>? possibilities,
    }) => 
        AvailableOptionLis(
            possibilities: possibilities ?? this.possibilities,
        );

    factory AvailableOptionLis.fromRawJson(String str) => AvailableOptionLis.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AvailableOptionLis.fromJson(Map<String, dynamic> json) => AvailableOptionLis(
        possibilities: List<Possibility>.from(json["possibilities"].map((x) => Possibility.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "possibilities": List<dynamic>.from(possibilities.map((x) => x.toJson())),
    };
}

class Possibility {
    List<PossibilityGroup> possibilityGroups;
    num quantity;
    num increasingPrice;

    Possibility({
        required this.possibilityGroups,
        required this.quantity,
        required this.increasingPrice,
    });

    Possibility copyWith({
        List<PossibilityGroup>? possibilityGroups,
        num? quantity,
        num? increasingPrice,
    }) => 
        Possibility(
            possibilityGroups: possibilityGroups ?? this.possibilityGroups,
            quantity: quantity ?? this.quantity,
            increasingPrice: increasingPrice ?? this.increasingPrice,
        );

    factory Possibility.fromRawJson(String str) => Possibility.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Possibility.fromJson(Map<String, dynamic> json) => Possibility(
        possibilityGroups: List<PossibilityGroup>.from(json["possibilityGroups"].map((x) => PossibilityGroup.fromJson(x))),
        quantity: json["quantity"],
        increasingPrice: json["increasingPrice"],
    );

    Map<String, dynamic> toJson() => {
        "possibilityGroups": List<dynamic>.from(possibilityGroups.map((x) => x.toJson())),
        "quantity": quantity,
        "increasingPrice": increasingPrice,
    };
}

class PossibilityGroup {
    num optionGroupId;
    num optionId;

    PossibilityGroup({
        required this.optionGroupId,
        required this.optionId,
    });

    PossibilityGroup copyWith({
        num? optionGroupId,
        num? optionId,
    }) => 
        PossibilityGroup(
            optionGroupId: optionGroupId ?? this.optionGroupId,
            optionId: optionId ?? this.optionId,
        );

    factory PossibilityGroup.fromRawJson(String str) => PossibilityGroup.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PossibilityGroup.fromJson(Map<String, dynamic> json) => PossibilityGroup(
        optionGroupId: json["optionGroupId"],
        optionId: json["optionId"],
    );

    Map<String, dynamic> toJson() => {
        "optionGroupId": optionGroupId,
        "optionId": optionId,
    };
}

class OptionGroupsLi {
    num optionGroupId;
    bool isColor;
    String optionGroupName;
    String optionGroupNameEn;
    bool isMain;
    List<Option> options;

    OptionGroupsLi({
        required this.optionGroupId,
        required this.isColor,
        required this.optionGroupName,
        required this.optionGroupNameEn,
        required this.isMain,
        required this.options,
    });

    OptionGroupsLi copyWith({
        num? optionGroupId,
        bool? isColor,
        String? optionGroupName,
        String? optionGroupNameEn,
        bool? isMain,
        List<Option>? options,
    }) => 
        OptionGroupsLi(
            optionGroupId: optionGroupId ?? this.optionGroupId,
            isColor: isColor ?? this.isColor,
            optionGroupName: optionGroupName ?? this.optionGroupName,
            optionGroupNameEn: optionGroupNameEn ?? this.optionGroupNameEn,
            isMain: isMain ?? this.isMain,
            options: options ?? this.options,
        );

    factory OptionGroupsLi.fromRawJson(String str) => OptionGroupsLi.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OptionGroupsLi.fromJson(Map<String, dynamic> json) => OptionGroupsLi(
        optionGroupId: json["optionGroupId"],
        isColor: json["isColor"],
        optionGroupName: json["optionGroupName"],
        optionGroupNameEn: json["optionGroupNameEn"],
        isMain: json["isMain"],
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "optionGroupId": optionGroupId,
        "isColor": isColor,
        "optionGroupName": optionGroupName,
        "optionGroupNameEn": optionGroupNameEn,
        "isMain": isMain,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
    };
}

class Option {
    num optionId;
    String name;
    String nameEn;
    String colorHash;

    Option({
        required this.optionId,
        required this.name,
        required this.nameEn,
        required this.colorHash,
    });

    Option copyWith({
        num? optionId,
        String? name,
        String? nameEn,
        String? colorHash,
    }) => 
        Option(
            optionId: optionId ?? this.optionId,
            name: name ?? this.name,
            nameEn: nameEn ?? this.nameEn,
            colorHash: colorHash ?? this.colorHash,
        );

    factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        optionId: json["optionId"],
        name: json["name"],
        nameEn: json["nameEn"],
        colorHash: json["colorHash"],
    );

    Map<String, dynamic> toJson() => {
        "optionId": optionId,
        "name": name,
        "nameEn": nameEn,
        "colorHash": colorHash,
    };
}
