local v0 = require(script.Common.AbuseVector);
local v1 = require(script.Signals.featureRestrictionDisplaySignal);
return {
    showFeatureRestriction = require(script.Utils.showFeatureRestriction), 
    AbuseVector = v0, 
    Signals = {
        featureRestrictionDisplaySignal = v1
    }, 
    ["jest.config"] = script["jest.config"]
};