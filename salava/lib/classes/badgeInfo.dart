import 'dart:convert';

BadgeInfo badgeInfoFromJson(String str) => BadgeInfo.fromJson(json.decode(str));

String badgeInfoToJson(BadgeInfo data) => json.encode(data.toJson());

class BadgeInfo {
  dynamic viewCount;
  int deleted;
  String email;
  String firstName;
  int showRecipientName;
  bool verifiedByObf;
  List<Content> content;
  dynamic receiveNotifications;
  int recipientCount;
  bool badgeInfoOwner;
  int expiresOn;
  String assertionJson;
  int revoked;
  dynamic congratulated;
  dynamic evidenceUrl;
  int userEndorsementCount;
  int issuedOn;
  dynamic obfUrl;
  int ctime;
  String status;
  bool issuedByObf;
  int id;
  String lastName;
  int userId;
  dynamic remoteUrl;
  String badgeId;
  dynamic congratulations;
  bool userLoggedIn;
  String assertionUrl;
  String qrCode;
  String visibility;
  int owner;
  int showEvidence;
  dynamic rating;
  Assertion assertion;
  List<dynamic> evidences;
  int mtime;
  int issuerVerified;

  BadgeInfo({
    this.viewCount,
    this.deleted,
    this.email,
    this.firstName,
    this.showRecipientName,
    this.verifiedByObf,
    this.content,
    this.receiveNotifications,
    this.recipientCount,
    this.badgeInfoOwner,
    this.expiresOn,
    this.assertionJson,
    this.revoked,
    this.congratulated,
    this.evidenceUrl,
    this.userEndorsementCount,
    this.issuedOn,
    this.obfUrl,
    this.ctime,
    this.status,
    this.issuedByObf,
    this.id,
    this.lastName,
    this.userId,
    this.remoteUrl,
    this.badgeId,
    this.congratulations,
    this.userLoggedIn,
    this.assertionUrl,
    this.qrCode,
    this.visibility,
    this.owner,
    this.showEvidence,
    this.rating,
    this.assertion,
    this.evidences,
    this.mtime,
    this.issuerVerified,
  });

  factory BadgeInfo.fromJson(Map<String, dynamic> json) => new BadgeInfo(
        viewCount: json["view_count"],
        deleted: json["deleted"],
        email: json["email"],
        firstName: json["first_name"],
        showRecipientName: json["show_recipient_name"],
        verifiedByObf: json["verified_by_obf"],
        content: new List<Content>.from(
            json["content"].map((x) => Content.fromJson(x))),
        receiveNotifications: json["receive-notifications"],
        recipientCount: json["recipient_count"],
        badgeInfoOwner: json["owner?"],
        expiresOn: json["expires_on"],
        assertionJson: json["assertion_json"],
        revoked: json["revoked"],
        congratulated: json["congratulated?"],
        evidenceUrl: json["evidence_url"],
        userEndorsementCount: json["user_endorsement_count"],
        issuedOn: json["issued_on"],
        obfUrl: json["obf_url"],
        ctime: json["ctime"],
        status: json["status"],
        issuedByObf: json["issued_by_obf"],
        id: json["id"],
        lastName: json["last_name"],
        userId: json["user_id"],
        remoteUrl: json["remote_url"],
        badgeId: json["badge_id"],
        congratulations: json["congratulations"],
        userLoggedIn: json["user-logged-in?"],
        assertionUrl: json["assertion_url"],
        qrCode: json["qr_code"],
        visibility: json["visibility"],
        owner: json["owner"],
        showEvidence: json["show_evidence"],
        rating: json["rating"],
        assertion: Assertion.fromJson(json["assertion"]),
        evidences: new List<dynamic>.from(json["evidences"].map((x) => x)),
        mtime: json["mtime"],
        issuerVerified: json["issuer_verified"],
      );

  Map<String, dynamic> toJson() => {
        "view_count": viewCount,
        "deleted": deleted,
        "email": email,
        "first_name": firstName,
        "show_recipient_name": showRecipientName,
        "verified_by_obf": verifiedByObf,
        "content": new List<dynamic>.from(content.map((x) => x.toJson())),
        "receive-notifications": receiveNotifications,
        "recipient_count": recipientCount,
        "owner?": badgeInfoOwner,
        "expires_on": expiresOn,
        "assertion_json": assertionJson,
        "revoked": revoked,
        "congratulated?": congratulated,
        "evidence_url": evidenceUrl,
        "user_endorsement_count": userEndorsementCount,
        "issued_on": issuedOn,
        "obf_url": obfUrl,
        "ctime": ctime,
        "status": status,
        "issued_by_obf": issuedByObf,
        "id": id,
        "last_name": lastName,
        "user_id": userId,
        "remote_url": remoteUrl,
        "badge_id": badgeId,
        "congratulations": congratulations,
        "user-logged-in?": userLoggedIn,
        "assertion_url": assertionUrl,
        "qr_code": qrCode,
        "visibility": visibility,
        "owner": owner,
        "show_evidence": showEvidence,
        "rating": rating,
        "assertion": assertion.toJson(),
        "evidences": new List<dynamic>.from(evidences.map((x) => x)),
        "mtime": mtime,
        "issuer_verified": issuerVerified,
      };
}

class Assertion {
  String type;
  String id;
  String badge;
  String context;
  Verification verification;
  String issuedOn;
  Recipient recipient;
  String expires;

  Assertion({
    this.type,
    this.id,
    this.badge,
    this.context,
    this.verification,
    this.issuedOn,
    this.recipient,
    this.expires,
  });

  factory Assertion.fromJson(Map<String, dynamic> json) => new Assertion(
        type: json["type"],
        id: json["id"],
        badge: json["badge"],
        context: json["@context"],
        verification: Verification.fromJson(json["verification"]),
        issuedOn: json["issuedOn"],
        recipient: Recipient.fromJson(json["recipient"]),
        expires: json["expires"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "badge": badge,
        "@context": context,
        "verification": verification.toJson(),
        "issuedOn": issuedOn,
        "recipient": recipient.toJson(),
        "expires": expires,
      };
}

class Recipient {
  String identity;
  bool hashed;
  String type;
  String salt;

  Recipient({
    this.identity,
    this.hashed,
    this.type,
    this.salt,
  });

  factory Recipient.fromJson(Map<String, dynamic> json) => new Recipient(
        identity: json["identity"],
        hashed: json["hashed"],
        type: json["type"],
        salt: json["salt"],
      );

  Map<String, dynamic> toJson() => {
        "identity": identity,
        "hashed": hashed,
        "type": type,
        "salt": salt,
      };
}

class Verification {
  String type;

  Verification({
    this.type,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => new Verification(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}

class Content {
  String description;
  String languageCode;
  String issuerDescription;
  String issuerContentUrl;
  dynamic creatorName;
  String issuerContentName;
  int endorsementCount;
  String name;
  String imageFile;
  dynamic creatorContentId;
  List<dynamic> alignment;
  String criteriaContent;
  String issuerContact;
  String issuerContentId;
  dynamic issuerImage;
  String defaultLanguageCode;
  dynamic creatorDescription;
  String criteriaUrl;
  dynamic creatorEmail;
  dynamic creatorImage;
  String badgeId;
  dynamic creatorUrl;

  Content({
    this.description,
    this.languageCode,
    this.issuerDescription,
    this.issuerContentUrl,
    this.creatorName,
    this.issuerContentName,
    this.endorsementCount,
    this.name,
    this.imageFile,
    this.creatorContentId,
    this.alignment,
    this.criteriaContent,
    this.issuerContact,
    this.issuerContentId,
    this.issuerImage,
    this.defaultLanguageCode,
    this.creatorDescription,
    this.criteriaUrl,
    this.creatorEmail,
    this.creatorImage,
    this.badgeId,
    this.creatorUrl,
  });

  factory Content.fromJson(Map<String, dynamic> json) => new Content(
        description: json["description"],
        languageCode: json["language_code"],
        issuerDescription: json["issuer_description"],
        issuerContentUrl: json["issuer_content_url"],
        creatorName: json["creator_name"],
        issuerContentName: json["issuer_content_name"],
        endorsementCount: json["endorsement_count"],
        name: json["name"],
        imageFile: json["image_file"],
        creatorContentId: json["creator_content_id"],
        alignment: new List<dynamic>.from(json["alignment"].map((x) => x)),
        criteriaContent: json["criteria_content"],
        issuerContact: json["issuer_contact"],
        issuerContentId: json["issuer_content_id"],
        issuerImage: json["issuer_image"],
        defaultLanguageCode: json["default_language_code"],
        creatorDescription: json["creator_description"],
        criteriaUrl: json["criteria_url"],
        creatorEmail: json["creator_email"],
        creatorImage: json["creator_image"],
        badgeId: json["badge_id"],
        creatorUrl: json["creator_url"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "language_code": languageCode,
        "issuer_description": issuerDescription,
        "issuer_content_url": issuerContentUrl,
        "creator_name": creatorName,
        "issuer_content_name": issuerContentName,
        "endorsement_count": endorsementCount,
        "name": name,
        "image_file": imageFile,
        "creator_content_id": creatorContentId,
        "alignment": new List<dynamic>.from(alignment.map((x) => x)),
        "criteria_content": criteriaContent,
        "issuer_contact": issuerContact,
        "issuer_content_id": issuerContentId,
        "issuer_image": issuerImage,
        "default_language_code": defaultLanguageCode,
        "creator_description": creatorDescription,
        "criteria_url": criteriaUrl,
        "creator_email": creatorEmail,
        "creator_image": creatorImage,
        "badge_id": badgeId,
        "creator_url": creatorUrl,
      };
}
