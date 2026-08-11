# Changelog ConnectedNetworkType

<!-- TOC:START -->
## Table of Contents
- [r2.1](#r21)
<!-- TOC:END -->

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r2.1

## Release Notes

This release candidate contains the definition and documentation of
* connected-network-type-subscriptions 0.3.0-rc.1
* connected-network-type 0.3.0-rc.1

The API definition(s) are based on
* Commonalities 0.8.0
* Identity and Consent Management 0.5.0

## connected-network-type-subscriptions 0.3.0-rc.1

**connected-network-type-subscriptions 0.3.0-rc.1 is a release-candidate version of this API.**

Changes documented below are compared to version 0.2.0.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r2.1/code/API_definitions/connected-network-type-subscriptions.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r2.1/code/API_definitions/connected-network-type-subscriptions.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/ConnectedNetworkType/blob/r2.1/code/API_definitions/connected-network-type-subscriptions.yaml)

### Breaking changes

* Update API definitions to fix CAMARA validation warnings and hints by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/58
  - Pagination for listing of subscriptions using GET /subscriptions is now supported
    -  Addition of `page` and `perPage` query parameters to control pagination
    -  Returned subscriptions are now embedded in the array `subscriptions` within the response JSON, with the page tracked within the `pagination` JSON
    -  Addition of response headers `X-Total-Count`, `X-Total-Pages` and `Link` to facilitate page navigation

### Added

* N/A

### Changed

* Update API definitions to fix CAMARA validation warnings and hints by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/58
  - Pagination for listing of subscriptions using GET /subscriptions is now supported
    -  Addition of `page` and `perPage` query parameters to control pagination
    -  Returned subscriptions are now embedded in the array `subscriptions` within the response JSON, with the page tracked within the `pagination` JSON
    -  Addition of response headers `X-Total-Count`, `X-Total-Pages` and `Link` to facilitate page navigation

### Fixed

* Fix Network identifier example by @bigludo7 in https://github.com/camaraproject/ConnectedNetworkType/pull/50

### Removed

* N/A

## connected-network-type 0.3.0-rc.1

**connected-network-type 0.3.0-rc.1 is a release-candidate version of this API.**

Changes documented below are compared to version 0.2.0.

- API definition **with inline documentation**:
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r2.1/code/API_definitions/connected-network-type.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/ConnectedNetworkType/r2.1/code/API_definitions/connected-network-type.yaml)
  - OpenAPI [YAML spec file](https://github.com/camaraproject/ConnectedNetworkType/blob/r2.1/code/API_definitions/connected-network-type.yaml)

### Breaking changes

* N/A

### Added

* N/A

### Changed

* Clarify LastStatusTime description in YAML by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/47
* Update API definitions to fix CAMARA validation warnings and hints by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/58
* Improve description of Last Status Time property by @eric-murray in https://github.com/camaraproject/ConnectedNetworkType/pull/73

### Fixed

* Fix Network identifier example by @bigludo7 in https://github.com/camaraproject/ConnectedNetworkType/pull/50

### Removed

* N/A

**Full Changelog**: https://github.com/camaraproject/ConnectedNetworkType/compare/r1.2...r2.1

