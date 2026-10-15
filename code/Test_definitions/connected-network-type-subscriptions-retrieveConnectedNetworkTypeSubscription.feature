# connected-network-type-subscriptions-retrieveConnectedNetworkTypeSubscription
Feature: CAMARA Connected Network Type Subscriptions API, vwip - Operation retrieveConnectedNetworkTypeSubscription

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

  @connected_network_type_subscriptions_01_retrieve_by_id_2legs
  Scenario: Check existing subscription is retrieved by id with a 2-legged access token
    Given a subscription exists and has a subscriptionId equal to "id"
    And the header "Authorization" is set to a valid access token which does not identify any device
    When the request "retrieveConnectedNetworkTypeSubscription" is sent
    And the path parameter "subscriptionId" is set to "id"
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/Subscription"
    And the response property "$.id" is equal to "id"
    And the response property "$.config.subscriptionDetail.device" is present

  @connected_network_type_subscriptions_02_retrieve_by_id_3legs
  Scenario: Check existing subscription is retrieved by id with a 3-legged access token
    Given a subscription exists and has a subscriptionId equal to "id"
    And the header "Authorization" is set to a valid access token which identifies the device associated with the subscription
    When the request "retrieveConnectedNetworkTypeSubscription"
    And the path parameter "subscriptionId" is set to "id"
    Then the response status code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/Subscription"
    And the response property "$.id" is equal to "id"
    And the response property "$.config.subscriptionDetail.device" is not present

  @connected_network_type_subscriptions_03_Operation_to_retrieve_subscription_based_on_an_existing_subscription-id_access_token_sink_credential_returned
  # Some implementations may decide to not return the sinkCredential in the response (data minimization principle)
  Scenario: Get a subscription based on existing subscription-id, with ACCESSTOKEN sinkCredential returned.
    Given the path parameter "subscriptionId" is set to the identifier of an existing roaming status subscription
    When the request "retrieveConnectedNetworkTypeSubscription" is sent
    Then the response code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has the same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/Subscription"
    And the response body property "$.sinkCredential.credentialType", if present, is set to value "ACCESSTOKEN"
    And the response body property "$.sinkCredential.accessTokenExpiresUtc", if present, is set to the same value of the request property "$.sinkCredential.accessTokenExpiresUtc"

  @connected_network_type_subscriptions_04_Operation_to_retrieve_subscription_based_on_an_existing_subscription-id_private_jwt_key_sink_credential_returned
  # Some implementations may decide to not return the sinkCredential in the response (data minimization principle)
  # Mainly applicable for in-band provisioning of PRIVATE_JWT_KEY mode for a given subscription
  Scenario: Get a subscription based on existing subscription-id, with PRIVATE_JWT_KEY sinkCredential returned.
    Given the path parameter "subscriptionId" is set to the identifier of an existing roaming status subscription
    When the request "retrieveConnectedNetworkTypeSubscription" is sent
    Then the response code is 200
    And the response header "Content-Type" is "application/json"
    And the response header "x-correlator" has the same value as the request header "x-correlator"
    And the response body complies with the OAS schema at "#/components/schemas/Subscription"
    And the response body property "$.sinkCredential.credentialType" is set to value "PRIVATE_JWT_KEY"
    And the response body property "$.sinkCredential.jwksUri" is set to a valid value

##################
# Error code 400
##################

# No test scenarios yet defined

##################
# Error code 401
##################

  @connected_network_type_subscriptions_retrieve_401.01_no_authorization_header
  Scenario: No Authorization header when retrieving subscriptions
    Given the request header "Authorization" is removed
    When the request "retrieveConnectedNetworkTypeSubscription" is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @connected_network_type_subscriptions_retrieve_401.02_expired_access_token
  Scenario: Expired access token when retrieving subscriptions
    Given the header "Authorization" is set to a previously valid but now expired access token
    When the request "retrieveConnectedNetworkTypeSubscription" is sent
    Then the response status code is 401
    And the response header "Content-Type" is "application/json"
    And the response property "$.status" is 401
    And the response property "$.code" is "UNAUTHENTICATED"
    And the response property "$.message" contains a user friendly text

  @connected_network_type_subscriptions_retrieve_401.03_malformed_access_token
  Scenario: Malformed access token when retrieving subscriptions
    Given the header "Authorization" is set to a malformed token
    When the request "retrieveConnectedNetworkTypeSubscription" is sent
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

  @connected_network_type_subscriptions_404.1_retrieve_unknown_subscription_id
  Scenario: Get subscription when subscriptionId is unknown to the system
    Given that there is no valid subscription with "subscriptionId" equal to "id"
    When the request "retrieveConnectedNetworkTypeSubscription" is sent
    And the path parameter "subscriptionId" is equal to "id"
    Then the response status code is 404
    And the response property "$.status" is 404
    And the response property "$.code" is "NOT_FOUND"
    And the response property "$.message" contains a user friendly text
