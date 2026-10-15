# connected-network-type-subscriptions-deleteConnectedNetworkTypeSubscription
Feature: CAMARA Connected Network Type Subscriptions API, vwip - Operation deleteConnectedNetworkTypeSubscription

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

  @connected_network_type_subscriptions_01_delete_subscription_based_on_an_existing_subscription-id
  Scenario: Delete the subscription with subscriptionId equal to "id"
    Given the API consumer has an active subscription with "subscriptionId" equal to "id"
    When the request "deleteConnectedNetworkTypeSubscription" is sent
    And the path parameter "subscriptionId" is set to "id"
    Then the response status code is 202 or 204
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And if the response property "$.status" is 204 then response body is not present
    And if the response property "$.status" is 202 then response body complies with the OAS schema at "#/components/schemas/SubscriptionAsync" and the response property "$.id" is equal to "id"

  @connected_network_type_subscriptions_02_subscription_delete_event_validation
  Scenario: Receive notification for subscription-ended event on deletion
    Given a valid subscription for a device exists with "subscriptionId" equal to "id"
    And the subscription property "$.sink" is a valid callback URL
    When the request "deleteConnectedNetworkTypeSubscription" is sent
    And the path parameter "subscriptionId" is set to "id"
    And the response status code is 202 or 204
    Then a subscription termination event notification is sent to the callback URL
    And the notification body complies with the OAS schema at "#/components/schemas/EventSubscriptionEnded"
    And the notification property "$.type" is equal to "org.camaraproject.connected-network-type-subscriptions.v0.subscription-ended"
    And the notification property "$.data.subscriptionId" is equal to "id"
    And the notification request property "$.data.terminationReason" is equal to "SUBSCRIPTION_DELETED"

##################
# Error code 400
##################

# No test scenarios yet defined

##################
# Error code 401
##################

  @connected_network_type_subscriptions_delete_401.01_no_authorization_header
  Scenario: No Authorization header when deleting subscription
    Given the request header "Authorization" is removed
    When the request "deleteConnectedNetworkTypeSubscription" is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @connected_network_type_subscriptions_delete_401.02_expired_access_token
  Scenario: Expired access token when deleting subscription
    Given the header "Authorization" is set to a previously valid but now expired access token
    When the request "deleteConnectedNetworkTypeSubscription" is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @connected_network_type_subscriptions_delete_401.03_malformed_access_token
  Scenario: Malformed access token when deleting subscription
    Given the header "Authorization" is set to a malformed token
    When the request "deleteConnectedNetworkTypeSubscription" is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

##################
# Error code 403
##################

# No test scenarios yet defined

##################
# Error code 404
##################

  @connected_network_type_subscriptions_404.01_delete_unknown_subscription_id
  Scenario: Delete subscription with subscriptionId unknown to the system
    Given that there is no valid subscription with "subscriptionId" equal to "id"
    When the request "deleteConnectedNetworkTypeSubscription" is sent
    And the path parameter "subscriptionId" is equal to "id"
    Then the response code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text
