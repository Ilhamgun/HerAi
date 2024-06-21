class UserProfile {
  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.role,
    required this.provider,
    required this.createdAt,
    required this.updatedAt,
    required this.point,
    required this.totalTransaction,
    required this.media,
    required this.overview,
    required this.profilePicture,
  });

  int id;
  String name;
  String email;
  DateTime emailVerifiedAt;
  String role;
  String provider;
  DateTime createdAt;
  DateTime updatedAt;

  int point;
  int totalTransaction;
  List<Media> media;
  Overview overview;
  String profilePicture;

  factory UserProfile.empty() => UserProfile(
      id: 0,
      name: '',
      email: '',
      emailVerifiedAt: DateTime.now(),
      role: '',
      provider: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      point: 0,
      totalTransaction: 0,
      media: [],
      overview: Overview.empty(),
      profilePicture: '');

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? '' : json["name"],
        email: json["email"] == null ? '' : json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["email_verified_at"]),
        role: json["role"] == null ? '' : json["role"],
        provider: json["provider"] == null ? '' : json["provider"],
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
        point: json["point"] == null ? 0 : json["point"],
        totalTransaction:
            json["total_transaction"] == null ? 0 : json["total_transaction"],
        media: json["media"] == null
            ? [Media.empty()]
            : List<Media>.from(json["media"].map((x) => Media.fromMap(x))),
        overview: json["overview"] == null
            ? Overview.empty()
            : Overview.fromMap(json["overview"]),
        profilePicture:
            json["profile_picture"] == null ? '' : json["profile_picture"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "provider": provider,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "point": point,
        "total_transaction": totalTransaction,
        "media": List<dynamic>.from(media.map((x) => x.toMap())),
      };
}

class Overview {
  Overview({
    required this.transaction,
    required this.progress,
  });

  final Transaction transaction;
  final Progress progress;

  factory Overview.empty() =>
      Overview(transaction: Transaction.empty(), progress: Progress.empty());
  factory Overview.fromMap(Map<String, dynamic> json) => Overview(
        transaction: json["transaction"] == null
            ? Transaction(total: 0, waiting: 0)
            : Transaction.fromMap(json["transaction"]),
        progress: json["progress"] == null
            ? Progress.empty()
            : Progress.fromMap(json["progress"]),
      );

  Map<String, dynamic> toMap() => {
        "transaction": transaction.toMap(),
        "progress": progress.toMap(),
      };
}

class Progress {
  Progress({
    required this.trashThisMonth,
    required this.topWeightOnTransaction,
    required this.totalWeight,
    required this.totalTransaction,
  });

  final int trashThisMonth;
  final int topWeightOnTransaction;
  final int totalWeight;
  final int totalTransaction;

  factory Progress.empty() => Progress(
      trashThisMonth: 0,
      topWeightOnTransaction: 0,
      totalWeight: 0,
      totalTransaction: 0);

  factory Progress.fromMap(Map<String, dynamic> json) => Progress(
        trashThisMonth:
            json["trash_this_month"] == null ? 0 : json["trash_this_month"],
        topWeightOnTransaction: json["top_weight_on_transaction"] == null
            ? 0
            : json["top_weight_on_transaction"],
        totalWeight: json["total_weight"] == null ? 0 : json["total_weight"],
        totalTransaction:
            json["total_transaction"] == null ? 0 : json["total_transaction"],
      );

  Map<String, dynamic> toMap() => {
        "trash_this_month": trashThisMonth,
        "top_weight_on_transaction": topWeightOnTransaction,
        "total_weight": totalWeight,
        "total_transaction": totalTransaction,
      };
}

class Transaction {
  Transaction({
    required this.total,
    required this.waiting,
  });

  final int total;
  final int waiting;

  factory Transaction.empty() => Transaction(total: 0, waiting: 0);
  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        total: json["total"] == null ? 0 : json["total"],
        waiting: json["waiting"] == null ? 0 : json["waiting"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "waiting": waiting,
      };
}

class Media {
  Media({
    required this.id,
    required this.modelType,
    required this.modelId,
    required this.uuid,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.disk,
    required this.conversionsDisk,
    required this.size,
    required this.manipulations,
    required this.customProperties,
    required this.generatedConversions,
    required this.responsiveImages,
    required this.orderColumn,
    required this.createdAt,
    required this.updatedAt,
    required this.originalUrl,
    required this.previewUrl,
  });

  final int id;
  final String modelType;
  final int modelId;
  final String uuid;
  final String collectionName;
  final String name;
  final String fileName;
  final String mimeType;
  final String disk;
  final String conversionsDisk;
  final int size;
  final List<dynamic> manipulations;
  final List<dynamic> customProperties;
  final List<dynamic> generatedConversions;
  final List<dynamic> responsiveImages;
  final int orderColumn;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String originalUrl;
  final String previewUrl;

  factory Media.empty() => Media(
      id: 0,
      modelType: '',
      modelId: 0,
      uuid: '',
      collectionName: '',
      name: '',
      fileName: '',
      mimeType: '',
      disk: '',
      conversionsDisk: '',
      size: 0,
      manipulations: [],
      customProperties: [],
      generatedConversions: [],
      responsiveImages: [],
      orderColumn: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      originalUrl: '',
      previewUrl: '');

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        id: json["id"] == null ? 0 : json["id"],
        modelType: json["model_type"] == null ? '' : json["model_type"],
        modelId: json["model_id"] == null ? 0 : json["model_id"],
        uuid: json["uuid"] == null ? '' : json["uuid"],
        collectionName:
            json["collection_name"] == null ? '' : json["collection_name"],
        name: json["name"] == null ? '' : json["name"],
        fileName: json["file_name"] == null ? '' : json["file_name"],
        mimeType: json["mime_type"] == null ? '' : json["mime_type"],
        disk: json["disk"] == null ? '' : json["disk"],
        conversionsDisk:
            json["conversions_disk"] == null ? '' : json["conversions_disk"],
        size: json["size"] == null ? 0 : json["size"],
        manipulations: json["manipulations"] == null
            ? []
            : List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties: json["custom_properties"] == null
            ? []
            : List<dynamic>.from(json["custom_properties"].map((x) => x)),
        generatedConversions: json["generated_conversions"] == null
            ? []
            : List<dynamic>.from(json["generated_conversions"].map((x) => x)),
        responsiveImages: json["responsive_images"] == null
            ? []
            : List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"] == null ? 0 : json["order_column"],
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
        originalUrl: json["original_url"] == null ? '' : json["original_url"],
        previewUrl: json["preview_url"] == null ? '' : json["preview_url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "uuid": uuid,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "conversions_disk": conversionsDisk,
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
        "generated_conversions":
            List<dynamic>.from(generatedConversions.map((x) => x)),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "original_url": originalUrl,
        "preview_url": previewUrl,
      };
}
