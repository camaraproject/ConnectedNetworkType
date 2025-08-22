# Changelog ConnectedNetworkType
## Table of Contents
- **[r1.2](#r12)**
- [r1.1](#r11)

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

  - for an alpha release, the delta with respect to the previous release
  - for the first release-candidate, all changes since the last public release
  - for subsequent release-candidate(s), only the delta to the previous release-candidate
  - for a public release, the consolidated changes since the previous public release

Note: this API had former releases in the [DeviceStatus](https://github.com/camaraproject/DeviceStatus) repository

# r1.2
## Release Notes

This public release contains the definition and documentation of
* connected-network-type v0.2.0
* connected-network-type-subscriptions v0.2.0

The API definition(s) are based on
* Commonalities v0.6.0 (r3.3)
* Identity and Consent Management v0.4.0 (r3.3)

## connected-network-type v0.2.0

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r1.2/code/API_definitions/connected-network-type.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r1.2/code/API_definitions/connected-network-type.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/ConnectedNetworkType/blob/r1.2/code/API_definitions/connected-network-type.yaml)

### Added

### Changed
* Make lastStatusTime mandatory in 200 responses of the API by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/17
* Update x-correlator schema by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/26
* Update error response documentation in OAS definitions by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/27
* Commonalities alignement for connected network type subscription & connected network type by @bigludo7 in https://github.com/camaraproject/ConnectedNetworkType/pull/34
* Fix feature files for compliance with centralised linting rules by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/38
* Further fix for feature files for compliance with centralised linting rules by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/40
* Migrate to centralized linting workflows by @hdamker-bot in https://github.com/camaraproject/ConnectedNetworkType/pull/37

### Fixed

### Removed
* Remove AUTHENTICATION_REQUIRED error code by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/12
* Update OAS and test definitions to remove IDENTIFIER_MISMATCH error code by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/24

## connected-network-type-subscriptions v0.2.0

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r1.2/code/API_definitions/connected-network-type-subscriptions.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r1.2/code/API_definitions/connected-network-type-subscriptions.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/ConnectedNetworkType/blob/r1.2/code/API_definitions/connected-network-type-subscriptions.yaml)

### Added
* Add subscription started & updated events by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/31

### Changed
* change sink format to format: uri by @maxl2287 in https://github.com/camaraproject/ConnectedNetworkType/pull/16
* Update x-correlator schema by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/26
* Rename subscription-ends event to subscription-ended by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/28
* Update error response documentation in OAS definitions by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/27
* Commonalities alignement for connected network type subscription & connected network type by @bigludo7 in https://github.com/camaraproject/ConnectedNetworkType/pull/34
* Fix feature files for compliance with centralised linting rules by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/38
* Further fix for feature files for compliance with centralised linting rules by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/40
* Migrate to centralized linting workflows by @hdamker-bot in https://github.com/camaraproject/ConnectedNetworkType/pull/37

### Fixed
* remove "Generic High Entropy Secret" by @maxl2287 in https://github.com/camaraproject/ConnectedNetworkType/pull/15

### Removed
* Remove AUTHENTICATION_REQUIRED error code by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/12
* Update OAS and test definitions to remove IDENTIFIER_MISMATCH error code by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/24

**Full Changelog**: https://github.com/camaraproject/ConnectedNetworkType/commits/r1.2

# r1.1
## Release Notes

This public release contains the definition and documentation of
* connected-network-type v0.2.0-rc.1
* connected-network-type-subscriptions v0.2.0-rc.1

The API definition(s) are based on
* Commonalities v0.6.0-rc.1 (r3.2)
* Identity and Consent Management v0.4.0-rc.1 (r3.2)

## connected-network-type v0.2.0-rc.1

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r1.1/code/API_definitions/connected-network-type.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r1.1/code/API_definitions/connected-network-type.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/ConnectedNetworkType/blob/r1.1/code/API_definitions/connected-network-type.yaml)

### Added

### Changed
* Make lastStatusTime mandatory in 200 responses of the API by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/17
* Update x-correlator schema by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/26
* Update error response documentation in OAS definitions by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/27
* Commonalities alignement for connected network type subscription & connected network type by @bigludo7 in https://github.com/camaraproject/ConnectedNetworkType/pull/34

### Fixed

### Removed
* Remove AUTHENTICATION_REQUIRED error code by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/12
* Update OAS and test definitions to remove IDENTIFIER_MISMATCH error code by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/24

## connected-network-type-subscriptions v0.2.0-rc.1

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r1.1/code/API_definitions/connected-network-type-subscriptions.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r1.1/code/API_definitions/connected-network-type-subscriptions.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/ConnectedNetworkType/blob/r1.1/code/API_definitions/connected-network-type-subscriptions.yaml)

### Added
* Add subscription started & updated events by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/31

### Changed
* change sink format to format: uri by @maxl2287 in https://github.com/camaraproject/ConnectedNetworkType/pull/16
* Update x-correlator schema by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/26
* Rename subscription-ends event to subscription-ended by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/28
* Update error response documentation in OAS definitions by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/27
* Commonalities alignement for connected network type subscription & connected network type by @bigludo7 in https://github.com/camaraproject/ConnectedNetworkType/pull/34

### Fixed
* remove "Generic High Entropy Secret" by @maxl2287 in https://github.com/camaraproject/ConnectedNetworkType/pull/15

### Removed
* Remove AUTHENTICATION_REQUIRED error code by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/12
* Update OAS and test definitions to remove IDENTIFIER_MISMATCH error code by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/24

**Full Changelog**: https://github.com/camaraproject/ConnectedNetworkType/commits/r1.1
