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
local v16 = require(l_Parent_0.FriendsCommon);
local l_useFriendsListOrderedByPresence_0 = v16.Hooks.useFriendsListOrderedByPresence;
local l_useDecoratedTrustedConnections_0 = v16.Hooks.useDecoratedTrustedConnections;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v20 = require(l_script_FirstAncestor_0.Friends.filterStates);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_FFlagConnectionsHubLayerExposure_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsHubLayerExposure;
local l_FFlagConnectionManagementChips_0 = require(l_Parent_0.SharedFlags).FFlagConnectionManagementChips;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v25 = game:DefineFastInt("FriendsLandingPageSize", 50);
local v26 = {
    [l_PresenceType_1.Offline] = l_PresenceType_0.Offline, 
    [l_PresenceType_1.Online] = l_PresenceType_0.Online, 
    [l_PresenceType_1.InGame] = l_PresenceType_0.InGame, 
    [l_PresenceType_1.InStudio] = l_PresenceType_0.InStudio
};
FriendsLandingContainer = function(_) --[[ Line: 49 ]] --[[ Name: FriendsLandingContainer ]]
    -- upvalues: l_FFlagConnectionsHubLayerExposure_0 (copy), v4 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useAppPolicy_0 (copy), v13 (copy), l_useFriendsListOrderedByPresence_0 (copy), v25 (copy), l_FFlagConnectionManagementChips_0 (copy), l_useDecoratedTrustedConnections_0 (copy), v20 (copy), v5 (copy), l_PresenceType_1 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_UserLibConstants_0 (copy), v26 (copy), l_PresenceType_0 (copy), v12 (copy)
    if l_FFlagConnectionsHubLayerExposure_0 then
        v4.useEffect(function() --[[ Line: 51 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ConnectionsHubExposureLayer);
        end, {});
    end;
    local v28 = l_useLocalUserId_0();
    local v30 = l_useSelector_0(function(v29) --[[ Line: 57 ]]
        -- upvalues: l_getDeepValue_0 (ref), v28 (copy)
        return l_getDeepValue_0(v29, (("FriendsLanding.Friends.countsByUserId.%*"):format(v28)));
    end);
    local v32 = l_useAppPolicy_0(function(v31) --[[ Line: 61 ]]
        return v31.getShowDisplayName();
    end);
    local v33 = v4.useContext(v13.Context);
    local v34 = l_useFriendsListOrderedByPresence_0({
        userId = v28, 
        pageSize = v25
    });
    local v35 = nil;
    if l_FFlagConnectionManagementChips_0 then
        v35 = l_useDecoratedTrustedConnections_0(v34.onlineFriends);
    end;
    local v39 = v4.useMemo(function() --[[ Line: 79 ]]
        -- upvalues: v34 (copy), v33 (copy), v20 (ref), v5 (ref), l_FFlagConnectionManagementChips_0 (ref), v35 (ref), l_PresenceType_1 (ref)
        local v36 = {};
        if v34.onlineFriends and v34.offlineFriends then
            if v33.filter == v20.All then
                return (v5.List.join(v34.onlineFriends, v34.offlineFriends));
            elseif v33.filter == v20.Offline then
                return v34.offlineFriends;
            elseif v33.filter == v20.Online then
                return v34.onlineFriends;
            elseif l_FFlagConnectionManagementChips_0 and v33.filter == v20.Trusted then
                return v35 or {};
            else
                local l_onlineFriends_0 = v34.onlineFriends;
                v36 = v5.List.filter(l_onlineFriends_0, function(v38) --[[ Line: 92 ]]
                    -- upvalues: l_PresenceType_1 (ref)
                    return v38.presence and v38.presence.userPresenceType == l_PresenceType_1.InGame;
                end);
            end;
        end;
        return v36;
    end, if l_FFlagConnectionManagementChips_0 then if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33.filter, 
        v34.onlineFriends, 
        v34.offlineFriends, 
        v35
    } else l_dependencyArray_0(v33.filter, v34.onlineFriends, v34.offlineFriends, v35) else if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33.filter, 
        v34.onlineFriends, 
        v34.offlineFriends
    } else l_dependencyArray_0(v33.filter, v34.onlineFriends, v34.offlineFriends));
    local v44 = v4.useMemo(function() --[[ Line: 114 ]]
        -- upvalues: v5 (ref), v39 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_UserLibConstants_0 (ref), v26 (ref), l_PresenceType_0 (ref)
        return v5.List.map(v39, function(v40, _) --[[ Line: 115 ]]
            -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_UserLibConstants_0 (ref), v26 (ref), l_PresenceType_0 (ref)
            local v42 = l_getRbxthumbWithTypeSizeAndOptions_0(v40.id, l_UserLibConstants_0.RbxthumbTypes.Avatar, 352);
            local v43 = if v40.presence then v26[v40.presence.userPresenceType] else l_PresenceType_0.Offline;
            return {
                id = v40.id, 
                username = "", 
                thumbnail = v42, 
                userPresenceType = v43, 
                universeId = v40.presence and v40.presence.universeId or nil, 
                lastLocation = if v40.presence then v40.presence.lastLocation else nil
            };
        end);
    end, {
        v39
    });
    return v4.createElement(v12, {
        totalFriendCount = v30, 
        friends = if l_FFlagConnectionManagementChips_0 then v44 or {} else v44, 
        fetchMoreFriends = if not v34 or v34.isEndOfList then nil else v34.fetchMoreFriends, 
        refreshFriends = v34.refreshFriendsData, 
        enableDisplayNamePolicy = v32, 
        localUserId = v28
    });
end;
return FriendsLandingContainer;