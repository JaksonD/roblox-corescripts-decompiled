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
return function(v45) --[[ Line: 73 ]] --[[ Name: AddFriendsContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), v28 (copy), l_getSessionIdByKey_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), v29 (copy), l_AddFriendsSelector_0 (copy), v10 (copy), l_AnalyticsSetup_0 (copy), l_dependencyArray_0 (copy), l_FriendsNetworking_0 (copy), v9 (copy), v11 (copy), l_FFlagAddFriendsSessionId_0 (copy), v7 (copy), v23 (copy), l_RecommendationSourceEnum_0 (copy), l_ContextualInfoTypes_0 (copy), l_RoduxFriends_0 (copy), l_RoduxAnalytics_0 (copy), l_FFlagAddFriendsPYMKPresence_0 (copy), v24 (copy), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (copy), l_EventNames_0 (copy), l_BreakpointConfig_0 (copy), v34 (copy), v36 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), l_reportPromiseLoadingTimeWrapper_0 (copy), l_Namespaces_0 (copy), v30 (copy), l_FFlagConnectionsHubLayerExposure_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v37 (copy)
    local v46 = l_useNavigation_0();
    local v47 = l_useDispatch_0();
    local v48 = l_useLocalization_0({
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        friendAddedText = "Feature.Friends.Action.ConnectionAdded", 
        requestIgnoredText = "Feature.AddFriends.Action.RequestIgnored", 
        allRequestsIgnoredText = "Feature.Profile.Action.AllRequestsIgnored", 
        allRequestsIgnoredBackgroundedText = "Feature.AddFriends.Label.DeclineAllBackgrounded", 
        requestSentText = "Feature.Friends.Action.ConnectionRequestSent"
    });
    local v49 = l_useLocalUserId_0();
    local v50 = l_useSelector_0(v28);
    local v52 = l_useSelector_0(function(v51) --[[ Line: 88 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        return l_getSessionIdByKey_0(v51)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    end);
    local v53 = l_useSelector_0(v29);
    local v55 = l_useSelector_0(function(v54) --[[ Line: 93 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v54, "Friends.requests.nextPageCursor");
    end);
    local v56 = v10.useMemo(function() --[[ Line: 97 ]]
        -- upvalues: l_AnalyticsSetup_0 (ref), v49 (copy), v52 (copy)
        return l_AnalyticsSetup_0({
            infoForAllEvents = {
                uid = v49, 
                recommendationSessionId = v52
            }
        }).fireAnalyticsEvent;
    end, l_dependencyArray_0(v49, v52));
    local v58 = v10.useCallback(function(v57) --[[ Line: 106 ]]
        -- upvalues: v47 (copy), l_FriendsNetworking_0 (ref)
        return v47(l_FriendsNetworking_0.GetFriendRequestsCount.API(v57));
    end, l_dependencyArray_0(v47));
    local v60 = v10.useCallback(function(v59) --[[ Line: 110 ]]
        -- upvalues: v47 (copy), l_FriendsNetworking_0 (ref)
        return v47(l_FriendsNetworking_0.ClearNewFriendRequests.API({
            currentUserId = v59
        }));
    end, l_dependencyArray_0(v47));
    local v74 = v10.useCallback(function(v61) --[[ Line: 116 ]]
        -- upvalues: v9 (ref), v11 (ref), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref), v47 (copy), l_FriendsNetworking_0 (ref), v23 (ref)
        local function v68(v62) --[[ Line: 118 ]]
            local v63 = {};
            local v64 = {};
            for _, v66 in pairs(v62) do
                table.insert(v63, v66.id);
                local l_sourceUniverseId_0 = v66.friendRequest.sourceUniverseId;
                if l_sourceUniverseId_0 ~= nil and l_sourceUniverseId_0 ~= 0 then
                    table.insert(v64, l_sourceUniverseId_0);
                end;
            end;
            return {
                userIds = v63, 
                universeIds = v64
            };
        end;
        return v9.new(function(v69, v70) --[[ Line: 134 ]]
            -- upvalues: v61 (ref), v11 (ref), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref), v47 (ref), l_FriendsNetworking_0 (ref), v68 (copy), v23 (ref), v9 (ref)
            v61 = v11.join(v61 or {}, {
                currentUserId = v61.localUserId, 
                sessionId = if l_FFlagAddFriendsSessionId_0 then v7.getSessionId() else nil
            });
            v47(l_FriendsNetworking_0.GetFriendRequests.API(v61)):andThen(function(v71) --[[ Line: 140 ]]
                -- upvalues: v68 (ref), v47 (ref), l_FriendsNetworking_0 (ref), v23 (ref), v9 (ref), v69 (copy), v70 (copy)
                local v72 = v68(v71.responseBody.data);
                local v73 = {};
                if next(v72.userIds) ~= nil then
                    table.insert(v73, v47(l_FriendsNetworking_0.GetFollowingExists.API({
                        targetUserIds = v72.userIds
                    })));
                end;
                if next(v72.universeIds) ~= nil then
                    table.insert(v73, v47(v23.GetExperiencesDetails.API(v72.universeIds)));
                end;
                v9.all(v73):andThen(function() --[[ Line: 156 ]]
                    -- upvalues: v69 (ref), v71 (copy)
                    v69(v71);
                end):catch(v70);
            end):catch(v70);
        end);
    end, l_dependencyArray_0(v47));
    local v86 = v10.useCallback(function(v75) --[[ Line: 165 ]]
        -- upvalues: v47 (copy), l_FriendsNetworking_0 (ref), l_RecommendationSourceEnum_0 (ref), v11 (ref), l_ContextualInfoTypes_0 (ref), l_RoduxFriends_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), v9 (ref), l_FFlagAddFriendsPYMKPresence_0 (ref), v24 (ref), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (ref), v56 (copy), l_EventNames_0 (ref)
        return v47(l_FriendsNetworking_0.GetFriendRecommendationsFromUserId.API({
            targetUserId = v75.localUserId, 
            source = l_RecommendationSourceEnum_0.AddFriendsPage
        })):andThen(function(v76) --[[ Line: 170 ]]
            -- upvalues: v11 (ref), l_ContextualInfoTypes_0 (ref), v47 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), v9 (ref)
            local l_data_0 = v76.responseBody.data;
            local v79 = v11.map(l_data_0, function(v78) --[[ Line: 172 ]]
                -- upvalues: l_ContextualInfoTypes_0 (ref)
                if v78.contextType == l_ContextualInfoTypes_0.Contacts then
                    return v78.contactId;
                else
                    return v78.id;
                end;
            end);
            v47(l_RoduxFriends_0.Actions.RecommendationSourceCreated({
                source = l_RecommendationSourceEnum_0.AddFriendsPage, 
                recommendationIds = v79
            }));
            local l_recommendationRequestId_0 = v76.responseBody.recommendationRequestId;
            v47(l_RoduxAnalytics_0.Actions.SessionIdUpdated({
                sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
                sessionId = l_recommendationRequestId_0
            }));
            return v9.resolve(v76);
        end):andThen(function(v81) --[[ Line: 189 ]]
            -- upvalues: l_FFlagAddFriendsPYMKPresence_0 (ref), v11 (ref), l_ContextualInfoTypes_0 (ref), v47 (ref), v24 (ref), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (ref), v56 (ref), l_EventNames_0 (ref), v9 (ref)
            if l_FFlagAddFriendsPYMKPresence_0 then
                local l_data_1 = v81.responseBody.data;
                local v85 = v11.reduce(l_data_1, function(v83, v84) --[[ Line: 192 ]]
                    -- upvalues: l_ContextualInfoTypes_0 (ref)
                    if v84.contextType ~= l_ContextualInfoTypes_0.Contacts then
                        table.insert(v83, v84.id);
                    end;
                    return v83;
                end, {});
                if #v85 > 0 then
                    v47(v24.GetPresencesFromUserIds.API(v85));
                    if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then
                        v56(l_EventNames_0.PYMKUserPresenceLoad);
                    end;
                end;
                return v9.resolve();
            else
                return;
            end;
        end);
    end, l_dependencyArray_0(v47, if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v56 else nil));
    local v88 = l_useSelector_0(function(v87) --[[ Line: 212 ]]
        return v87.ScreenSize;
    end).X >= l_BreakpointConfig_0.getMinWidthFor(v34.Keys.Medium);
    local v89 = v10.useCallback(function() --[[ Line: 218 ]]
        -- upvalues: v88 (copy)
        if v88 then
            return 50;
        else
            return 25;
        end;
    end, l_dependencyArray_0(v88));
    local v96 = v10.useCallback(function(_, v91, v92) --[[ Line: 222 ]]
        -- upvalues: v56 (copy), l_EventNames_0 (ref)
        v56(l_EventNames_0.AddFriendsPageLoadingTime, {
            status = v91.status, 
            loadingTime = v92, 
            statValue = v92
        });
        local v93 = nil;
        local v94 = v91.result[3];
        if v94 then
            local v95 = v94.responseBody.data or {};
            v93 = v95 and #v95;
        else
            v93 = 0;
        end;
        v56(l_EventNames_0.PageLoad, {
            recommendationCount = v93, 
            status = v91.status
        });
    end, l_dependencyArray_0(v56));
    local v98 = v10.useCallback(function(v97) --[[ Line: 244 ]]
        -- upvalues: v47 (copy), v36 (ref)
        if not v97 then
            return;
        else
            v47(v36.Actions.SetCurrentToastMessage({
                isLocalized = true, 
                toastMessage = v97.toastTitle, 
                toastIcon = v97.iconImage
            }));
            return;
        end;
    end, l_dependencyArray_0(v46));
    local v101 = v10.useCallback(function(v99, v100) --[[ Line: 257 ]]
        -- upvalues: v98 (copy), v48 (copy)
        return function(...) --[[ Line: 258 ]]
            -- upvalues: v99 (copy), v98 (ref), v100 (copy), v48 (ref)
            return v99(...):andThen(function() --[[ Line: 260 ]]
                -- upvalues: v98 (ref), v100 (ref)
                v98(v100);
            end):catch(function() --[[ Line: 263 ]]
                -- upvalues: v98 (ref), v48 (ref)
                v98({
                    toastTitle = v48.networkErrorText
                });
            end);
        end;
    end, l_dependencyArray_0(v98, v48.networkErrorText));
    local v102 = v10.useCallback(function() --[[ Line: 269 ]]
        -- upvalues: v9 (ref), v58 (copy), v49 (copy), v74 (copy), l_FFlagAddFriendsUserListEnabled_0 (ref), v89 (copy), v86 (copy)
        return v9.all({
            v58(v49), 
            v74({
                isRefresh = true, 
                localUserId = v49, 
                limit = l_FFlagAddFriendsUserListEnabled_0 and 25 or v89()
            }), 
            v86({
                localUserId = v49
            })
        });
    end, {});
    local v105 = v10.useCallback(v101(function() --[[ Line: 282 ]]
        -- upvalues: l_FFlagAddFriendsSessionId_0 (ref), v7 (ref), l_reportPromiseLoadingTimeWrapper_0 (ref), v102 (copy), v96 (copy), v9 (ref)
        if l_FFlagAddFriendsSessionId_0 then
            v7.initializeSession();
        end;
        return l_reportPromiseLoadingTimeWrapper_0(v102, function() --[[ Line: 288 ]]
            return {
                fetch = "add_friends_page_load"
            };
        end, {
            fireEvent = v96
        })():andThen(function(v103) --[[ Line: 293 ]]
            -- upvalues: v9 (ref)
            return v9.resolve(v103);
        end):catch(function(_) --[[ Line: 296 ]]

        end);
    end), l_dependencyArray_0(v86, v74, v58, v49));
    local v107 = v10.useCallback(v101(function(v106) --[[ Line: 302 ]]
        -- upvalues: v74 (copy), l_FFlagAddFriendsUserListEnabled_0 (ref), v89 (copy), v49 (copy)
        return v74({
            limit = l_FFlagAddFriendsUserListEnabled_0 and 25 or v89(), 
            cursor = v106, 
            localUserId = v49
        });
    end), l_dependencyArray_0(if l_FFlagAddFriendsUserListEnabled_0 then nil else v89));
    local v109 = v10.useCallback(function(v108) --[[ Line: 312 ]]
        -- upvalues: v56 (copy), l_EventNames_0 (ref), l_Namespaces_0 (ref)
        v56(l_EventNames_0.ShowMoreBtnClick, {
            namespace = if v108 == l_Namespaces_0.FriendRequests then l_Namespaces_0.FriendRequests else l_Namespaces_0.PYMK
        });
    end, l_dependencyArray_0(v56));
    local v111 = v10.useCallback(function(v110) --[[ Line: 318 ]]
        -- upvalues: v55 (copy), v107 (copy), v109 (copy), v30 (ref)
        if v55 then
            v107(v55, v110);
        end;
        v109(v30.FriendRequests);
    end, l_dependencyArray_0(v53, v107, v55));
    local v112 = v10.useCallback(function() --[[ Line: 326 ]]
        -- upvalues: v56 (copy), l_EventNames_0 (ref)
        v56(l_EventNames_0.UserSearchClick);
    end, l_dependencyArray_0(v56));
    v10.useEffect(function() --[[ Line: 330 ]]
        -- upvalues: l_FFlagConnectionsHubLayerExposure_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v105 (copy), v60 (copy), v49 (copy), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref)
        if l_FFlagConnectionsHubLayerExposure_0 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ConnectionsHubExposureLayer);
        end;
        v105();
        v60(v49);
        return function() --[[ Line: 338 ]]
            -- upvalues: v60 (ref), v49 (ref), l_FFlagAddFriendsSessionId_0 (ref), v7 (ref)
            v60(v49);
            if l_FFlagAddFriendsSessionId_0 then
                v7.destroySession();
            end;
        end;
    end, {});
    local v113 = v50 and #v50 or 0;
    local v114 = if l_FFlagAddFriendsUserListEnabled_0 then v113 > 0 and 10 or 25 else v113 > 0 and 5 or 6;
    return v10.createElement(v37, {
        initialRequestsRows = v114, 
        requestsPageSize = l_FFlagAddFriendsUserListEnabled_0 and 25 or v89(), 
        navigateToLuaAppPages = v45.navigateToLuaAppPages, 
        friendRecommendationsSessionId = v52, 
        friendRecommendations = v50, 
        friendRequests = v53, 
        handleLoadMoreRequests = v111, 
        refreshPage = v105, 
        fireSearchbarPressedEvent = v112, 
        fireOnShowMore = v109
    });
end;