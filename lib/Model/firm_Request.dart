

class FIrmRequest {
  final String? apiRequestType;
  final String? ecomOwnId;
  final String? ecomLoginId;
  final String? systemOnOff;
  final String? gbDbHost;
  final String? userLoginId;
  final String? ecomDomainName;
  final String? ecomApiKey;
  final String? apiLoginToken;
  final String? apiProdKey;
  final String? apiRequestId;
  final String? apiFolder;
  final String? mapiFolder;
  final String? remoteLogin;
  final String? gbDbPort;
  final String? gbDbUser;
  final String? userDbHost;
  final String? userDbPort;
  final String? userDbUser;
  final String? ownerLoginId;
  final String? ownerUserPassword;

  FIrmRequest({
     this.apiRequestType,
     this.ecomOwnId,
     this.ecomLoginId,
     this.systemOnOff,
     this.gbDbHost,
     this.userLoginId,
     this.ecomDomainName,
     this.ecomApiKey,
     this.apiLoginToken,
     this.apiProdKey,
     this.apiRequestId,
     this.apiFolder,
     this.mapiFolder,
     this.remoteLogin,
     this.gbDbPort,
     this.gbDbUser,
     this.userDbHost,
     this.userDbPort,
     this.userDbUser,
     this.ownerLoginId,
     this.ownerUserPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "api_request_type": apiRequestType,
      "ecom_own_id": ecomOwnId,
      "ecom_login_id": ecomLoginId,
      "system_onoff": systemOnOff,
      "GB_DB_HOST": gbDbHost,
      "user_login_id": userLoginId,
      "ecom_domain_name": ecomDomainName,
      "ecom_api_key": ecomApiKey,
      "api_login_token": apiLoginToken,
      "api_prod_key": apiProdKey,
      "api_request_id": apiRequestId,
      "api_folder": apiFolder,
      "mapi_folder": mapiFolder,
      "remote_login": remoteLogin,
      "GB_DB_PORT": gbDbPort,
      "GB_DB_USER": gbDbUser,
      "USER_DB_HOST": userDbHost,
      "USER_DB_PORT": userDbPort,
      "USER_DB_USER": userDbUser,
      "owner_login_id": ownerLoginId,
      "owner_user_password": ownerUserPassword,
    };
  }
}
