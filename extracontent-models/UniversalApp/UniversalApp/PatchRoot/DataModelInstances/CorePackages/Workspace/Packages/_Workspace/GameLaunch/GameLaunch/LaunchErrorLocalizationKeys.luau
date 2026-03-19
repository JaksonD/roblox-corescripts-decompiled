local l_Parent_0 = script:FindFirstAncestor("GameLaunch").Parent;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.DiscoveryTypes).PlayabilityStatusEnum;
local l_FFlagLuaAppBlockedUnplayableError_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppBlockedUnplayableError;
local v4 = {};
local v5 = {
    [l_RetrievalStatus_0.Failed] = "Feature.GamePage.QuickLaunch.LaunchError.RequestFailed", 
    [l_PlayabilityStatusEnum_0.GuestProhibited] = "Feature.GamePage.QuickLaunch.LaunchError.GuestProhibited", 
    [l_PlayabilityStatusEnum_0.GameUnapproved] = "Feature.ExperienceDetails.UnplayableError.GameUnapproved", 
    [l_PlayabilityStatusEnum_0.UniverseRootPlaceIsPrivate] = "Feature.ExperienceDetails.UnplayableError.UniverseRootPlaceIsPrivate", 
    [l_PlayabilityStatusEnum_0.InsufficientPermissionFriendsOnly] = "Feature.ExperienceDetails.UnplayableError.InsufficientPermissionFriendsOnly", 
    [l_PlayabilityStatusEnum_0.InsufficientPermissionGroupOnly] = "Feature.ExperienceDetails.UnplayableError.InsufficientPermissionGroupOnly", 
    [l_PlayabilityStatusEnum_0.DeviceRestricted] = "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedDefault", 
    [l_PlayabilityStatusEnum_0.UnderReview] = "Feature.ExperienceDetails.UnplayableError.UnderReview", 
    [l_PlayabilityStatusEnum_0.PurchaseRequired] = "Feature.GamePage.QuickLaunch.LaunchError.PurchaseRequired", 
    [l_PlayabilityStatusEnum_0.AccountRestricted] = "Feature.ExperienceDetails.UnplayableError.AccountRestricted", 
    [l_PlayabilityStatusEnum_0.TemporarilyUnavailable] = "Feature.ExperienceDetails.UnplayableError.TemporarilyUnavailable", 
    [l_PlayabilityStatusEnum_0.ComplianceBlocked] = "Feature.ExperienceDetails.UnplayableError.ComplianceBlocked", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityAgeRecommendationParentalControls", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityRegionalAvailability] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityRegionalAvailability", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityRegionalCompliance] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityRegionalCompliance", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityUnverifiedSeventeenPlusUser] = "Feature.GamePage.QuickLaunch.LaunchError.ContextualPlayabilityUnverifiedSeventeenPlusUser", 
    [l_PlayabilityStatusEnum_0.PlaceHasNoPublishedVersion] = "Feature.ExperienceDetails.UnplayableError.PlaceHasNoPublishedVersion", 
    [l_PlayabilityStatusEnum_0.IncorrectConfiguration] = "Feature.ExperienceDetails.UnplayableError.IncorrectConfiguration", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeGated] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityAgeGated", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityUnrated] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityUnrated", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeGatedByDescriptor] = "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityAgeGatedByDescriptor", 
    [l_PlayabilityStatusEnum_0.FiatPurchaseDeviceRestricted] = "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedDefault", 
    [l_PlayabilityStatusEnum_0.ContextualPlayabilityExperienceBlockedParentalControls] = l_FFlagLuaAppBlockedUnplayableError_0 and "Feature.ExperienceDetails.UnplayableError.ContextualPlayabilityExperienceBlockedParentalControls" or nil, 
    Default = "Feature.ExperienceDetails.UnplayableError.UnplayableOther"
};
setmetatable(v4, {
    __newindex = function(_, _, _) --[[ Line: 42 ]] --[[ Name: __newindex ]]

    end, 
    __index = function(_, v10) --[[ Line: 43 ]] --[[ Name: __index ]]
        -- upvalues: v5 (copy)
        assert(v10 ~= nil, "LaunchErrorLocalizationKeys needs a key");
        return v5[v10] or v5.Default;
    end
});
return v4;