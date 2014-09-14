library spectrum_v1explorer_api.browser;

import "package:google_oauth2_client/google_oauth2_browser.dart" as oauth;

import 'package:google_spectrum_v1explorer_api/src/browser_client.dart';
import "package:google_spectrum_v1explorer_api/spectrum_v1explorer_api_client.dart";

/** API for spectrum-management functions. */
@deprecated
class Spectrum extends Client with BrowserClient {

  final oauth.OAuth2 auth;

  Spectrum([oauth.OAuth2 this.auth]);
}
