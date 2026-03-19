local _ = require(script.PolicyTypes);
local v1 = require(script.Enum.CrossPlayCapabilities);
return {
    getAppFeaturePolicies = require(script.getAppFeaturePolicies), 
    AppFeaturePolicies = require(script.AppFeaturePolicies), 
    RoactAppPolicy = require(script.RoactAppPolicy), 
    UniversalAppPolicy = require(script.UniversalAppPolicy), 
    useAppPolicy = require(script.useAppPolicy), 
    Enum = {
        CrossPlayCapabilities = v1
    }
};