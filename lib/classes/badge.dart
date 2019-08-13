class Badge {
  String description;
  List<dynamic> tags;
  String issuerContentUrl;
  String issuerContentName;
  bool verifiedByOBF;
  int userEndorsementsCount;
  int endorsementCount;
  String name;
  String imageFile;
  int expiresOn;
  bool revoked;
  int issuedOn;
  String obfUrl;
  String status;
  bool issuedByObf;
  int id;
  String badgeId;
  String assertionUrl;
  String visibility;
  int mtime;
  int issuerVerified;

  Badge({
    this.description,
    this.tags,
    this.issuerContentUrl,
    this.issuerContentName,
    this.verifiedByOBF,
    this.userEndorsementsCount,
    this.endorsementCount,
    this.name,
    this.imageFile,
    this.expiresOn,
    this.revoked,
    this.issuedOn,
    this.obfUrl,
    this.status,
    this.issuedByObf,
    this.id,
    this.badgeId,
    this.assertionUrl,
    this.visibility,
    this.mtime,
    this.issuerVerified,
  });

  factory Badge.fromJson(Map<String, dynamic> json) => new Badge(
      description: json["description"],
      tags: new List<dynamic>.from(json["tags"].map((x) => x)),
      issuerContentUrl: json["issuer_content_url"],
      issuerContentName: json["issuer_content_name"],
      verifiedByOBF: json["verified_by_obf"],
      userEndorsementsCount: json["user_endorsements_count"],
      endorsementCount: json["endorsements_count"],
      name: json["name"],
      imageFile: json["image_file"],
      expiresOn: json["expires_on"],
      revoked: json["revoked"],
      issuedOn: json["issued_on"],
      obfUrl: json["obf_url"],
      status: json["status"],
      issuedByObf: json["issued_by_obf"],
      id: json["id"],
      badgeId: json["badge_id"],
      assertionUrl: json["assertion_url"],
      visibility: json["visibility"],
      mtime: json["mtime"],
      issuerVerified: json["issuer_verified"]);
}
