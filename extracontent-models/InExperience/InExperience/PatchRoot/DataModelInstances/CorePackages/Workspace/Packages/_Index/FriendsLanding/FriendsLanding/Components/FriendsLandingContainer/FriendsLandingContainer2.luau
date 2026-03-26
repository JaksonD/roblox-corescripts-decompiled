local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_IXPService_0 = game:GetService("IXPService");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.DataHydration);
local v7 = require(l_Parent_0.SignalsReact);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v2.getRbxthumbWithTypeSizeAndOptions;
local l_UserLibConstants_0 = v2.UserLibConstants;
local v14 = require(l_script_FirstAncestor_0.Components.FriendsLandingPage);
local v15 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local l_PresenceType_0 = v2.RoduxPresence.Enums.PresenceType;
local l_PresenceType_1 = require(l_Parent_0.GraphQLServer).types.PresenceType;
local l_useFriendsListOrderedByPresence_0 = require(l_Parent_0.FriendsCommon).Hooks.useFriendsListOrderedByPresence;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v20 = require(l_script_FirstAncestor_0.Friends.filterStates);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_FFlagConnectionsHubLayerExposure_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsHubLayerExposure;
local l_FFlagConnectionManagementChips_0 = require(l_Parent_0.SharedFlags).FFlagConnectionManagementChips;
local v24 = game:DefineFastInt("FriendsLandingPageSize", 50);
local v25 = {
    [l_PresenceType_1.Offline] = l_PresenceType_0.Offline, 
    [l_PresenceType_1.Online] = l_PresenceType_0.Online, 
    [l_PresenceType_1.InGame] = l_PresenceType_0.InGame, 
    [l_PresenceType_1.InStudio] = l_PresenceType_0.InStudio
};
local v26 = if l_FFlagConnectionManagementChips_0 then v6.TrustedConnections.TrustedConnectionsStore.get() else nil;
FriendsLandingContainer = function(_) --[[ Line: 51 ]] --[[ Name: FriendsLandingContainer ]]
    -- upvalues: l_FFlagConnectionsHubLayerExposure_0 (copy), v4 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useAppPolicy_0 (copy), v15 (copy), l_FFlagConnectionManagementChips_0 (copy), v26 (copy), v7 (copy), l_useFriendsListOrderedByPresence_0 (copy), v24 (copy), v5 (copy), l_dependencyArray_0 (copy), v20 (copy), l_PresenceType_1 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_UserLibConstants_0 (copy), v25 (copy), l_PresenceType_0 (copy), v14 (copy)
    if l_FFlagConnectionsHubLayerExposure_0 then
        v4.useEffect(function() --[[ Line: 53 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ConnectionsHubExposureLayer);
        end, {});
    end;
    local v28 = l_useLocalUserId_0();
    local v30 = l_useSelector_0(function(v29) --[[ Line: 59 ]]
        -- upvalues: l_getDeepValue_0 (ref), v28 (copy)
        return l_getDeepValue_0(v29, (("FriendsLanding.Friends.countsByUserId.%*"):format(v28)));
    end);
    local v32 = l_useAppPolicy_0(function(v31) --[[ Line: 63 ]]
        return v31.getShowDisplayName();
    end);
    local v33 = v4.useContext(v15.Context);
    local v34 = nil;
    if l_FFlagConnectionManagementChips_0 then
        local v35 = v26.getUserTrustedConnections(v28);
        v34 = v7.useSignalState(v35.data);
    end;
    local v36 = l_useFriendsListOrderedByPresence_0({
        userId = v28, 
        pageSize = v24
    });
    local v37 = nil;
    local v38 = nil;
    if l_FFlagConnectionManagementChips_0 then
        local v39, v40 = v4.useState({});
        v37 = v39;
        v38 = v40;
        v4.useEffect(function() --[[ Line: 84 ]]
            -- upvalues: v34 (ref), v36 (copy), v5 (ref), v38 (ref)
            if v34 and v36.onlineFriends and v36.offlineFriends then
                local v42 = v5.List.filter(v36.onlineFriends, function(v41) --[[ Line: 86 ]]
                    -- upvalues: v34 (ref)
                    return v34[v41.id];
                end);
                local v44 = v5.List.filter(v36.offlineFriends, function(v43) --[[ Line: 89 ]]
                    -- upvalues: v34 (ref)
                    return v34[v43.id];
                end);
                v38(v5.List.join(v42, v44));
            end;
        end, l_dependencyArray_0(v36.onlineFriends, v36.offlineFriends, v34));
    end;
    local v48 = v4.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: v36 (copy), v33 (copy), v20 (ref), v5 (ref), l_FFlagConnectionManagementChips_0 (ref), v34 (ref), v37 (ref), l_PresenceType_1 (ref)
        local v45 = {};
        if v36.onlineFriends and v36.offlineFriends then
            if v33.filter == v20.All then
                return (v5.List.join(v36.onlineFriends, v36.offlineFriends));
            elseif v33.filter == v20.Offline then
                return v36.offlineFriends;
            elseif v33.filter == v20.Online then
                return v36.onlineFriends;
            elseif l_FFlagConnectionManagementChips_0 and v33.filter == v20.Trusted and v34 then
                return v37;
            else
                local l_onlineFriends_0 = v36.onlineFriends;
                v45 = v5.List.filter(l_onlineFriends_0, function(v47) --[[ Line: 115 ]]
                    -- upvalues: l_PresenceType_1 (ref)
                    return v47.presence and v47.presence.userPresenceType == l_PresenceType_1.InGame;
                end);
            end;
        end;
        return v45;
    end, l_dependencyArray_0(v33.filter, v36.onlineFriends, v36.offlineFriends, v37, v34));
    local v53 = v4.useMemo(function() --[[ Line: 132 ]]
        -- upvalues: v5 (ref), v48 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_UserLibConstants_0 (ref), v25 (ref), l_PresenceType_0 (ref)
        return v5.List.map(v48, function(v49, _) --[[ Line: 133 ]]
            -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_UserLibConstants_0 (ref), v25 (ref), l_PresenceType_0 (ref)
            local v51 = l_getRbxthumbWithTypeSizeAndOptions_0(v49.id, l_UserLibConstants_0.RbxthumbTypes.Avatar, 352);
            local v52 = if v49.presence then v25[v49.presence.userPresenceType] else l_PresenceType_0.Offline;
            return {
                id = v49.id, 
                username = "", 
                thumbnail = v51, 
                userPresenceType = v52, 
                universeId = v49.presence and v49.presence.universeId or nil, 
                lastLocation = if v49.presence then v49.presence.lastLocation else nil
            };
        end);
    end, {
        v48
    });
    return v4.createElement(v14, {
        totalFriendCount = v30, 
        friends = if l_FFlagConnectionManagementChips_0 then v53 or {} else v53, 
        fetchMoreFriends = if not v36 or v36.isEndOfList then nil else v36.fetchMoreFriends, 
        refreshFriends = v36.refreshFriendsData, 
        enableDisplayNamePolicy = v32, 
        localUserId = v28
    });
end;
return FriendsLandingContainer;