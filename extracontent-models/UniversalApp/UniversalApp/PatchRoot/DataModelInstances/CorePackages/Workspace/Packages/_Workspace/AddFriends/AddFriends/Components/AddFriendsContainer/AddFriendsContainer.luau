local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_IXPService_0 = game:GetService("IXPService");
local v3 = require(l_script_FirstAncestor_0.Analytics);
local l_AnalyticsSetup_0 = v3.AnalyticsSetup;
local l_EventNames_0 = v3.EventNames;
local l_Namespaces_0 = v3.Namespaces;
local v7 = require(l_script_FirstAncestor_0.Analytics.sessionUtil);
local v8 = require(l_Parent_0.SocialCommon);
local v9 = require(l_Parent_0.Promise);
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.Dash);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v17 = require(l_Parent_0.AddFriendsState);
local l_AddFriendsSelector_0 = v17.AddFriendsSelector;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_RoduxFriends_0 = v17.RoduxFriends;
local l_RoduxAnalytics_0 = v17.RoduxAnalytics;
local l_FriendsNetworking_0 = v17.Networking.FriendsNetworking;
local v23 = require(l_script_FirstAncestor_0.Networking.NetworkingGames);
local v24 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local l_RecommendationSourceEnum_0 = v8.Enums.RecommendationSourceEnum;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_getSessionIdByKey_0 = l_RoduxAnalytics_0.Selectors.getSessionIdByKey;
local v28 = require(script.Parent.getFriendRecommendationsFromState);
local v29 = require(script.Parent.getFriendRequestsFromState);
local v30 = require(l_script_FirstAncestor_0.Enums.ShowMoreSectionTypeEnum);
local v31 = require(l_Parent_0.SocialLuaAnalytics);
local l_ContextualInfoTypes_0 = v8.Enums.ContextualInfoTypes;
local l_reportPromiseLoadingTimeWrapper_0 = v31.Analytics.Timing.reportPromiseLoadingTimeWrapper;
local v34 = require(l_Parent_0.Responsive);
local l_BreakpointConfig_0 = v34.BreakpointConfig;
local v36 = require(l_Parent_0.ToastRodux);
local v37 = require(script.Parent.Parent.AddFriendsPage);
local _ = require(script.Parent.Parent.AddFriendsTile.getFriendRequestHandlersExtraProps);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_FFlagConnectionsHubLayerExposure_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsHubLayerExposure;
local l_FFlagAddFriendsPYMKPresence_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsPYMKPresence;
local l_FFlagAddFriendsPYMKPresenceAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsPYMKPresenceAnalytics;
local l_FFlagAddFriendsUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsUserListEnabled;
local l_FFlagAddFriendsSessionId_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsSessionId;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v47) --[[ Line: 77 ]] --[[ Name: AddFriendsContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), v28 (copy), l_getSessionIdByKey_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), v29 (copy), l_AddFriendsSelector_0 (copy), v10 (copy), l_AnalyticsSetup_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FriendsNetworking_0 (copy), v9 (copy), v11 (copy), l_FFlagAddFriendsSessionId_0 (copy), v7 (copy), v23 (copy), l_RecommendationSourceEnum_0 (copy), l_ContextualInfoTypes_0 (copy), l_RoduxFriends_0 (copy), l_RoduxAnalytics_0 (copy), l_FFlagAddFriendsPYMKPresence_0 (copy), v24 (copy), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (copy), l_EventNames_0 (copy), l_BreakpointConfig_0 (copy), v34 (copy), v36 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), l_reportPromiseLoadingTimeWrapper_0 (copy), l_Namespaces_0 (copy), v30 (copy), l_FFlagConnectionsHubLayerExposure_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v37 (copy)
    local v48 = l_useNavigation_0();
    local v49 = l_useDispatch_0();
    local v50 = l_useLocalization_0({
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        friendAddedText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendAdded" or "Feature.Friends.Action.ConnectionAdded", 
        requestIgnoredText = "Feature.AddFriends.Action.RequestIgnored", 
        allRequestsIgnoredText = "Feature.Profile.Action.AllRequestsIgnored", 
        allRequestsIgnoredBackgroundedText = "Feature.AddFriends.Label.DeclineAllBackgrounded", 
        requestSentText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendRequestSent" or "Feature.Friends.Action.ConnectionRequestSent"
    });
    local v51 = l_useLocalUserId_0();
    local v52 = l_useSelector_0(v28);
    local v54 = l_useSelector_0(function(v53) --[[ Line: 96 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        return l_getSessionIdByKey_0(v53)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    end);
    local v55 = l_useSelector_0(v29);
    local v57 = l_useSelector_0(function(v56) --[[ Line: 101 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v56, "Friends.requests.nextPageCursor");
    end);
    local v58 = v10.useMemo(function() --[[ Line: 106 ]]
        -- upvalues: l_AnalyticsSetup_0 (ref), v51 (copy), v54 (copy)
        return l_AnalyticsSetup_0({
            infoForAllEvents = {
                uid = v51, 
                recommendationSessionId = v54
            }
        }).fireAnalyticsEvent;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v51, 
        v54
    } else l_dependencyArray_0(v51, v54));
    local v60 = v10.useCallback(function(v59) --[[ Line: 119 ]]
        -- upvalues: v49 (copy), l_FriendsNetworking_0 (ref)
        return v49(l_FriendsNetworking_0.GetFriendRequestsCount.API(v59));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v49
    } else l_dependencyArray_0(v49));
    local v62 = v10.useCallback(function(v61) --[[ Line: 123 ]]
        -- upvalues: v49 (copy), l_FriendsNetworking_0 (ref)
        return v49(l_FriendsNetworking_0.ClearNewFriendRequests.API({
            currentUserId = v61
        }));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v49
    } else l_dependencyArray_0(v49));
    local v76 = v10.useCallback(function(v63) --[[ Line: 129 ]]
        -- upvalues: v9 (ref), v11 (ref), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref), v49 (copy), l_FriendsNetworking_0 (ref), v23 (ref)
        local function v70(v64) --[[ Line: 131 ]]
            local v65 = {};
            local v66 = {};
            for _, v68 in pairs(v64) do
                table.insert(v65, v68.id);
                local l_sourceUniverseId_0 = v68.friendRequest.sourceUniverseId;
                if l_sourceUniverseId_0 ~= nil and l_sourceUniverseId_0 ~= 0 then
                    table.insert(v66, l_sourceUniverseId_0);
                end;
            end;
            return {
                userIds = v65, 
                universeIds = v66
            };
        end;
        return v9.new(function(v71, v72) --[[ Line: 147 ]]
            -- upvalues: v63 (ref), v11 (ref), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref), v49 (ref), l_FriendsNetworking_0 (ref), v70 (copy), v23 (ref), v9 (ref)
            v63 = v11.join(v63 or {}, {
                currentUserId = v63.localUserId, 
                sessionId = if l_FFlagAddFriendsSessionId_0 then v7.getSessionId() else nil
            });
            v49(l_FriendsNetworking_0.GetFriendRequests.API(v63)):andThen(function(v73) --[[ Line: 153 ]]
                -- upvalues: v70 (ref), v49 (ref), l_FriendsNetworking_0 (ref), v23 (ref), v9 (ref), v71 (copy), v72 (copy)
                local v74 = v70(v73.responseBody.data);
                local v75 = {};
                if next(v74.userIds) ~= nil then
                    table.insert(v75, v49(l_FriendsNetworking_0.GetFollowingExists.API({
                        targetUserIds = v74.userIds
                    })));
                end;
                if next(v74.universeIds) ~= nil then
                    table.insert(v75, v49(v23.GetExperiencesDetails.API(v74.universeIds)));
                end;
                v9.all(v75):andThen(function() --[[ Line: 169 ]]
                    -- upvalues: v71 (ref), v73 (copy)
                    v71(v73);
                end):catch(v72);
            end):catch(v72);
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v49
    } else l_dependencyArray_0(v49));
    local v88 = v10.useCallback(function(v77) --[[ Line: 179 ]]
        -- upvalues: v49 (copy), l_FriendsNetworking_0 (ref), l_RecommendationSourceEnum_0 (ref), v11 (ref), l_ContextualInfoTypes_0 (ref), l_RoduxFriends_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), v9 (ref), l_FFlagAddFriendsPYMKPresence_0 (ref), v24 (ref), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (ref), v58 (copy), l_EventNames_0 (ref)
        return v49(l_FriendsNetworking_0.GetFriendRecommendationsFromUserId.API({
            targetUserId = v77.localUserId, 
            source = l_RecommendationSourceEnum_0.AddFriendsPage
        })):andThen(function(v78) --[[ Line: 184 ]]
            -- upvalues: v11 (ref), l_ContextualInfoTypes_0 (ref), v49 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), v9 (ref)
            local l_data_0 = v78.responseBody.data;
            local v81 = v11.map(l_data_0, function(v80) --[[ Line: 186 ]]
                -- upvalues: l_ContextualInfoTypes_0 (ref)
                if v80.contextType == l_ContextualInfoTypes_0.Contacts then
                    return v80.contactId;
                else
                    return v80.id;
                end;
            end);
            v49(l_RoduxFriends_0.Actions.RecommendationSourceCreated({
                source = l_RecommendationSourceEnum_0.AddFriendsPage, 
                recommendationIds = v81
            }));
            local l_recommendationRequestId_0 = v78.responseBody.recommendationRequestId;
            v49(l_RoduxAnalytics_0.Actions.SessionIdUpdated({
                sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
                sessionId = l_recommendationRequestId_0
            }));
            return v9.resolve(v78);
        end):andThen(function(v83) --[[ Line: 203 ]]
            -- upvalues: l_FFlagAddFriendsPYMKPresence_0 (ref), v11 (ref), l_ContextualInfoTypes_0 (ref), v49 (ref), v24 (ref), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (ref), v58 (ref), l_EventNames_0 (ref), v9 (ref)
            if l_FFlagAddFriendsPYMKPresence_0 then
                local l_data_1 = v83.responseBody.data;
                local v87 = v11.reduce(l_data_1, function(v85, v86) --[[ Line: 206 ]]
                    -- upvalues: l_ContextualInfoTypes_0 (ref)
                    if v86.contextType ~= l_ContextualInfoTypes_0.Contacts then
                        table.insert(v85, v86.id);
                    end;
                    return v85;
                end, {});
                if #v87 > 0 then
                    v49(v24.GetPresencesFromUserIds.API(v87));
                    if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then
                        v58(l_EventNames_0.PYMKUserPresenceLoad);
                    end;
                end;
                return v9.resolve();
            else
                return;
            end;
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v49, 
        if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v58 else nil
    } else l_dependencyArray_0(v49, if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v58 else nil));
    local v90 = l_useSelector_0(function(v89) --[[ Line: 233 ]]
        return v89.ScreenSize;
    end).X >= l_BreakpointConfig_0.getMinWidthFor(v34.Keys.Medium);
    local v91 = v10.useCallback(function() --[[ Line: 239 ]]
        -- upvalues: v90 (copy)
        if v90 then
            return 50;
        else
            return 25;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v90
    } else l_dependencyArray_0(v90));
    local v98 = v10.useCallback(function(_, v93, v94) --[[ Line: 243 ]]
        -- upvalues: v58 (copy), l_EventNames_0 (ref)
        v58(l_EventNames_0.AddFriendsPageLoadingTime, {
            status = v93.status, 
            loadingTime = v94, 
            statValue = v94
        });
        local v95 = nil;
        local v96 = v93.result[3];
        if v96 then
            local v97 = v96.responseBody.data or {};
            v95 = v97 and #v97;
        else
            v95 = 0;
        end;
        v58(l_EventNames_0.PageLoad, {
            recommendationCount = v95, 
            status = v93.status
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v58
    } else l_dependencyArray_0(v58));
    local v100 = v10.useCallback(function(v99) --[[ Line: 265 ]]
        -- upvalues: v49 (copy), v36 (ref)
        if not v99 then
            return;
        else
            v49(v36.Actions.SetCurrentToastMessage({
                isLocalized = true, 
                toastMessage = v99.toastTitle, 
                toastIcon = v99.iconImage
            }));
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v48
    } else l_dependencyArray_0(v48));
    local v103 = v10.useCallback(function(v101, v102) --[[ Line: 279 ]]
        -- upvalues: v100 (copy), v50 (copy)
        return function(...) --[[ Line: 280 ]]
            -- upvalues: v101 (copy), v100 (ref), v102 (copy), v50 (ref)
            return v101(...):andThen(function() --[[ Line: 282 ]]
                -- upvalues: v100 (ref), v102 (ref)
                v100(v102);
            end):catch(function() --[[ Line: 285 ]]
                -- upvalues: v100 (ref), v50 (ref)
                v100({
                    toastTitle = v50.networkErrorText
                });
            end);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v100, 
        v50.networkErrorText
    } else l_dependencyArray_0(v100, v50.networkErrorText));
    local v104 = v10.useCallback(function() --[[ Line: 295 ]]
        -- upvalues: v9 (ref), v60 (copy), v51 (copy), v76 (copy), l_FFlagAddFriendsUserListEnabled_0 (ref), v91 (copy), v88 (copy)
        return v9.all({
            v60(v51), 
            v76({
                isRefresh = true, 
                localUserId = v51, 
                limit = l_FFlagAddFriendsUserListEnabled_0 and 25 or v91()
            }), 
            v88({
                localUserId = v51
            })
        });
    end, {});
    local v107 = v10.useCallback(v103(function() --[[ Line: 308 ]]
        -- upvalues: l_FFlagAddFriendsSessionId_0 (ref), v7 (ref), l_reportPromiseLoadingTimeWrapper_0 (ref), v104 (copy), v98 (copy), v9 (ref)
        if l_FFlagAddFriendsSessionId_0 then
            v7.initializeSession();
        end;
        return l_reportPromiseLoadingTimeWrapper_0(v104, function() --[[ Line: 314 ]]
            return {
                fetch = "add_friends_page_load"
            };
        end, {
            fireEvent = v98
        })():andThen(function(v105) --[[ Line: 319 ]]
            -- upvalues: v9 (ref)
            return v9.resolve(v105);
        end):catch(function(_) --[[ Line: 322 ]]

        end);
    end), if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v88, 
        v76, 
        v60, 
        v51
    } else l_dependencyArray_0(v88, v76, v60, v51));
    local v109 = v10.useCallback(v103(function(v108) --[[ Line: 330 ]]
        -- upvalues: v76 (copy), l_FFlagAddFriendsUserListEnabled_0 (ref), v91 (copy), v51 (copy)
        return v76({
            limit = l_FFlagAddFriendsUserListEnabled_0 and 25 or v91(), 
            cursor = v108, 
            localUserId = v51
        });
    end), if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        if l_FFlagAddFriendsUserListEnabled_0 then nil else v91
    } else l_dependencyArray_0(if l_FFlagAddFriendsUserListEnabled_0 then nil else v91));
    local v111 = v10.useCallback(function(v110) --[[ Line: 342 ]]
        -- upvalues: v58 (copy), l_EventNames_0 (ref), l_Namespaces_0 (ref)
        v58(l_EventNames_0.ShowMoreBtnClick, {
            namespace = if v110 == l_Namespaces_0.FriendRequests then l_Namespaces_0.FriendRequests else l_Namespaces_0.PYMK
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v58
    } else l_dependencyArray_0(v58));
    local v113 = v10.useCallback(function(v112) --[[ Line: 349 ]]
        -- upvalues: v57 (copy), v109 (copy), v111 (copy), v30 (ref)
        if v57 then
            v109(v57, v112);
        end;
        v111(v30.FriendRequests);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v55, 
        v109, 
        v57
    } else l_dependencyArray_0(v55, v109, v57));
    local v114 = v10.useCallback(function() --[[ Line: 361 ]]
        -- upvalues: v58 (copy), l_EventNames_0 (ref)
        v58(l_EventNames_0.UserSearchClick);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v58
    } else l_dependencyArray_0(v58));
    v10.useEffect(function() --[[ Line: 365 ]]
        -- upvalues: l_FFlagConnectionsHubLayerExposure_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v107 (copy), v62 (copy), v51 (copy), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref)
        if l_FFlagConnectionsHubLayerExposure_0 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ConnectionsHubExposureLayer);
        end;
        v107();
        v62(v51);
        return function() --[[ Line: 373 ]]
            -- upvalues: v62 (ref), v51 (ref), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref)
            v62(v51);
            if l_FFlagAddFriendsSessionId_0 then
                v7.destroySession();
            end;
        end;
    end, {});
    local v115 = v52 and #v52 or 0;
    local v116 = if l_FFlagAddFriendsUserListEnabled_0 then v115 > 0 and 10 or 25 else v115 > 0 and 5 or 6;
    return v10.createElement(v37, {
        initialRequestsRows = v116, 
        requestsPageSize = l_FFlagAddFriendsUserListEnabled_0 and 25 or v91(), 
        navigateToLuaAppPages = v47.navigateToLuaAppPages, 
        friendRecommendationsSessionId = v54, 
        friendRecommendations = v52, 
        friendRequests = v55, 
        handleLoadMoreRequests = v113, 
        refreshPage = v107, 
        fireSearchbarPressedEvent = v114, 
        fireOnShowMore = v111
    });
end;