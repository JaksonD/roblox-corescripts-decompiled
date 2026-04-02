local _ = require(script.Types.RoduxTypes);
local _ = require(script.Types.AssetMetadata);
local _ = require(script.Types.AssetInfo);
local _ = require(script.Types.OutfitTryOn);
local v4 = require(script.Actions.AddAnalyticsMetadata);
local v5 = require(script.Actions.AvatarExperienceLoaded);
local v6 = require(script.Actions.PlayingSwimAnimation);
local v7 = require(script.Actions.SetAvatarSceneRoute);
local v8 = require(script.Reducers.AnalyticsMetadata);
local v9 = require(script.Reducers.AvatarExperienceLoaded);
local v10 = require(script.Reducers.AvatarRoute);
local v11 = require(script.Reducers.PlayingSwimAnimation);
return {
    Actions = {
        AddAnalyticsMetadata = v4, 
        AvatarExperienceLoaded = v5, 
        PlayingSwimAnimation = v6, 
        SetAvatarSceneRoute = v7
    }, 
    Reducers = {
        AnalyticsMetadata = v8, 
        AvatarExperienceLoaded = v9, 
        AvatarRoute = v10, 
        PlayingSwimAnimation = v11
    }, 
    ["jest.config"] = script["jest.config"]
};