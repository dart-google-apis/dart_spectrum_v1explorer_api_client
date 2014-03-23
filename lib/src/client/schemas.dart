part of spectrum_v1explorer_api;

/** Antenna characteristics provide additional information, such as the antenna height, antenna type, etc. Whether antenna characteristics must be provided in a request depends on the device type and regulatory domain. */
class AntennaCharacteristics {

  /** The antenna height in meters. Whether the antenna height is required depends on the device type and the regulatory domain. Note that the height may be negative. */
  core.num height;

  /** If the height is required, then the height type (AGL for above ground level or AMSL for above mean sea level) is also required. The default is AGL. */
  core.String heightType;

  /** The height uncertainty in meters. Whether this is required depends on the regulatory domain. */
  core.num heightUncertainty;

  /** Create new AntennaCharacteristics from JSON data */
  AntennaCharacteristics.fromJson(core.Map json) {
    if (json.containsKey("height")) {
      height = json["height"];
    }
    if (json.containsKey("heightType")) {
      heightType = json["heightType"];
    }
    if (json.containsKey("heightUncertainty")) {
      heightUncertainty = json["heightUncertainty"];
    }
  }

  /** Create JSON Object for AntennaCharacteristics */
  core.Map toJson() {
    var output = new core.Map();

    if (height != null) {
      output["height"] = height;
    }
    if (heightType != null) {
      output["heightType"] = heightType;
    }
    if (heightUncertainty != null) {
      output["heightUncertainty"] = heightUncertainty;
    }

    return output;
  }

  /** Return String representation of AntennaCharacteristics */
  core.String toString() => JSON.encode(this.toJson());

}

/** This message contains the name and URI of a database. */
class DatabaseSpec {

  /** The display name for a database. */
  core.String name;

  /** The corresponding URI of the database. */
  core.String uri;

  /** Create new DatabaseSpec from JSON data */
  DatabaseSpec.fromJson(core.Map json) {
    if (json.containsKey("name")) {
      name = json["name"];
    }
    if (json.containsKey("uri")) {
      uri = json["uri"];
    }
  }

  /** Create JSON Object for DatabaseSpec */
  core.Map toJson() {
    var output = new core.Map();

    if (name != null) {
      output["name"] = name;
    }
    if (uri != null) {
      output["uri"] = uri;
    }

    return output;
  }

  /** Return String representation of DatabaseSpec */
  core.String toString() => JSON.encode(this.toJson());

}

/** This message is provided by the database to notify devices of an upcoming change to the database URI. */
class DbUpdateSpec {

  /** A required list of one or more databases. A device should update its preconfigured list of databases to replace (only) the database that provided the response with the specified entries. */
  core.List<DatabaseSpec> databases;

  /** Create new DbUpdateSpec from JSON data */
  DbUpdateSpec.fromJson(core.Map json) {
    if (json.containsKey("databases")) {
      databases = json["databases"].map((databasesItem) => new DatabaseSpec.fromJson(databasesItem)).toList();
    }
  }

  /** Create JSON Object for DbUpdateSpec */
  core.Map toJson() {
    var output = new core.Map();

    if (databases != null) {
      output["databases"] = databases.map((databasesItem) => databasesItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of DbUpdateSpec */
  core.String toString() => JSON.encode(this.toJson());

}

/** Device capabilities provide additional information that may be used by a device to provide additional information to the database that may help it to determine available spectrum. If the database does not support device capabilities it will ignore the parameter altogether. */
class DeviceCapabilities {

  /** An optional list of frequency ranges supported by the device. Each element must contain start and stop frequencies in which the device can operate. Channel identifiers are optional. When specified, the database should not return available spectrum that falls outside these ranges or channel IDs. */
  core.List<FrequencyRange> frequencyRanges;

  /** Create new DeviceCapabilities from JSON data */
  DeviceCapabilities.fromJson(core.Map json) {
    if (json.containsKey("frequencyRanges")) {
      frequencyRanges = json["frequencyRanges"].map((frequencyRangesItem) => new FrequencyRange.fromJson(frequencyRangesItem)).toList();
    }
  }

  /** Create JSON Object for DeviceCapabilities */
  core.Map toJson() {
    var output = new core.Map();

    if (frequencyRanges != null) {
      output["frequencyRanges"] = frequencyRanges.map((frequencyRangesItem) => frequencyRangesItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of DeviceCapabilities */
  core.String toString() => JSON.encode(this.toJson());

}

/** The device descriptor contains parameters that identify the specific device, such as its manufacturer serial number, regulatory-specific identifier (e.g., FCC ID), and any other device characteristics required by regulatory domains. */
class DeviceDescriptor {

  /** Specifies the ETSI white space device category. Valid values are the strings master and slave. This field is case-insensitive. Consult the ETSI documentation for details about the device types. */
  core.String etsiEnDeviceCategory;

  /** Specifies the ETSI white space device emissions class. The values are represented by numeric strings, such as 1, 2, etc. Consult the ETSI documentation for details about the device types. */
  core.String etsiEnDeviceEmissionsClass;

  /** Specifies the ETSI white space device type. Valid values are single-letter strings, such as A, B, etc. Consult the ETSI documentation for details about the device types. */
  core.String etsiEnDeviceType;

  /** Specifies the ETSI white space device technology identifier. The string value must not exceed 64 characters in length. Consult the ETSI documentation for details about the device types. */
  core.String etsiEnTechnologyId;

  /** Specifies the device's FCC certification identifier. The value is an identifier string whose length should not exceed 32 characters. Note that, in practice, a valid FCC ID may be limited to 19 characters. */
  core.String fccId;

  /** Specifies the TV Band White Space device type, as defined by the FCC. Valid values are FIXED, MODE_1, MODE_2. */
  core.String fccTvbdDeviceType;

  /** The manufacturer's ID may be required by the regulatory domain. This should represent the name of the device manufacturer, should be consistent across all devices from the same manufacturer, and should be distinct from that of other manufacturers. The string value must not exceed 64 characters in length. */
  core.String manufacturerId;

  /** The device's model ID may be required by the regulatory domain. The string value must not exceed 64 characters in length. */
  core.String modelId;

  /** The list of identifiers for rulesets supported by the device. A database may require that the device provide this list before servicing the device requests. If the database does not support any of the rulesets specified in the list, the database may refuse to service the device requests. If present, the list must contain at least one entry.

For information about the valid requests, see section 9.2 of the PAWS specification. Currently, FccTvBandWhiteSpace-2010 is the only supported ruleset. */
  core.List<core.String> rulesetIds;

  /** The manufacturer's device serial number; required by the applicable regulatory domain. The length of the value must not exceed 64 characters. */
  core.String serialNumber;

  /** Create new DeviceDescriptor from JSON data */
  DeviceDescriptor.fromJson(core.Map json) {
    if (json.containsKey("etsiEnDeviceCategory")) {
      etsiEnDeviceCategory = json["etsiEnDeviceCategory"];
    }
    if (json.containsKey("etsiEnDeviceEmissionsClass")) {
      etsiEnDeviceEmissionsClass = json["etsiEnDeviceEmissionsClass"];
    }
    if (json.containsKey("etsiEnDeviceType")) {
      etsiEnDeviceType = json["etsiEnDeviceType"];
    }
    if (json.containsKey("etsiEnTechnologyId")) {
      etsiEnTechnologyId = json["etsiEnTechnologyId"];
    }
    if (json.containsKey("fccId")) {
      fccId = json["fccId"];
    }
    if (json.containsKey("fccTvbdDeviceType")) {
      fccTvbdDeviceType = json["fccTvbdDeviceType"];
    }
    if (json.containsKey("manufacturerId")) {
      manufacturerId = json["manufacturerId"];
    }
    if (json.containsKey("modelId")) {
      modelId = json["modelId"];
    }
    if (json.containsKey("rulesetIds")) {
      rulesetIds = json["rulesetIds"].toList();
    }
    if (json.containsKey("serialNumber")) {
      serialNumber = json["serialNumber"];
    }
  }

  /** Create JSON Object for DeviceDescriptor */
  core.Map toJson() {
    var output = new core.Map();

    if (etsiEnDeviceCategory != null) {
      output["etsiEnDeviceCategory"] = etsiEnDeviceCategory;
    }
    if (etsiEnDeviceEmissionsClass != null) {
      output["etsiEnDeviceEmissionsClass"] = etsiEnDeviceEmissionsClass;
    }
    if (etsiEnDeviceType != null) {
      output["etsiEnDeviceType"] = etsiEnDeviceType;
    }
    if (etsiEnTechnologyId != null) {
      output["etsiEnTechnologyId"] = etsiEnTechnologyId;
    }
    if (fccId != null) {
      output["fccId"] = fccId;
    }
    if (fccTvbdDeviceType != null) {
      output["fccTvbdDeviceType"] = fccTvbdDeviceType;
    }
    if (manufacturerId != null) {
      output["manufacturerId"] = manufacturerId;
    }
    if (modelId != null) {
      output["modelId"] = modelId;
    }
    if (rulesetIds != null) {
      output["rulesetIds"] = rulesetIds.toList();
    }
    if (serialNumber != null) {
      output["serialNumber"] = serialNumber;
    }

    return output;
  }

  /** Return String representation of DeviceDescriptor */
  core.String toString() => JSON.encode(this.toJson());

}

/** This parameter contains device-owner information required as part of device registration. The regulatory domains may require additional parameters.

All contact information must be expressed using the structure defined by the vCard format specification. Only the contact fields of vCard are supported:  
- fn: Full name of an individual 
- org: Name of the organization 
- adr: Address fields 
- tel: Telephone numbers 
- email: Email addresses  

Note that the vCard specification defines maximum lengths for each field. */
class DeviceOwner {

  /** The vCard contact information for the device operator is optional, but may be required by specific regulatory domains. */
  Vcard operator;

  /** The vCard contact information for the individual or business that owns the device is required. */
  Vcard owner;

  /** Create new DeviceOwner from JSON data */
  DeviceOwner.fromJson(core.Map json) {
    if (json.containsKey("operator")) {
      operator = new Vcard.fromJson(json["operator"]);
    }
    if (json.containsKey("owner")) {
      owner = new Vcard.fromJson(json["owner"]);
    }
  }

  /** Create JSON Object for DeviceOwner */
  core.Map toJson() {
    var output = new core.Map();

    if (operator != null) {
      output["operator"] = operator.toJson();
    }
    if (owner != null) {
      output["owner"] = owner.toJson();
    }

    return output;
  }

  /** Return String representation of DeviceOwner */
  core.String toString() => JSON.encode(this.toJson());

}

/** The device validity element describes whether a particular device is valid to operate in the regulatory domain. */
class DeviceValidity {

  /** The descriptor of the device for which the validity check was requested. It will always be present. */
  DeviceDescriptor deviceDesc;

  /** The validity status: true if the device is valid for operation, false otherwise. It will always be present. */
  core.bool isValid;

  /** If the device identifier is not valid, the database may include a reason. The reason may be in any language. The length of the value should not exceed 128 characters. */
  core.String reason;

  /** Create new DeviceValidity from JSON data */
  DeviceValidity.fromJson(core.Map json) {
    if (json.containsKey("deviceDesc")) {
      deviceDesc = new DeviceDescriptor.fromJson(json["deviceDesc"]);
    }
    if (json.containsKey("isValid")) {
      isValid = json["isValid"];
    }
    if (json.containsKey("reason")) {
      reason = json["reason"];
    }
  }

  /** Create JSON Object for DeviceValidity */
  core.Map toJson() {
    var output = new core.Map();

    if (deviceDesc != null) {
      output["deviceDesc"] = deviceDesc.toJson();
    }
    if (isValid != null) {
      output["isValid"] = isValid;
    }
    if (reason != null) {
      output["reason"] = reason;
    }

    return output;
  }

  /** Return String representation of DeviceValidity */
  core.String toString() => JSON.encode(this.toJson());

}

/** The start and stop times of an event. This is used to indicate the time period for which a spectrum profile is valid.

Both times are expressed using the format, YYYY-MM-DDThh:mm:ssZ, as defined in RFC3339. The times must be expressed using UTC. */
class EventTime {

  /** The inclusive start of the event. It will be present. */
  core.String startTime;

  /** The exclusive end of the event. It will be present. */
  core.String stopTime;

  /** Create new EventTime from JSON data */
  EventTime.fromJson(core.Map json) {
    if (json.containsKey("startTime")) {
      startTime = json["startTime"];
    }
    if (json.containsKey("stopTime")) {
      stopTime = json["stopTime"];
    }
  }

  /** Create JSON Object for EventTime */
  core.Map toJson() {
    var output = new core.Map();

    if (startTime != null) {
      output["startTime"] = startTime;
    }
    if (stopTime != null) {
      output["stopTime"] = stopTime;
    }

    return output;
  }

  /** Return String representation of EventTime */
  core.String toString() => JSON.encode(this.toJson());

}

/** A specific range of frequencies together with the associated maximum power level and channel identifier. */
class FrequencyRange {

  /** The database may include a channel identifier, when applicable. When it is included, the device should treat it as informative. The length of the identifier should not exceed 16 characters. */
  core.String channelId;

  /** The maximum total power level (EIRP)—computed over the corresponding operating bandwidth—that is permitted within the frequency range. Depending on the context in which the frequency-range element appears, this value may be required. For example, it is required in the available-spectrum response, available-spectrum-batch response, and spectrum-use notification message, but it should not be present (it is not applicable) when the frequency range appears inside a device-capabilities message. */
  core.num maxPowerDBm;

  /** The required inclusive start of the frequency range (in Hertz). */
  core.num startHz;

  /** The required exclusive end of the frequency range (in Hertz). */
  core.num stopHz;

  /** Create new FrequencyRange from JSON data */
  FrequencyRange.fromJson(core.Map json) {
    if (json.containsKey("channelId")) {
      channelId = json["channelId"];
    }
    if (json.containsKey("maxPowerDBm")) {
      maxPowerDBm = json["maxPowerDBm"];
    }
    if (json.containsKey("startHz")) {
      startHz = json["startHz"];
    }
    if (json.containsKey("stopHz")) {
      stopHz = json["stopHz"];
    }
  }

  /** Create JSON Object for FrequencyRange */
  core.Map toJson() {
    var output = new core.Map();

    if (channelId != null) {
      output["channelId"] = channelId;
    }
    if (maxPowerDBm != null) {
      output["maxPowerDBm"] = maxPowerDBm;
    }
    if (startHz != null) {
      output["startHz"] = startHz;
    }
    if (stopHz != null) {
      output["stopHz"] = stopHz;
    }

    return output;
  }

  /** Return String representation of FrequencyRange */
  core.String toString() => JSON.encode(this.toJson());

}

/** This parameter is used to specify the geolocation of the device. */
class GeoLocation {

  /** The location confidence level, as an integer percentage, may be required, depending on the regulatory domain. When the parameter is optional and not provided, its value is assumed to be 95. Valid values range from 0 to 99, since, in practice, 100-percent confidence is not achievable. The confidence value is meaningful only when geolocation refers to a point with uncertainty. */
  core.int confidence;

  /** If present, indicates that the geolocation represents a point. Paradoxically, a point is parameterized using an ellipse, where the center represents the location of the point and the distances along the major and minor axes represent the uncertainty. The uncertainty values may be required, depending on the regulatory domain. */
  GeoLocationEllipse point;

  /** If present, indicates that the geolocation represents a region. Database support for regions is optional. */
  GeoLocationPolygon region;

  /** Create new GeoLocation from JSON data */
  GeoLocation.fromJson(core.Map json) {
    if (json.containsKey("confidence")) {
      confidence = json["confidence"];
    }
    if (json.containsKey("point")) {
      point = new GeoLocationEllipse.fromJson(json["point"]);
    }
    if (json.containsKey("region")) {
      region = new GeoLocationPolygon.fromJson(json["region"]);
    }
  }

  /** Create JSON Object for GeoLocation */
  core.Map toJson() {
    var output = new core.Map();

    if (confidence != null) {
      output["confidence"] = confidence;
    }
    if (point != null) {
      output["point"] = point.toJson();
    }
    if (region != null) {
      output["region"] = region.toJson();
    }

    return output;
  }

  /** Return String representation of GeoLocation */
  core.String toString() => JSON.encode(this.toJson());

}

/** A "point" with uncertainty is represented using the Ellipse shape. */
class GeoLocationEllipse {

  /** A required geo-spatial point representing the center of the ellipse. */
  GeoLocationPoint center;

  /** A floating-point number that expresses the orientation of the ellipse, representing the rotation, in degrees, of the semi-major axis from North towards the East. For example, when the uncertainty is greatest along the North-South direction, orientation is 0 degrees; conversely, if the uncertainty is greatest along the East-West direction, orientation is 90 degrees. When orientation is not present, the orientation is assumed to be 0. */
  core.num orientation;

  /** A floating-point number that expresses the location uncertainty along the major axis of the ellipse. May be required by the regulatory domain. When the uncertainty is optional, the default value is 0. */
  core.num semiMajorAxis;

  /** A floating-point number that expresses the location uncertainty along the minor axis of the ellipse. May be required by the regulatory domain. When the uncertainty is optional, the default value is 0. */
  core.num semiMinorAxis;

  /** Create new GeoLocationEllipse from JSON data */
  GeoLocationEllipse.fromJson(core.Map json) {
    if (json.containsKey("center")) {
      center = new GeoLocationPoint.fromJson(json["center"]);
    }
    if (json.containsKey("orientation")) {
      orientation = json["orientation"];
    }
    if (json.containsKey("semiMajorAxis")) {
      semiMajorAxis = json["semiMajorAxis"];
    }
    if (json.containsKey("semiMinorAxis")) {
      semiMinorAxis = json["semiMinorAxis"];
    }
  }

  /** Create JSON Object for GeoLocationEllipse */
  core.Map toJson() {
    var output = new core.Map();

    if (center != null) {
      output["center"] = center.toJson();
    }
    if (orientation != null) {
      output["orientation"] = orientation;
    }
    if (semiMajorAxis != null) {
      output["semiMajorAxis"] = semiMajorAxis;
    }
    if (semiMinorAxis != null) {
      output["semiMinorAxis"] = semiMinorAxis;
    }

    return output;
  }

  /** Return String representation of GeoLocationEllipse */
  core.String toString() => JSON.encode(this.toJson());

}

/** A single geolocation on the globe. */
class GeoLocationPoint {

  /** A required floating-point number that expresses the latitude in degrees using the WGS84 datum. For details on this encoding, see the National Imagery and Mapping Agency's Technical Report TR8350.2. */
  core.num latitude;

  /** A required floating-point number that expresses the longitude in degrees using the WGS84 datum. For details on this encoding, see the National Imagery and Mapping Agency's Technical Report TR8350.2. */
  core.num longitude;

  /** Create new GeoLocationPoint from JSON data */
  GeoLocationPoint.fromJson(core.Map json) {
    if (json.containsKey("latitude")) {
      latitude = json["latitude"];
    }
    if (json.containsKey("longitude")) {
      longitude = json["longitude"];
    }
  }

  /** Create JSON Object for GeoLocationPoint */
  core.Map toJson() {
    var output = new core.Map();

    if (latitude != null) {
      output["latitude"] = latitude;
    }
    if (longitude != null) {
      output["longitude"] = longitude;
    }

    return output;
  }

  /** Return String representation of GeoLocationPoint */
  core.String toString() => JSON.encode(this.toJson());

}

/** A region is represented using the polygonal shape. */
class GeoLocationPolygon {

  /** When the geolocation describes a region, the exterior field refers to a list of latitude/longitude points that represent the vertices of a polygon. The first and last points must be the same. Thus, a minimum of four points is required. The following polygon restrictions from RFC5491 apply:  
- A connecting line shall not cross another connecting line of the same polygon. 
- The vertices must be defined in a counterclockwise order. 
- The edges of a polygon are defined by the shortest path between two points in space (not a geodesic curve). Consequently, the length between two adjacent vertices should be restricted to a maximum of 130 km. 
- All vertices are assumed to be at the same altitude. 
- Polygon shapes should be restricted to a maximum of 15 vertices (16 points that include the repeated vertex). */
  core.List<GeoLocationPoint> exterior;

  /** Create new GeoLocationPolygon from JSON data */
  GeoLocationPolygon.fromJson(core.Map json) {
    if (json.containsKey("exterior")) {
      exterior = json["exterior"].map((exteriorItem) => new GeoLocationPoint.fromJson(exteriorItem)).toList();
    }
  }

  /** Create JSON Object for GeoLocationPolygon */
  core.Map toJson() {
    var output = new core.Map();

    if (exterior != null) {
      output["exterior"] = exterior.map((exteriorItem) => exteriorItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of GeoLocationPolygon */
  core.String toString() => JSON.encode(this.toJson());

}

/** The schedule of spectrum profiles available at a particular geolocation. */
class GeoSpectrumSchedule {

  /** The geolocation identifies the location at which the spectrum schedule applies. It will always be present. */
  GeoLocation location;

  /** A list of available spectrum profiles and associated times. It will always be present, and at least one schedule must be included (though it may be empty if there is no available spectrum). More than one schedule may be included to represent future changes to the available spectrum. */
  core.List<SpectrumSchedule> spectrumSchedules;

  /** Create new GeoSpectrumSchedule from JSON data */
  GeoSpectrumSchedule.fromJson(core.Map json) {
    if (json.containsKey("location")) {
      location = new GeoLocation.fromJson(json["location"]);
    }
    if (json.containsKey("spectrumSchedules")) {
      spectrumSchedules = json["spectrumSchedules"].map((spectrumSchedulesItem) => new SpectrumSchedule.fromJson(spectrumSchedulesItem)).toList();
    }
  }

  /** Create JSON Object for GeoSpectrumSchedule */
  core.Map toJson() {
    var output = new core.Map();

    if (location != null) {
      output["location"] = location.toJson();
    }
    if (spectrumSchedules != null) {
      output["spectrumSchedules"] = spectrumSchedules.map((spectrumSchedulesItem) => spectrumSchedulesItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of GeoSpectrumSchedule */
  core.String toString() => JSON.encode(this.toJson());

}

/** The request message for a batch available spectrum query protocol. */
class PawsGetSpectrumBatchRequest {

  /** Depending on device type and regulatory domain, antenna characteristics may be required. */
  AntennaCharacteristics antenna;

  /** The master device may include its device capabilities to limit the available-spectrum batch response to the spectrum that is compatible with its capabilities. The database should not return spectrum that is incompatible with the specified capabilities. */
  DeviceCapabilities capabilities;

  /** When the available spectrum request is made on behalf of a specific device (a master or slave device), device descriptor information for the device on whose behalf the request is made is required (in such cases, the requestType parameter must be empty). When a requestType value is specified, device descriptor information may be optional or required according to the rules of the applicable regulatory domain. */
  DeviceDescriptor deviceDesc;

  /** A geolocation list is required. This allows a device to specify its current location plus additional anticipated locations when allowed by the regulatory domain. At least one location must be included. Geolocation must be given as the location of the radiation center of the device's antenna. If a location specifies a region, rather than a point, the database may return an UNIMPLEMENTED error if it does not support query by region.

There is no upper limit on the number of locations included in a available spectrum batch request, but the database may restrict the number of locations it supports by returning a response with fewer locations than specified in the batch request. Note that geolocations must be those of the master device (a device with geolocation capability that makes an available spectrum batch request), whether the master device is making the request on its own behalf or on behalf of a slave device (one without geolocation capability). */
  core.List<GeoLocation> locations;

  /** When an available spectrum batch request is made by the master device (a device with geolocation capability) on behalf of a slave device (a device without geolocation capability), the rules of the applicable regulatory domain may require the master device to provide its own device descriptor information (in addition to device descriptor information for the slave device in a separate parameter). */
  DeviceDescriptor masterDeviceDesc;

  /** Depending on device type and regulatory domain, device owner information may be included in an available spectrum batch request. This allows the device to register and get spectrum-availability information in a single request. */
  DeviceOwner owner;

  /** The request type parameter is an optional parameter that can be used to modify an available spectrum batch request, but its use depends on applicable regulatory rules. For example, It may be used to request generic slave device parameters without having to specify the device descriptor for a specific device. When the requestType parameter is missing, the request is for a specific device (master or slave), and the device descriptor parameter for the device on whose behalf the batch request is made is required. */
  core.String requestType;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsGetSpectrumBatchRequest from JSON data */
  PawsGetSpectrumBatchRequest.fromJson(core.Map json) {
    if (json.containsKey("antenna")) {
      antenna = new AntennaCharacteristics.fromJson(json["antenna"]);
    }
    if (json.containsKey("capabilities")) {
      capabilities = new DeviceCapabilities.fromJson(json["capabilities"]);
    }
    if (json.containsKey("deviceDesc")) {
      deviceDesc = new DeviceDescriptor.fromJson(json["deviceDesc"]);
    }
    if (json.containsKey("locations")) {
      locations = json["locations"].map((locationsItem) => new GeoLocation.fromJson(locationsItem)).toList();
    }
    if (json.containsKey("masterDeviceDesc")) {
      masterDeviceDesc = new DeviceDescriptor.fromJson(json["masterDeviceDesc"]);
    }
    if (json.containsKey("owner")) {
      owner = new DeviceOwner.fromJson(json["owner"]);
    }
    if (json.containsKey("requestType")) {
      requestType = json["requestType"];
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsGetSpectrumBatchRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (antenna != null) {
      output["antenna"] = antenna.toJson();
    }
    if (capabilities != null) {
      output["capabilities"] = capabilities.toJson();
    }
    if (deviceDesc != null) {
      output["deviceDesc"] = deviceDesc.toJson();
    }
    if (locations != null) {
      output["locations"] = locations.map((locationsItem) => locationsItem.toJson()).toList();
    }
    if (masterDeviceDesc != null) {
      output["masterDeviceDesc"] = masterDeviceDesc.toJson();
    }
    if (owner != null) {
      output["owner"] = owner.toJson();
    }
    if (requestType != null) {
      output["requestType"] = requestType;
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsGetSpectrumBatchRequest */
  core.String toString() => JSON.encode(this.toJson());

}

/** The response message for the batch available spectrum query contains a schedule of available spectrum for the device at multiple locations. */
class PawsGetSpectrumBatchResponse {

  /** A database may include the databaseChange parameter to notify a device of a change to its database URI, providing one or more alternate database URIs. The device should use this information to update its list of pre-configured databases by (only) replacing its entry for the responding database with the list of alternate URIs. */
  DbUpdateSpec databaseChange;

  /** The database must return in its available spectrum response the device descriptor information it received in the master device's available spectrum batch request. */
  DeviceDescriptor deviceDesc;

  /** The available spectrum batch response must contain a geo-spectrum schedule list, The list may be empty if spectrum is not available. The database may return more than one geo-spectrum schedule to represent future changes to the available spectrum. How far in advance a schedule may be provided depends upon the applicable regulatory domain. The database may return available spectrum for fewer geolocations than requested. The device must not make assumptions about the order of the entries in the list, and must use the geolocation value in each geo-spectrum schedule entry to match available spectrum to a location. */
  core.List<GeoSpectrumSchedule> geoSpectrumSchedules;

  /** Identifies what kind of resource this is. Value: the fixed string "spectrum#pawsGetSpectrumBatchResponse". */
  core.String kind;

  /** The database may return a constraint on the allowed maximum contiguous bandwidth (in Hertz). A regulatory domain may require the database to return this parameter. When this parameter is present in the response, the device must apply this constraint to its spectrum-selection logic to ensure that no single block of spectrum has bandwidth that exceeds this value. */
  core.num maxContiguousBwHz;

  /** The database may return a constraint on the allowed maximum total bandwidth (in Hertz), which does not need to be contiguous. A regulatory domain may require the database to return this parameter. When this parameter is present in the available spectrum batch response, the device must apply this constraint to its spectrum-selection logic to ensure that total bandwidth does not exceed this value. */
  core.num maxTotalBwHz;

  /** For regulatory domains that require a spectrum-usage report from devices, the database must return true for this parameter if the geo-spectrum schedules list is not empty; otherwise, the database should either return false or omit this parameter. If this parameter is present and its value is true, the device must send a spectrum use notify message to the database; otherwise, the device should not send the notification. */
  core.bool needsSpectrumReport;

  /** The database should return ruleset information, which identifies the applicable regulatory authority and ruleset for the available spectrum batch response. If included, the device must use the corresponding ruleset to interpret the response. Values provided in the returned ruleset information, such as maxLocationChange, take precedence over any conflicting values provided in the ruleset information returned in a prior initialization response sent by the database to the device. */
  RulesetInfo rulesetInfo;

  /** The database includes a timestamp of the form, YYYY-MM-DDThh:mm:ssZ (Internet timestamp format per RFC3339), in its available spectrum batch response. The timestamp should be used by the device as a reference for the start and stop times specified in the response spectrum schedules. */
  core.String timestamp;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsGetSpectrumBatchResponse from JSON data */
  PawsGetSpectrumBatchResponse.fromJson(core.Map json) {
    if (json.containsKey("databaseChange")) {
      databaseChange = new DbUpdateSpec.fromJson(json["databaseChange"]);
    }
    if (json.containsKey("deviceDesc")) {
      deviceDesc = new DeviceDescriptor.fromJson(json["deviceDesc"]);
    }
    if (json.containsKey("geoSpectrumSchedules")) {
      geoSpectrumSchedules = json["geoSpectrumSchedules"].map((geoSpectrumSchedulesItem) => new GeoSpectrumSchedule.fromJson(geoSpectrumSchedulesItem)).toList();
    }
    if (json.containsKey("kind")) {
      kind = json["kind"];
    }
    if (json.containsKey("maxContiguousBwHz")) {
      maxContiguousBwHz = json["maxContiguousBwHz"];
    }
    if (json.containsKey("maxTotalBwHz")) {
      maxTotalBwHz = json["maxTotalBwHz"];
    }
    if (json.containsKey("needsSpectrumReport")) {
      needsSpectrumReport = json["needsSpectrumReport"];
    }
    if (json.containsKey("rulesetInfo")) {
      rulesetInfo = new RulesetInfo.fromJson(json["rulesetInfo"]);
    }
    if (json.containsKey("timestamp")) {
      timestamp = json["timestamp"];
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsGetSpectrumBatchResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (databaseChange != null) {
      output["databaseChange"] = databaseChange.toJson();
    }
    if (deviceDesc != null) {
      output["deviceDesc"] = deviceDesc.toJson();
    }
    if (geoSpectrumSchedules != null) {
      output["geoSpectrumSchedules"] = geoSpectrumSchedules.map((geoSpectrumSchedulesItem) => geoSpectrumSchedulesItem.toJson()).toList();
    }
    if (kind != null) {
      output["kind"] = kind;
    }
    if (maxContiguousBwHz != null) {
      output["maxContiguousBwHz"] = maxContiguousBwHz;
    }
    if (maxTotalBwHz != null) {
      output["maxTotalBwHz"] = maxTotalBwHz;
    }
    if (needsSpectrumReport != null) {
      output["needsSpectrumReport"] = needsSpectrumReport;
    }
    if (rulesetInfo != null) {
      output["rulesetInfo"] = rulesetInfo.toJson();
    }
    if (timestamp != null) {
      output["timestamp"] = timestamp;
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsGetSpectrumBatchResponse */
  core.String toString() => JSON.encode(this.toJson());

}

/** The request message for the available spectrum query protocol which must include the device's geolocation. */
class PawsGetSpectrumRequest {

  /** Depending on device type and regulatory domain, the characteristics of the antenna may be required. */
  AntennaCharacteristics antenna;

  /** The master device may include its device capabilities to limit the available-spectrum response to the spectrum that is compatible with its capabilities. The database should not return spectrum that is incompatible with the specified capabilities. */
  DeviceCapabilities capabilities;

  /** When the available spectrum request is made on behalf of a specific device (a master or slave device), device descriptor information for that device is required (in such cases, the requestType parameter must be empty). When a requestType value is specified, device descriptor information may be optional or required according to the rules of the applicable regulatory domain. */
  DeviceDescriptor deviceDesc;

  /** The geolocation of the master device (a device with geolocation capability that makes an available spectrum request) is required whether the master device is making the request on its own behalf or on behalf of a slave device (one without geolocation capability). The location must be the location of the radiation center of the master device's antenna. To support mobile devices, a regulatory domain may allow the anticipated position of the master device to be given instead. If the location specifies a region, rather than a point, the database may return an UNIMPLEMENTED error code if it does not support query by region. */
  GeoLocation location;

  /** When an available spectrum request is made by the master device (a device with geolocation capability) on behalf of a slave device (a device without geolocation capability), the rules of the applicable regulatory domain may require the master device to provide its own device descriptor information (in addition to device descriptor information for the slave device, which is provided in a separate parameter). */
  DeviceDescriptor masterDeviceDesc;

  /** Depending on device type and regulatory domain, device owner information may be included in an available spectrum request. This allows the device to register and get spectrum-availability information in a single request. */
  DeviceOwner owner;

  /** The request type parameter is an optional parameter that can be used to modify an available spectrum request, but its use depends on applicable regulatory rules. It may be used, for example, to request generic slave device parameters without having to specify the device descriptor for a specific device. When the requestType parameter is missing, the request is for a specific device (master or slave), and the deviceDesc parameter for the device on whose behalf the request is made is required. */
  core.String requestType;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsGetSpectrumRequest from JSON data */
  PawsGetSpectrumRequest.fromJson(core.Map json) {
    if (json.containsKey("antenna")) {
      antenna = new AntennaCharacteristics.fromJson(json["antenna"]);
    }
    if (json.containsKey("capabilities")) {
      capabilities = new DeviceCapabilities.fromJson(json["capabilities"]);
    }
    if (json.containsKey("deviceDesc")) {
      deviceDesc = new DeviceDescriptor.fromJson(json["deviceDesc"]);
    }
    if (json.containsKey("location")) {
      location = new GeoLocation.fromJson(json["location"]);
    }
    if (json.containsKey("masterDeviceDesc")) {
      masterDeviceDesc = new DeviceDescriptor.fromJson(json["masterDeviceDesc"]);
    }
    if (json.containsKey("owner")) {
      owner = new DeviceOwner.fromJson(json["owner"]);
    }
    if (json.containsKey("requestType")) {
      requestType = json["requestType"];
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsGetSpectrumRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (antenna != null) {
      output["antenna"] = antenna.toJson();
    }
    if (capabilities != null) {
      output["capabilities"] = capabilities.toJson();
    }
    if (deviceDesc != null) {
      output["deviceDesc"] = deviceDesc.toJson();
    }
    if (location != null) {
      output["location"] = location.toJson();
    }
    if (masterDeviceDesc != null) {
      output["masterDeviceDesc"] = masterDeviceDesc.toJson();
    }
    if (owner != null) {
      output["owner"] = owner.toJson();
    }
    if (requestType != null) {
      output["requestType"] = requestType;
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsGetSpectrumRequest */
  core.String toString() => JSON.encode(this.toJson());

}

/** The response message for the available spectrum query which contains a schedule of available spectrum for the device. */
class PawsGetSpectrumResponse {

  /** A database may include the databaseChange parameter to notify a device of a change to its database URI, providing one or more alternate database URIs. The device should use this information to update its list of pre-configured databases by (only) replacing its entry for the responding database with the list of alternate URIs. */
  DbUpdateSpec databaseChange;

  /** The database must return, in its available spectrum response, the device descriptor information it received in the master device's available spectrum request. */
  DeviceDescriptor deviceDesc;

  /** Identifies what kind of resource this is. Value: the fixed string "spectrum#pawsGetSpectrumResponse". */
  core.String kind;

  /** The database may return a constraint on the allowed maximum contiguous bandwidth (in Hertz). A regulatory domain may require the database to return this parameter. When this parameter is present in the response, the device must apply this constraint to its spectrum-selection logic to ensure that no single block of spectrum has bandwidth that exceeds this value. */
  core.num maxContiguousBwHz;

  /** The database may return a constraint on the allowed maximum total bandwidth (in Hertz), which need not be contiguous. A regulatory domain may require the database to return this parameter. When this parameter is present in the available spectrum response, the device must apply this constraint to its spectrum-selection logic to ensure that total bandwidth does not exceed this value. */
  core.num maxTotalBwHz;

  /** For regulatory domains that require a spectrum-usage report from devices, the database must return true for this parameter if the spectrum schedule list is not empty; otherwise, the database will either return false or omit this parameter. If this parameter is present and its value is true, the device must send a spectrum use notify message to the database; otherwise, the device must not send the notification. */
  core.bool needsSpectrumReport;

  /** The database should return ruleset information, which identifies the applicable regulatory authority and ruleset for the available spectrum response. If included, the device must use the corresponding ruleset to interpret the response. Values provided in the returned ruleset information, such as maxLocationChange, take precedence over any conflicting values provided in the ruleset information returned in a prior initialization response sent by the database to the device. */
  RulesetInfo rulesetInfo;

  /** The available spectrum response must contain a spectrum schedule list. The list may be empty if spectrum is not available. The database may return more than one spectrum schedule to represent future changes to the available spectrum. How far in advance a schedule may be provided depends on the applicable regulatory domain. */
  core.List<SpectrumSchedule> spectrumSchedules;

  /** The database includes a timestamp of the form YYYY-MM-DDThh:mm:ssZ (Internet timestamp format per RFC3339) in its available spectrum response. The timestamp should be used by the device as a reference for the start and stop times specified in the response spectrum schedules. */
  core.String timestamp;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsGetSpectrumResponse from JSON data */
  PawsGetSpectrumResponse.fromJson(core.Map json) {
    if (json.containsKey("databaseChange")) {
      databaseChange = new DbUpdateSpec.fromJson(json["databaseChange"]);
    }
    if (json.containsKey("deviceDesc")) {
      deviceDesc = new DeviceDescriptor.fromJson(json["deviceDesc"]);
    }
    if (json.containsKey("kind")) {
      kind = json["kind"];
    }
    if (json.containsKey("maxContiguousBwHz")) {
      maxContiguousBwHz = json["maxContiguousBwHz"];
    }
    if (json.containsKey("maxTotalBwHz")) {
      maxTotalBwHz = json["maxTotalBwHz"];
    }
    if (json.containsKey("needsSpectrumReport")) {
      needsSpectrumReport = json["needsSpectrumReport"];
    }
    if (json.containsKey("rulesetInfo")) {
      rulesetInfo = new RulesetInfo.fromJson(json["rulesetInfo"]);
    }
    if (json.containsKey("spectrumSchedules")) {
      spectrumSchedules = json["spectrumSchedules"].map((spectrumSchedulesItem) => new SpectrumSchedule.fromJson(spectrumSchedulesItem)).toList();
    }
    if (json.containsKey("timestamp")) {
      timestamp = json["timestamp"];
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsGetSpectrumResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (databaseChange != null) {
      output["databaseChange"] = databaseChange.toJson();
    }
    if (deviceDesc != null) {
      output["deviceDesc"] = deviceDesc.toJson();
    }
    if (kind != null) {
      output["kind"] = kind;
    }
    if (maxContiguousBwHz != null) {
      output["maxContiguousBwHz"] = maxContiguousBwHz;
    }
    if (maxTotalBwHz != null) {
      output["maxTotalBwHz"] = maxTotalBwHz;
    }
    if (needsSpectrumReport != null) {
      output["needsSpectrumReport"] = needsSpectrumReport;
    }
    if (rulesetInfo != null) {
      output["rulesetInfo"] = rulesetInfo.toJson();
    }
    if (spectrumSchedules != null) {
      output["spectrumSchedules"] = spectrumSchedules.map((spectrumSchedulesItem) => spectrumSchedulesItem.toJson()).toList();
    }
    if (timestamp != null) {
      output["timestamp"] = timestamp;
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsGetSpectrumResponse */
  core.String toString() => JSON.encode(this.toJson());

}

/** The initialization request message allows the master device to initiate exchange of capabilities with the database. */
class PawsInitRequest {

  /** The DeviceDescriptor parameter is required. If the database does not support the device or any of the rulesets specified in the device descriptor, it must return an UNSUPPORTED error code in the error response. */
  DeviceDescriptor deviceDesc;

  /** A device's geolocation is required. */
  GeoLocation location;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsInitRequest from JSON data */
  PawsInitRequest.fromJson(core.Map json) {
    if (json.containsKey("deviceDesc")) {
      deviceDesc = new DeviceDescriptor.fromJson(json["deviceDesc"]);
    }
    if (json.containsKey("location")) {
      location = new GeoLocation.fromJson(json["location"]);
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsInitRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (deviceDesc != null) {
      output["deviceDesc"] = deviceDesc.toJson();
    }
    if (location != null) {
      output["location"] = location.toJson();
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsInitRequest */
  core.String toString() => JSON.encode(this.toJson());

}

/** The initialization response message communicates database parameters to the requesting device. */
class PawsInitResponse {

  /** A database may include the databaseChange parameter to notify a device of a change to its database URI, providing one or more alternate database URIs. The device should use this information to update its list of pre-configured databases by (only) replacing its entry for the responding database with the list of alternate URIs. */
  DbUpdateSpec databaseChange;

  /** Identifies what kind of resource this is. Value: the fixed string "spectrum#pawsInitResponse". */
  core.String kind;

  /** The rulesetInfo parameter must be included in the response. This parameter specifies the regulatory domain and parameters applicable to that domain. The database must include the authority field, which defines the regulatory domain for the location specified in the INIT_REQ message. */
  RulesetInfo rulesetInfo;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsInitResponse from JSON data */
  PawsInitResponse.fromJson(core.Map json) {
    if (json.containsKey("databaseChange")) {
      databaseChange = new DbUpdateSpec.fromJson(json["databaseChange"]);
    }
    if (json.containsKey("kind")) {
      kind = json["kind"];
    }
    if (json.containsKey("rulesetInfo")) {
      rulesetInfo = new RulesetInfo.fromJson(json["rulesetInfo"]);
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsInitResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (databaseChange != null) {
      output["databaseChange"] = databaseChange.toJson();
    }
    if (kind != null) {
      output["kind"] = kind;
    }
    if (rulesetInfo != null) {
      output["rulesetInfo"] = rulesetInfo.toJson();
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsInitResponse */
  core.String toString() => JSON.encode(this.toJson());

}

/** The spectrum-use notification message which must contain the geolocation of the Device and parameters required by the regulatory domain. */
class PawsNotifySpectrumUseRequest {

  /** Device descriptor information is required in the spectrum-use notification message. */
  DeviceDescriptor deviceDesc;

  /** The geolocation of the master device (the device that is sending the spectrum-use notification) to the database is required in the spectrum-use notification message. */
  GeoLocation location;

  /** A spectrum list is required in the spectrum-use notification. The list specifies the spectrum that the device expects to use, which includes frequency ranges and maximum power levels. The list may be empty if the device decides not to use any of spectrum. For consistency, the psdBandwidthHz value should match that from one of the spectrum elements in the corresponding available spectrum response previously sent to the device by the database. Note that maximum power levels in the spectrum element must be expressed as power spectral density over the specified psdBandwidthHz value. The actual bandwidth to be used (as computed from the start and stop frequencies) may be different from the psdBandwidthHz value. As an example, when regulatory rules express maximum power spectral density in terms of maximum power over any 100 kHz band, then the psdBandwidthHz value should be set to 100 kHz, even though the actual bandwidth used can be 20 kHz. */
  core.List<SpectrumMessage> spectra;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsNotifySpectrumUseRequest from JSON data */
  PawsNotifySpectrumUseRequest.fromJson(core.Map json) {
    if (json.containsKey("deviceDesc")) {
      deviceDesc = new DeviceDescriptor.fromJson(json["deviceDesc"]);
    }
    if (json.containsKey("location")) {
      location = new GeoLocation.fromJson(json["location"]);
    }
    if (json.containsKey("spectra")) {
      spectra = json["spectra"].map((spectraItem) => new SpectrumMessage.fromJson(spectraItem)).toList();
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsNotifySpectrumUseRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (deviceDesc != null) {
      output["deviceDesc"] = deviceDesc.toJson();
    }
    if (location != null) {
      output["location"] = location.toJson();
    }
    if (spectra != null) {
      output["spectra"] = spectra.map((spectraItem) => spectraItem.toJson()).toList();
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsNotifySpectrumUseRequest */
  core.String toString() => JSON.encode(this.toJson());

}

/** An empty response to the notification. */
class PawsNotifySpectrumUseResponse {

  /** Identifies what kind of resource this is. Value: the fixed string "spectrum#pawsNotifySpectrumUseResponse". */
  core.String kind;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsNotifySpectrumUseResponse from JSON data */
  PawsNotifySpectrumUseResponse.fromJson(core.Map json) {
    if (json.containsKey("kind")) {
      kind = json["kind"];
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsNotifySpectrumUseResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (kind != null) {
      output["kind"] = kind;
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsNotifySpectrumUseResponse */
  core.String toString() => JSON.encode(this.toJson());

}

/** The registration request message contains the required registration parameters. */
class PawsRegisterRequest {

  /** Antenna characteristics, including its height and height type. */
  AntennaCharacteristics antenna;

  /** A DeviceDescriptor is required. */
  DeviceDescriptor deviceDesc;

  /** Device owner information is required. */
  DeviceOwner deviceOwner;

  /** A device's geolocation is required. */
  GeoLocation location;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsRegisterRequest from JSON data */
  PawsRegisterRequest.fromJson(core.Map json) {
    if (json.containsKey("antenna")) {
      antenna = new AntennaCharacteristics.fromJson(json["antenna"]);
    }
    if (json.containsKey("deviceDesc")) {
      deviceDesc = new DeviceDescriptor.fromJson(json["deviceDesc"]);
    }
    if (json.containsKey("deviceOwner")) {
      deviceOwner = new DeviceOwner.fromJson(json["deviceOwner"]);
    }
    if (json.containsKey("location")) {
      location = new GeoLocation.fromJson(json["location"]);
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsRegisterRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (antenna != null) {
      output["antenna"] = antenna.toJson();
    }
    if (deviceDesc != null) {
      output["deviceDesc"] = deviceDesc.toJson();
    }
    if (deviceOwner != null) {
      output["deviceOwner"] = deviceOwner.toJson();
    }
    if (location != null) {
      output["location"] = location.toJson();
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsRegisterRequest */
  core.String toString() => JSON.encode(this.toJson());

}

/** The registration response message simply acknowledges receipt of the request and is otherwise empty. */
class PawsRegisterResponse {

  /** A database may include the databaseChange parameter to notify a device of a change to its database URI, providing one or more alternate database URIs. The device should use this information to update its list of pre-configured databases by (only) replacing its entry for the responding database with the list of alternate URIs. */
  DbUpdateSpec databaseChange;

  /** Identifies what kind of resource this is. Value: the fixed string "spectrum#pawsRegisterResponse". */
  core.String kind;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsRegisterResponse from JSON data */
  PawsRegisterResponse.fromJson(core.Map json) {
    if (json.containsKey("databaseChange")) {
      databaseChange = new DbUpdateSpec.fromJson(json["databaseChange"]);
    }
    if (json.containsKey("kind")) {
      kind = json["kind"];
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsRegisterResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (databaseChange != null) {
      output["databaseChange"] = databaseChange.toJson();
    }
    if (kind != null) {
      output["kind"] = kind;
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsRegisterResponse */
  core.String toString() => JSON.encode(this.toJson());

}

/** The device validation request message. */
class PawsVerifyDeviceRequest {

  /** A list of device descriptors, which specifies the slave devices to be validated, is required. */
  core.List<DeviceDescriptor> deviceDescs;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsVerifyDeviceRequest from JSON data */
  PawsVerifyDeviceRequest.fromJson(core.Map json) {
    if (json.containsKey("deviceDescs")) {
      deviceDescs = json["deviceDescs"].map((deviceDescsItem) => new DeviceDescriptor.fromJson(deviceDescsItem)).toList();
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsVerifyDeviceRequest */
  core.Map toJson() {
    var output = new core.Map();

    if (deviceDescs != null) {
      output["deviceDescs"] = deviceDescs.map((deviceDescsItem) => deviceDescsItem.toJson()).toList();
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsVerifyDeviceRequest */
  core.String toString() => JSON.encode(this.toJson());

}

/** The device validation response message. */
class PawsVerifyDeviceResponse {

  /** A database may include the databaseChange parameter to notify a device of a change to its database URI, providing one or more alternate database URIs. The device should use this information to update its list of pre-configured databases by (only) replacing its entry for the responding database with the list of alternate URIs. */
  DbUpdateSpec databaseChange;

  /** A device validities list is required in the device validation response to report whether each slave device listed in a previous device validation request is valid. The number of entries must match the number of device descriptors listed in the previous device validation request. */
  core.List<DeviceValidity> deviceValidities;

  /** Identifies what kind of resource this is. Value: the fixed string "spectrum#pawsVerifyDeviceResponse". */
  core.String kind;

  /** The message type (e.g., INIT_REQ, AVAIL_SPECTRUM_REQ, ...).

Required field. */
  core.String type;

  /** The PAWS version. Must be exactly 1.0.

Required field. */
  core.String version;

  /** Create new PawsVerifyDeviceResponse from JSON data */
  PawsVerifyDeviceResponse.fromJson(core.Map json) {
    if (json.containsKey("databaseChange")) {
      databaseChange = new DbUpdateSpec.fromJson(json["databaseChange"]);
    }
    if (json.containsKey("deviceValidities")) {
      deviceValidities = json["deviceValidities"].map((deviceValiditiesItem) => new DeviceValidity.fromJson(deviceValiditiesItem)).toList();
    }
    if (json.containsKey("kind")) {
      kind = json["kind"];
    }
    if (json.containsKey("type")) {
      type = json["type"];
    }
    if (json.containsKey("version")) {
      version = json["version"];
    }
  }

  /** Create JSON Object for PawsVerifyDeviceResponse */
  core.Map toJson() {
    var output = new core.Map();

    if (databaseChange != null) {
      output["databaseChange"] = databaseChange.toJson();
    }
    if (deviceValidities != null) {
      output["deviceValidities"] = deviceValidities.map((deviceValiditiesItem) => deviceValiditiesItem.toJson()).toList();
    }
    if (kind != null) {
      output["kind"] = kind;
    }
    if (type != null) {
      output["type"] = type;
    }
    if (version != null) {
      output["version"] = version;
    }

    return output;
  }

  /** Return String representation of PawsVerifyDeviceResponse */
  core.String toString() => JSON.encode(this.toJson());

}

/** This contains parameters for the ruleset of a regulatory domain that is communicated using the initialization and available-spectrum processes. */
class RulesetInfo {

  /** The regulatory domain to which the ruleset belongs is required. It must be a 2-letter country code. The device should use this to determine additional device behavior required by the associated regulatory domain. */
  core.String authority;

  /** The maximum location change in meters is required in the initialization response, but optional otherwise. When the device changes location by more than this specified distance, it must contact the database to get the available spectrum for the new location. If the device is using spectrum that is no longer available, it must immediately cease use of the spectrum under rules for database-managed spectrum. If this value is provided within the context of an available-spectrum response, it takes precedence over the value within the initialization response. */
  core.num maxLocationChange;

  /** The maximum duration, in seconds, between requests for available spectrum. It is required in the initialization response, but optional otherwise. The device must contact the database to get available spectrum no less frequently than this duration. If the new spectrum information indicates that the device is using spectrum that is no longer available, it must immediately cease use of those frequencies under rules for database-managed spectrum. If this value is provided within the context of an available-spectrum response, it takes precedence over the value within the initialization response. */
  core.int maxPollingSecs;

  /** The identifiers of the rulesets supported for the device's location. The database should include at least one applicable ruleset in the initialization response. The device may use the ruleset identifiers to determine parameters to include in subsequent requests. Within the context of the available-spectrum responses, the database should include the identifier of the ruleset that it used to determine the available-spectrum response. If included, the device must use the specified ruleset to interpret the response. If the device does not support the indicated ruleset, it must not operate in the spectrum governed by the ruleset. */
  core.List<core.String> rulesetIds;

  /** Create new RulesetInfo from JSON data */
  RulesetInfo.fromJson(core.Map json) {
    if (json.containsKey("authority")) {
      authority = json["authority"];
    }
    if (json.containsKey("maxLocationChange")) {
      maxLocationChange = json["maxLocationChange"];
    }
    if (json.containsKey("maxPollingSecs")) {
      maxPollingSecs = json["maxPollingSecs"];
    }
    if (json.containsKey("rulesetIds")) {
      rulesetIds = json["rulesetIds"].toList();
    }
  }

  /** Create JSON Object for RulesetInfo */
  core.Map toJson() {
    var output = new core.Map();

    if (authority != null) {
      output["authority"] = authority;
    }
    if (maxLocationChange != null) {
      output["maxLocationChange"] = maxLocationChange;
    }
    if (maxPollingSecs != null) {
      output["maxPollingSecs"] = maxPollingSecs;
    }
    if (rulesetIds != null) {
      output["rulesetIds"] = rulesetIds.toList();
    }

    return output;
  }

  /** Return String representation of RulesetInfo */
  core.String toString() => JSON.encode(this.toJson());

}

/** Available spectrum can be logically characterized by a list of frequency ranges and permissible power levels for each range. */
class SpectrumMessage {

  /** The bandwidth (in Hertz) for which permissible power levels are specified. For example, FCC regulation would require only one spectrum specification at 6MHz bandwidth, but Ofcom regulation would require two specifications, at 0.1MHz and 8MHz. This parameter may be empty if there is no available spectrum. It will be present otherwise. */
  core.num bandwidth;

  /** The list of frequency ranges and permissible power levels. The list may be empty if there is no available spectrum, otherwise it will be present. */
  core.List<FrequencyRange> frequencyRanges;

  /** Create new SpectrumMessage from JSON data */
  SpectrumMessage.fromJson(core.Map json) {
    if (json.containsKey("bandwidth")) {
      bandwidth = json["bandwidth"];
    }
    if (json.containsKey("frequencyRanges")) {
      frequencyRanges = json["frequencyRanges"].map((frequencyRangesItem) => new FrequencyRange.fromJson(frequencyRangesItem)).toList();
    }
  }

  /** Create JSON Object for SpectrumMessage */
  core.Map toJson() {
    var output = new core.Map();

    if (bandwidth != null) {
      output["bandwidth"] = bandwidth;
    }
    if (frequencyRanges != null) {
      output["frequencyRanges"] = frequencyRanges.map((frequencyRangesItem) => frequencyRangesItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of SpectrumMessage */
  core.String toString() => JSON.encode(this.toJson());

}

/** The spectrum schedule element combines an event time with spectrum profile to define a time period in which the profile is valid. */
class SpectrumSchedule {

  /** The event time expresses when the spectrum profile is valid. It will always be present. */
  EventTime eventTime;

  /** A list of spectrum messages representing the usable profile. It will always be present, but may be empty when there is no available spectrum. */
  core.List<SpectrumMessage> spectra;

  /** Create new SpectrumSchedule from JSON data */
  SpectrumSchedule.fromJson(core.Map json) {
    if (json.containsKey("eventTime")) {
      eventTime = new EventTime.fromJson(json["eventTime"]);
    }
    if (json.containsKey("spectra")) {
      spectra = json["spectra"].map((spectraItem) => new SpectrumMessage.fromJson(spectraItem)).toList();
    }
  }

  /** Create JSON Object for SpectrumSchedule */
  core.Map toJson() {
    var output = new core.Map();

    if (eventTime != null) {
      output["eventTime"] = eventTime.toJson();
    }
    if (spectra != null) {
      output["spectra"] = spectra.map((spectraItem) => spectraItem.toJson()).toList();
    }

    return output;
  }

  /** Return String representation of SpectrumSchedule */
  core.String toString() => JSON.encode(this.toJson());

}

/** A vCard-in-JSON message that contains only the fields needed for PAWS:  
- fn: Full name of an individual 
- org: Name of the organization 
- adr: Address fields 
- tel: Telephone numbers 
- email: Email addresses */
class Vcard {

  /** The street address of the entity. */
  VcardAddress adr;

  /** An email address that can be used to reach the contact. */
  VcardTypedText email;

  /** The full name of the contact person. For example: John A. Smith. */
  core.String fn;

  /** The organization associated with the registering entity. */
  VcardTypedText org;

  /** A telephone number that can be used to call the contact. */
  VcardTelephone tel;

  /** Create new Vcard from JSON data */
  Vcard.fromJson(core.Map json) {
    if (json.containsKey("adr")) {
      adr = new VcardAddress.fromJson(json["adr"]);
    }
    if (json.containsKey("email")) {
      email = new VcardTypedText.fromJson(json["email"]);
    }
    if (json.containsKey("fn")) {
      fn = json["fn"];
    }
    if (json.containsKey("org")) {
      org = new VcardTypedText.fromJson(json["org"]);
    }
    if (json.containsKey("tel")) {
      tel = new VcardTelephone.fromJson(json["tel"]);
    }
  }

  /** Create JSON Object for Vcard */
  core.Map toJson() {
    var output = new core.Map();

    if (adr != null) {
      output["adr"] = adr.toJson();
    }
    if (email != null) {
      output["email"] = email.toJson();
    }
    if (fn != null) {
      output["fn"] = fn;
    }
    if (org != null) {
      output["org"] = org.toJson();
    }
    if (tel != null) {
      output["tel"] = tel.toJson();
    }

    return output;
  }

  /** Return String representation of Vcard */
  core.String toString() => JSON.encode(this.toJson());

}

/** The structure used to represent a street address. */
class VcardAddress {

  /** The postal code associated with the address. For example: 94423. */
  core.String code;

  /** The country name. For example: US. */
  core.String country;

  /** The city or local equivalent portion of the address. For example: San Jose. */
  core.String locality;

  /** An optional post office box number. */
  core.String pobox;

  /** The state or local equivalent portion of the address. For example: CA. */
  core.String region;

  /** The street number and name. For example: 123 Any St. */
  core.String street;

  /** Create new VcardAddress from JSON data */
  VcardAddress.fromJson(core.Map json) {
    if (json.containsKey("code")) {
      code = json["code"];
    }
    if (json.containsKey("country")) {
      country = json["country"];
    }
    if (json.containsKey("locality")) {
      locality = json["locality"];
    }
    if (json.containsKey("pobox")) {
      pobox = json["pobox"];
    }
    if (json.containsKey("region")) {
      region = json["region"];
    }
    if (json.containsKey("street")) {
      street = json["street"];
    }
  }

  /** Create JSON Object for VcardAddress */
  core.Map toJson() {
    var output = new core.Map();

    if (code != null) {
      output["code"] = code;
    }
    if (country != null) {
      output["country"] = country;
    }
    if (locality != null) {
      output["locality"] = locality;
    }
    if (pobox != null) {
      output["pobox"] = pobox;
    }
    if (region != null) {
      output["region"] = region;
    }
    if (street != null) {
      output["street"] = street;
    }

    return output;
  }

  /** Return String representation of VcardAddress */
  core.String toString() => JSON.encode(this.toJson());

}

/** The structure used to represent a telephone number. */
class VcardTelephone {

  /** A nested telephone URI of the form: tel:+1-123-456-7890. */
  core.String uri;

  /** Create new VcardTelephone from JSON data */
  VcardTelephone.fromJson(core.Map json) {
    if (json.containsKey("uri")) {
      uri = json["uri"];
    }
  }

  /** Create JSON Object for VcardTelephone */
  core.Map toJson() {
    var output = new core.Map();

    if (uri != null) {
      output["uri"] = uri;
    }

    return output;
  }

  /** Return String representation of VcardTelephone */
  core.String toString() => JSON.encode(this.toJson());

}

/** The structure used to represent an organization and an email address. */
class VcardTypedText {

  /** The text string associated with this item. For example, for an org field: ACME, inc. For an email field: smith@example.com. */
  core.String text;

  /** Create new VcardTypedText from JSON data */
  VcardTypedText.fromJson(core.Map json) {
    if (json.containsKey("text")) {
      text = json["text"];
    }
  }

  /** Create JSON Object for VcardTypedText */
  core.Map toJson() {
    var output = new core.Map();

    if (text != null) {
      output["text"] = text;
    }

    return output;
  }

  /** Return String representation of VcardTypedText */
  core.String toString() => JSON.encode(this.toJson());

}

core.Map _mapMap(core.Map source, [core.Object convert(core.Object source) = null]) {
  assert(source != null);
  var result = new dart_collection.LinkedHashMap();
  source.forEach((core.String key, value) {
    assert(key != null);
    if(convert == null) {
      result[key] = value;
    } else {
      result[key] = convert(value);
    }
  });
  return result;
}
