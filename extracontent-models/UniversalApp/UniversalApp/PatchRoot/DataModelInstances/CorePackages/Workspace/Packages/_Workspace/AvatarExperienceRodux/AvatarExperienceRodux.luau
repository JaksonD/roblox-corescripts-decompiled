local _ = require(script.Types.RoduxTypes);
local _ = require(script.Types.AssetMetadata);
local _ = require(script.Types.AssetInfo);
local _ = require(script.Types.OutfitTryOn);
local v4 = require(script.Actions.AddAnalyticsMetadata);
local v5 = require(script.Reducers.AnalyticsMetadata);
return {
    Actions = {
        AddAnalyticsMetadata = v4
    }, 
    Reducers = {
        AnalyticsMetadata = v5
    }, 
    ["jest.config"] = script["jest.config"]
};