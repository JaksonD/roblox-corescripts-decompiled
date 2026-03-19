local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.DiscoveryTypes).PlayabilityStatusEnum;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = {
    l_PlayabilityStatusEnum_0.UnderReview, 
    l_PlayabilityStatusEnum_0.UniverseRootPlaceIsPrivate, 
    l_PlayabilityStatusEnum_0.InsufficientPermissionFriendsOnly, 
    l_PlayabilityStatusEnum_0.InsufficientPermissionGroupOnly, 
    l_PlayabilityStatusEnum_0.GameUnapproved, 
    l_PlayabilityStatusEnum_0.AccountRestricted, 
    l_PlayabilityStatusEnum_0.ComplianceBlocked, 
    l_PlayabilityStatusEnum_0.ContextualPlayabilityRegionalCompliance, 
    l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls, 
    l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeGated, 
    l_PlayabilityStatusEnum_0.ContextualPlayabilityUnrated, 
    l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeGatedByDescriptor, 
    l_PlayabilityStatusEnum_0.ContextualPlayabilityExperienceBlockedParentalControls
};
return function(v7) --[[ Line: 32 ]] --[[ Name: useIsVideoEligible ]]
    -- upvalues: l_useSelector_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_RetrievalStatus_0 (copy), v1 (copy), v6 (copy)
    local v9 = l_useSelector_0(function(v8) --[[ Line: 33 ]]
        -- upvalues: l_FetchGamePlayabilityAndProductInfo_0 (ref), v7 (copy)
        return l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v8, v7);
    end);
    local v11 = l_useSelector_0(function(v10) --[[ Line: 37 ]]
        -- upvalues: v7 (copy)
        return v10.PlayabilityStatus and v10.PlayabilityStatus[v7] or nil;
    end);
    if v9 == l_RetrievalStatus_0.Done and v11 ~= nil then
        if v11.isPlayable == true then
            return true;
        elseif v1.List.find(v6, v11.playabilityStatus) ~= nil then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;