part of spectrum_v1explorer_api;

class PawsResource_ {

  final Client _client;

  PawsResource_(Client client) :
      _client = client;

  /**
   * Requests information about the available spectrum for a device at a location. Requests from a fixed-mode device must include owner information so the device can be registered with the database.
   *
   * [request] - PawsGetSpectrumRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<PawsGetSpectrumResponse> getSpectrum(PawsGetSpectrumRequest request, {core.Map optParams}) {
    var url = "getSpectrum";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new PawsGetSpectrumResponse.fromJson(data));
  }

  /**
   * The Google Spectrum Database does not support batch requests, so this method always yields an UNIMPLEMENTED error.
   *
   * [request] - PawsGetSpectrumBatchRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<PawsGetSpectrumBatchResponse> getSpectrumBatch(PawsGetSpectrumBatchRequest request, {core.Map optParams}) {
    var url = "getSpectrumBatch";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new PawsGetSpectrumBatchResponse.fromJson(data));
  }

  /**
   * Initializes the connection between a white space device and the database.
   *
   * [request] - PawsInitRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<PawsInitResponse> init(PawsInitRequest request, {core.Map optParams}) {
    var url = "init";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new PawsInitResponse.fromJson(data));
  }

  /**
   * Notifies the database that the device has selected certain frequency ranges for transmission. Only to be invoked when required by the regulator. The Google Spectrum Database does not operate in domains that require notification, so this always yields an UNIMPLEMENTED error.
   *
   * [request] - PawsNotifySpectrumUseRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<PawsNotifySpectrumUseResponse> notifySpectrumUse(PawsNotifySpectrumUseRequest request, {core.Map optParams}) {
    var url = "notifySpectrumUse";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new PawsNotifySpectrumUseResponse.fromJson(data));
  }

  /**
   * The Google Spectrum Database implements registration in the getSpectrum method. As such this always returns an UNIMPLEMENTED error.
   *
   * [request] - PawsRegisterRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<PawsRegisterResponse> register(PawsRegisterRequest request, {core.Map optParams}) {
    var url = "register";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new PawsRegisterResponse.fromJson(data));
  }

  /**
   * Validates a device for white space use in accordance with regulatory rules. The Google Spectrum Database does not support master/slave configurations, so this always yields an UNIMPLEMENTED error.
   *
   * [request] - PawsVerifyDeviceRequest to send in this request
   *
   * [optParams] - Additional query parameters
   */
  async.Future<PawsVerifyDeviceResponse> verifyDevice(PawsVerifyDeviceRequest request, {core.Map optParams}) {
    var url = "verifyDevice";
    var urlParams = new core.Map();
    var queryParams = new core.Map();

    var paramErrors = new core.List();
    if (optParams != null) {
      optParams.forEach((key, value) {
        if (value != null && queryParams[key] == null) {
          queryParams[key] = value;
        }
      });
    }

    if (!paramErrors.isEmpty) {
      throw new core.ArgumentError(paramErrors.join(" / "));
    }

    var response;
    response = _client.request(url, "POST", body: request.toString(), urlParams: urlParams, queryParams: queryParams);
    return response
      .then((data) => new PawsVerifyDeviceResponse.fromJson(data));
  }
}

