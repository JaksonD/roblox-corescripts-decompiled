local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_IXPService_0 = game:GetService("IXPService");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v2.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v2.UserLibConstants;
local v12 = require(l_script_FirstAncestor_0.Components.FriendsLandingPage);
local v13 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local l_PresenceType_0 = v2.RoduxPresence.Enums.PresenceType;
local l_PresenceType_1 = require(l_Parent_0.GraphQLServer).types.PresenceType;
local l_useFriendsListOrderedByPresence_0 = require(l_Parent_0.FriendsCommon).Hooks.useFriendsListOrderedByPresence;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v18 = require(l_script_FirstAncestor_0.Friends.filterStates);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_FFlagConnectionsHubLayerExposure_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsHubLayerExposure;
local v21 = game:DefineFastInt("FriendsLandingPageSize", 50);
local v22 = {
    [l_PresenceType_1.Offline] = l_PresenceType_0.Offline, 
    [l_PresenceType_1.Online] = l_PresenceType_0.Online, 
    [l_PresenceType_1.InGame] = l_PresenceType_0.InGame, 
    [l_PresenceType_1.InStudio] = l_PresenceType_0.InStudio
};
FriendsLandingContainer = function(_) --[[ Line: 45 ]] --[[ Name: FriendsLandingContainer ]]
    -- upvalues: l_FFlagConnectionsHubLayerExposure_0 (copy), v4 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useAppPolicy_0 (copy), v13 (copy), l_useFriendsListOrderedByPresence_0 (copy), v21 (copy), v18 (copy), v5 (copy), l_PresenceType_1 (copy), l_dependencyArray_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_UserLibConstants_0 (copy), v22 (copy), l_PresenceType_0 (copy), v12 (copy)
    if l_FFlagConnectionsHubLayerExposure_0 then
        v4.useEffect(function() --[[ Line: 47 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ConnectionsHubExposureLayer);
        end, {});
    end;
    local v24 = l_useLocalUserId_0();
    local v26 = l_useSelector_0(function(v25) --[[ Line: 53 ]]
        -- upvalues: l_getDeepValue_0 (ref), v24 (copy)
        return l_getDeepValue_0(v25, (("FriendsLanding.Friends.countsByUserId.%*"):format(v24)));
    end);
    local v28 = l_useAppPolicy_0(function(v27) --[[ Line: 57 ]]
        return v27.getShowDisplayName();
    end);
    local v29 = v4.useContext(v13.Context);
    local v30 = l_useFriendsListOrderedByPresence_0({
        userId = v24, 
        pageSize = v21
    });
    local v34 = v4.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v30 (copy), v29 (copy), v18 (ref), v5 (ref), l_PresenceType_1 (ref)
        local v31 = {};
        if v30.onlineFriends and v30.offlineFriends then
            if v29.filter == v18.All then
                return (v5.List.join(v30.onlineFriends, v30.offlineFriends));
            elseif v29.filter == v18.Offline then
                return v30.offlineFriends;
            elseif v29.filter == v18.Online then
                return v30.onlineFriends;
            else
                local l_onlineFriends_0 = v30.onlineFriends;
                v31 = v5.List.filter(l_onlineFriends_0, function(v33) --[[ Line: 79 ]]
                    -- upvalues: l_PresenceType_1 (ref)
                    return v33.presence and v33.presence.userPresenceType == l_PresenceType_1.InGame;
                end);
            end;
        end;
        return v31;
    end, l_dependencyArray_0(v29.filter, v30.onlineFriends, v30.offlineFriends));
    local v39 = v4.useMemo(function() --[[ Line: 88 ]]
        -- upvalues: v5 (ref), v34 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_UserLibConstants_0 (ref), v22 (ref), l_PresenceType_0 (ref)
        return v5.List.map(v34, function(v35, _) --[[ Line: 89 ]]
            -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_UserLibConstants_0 (ref), v22 (ref), l_PresenceType_0 (ref)
            local v37 = l_getRbxthumbWithTypeSizeAndOptions_0(v35.id, l_UserLibConstants_0.RbxthumbTypes.Avatar, 352);
            local v38 = if v35.presence then v22[v35.presence.userPresenceType] else l_PresenceType_0.Offline;
            return {
                id = v35.id, 
                username = "", 
                thumbnail = v37, 
                userPresenceType = v38, 
                universeId = v35.presence and v35.presence.universeId or nil, 
                lastLocation = if v35.presence then v35.presence.lastLocation else nil
            };
        end);
    end, {
        v34
    });
    return v4.createElement(v12, {
        totalFriendCount = v26, 
        friends = v39, 
        fetchMoreFriends = if not v30 or v30.isEndOfList then nil else v30.fetchMoreFriends, 
        refreshFriends = v30.refreshFriendsData, 
        enableDisplayNamePolicy = v28, 
        localUserId = v24
    });
end;
return FriendsLandingContainer;