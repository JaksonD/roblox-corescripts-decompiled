local v0 = require(script.useUserAgreements);
local v1 = require(script.FetchUpdatedUserAgreements);
local v2 = require(script.FetchSignupUserAgreements);
local v3 = require(script.UserAgreementsCounterNames);
local v4 = require(script.UserAgreementErrorCodes);
local v5 = require(script.UserAgreementUtils);
local v6 = require(script.Components.UserAgreementsList);
return {
    ["jest.config"] = script["jest.config"], 
    useUserAgreements = v0, 
    FetchUpdatedUserAgreements = v1, 
    FetchSignupUserAgreements = v2, 
    UserAgreementsCounterNames = v3, 
    UserAgreementErrorCodes = v4, 
    UserAgreementUtils = v5, 
    UserAgreementsList = v6
};