library spectrum_v1explorer_api.console;

import "package:google_oauth2_client/google_oauth2_console.dart" as oauth2;

import 'package:google_spectrum_v1explorer_api/src/console_client.dart';

import "package:google_spectrum_v1explorer_api/spectrum_v1explorer_api_client.dart";

/** API for spectrum-management functions. */
@deprecated
class Spectrum extends Client with ConsoleClient {

  final oauth2.OAuth2Console auth;

  Spectrum([oauth2.OAuth2Console this.auth]);
}
