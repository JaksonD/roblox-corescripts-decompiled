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
return function(v46) --[[ Line: 74 ]] --[[ Name: AddFriendsContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), v28 (copy), l_getSessionIdByKey_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), v29 (copy), l_AddFriendsSelector_0 (copy), v10 (copy), l_AnalyticsSetup_0 (copy), l_dependencyArray_0 (copy), l_FriendsNetworking_0 (copy), v9 (copy), v11 (copy), l_FFlagAddFriendsSessionId_0 (copy), v7 (copy), v23 (copy), l_RecommendationSourceEnum_0 (copy), l_ContextualInfoTypes_0 (copy), l_RoduxFriends_0 (copy), l_RoduxAnalytics_0 (copy), l_FFlagAddFriendsPYMKPresence_0 (copy), v24 (copy), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (copy), l_EventNames_0 (copy), l_BreakpointConfig_0 (copy), v34 (copy), v36 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), l_reportPromiseLoadingTimeWrapper_0 (copy), l_Namespaces_0 (copy), v30 (copy), l_FFlagConnectionsHubLayerExposure_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v37 (copy)
    local v47 = l_useNavigation_0();
    local v48 = l_useDispatch_0();
    local v49 = l_useLocalization_0({
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        friendAddedText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendAdded" or "Feature.Friends.Action.ConnectionAdded", 
        requestIgnoredText = "Feature.AddFriends.Action.RequestIgnored", 
        allRequestsIgnoredText = "Feature.Profile.Action.AllRequestsIgnored", 
        allRequestsIgnoredBackgroundedText = "Feature.AddFriends.Label.DeclineAllBackgrounded", 
        requestSentText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendRequestSent" or "Feature.Friends.Action.ConnectionRequestSent"
    });
    local v50 = l_useLocalUserId_0();
    local v51 = l_useSelector_0(v28);
    local v53 = l_useSelector_0(function(v52) --[[ Line: 93 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        return l_getSessionIdByKey_0(v52)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    end);
    local v54 = l_useSelector_0(v29);
    local v56 = l_useSelector_0(function(v55) --[[ Line: 98 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v55, "Friends.requests.nextPageCursor");
    end);
    local v57 = v10.useMemo(function() --[[ Line: 102 ]]
        -- upvalues: l_AnalyticsSetup_0 (ref), v50 (copy), v53 (copy)
        return l_AnalyticsSetup_0({
            infoForAllEvents = {
                uid = v50, 
                recommendationSessionId = v53
            }
        }).fireAnalyticsEvent;
    end, l_dependencyArray_0(v50, v53));
    local v59 = v10.useCallback(function(v58) --[[ Line: 111 ]]
        -- upvalues: v48 (copy), l_FriendsNetworking_0 (ref)
        return v48(l_FriendsNetworking_0.GetFriendRequestsCount.API(v58));
    end, l_dependencyArray_0(v48));
    local v61 = v10.useCallback(function(v60) --[[ Line: 115 ]]
        -- upvalues: v48 (copy), l_FriendsNetworking_0 (ref)
        return v48(l_FriendsNetworking_0.ClearNewFriendRequests.API({
            currentUserId = v60
        }));
    end, l_dependencyArray_0(v48));
    local v75 = v10.useCallback(function(v62) --[[ Line: 121 ]]
        -- upvalues: v9 (ref), v11 (ref), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref), v48 (copy), l_FriendsNetworking_0 (ref), v23 (ref)
        local function v69(v63) --[[ Line: 123 ]]
            local v64 = {};
            local v65 = {};
            for _, v67 in pairs(v63) do
                table.insert(v64, v67.id);
                local l_sourceUniverseId_0 = v67.friendRequest.sourceUniverseId;
                if l_sourceUniverseId_0 ~= nil and l_sourceUniverseId_0 ~= 0 then
                    table.insert(v65, l_sourceUniverseId_0);
                end;
            end;
            return {
                userIds = v64, 
                universeIds = v65
            };
        end;
        return v9.new(function(v70, v71) --[[ Line: 139 ]]
            -- upvalues: v62 (ref), v11 (ref), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref), v48 (ref), l_FriendsNetworking_0 (ref), v69 (copy), v23 (ref), v9 (ref)
            v62 = v11.join(v62 or {}, {
                currentUserId = v62.localUserId, 
                sessionId = if l_FFlagAddFriendsSessionId_0 then v7.getSessionId() else nil
            });
            v48(l_FriendsNetworking_0.GetFriendRequests.API(v62)):andThen(function(v72) --[[ Line: 145 ]]
                -- upvalues: v69 (ref), v48 (ref), l_FriendsNetworking_0 (ref), v23 (ref), v9 (ref), v70 (copy), v71 (copy)
                local v73 = v69(v72.responseBody.data);
                local v74 = {};
                if next(v73.userIds) ~= nil then
                    table.insert(v74, v48(l_FriendsNetworking_0.GetFollowingExists.API({
                        targetUserIds = v73.userIds
                    })));
                end;
                if next(v73.universeIds) ~= nil then
                    table.insert(v74, v48(v23.GetExperiencesDetails.API(v73.universeIds)));
                end;
                v9.all(v74):andThen(function() --[[ Line: 161 ]]
                    -- upvalues: v70 (ref), v72 (copy)
                    v70(v72);
                end):catch(v71);
            end):catch(v71);
        end);
    end, l_dependencyArray_0(v48));
    local v87 = v10.useCallback(function(v76) --[[ Line: 170 ]]
        -- upvalues: v48 (copy), l_FriendsNetworking_0 (ref), l_RecommendationSourceEnum_0 (ref), v11 (ref), l_ContextualInfoTypes_0 (ref), l_RoduxFriends_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), v9 (ref), l_FFlagAddFriendsPYMKPresence_0 (ref), v24 (ref), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (ref), v57 (copy), l_EventNames_0 (ref)
        return v48(l_FriendsNetworking_0.GetFriendRecommendationsFromUserId.API({
            targetUserId = v76.localUserId, 
            source = l_RecommendationSourceEnum_0.AddFriendsPage
        })):andThen(function(v77) --[[ Line: 175 ]]
            -- upvalues: v11 (ref), l_ContextualInfoTypes_0 (ref), v48 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), v9 (ref)
            local l_data_0 = v77.responseBody.data;
            local v80 = v11.map(l_data_0, function(v79) --[[ Line: 177 ]]
                -- upvalues: l_ContextualInfoTypes_0 (ref)
                if v79.contextType == l_ContextualInfoTypes_0.Contacts then
                    return v79.contactId;
                else
                    return v79.id;
                end;
            end);
            v48(l_RoduxFriends_0.Actions.RecommendationSourceCreated({
                source = l_RecommendationSourceEnum_0.AddFriendsPage, 
                recommendationIds = v80
            }));
            local l_recommendationRequestId_0 = v77.responseBody.recommendationRequestId;
            v48(l_RoduxAnalytics_0.Actions.SessionIdUpdated({
                sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
                sessionId = l_recommendationRequestId_0
            }));
            return v9.resolve(v77);
        end):andThen(function(v82) --[[ Line: 194 ]]
            -- upvalues: l_FFlagAddFriendsPYMKPresence_0 (ref), v11 (ref), l_ContextualInfoTypes_0 (ref), v48 (ref), v24 (ref), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (ref), v57 (ref), l_EventNames_0 (ref), v9 (ref)
            if l_FFlagAddFriendsPYMKPresence_0 then
                local l_data_1 = v82.responseBody.data;
                local v86 = v11.reduce(l_data_1, function(v84, v85) --[[ Line: 197 ]]
                    -- upvalues: l_ContextualInfoTypes_0 (ref)
                    if v85.contextType ~= l_ContextualInfoTypes_0.Contacts then
                        table.insert(v84, v85.id);
                    end;
                    return v84;
                end, {});
                if #v86 > 0 then
                    v48(v24.GetPresencesFromUserIds.API(v86));
                    if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then
                        v57(l_EventNames_0.PYMKUserPresenceLoad);
                    end;
                end;
                return v9.resolve();
            else
                return;
            end;
        end);
    end, l_dependencyArray_0(v48, if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v57 else nil));
    local v89 = l_useSelector_0(function(v88) --[[ Line: 217 ]]
        return v88.ScreenSize;
    end).X >= l_BreakpointConfig_0.getMinWidthFor(v34.Keys.Medium);
    local v90 = v10.useCallback(function() --[[ Line: 223 ]]
        -- upvalues: v89 (copy)
        if v89 then
            return 50;
        else
            return 25;
        end;
    end, l_dependencyArray_0(v89));
    local v97 = v10.useCallback(function(_, v92, v93) --[[ Line: 227 ]]
        -- upvalues: v57 (copy), l_EventNames_0 (ref)
        v57(l_EventNames_0.AddFriendsPageLoadingTime, {
            status = v92.status, 
            loadingTime = v93, 
            statValue = v93
        });
        local v94 = nil;
        local v95 = v92.result[3];
        if v95 then
            local v96 = v95.responseBody.data or {};
            v94 = v96 and #v96;
        else
            v94 = 0;
        end;
        v57(l_EventNames_0.PageLoad, {
            recommendationCount = v94, 
            status = v92.status
        });
    end, l_dependencyArray_0(v57));
    local v99 = v10.useCallback(function(v98) --[[ Line: 249 ]]
        -- upvalues: v48 (copy), v36 (ref)
        if not v98 then
            return;
        else
            v48(v36.Actions.SetCurrentToastMessage({
                isLocalized = true, 
                toastMessage = v98.toastTitle, 
                toastIcon = v98.iconImage
            }));
            return;
        end;
    end, l_dependencyArray_0(v47));
    local v102 = v10.useCallback(function(v100, v101) --[[ Line: 262 ]]
        -- upvalues: v99 (copy), v49 (copy)
        return function(...) --[[ Line: 263 ]]
            -- upvalues: v100 (copy), v99 (ref), v101 (copy), v49 (ref)
            return v100(...):andThen(function() --[[ Line: 265 ]]
                -- upvalues: v99 (ref), v101 (ref)
                v99(v101);
            end):catch(function() --[[ Line: 268 ]]
                -- upvalues: v99 (ref), v49 (ref)
                v99({
                    toastTitle = v49.networkErrorText
                });
            end);
        end;
    end, l_dependencyArray_0(v99, v49.networkErrorText));
    local v103 = v10.useCallback(function() --[[ Line: 274 ]]
        -- upvalues: v9 (ref), v59 (copy), v50 (copy), v75 (copy), l_FFlagAddFriendsUserListEnabled_0 (ref), v90 (copy), v87 (copy)
        return v9.all({
            v59(v50), 
            v75({
                isRefresh = true, 
                localUserId = v50, 
                limit = l_FFlagAddFriendsUserListEnabled_0 and 25 or v90()
            }), 
            v87({
                localUserId = v50
            })
        });
    end, {});
    local v106 = v10.useCallback(v102(function() --[[ Line: 287 ]]
        -- upvalues: l_FFlagAddFriendsSessionId_0 (ref), v7 (ref), l_reportPromiseLoadingTimeWrapper_0 (ref), v103 (copy), v97 (copy), v9 (ref)
        if l_FFlagAddFriendsSessionId_0 then
            v7.initializeSession();
        end;
        return l_reportPromiseLoadingTimeWrapper_0(v103, function() --[[ Line: 293 ]]
            return {
                fetch = "add_friends_page_load"
            };
        end, {
            fireEvent = v97
        })():andThen(function(v104) --[[ Line: 298 ]]
            -- upvalues: v9 (ref)
            return v9.resolve(v104);
        end):catch(function(_) --[[ Line: 301 ]]

        end);
    end), l_dependencyArray_0(v87, v75, v59, v50));
    local v108 = v10.useCallback(v102(function(v107) --[[ Line: 307 ]]
        -- upvalues: v75 (copy), l_FFlagAddFriendsUserListEnabled_0 (ref), v90 (copy), v50 (copy)
        return v75({
            limit = l_FFlagAddFriendsUserListEnabled_0 and 25 or v90(), 
            cursor = v107, 
            localUserId = v50
        });
    end), l_dependencyArray_0(if l_FFlagAddFriendsUserListEnabled_0 then nil else v90));
    local v110 = v10.useCallback(function(v109) --[[ Line: 317 ]]
        -- upvalues: v57 (copy), l_EventNames_0 (ref), l_Namespaces_0 (ref)
        v57(l_EventNames_0.ShowMoreBtnClick, {
            namespace = if v109 == l_Namespaces_0.FriendRequests then l_Namespaces_0.FriendRequests else l_Namespaces_0.PYMK
        });
    end, l_dependencyArray_0(v57));
    local v112 = v10.useCallback(function(v111) --[[ Line: 323 ]]
        -- upvalues: v56 (copy), v108 (copy), v110 (copy), v30 (ref)
        if v56 then
            v108(v56, v111);
        end;
        v110(v30.FriendRequests);
    end, l_dependencyArray_0(v54, v108, v56));
    local v113 = v10.useCallback(function() --[[ Line: 331 ]]
        -- upvalues: v57 (copy), l_EventNames_0 (ref)
        v57(l_EventNames_0.UserSearchClick);
    end, l_dependencyArray_0(v57));
    v10.useEffect(function() --[[ Line: 335 ]]
        -- upvalues: l_FFlagConnectionsHubLayerExposure_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v106 (copy), v61 (copy), v50 (copy), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref)
        if l_FFlagConnectionsHubLayerExposure_0 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ConnectionsHubExposureLayer);
        end;
        v106();
        v61(v50);
        return function() --[[ Line: 343 ]]
            -- upvalues: v61 (ref), v50 (ref), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref)
            v61(v50);
            if l_FFlagAddFriendsSessionId_0 then
                v7.destroySession();
            end;
        end;
    end, {});
    local v114 = v51 and #v51 or 0;
    local v115 = if l_FFlagAddFriendsUserListEnabled_0 then v114 > 0 and 10 or 25 else v114 > 0 and 5 or 6;
    return v10.createElement(v37, {
        initialRequestsRows = v115, 
        requestsPageSize = l_FFlagAddFriendsUserListEnabled_0 and 25 or v90(), 
        navigateToLuaAppPages = v46.navigateToLuaAppPages, 
        friendRecommendationsSessionId = v53, 
        friendRecommendations = v51, 
        friendRequests = v54, 
        handleLoadMoreRequests = v112, 
        refreshPage = v106, 
        fireSearchbarPressedEvent = v113, 
        fireOnShowMore = v110
    });
end;