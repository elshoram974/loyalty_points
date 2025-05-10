import 'dart:convert';

import 'package:equatable/equatable.dart';

class PushNotificationServiceFileContent extends Equatable {
  final String? type;
  final String? projectId;
  final String? privateKeyId;
  final String? privateKey;
  final String? clientEmail;
  final String? clientId;
  final String? authUri;
  final String? tokenUri;
  final String? authProviderX509CertUrl;
  final String? clientX509CertUrl;
  final String? universeDomain;

  const PushNotificationServiceFileContent({
    this.type,
    this.projectId,
    this.privateKeyId,
    this.privateKey,
    this.clientEmail,
    this.clientId,
    this.authUri,
    this.tokenUri,
    this.authProviderX509CertUrl,
    this.clientX509CertUrl,
    this.universeDomain,
  });

  factory PushNotificationServiceFileContent.fromMap(
      Map<String, dynamic> data) {
    return PushNotificationServiceFileContent(
      type: data['type'] as String?,
      projectId: data['project_id'] as String?,
      privateKeyId: data['private_key_id'] as String?,
      privateKey: data['private_key'] as String?,
      clientEmail: data['client_email'] as String?,
      clientId: data['client_id'] as String?,
      authUri: data['auth_uri'] as String?,
      tokenUri: data['token_uri'] as String?,
      authProviderX509CertUrl: data['auth_provider_x509_cert_url'] as String?,
      clientX509CertUrl: data['client_x509_cert_url'] as String?,
      universeDomain: data['universe_domain'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'type': type,
        'project_id': projectId,
        'private_key_id': privateKeyId,
        'private_key': privateKey,
        'client_email': clientEmail,
        'client_id': clientId,
        'auth_uri': authUri,
        'token_uri': tokenUri,
        'auth_provider_x509_cert_url': authProviderX509CertUrl,
        'client_x509_cert_url': clientX509CertUrl,
        'universe_domain': universeDomain,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PushNotificationServiceFileContent].
  factory PushNotificationServiceFileContent.fromJson(String data) {
    return PushNotificationServiceFileContent.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PushNotificationServiceFileContent] to a JSON string.
  String toJson() => json.encode(toMap());

  PushNotificationServiceFileContent copyWith({
    String? type,
    String? projectId,
    String? privateKeyId,
    String? privateKey,
    String? clientEmail,
    String? clientId,
    String? authUri,
    String? tokenUri,
    String? authProviderX509CertUrl,
    String? clientX509CertUrl,
    String? universeDomain,
  }) {
    return PushNotificationServiceFileContent(
      type: type ?? this.type,
      projectId: projectId ?? this.projectId,
      privateKeyId: privateKeyId ?? this.privateKeyId,
      privateKey: privateKey ?? this.privateKey,
      clientEmail: clientEmail ?? this.clientEmail,
      clientId: clientId ?? this.clientId,
      authUri: authUri ?? this.authUri,
      tokenUri: tokenUri ?? this.tokenUri,
      authProviderX509CertUrl:
          authProviderX509CertUrl ?? this.authProviderX509CertUrl,
      clientX509CertUrl: clientX509CertUrl ?? this.clientX509CertUrl,
      universeDomain: universeDomain ?? this.universeDomain,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      type,
      projectId,
      privateKeyId,
      privateKey,
      clientEmail,
      clientId,
      authUri,
      tokenUri,
      authProviderX509CertUrl,
      clientX509CertUrl,
      universeDomain,
    ];
  }
}
