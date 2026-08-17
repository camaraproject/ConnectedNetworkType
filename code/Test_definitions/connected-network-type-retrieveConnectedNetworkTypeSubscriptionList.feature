# connected-network-type-subscriptions
Feature: CAMARA Connected Network Type Subscriptions API, vwip
  # Operations createConnectedNetworkTypeSubscription, retrieveConnectedNetworkTypeSubscriptionList, retrieveConnectedNetworkTypeSubscription and deleteConnectedNetworkTypeSubscription

  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  # * List of device identifier types which are not supported, among: phoneNumber, networkAccessIdentifier, ipv4Address, ipv6Address
  #
  # Testing assets:
  # * A device object where the tester can select between multiple network types.
  # * (optional: Additional devices object which supports 2G, 3G, 4G and/or 5G)
  # * The known connected Generation of Mobile Communication Technology.
  # * A sink-url identified as "callbackUrl", which receives notifications
  # * apiRoot: API root of the server URL
  #
  # References to OAS spec schemas refer to schemas specifies in connected-network-type-subscriptions.yaml

  Background: Connected Network Type Subscriptions setup
    Given an environment at "apiRoot"
    And the resource "/connected-network-type-subscriptions/vwip"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"

##########################
# Happy path scenarios
##########################

  @connected_network_type_subscriptions_04_retrieve_list_2legs
  Scenario: Check existing subscription(s) is/are retrieved in list using a 2-legged access token
    Given at least one subscription is existing for the API consumer making this request
    And the header "Authorization" is set to a valid access token which does not identify any device
    When the request "retrieveConnectedNetworkTypeSubscriptionList" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with an array of OAS schema defined at "#/components/schemas/Subscription"
    And the response body lists all subscriptions belonging to the API consumer

  @connected_network_type_subscriptions_05_retrieve_list_3legs
  Scenario: Check existing subscription(s) is/are retrieved in list using a 3-legged access token
    Given the API consumer has at least one active subscription for the device
    And the header "Authorization" is set to a valid access token which identifies a valid device associated with one or more subscriptions
    When the request "retrieveConnectedNetworkTypeSubscriptionList" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with an array of OAS schema defined at "#/components/schemas/Subscription"
    And the response body lists all subscriptions belonging to the API consumer for the identified device
    And the response property "$.config.subscriptionDetail.device" is not present in any of the subscription records

  @connected_network_type_subscriptions_06_retrieve_empty_list_3legs
  Scenario: Check no existing subscription is retrieved in list
    Given the API consumer has no active subscriptions for the device
    And the header "Authorization" is set to a valid access token which identifies a valid device
    When the request "retrieveConnectedNetworkTypeSubscriptionList" is sent
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body is an empty array

##################
# Error code 400
##################

##################
# Error code 401
##################

  @connected_network_type_subscriptions_retrieve_list_401.10_no_authorization_header
  Scenario: No Authorization header when retrieving subscription list
    Given the request header "Authorization" is removed
    When the request "retrieveConnectedNetworkTypeSubscriptionList" is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @connected_network_type_subscriptions_retrieve_list_401.11_expired_access_token
  Scenario: Expired access token when retrieving subscription list
    Given the header "Authorization" is set to a previously valid but now expired access token
    When the request "retrieveConnectedNetworkTypeSubscriptionList" is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @connected_network_type_subscriptions_retrieve_list_401.12_malformed_access_token
  Scenario: Malformed access token when retrieving subscription list
    Given the header "Authorization" is set to a malformed token
    When the request "retrieveConnectedNetworkTypeSubscriptionList" is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

##################
# Error code 403
##################

##################
# Error code 404
##################
