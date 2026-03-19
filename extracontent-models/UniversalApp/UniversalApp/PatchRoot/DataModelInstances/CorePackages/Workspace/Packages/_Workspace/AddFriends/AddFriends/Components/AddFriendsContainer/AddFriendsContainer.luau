local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_IXPService_0 = game:GetService("IXPService");
local v3 = require(l_script_FirstAncestor_0.Analytics);
local l_AnalyticsSetup_0 = v3.AnalyticsSetup;
local l_EventNames_0 = v3.EventNames;
local l_Namespaces_0 = v3.Namespaces;
local v7 = require(l_Parent_0.SocialCommon);
local v8 = require(l_Parent_0.Promise);
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.Dash);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v16 = require(l_Parent_0.AddFriendsState);
local l_AddFriendsSelector_0 = v16.AddFriendsSelector;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_RoduxFriends_0 = v16.RoduxFriends;
local l_RoduxAnalytics_0 = v16.RoduxAnalytics;
local l_FriendsNetworking_0 = v16.Networking.FriendsNetworking;
local v22 = require(l_script_FirstAncestor_0.Networking.NetworkingGames);
local v23 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local l_RecommendationSourceEnum_0 = v7.Enums.RecommendationSourceEnum;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_getSessionIdByKey_0 = l_RoduxAnalytics_0.Selectors.getSessionIdByKey;
local v27 = require(script.Parent.getFriendRecommendationsFromState);
local v28 = require(script.Parent.getFriendRequestsFromState);
local v29 = require(l_script_FirstAncestor_0.Enums.ShowMoreSectionTypeEnum);
local v30 = require(l_Parent_0.SocialLuaAnalytics);
local l_ContextualInfoTypes_0 = v7.Enums.ContextualInfoTypes;
local l_reportPromiseLoadingTimeWrapper_0 = v30.Analytics.Timing.reportPromiseLoadingTimeWrapper;
local v33 = require(l_Parent_0.Responsive);
local l_BreakpointConfig_0 = v33.BreakpointConfig;
local v35 = require(l_Parent_0.ToastRodux);
local v36 = require(script.Parent.Parent.AddFriendsPage);
local _ = require(script.Parent.Parent.AddFriendsTile.getFriendRequestHandlersExtraProps);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_FFlagConnectionsHubLayerExposure_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsHubLayerExposure;
local l_FFlagAddFriendsPYMKPresence_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsPYMKPresence;
local l_FFlagAddFriendsPYMKPresenceAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsPYMKPresenceAnalytics;
local l_FFlagAddFriendsUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsUserListEnabled;
return function(v43) --[[ Line: 71 ]] --[[ Name: AddFriendsContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), v27 (copy), l_getSessionIdByKey_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), v28 (copy), l_AddFriendsSelector_0 (copy), v9 (copy), l_AnalyticsSetup_0 (copy), l_dependencyArray_0 (copy), l_FriendsNetworking_0 (copy), v8 (copy), v10 (copy), v22 (copy), l_RecommendationSourceEnum_0 (copy), l_ContextualInfoTypes_0 (copy), l_RoduxFriends_0 (copy), l_RoduxAnalytics_0 (copy), l_FFlagAddFriendsPYMKPresence_0 (copy), v23 (copy), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (copy), l_EventNames_0 (copy), l_BreakpointConfig_0 (copy), v33 (copy), v35 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), l_reportPromiseLoadingTimeWrapper_0 (copy), l_Namespaces_0 (copy), v29 (copy), l_FFlagConnectionsHubLayerExposure_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v36 (copy)
    local v44 = l_useNavigation_0();
    local v45 = l_useDispatch_0();
    local v46 = l_useLocalization_0({
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        friendAddedText = "Feature.Friends.Action.ConnectionAdded", 
        requestIgnoredText = "Feature.AddFriends.Action.RequestIgnored", 
        allRequestsIgnoredText = "Feature.Profile.Action.AllRequestsIgnored", 
        allRequestsIgnoredBackgroundedText = "Feature.AddFriends.Label.DeclineAllBackgrounded", 
        requestSentText = "Feature.Friends.Action.ConnectionRequestSent"
    });
    local v47 = l_useLocalUserId_0();
    local v48 = l_useSelector_0(v27);
    local v50 = l_useSelector_0(function(v49) --[[ Line: 86 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        return l_getSessionIdByKey_0(v49)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    end);
    local v51 = l_useSelector_0(v28);
    local v53 = l_useSelector_0(function(v52) --[[ Line: 91 ]]
        -- upvalues: l_AddFriendsSelector_0 (ref)
        return l_AddFriendsSelector_0(v52, "Friends.requests.nextPageCursor");
    end);
    local v54 = v9.useMemo(function() --[[ Line: 95 ]]
        -- upvalues: l_AnalyticsSetup_0 (ref), v47 (copy), v50 (copy)
        return l_AnalyticsSetup_0({
            infoForAllEvents = {
                uid = v47, 
                recommendationSessionId = v50
            }
        }).fireAnalyticsEvent;
    end, l_dependencyArray_0(v47, v50));
    local v56 = v9.useCallback(function(v55) --[[ Line: 104 ]]
        -- upvalues: v45 (copy), l_FriendsNetworking_0 (ref)
        return v45(l_FriendsNetworking_0.GetFriendRequestsCount.API(v55));
    end, l_dependencyArray_0(v45));
    local v58 = v9.useCallback(function(v57) --[[ Line: 108 ]]
        -- upvalues: v45 (copy), l_FriendsNetworking_0 (ref)
        return v45(l_FriendsNetworking_0.ClearNewFriendRequests.API({
            currentUserId = v57
        }));
    end, l_dependencyArray_0(v45));
    local v72 = v9.useCallback(function(v59) --[[ Line: 114 ]]
        -- upvalues: v8 (ref), v10 (ref), v45 (copy), l_FriendsNetworking_0 (ref), v22 (ref)
        local function v66(v60) --[[ Line: 116 ]]
            local v61 = {};
            local v62 = {};
            for _, v64 in pairs(v60) do
                table.insert(v61, v64.id);
                local l_sourceUniverseId_0 = v64.friendRequest.sourceUniverseId;
                if l_sourceUniverseId_0 ~= nil and l_sourceUniverseId_0 ~= 0 then
                    table.insert(v62, l_sourceUniverseId_0);
                end;
            end;
            return {
                userIds = v61, 
                universeIds = v62
            };
        end;
        return v8.new(function(v67, v68) --[[ Line: 132 ]]
            -- upvalues: v59 (ref), v10 (ref), v45 (ref), l_FriendsNetworking_0 (ref), v66 (copy), v22 (ref), v8 (ref)
            v59 = v10.join(v59 or {}, {
                currentUserId = v59.localUserId
            });
            v45(l_FriendsNetworking_0.GetFriendRequests.API(v59)):andThen(function(v69) --[[ Line: 137 ]]
                -- upvalues: v66 (ref), v45 (ref), l_FriendsNetworking_0 (ref), v22 (ref), v8 (ref), v67 (copy), v68 (copy)
                local v70 = v66(v69.responseBody.data);
                local v71 = {};
                if next(v70.userIds) ~= nil then
                    table.insert(v71, v45(l_FriendsNetworking_0.GetFollowingExists.API({
                        targetUserIds = v70.userIds
                    })));
                end;
                if next(v70.universeIds) ~= nil then
                    table.insert(v71, v45(v22.GetExperiencesDetails.API(v70.universeIds)));
                end;
                v8.all(v71):andThen(function() --[[ Line: 153 ]]
                    -- upvalues: v67 (ref), v69 (copy)
                    v67(v69);
                end):catch(v68);
            end):catch(v68);
        end);
    end, l_dependencyArray_0(v45));
    local v84 = v9.useCallback(function(v73) --[[ Line: 162 ]]
        -- upvalues: v45 (copy), l_FriendsNetworking_0 (ref), l_RecommendationSourceEnum_0 (ref), v10 (ref), l_ContextualInfoTypes_0 (ref), l_RoduxFriends_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), v8 (ref), l_FFlagAddFriendsPYMKPresence_0 (ref), v23 (ref), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (ref), v54 (copy), l_EventNames_0 (ref)
        return v45(l_FriendsNetworking_0.GetFriendRecommendationsFromUserId.API({
            targetUserId = v73.localUserId, 
            source = l_RecommendationSourceEnum_0.AddFriendsPage
        })):andThen(function(v74) --[[ Line: 167 ]]
            -- upvalues: v10 (ref), l_ContextualInfoTypes_0 (ref), v45 (ref), l_RoduxFriends_0 (ref), l_RecommendationSourceEnum_0 (ref), l_RoduxAnalytics_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref), v8 (ref)
            local l_data_0 = v74.responseBody.data;
            local v77 = v10.map(l_data_0, function(v76) --[[ Line: 169 ]]
                -- upvalues: l_ContextualInfoTypes_0 (ref)
                if v76.contextType == l_ContextualInfoTypes_0.Contacts then
                    return v76.contactId;
                else
                    return v76.id;
                end;
            end);
            v45(l_RoduxFriends_0.Actions.RecommendationSourceCreated({
                source = l_RecommendationSourceEnum_0.AddFriendsPage, 
                recommendationIds = v77
            }));
            local l_recommendationRequestId_0 = v74.responseBody.recommendationRequestId;
            v45(l_RoduxAnalytics_0.Actions.SessionIdUpdated({
                sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
                sessionId = l_recommendationRequestId_0
            }));
            return v8.resolve(v74);
        end):andThen(function(v79) --[[ Line: 186 ]]
            -- upvalues: l_FFlagAddFriendsPYMKPresence_0 (ref), v10 (ref), l_ContextualInfoTypes_0 (ref), v45 (ref), v23 (ref), l_FFlagAddFriendsPYMKPresenceAnalytics_0 (ref), v54 (ref), l_EventNames_0 (ref), v8 (ref)
            if l_FFlagAddFriendsPYMKPresence_0 then
                local l_data_1 = v79.responseBody.data;
                local v83 = v10.reduce(l_data_1, function(v81, v82) --[[ Line: 189 ]]
                    -- upvalues: l_ContextualInfoTypes_0 (ref)
                    if v82.contextType ~= l_ContextualInfoTypes_0.Contacts then
                        table.insert(v81, v82.id);
                    end;
                    return v81;
                end, {});
                if #v83 > 0 then
                    v45(v23.GetPresencesFromUserIds.API(v83));
                    if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then
                        v54(l_EventNames_0.PYMKUserPresenceLoad);
                    end;
                end;
                return v8.resolve();
            else
                return;
            end;
        end);
    end, l_dependencyArray_0(v45, if l_FFlagAddFriendsPYMKPresenceAnalytics_0 then v54 else nil));
    local v86 = l_useSelector_0(function(v85) --[[ Line: 209 ]]
        return v85.ScreenSize;
    end).X >= l_BreakpointConfig_0.getMinWidthFor(v33.Keys.Medium);
    local v87 = v9.useCallback(function() --[[ Line: 215 ]]
        -- upvalues: v86 (copy)
        if v86 then
            return 50;
        else
            return 25;
        end;
    end, l_dependencyArray_0(v86));
    local v94 = v9.useCallback(function(_, v89, v90) --[[ Line: 219 ]]
        -- upvalues: v54 (copy), l_EventNames_0 (ref)
        v54(l_EventNames_0.AddFriendsPageLoadingTime, {
            status = v89.status, 
            loadingTime = v90, 
            statValue = v90
        });
        local v91 = nil;
        local v92 = v89.result[3];
        if v92 then
            local v93 = v92.responseBody.data or {};
            v91 = v93 and #v93;
        else
            v91 = 0;
        end;
        v54(l_EventNames_0.PageLoad, {
            recommendationCount = v91, 
            status = v89.status
        });
    end, l_dependencyArray_0(v54));
    local v96 = v9.useCallback(function(v95) --[[ Line: 241 ]]
        -- upvalues: v45 (copy), v35 (ref)
        if not v95 then
            return;
        else
            v45(v35.Actions.SetCurrentToastMessage({
                isLocalized = true, 
                toastMessage = v95.toastTitle, 
                toastIcon = v95.iconImage
            }));
            return;
        end;
    end, l_dependencyArray_0(v44));
    local v99 = v9.useCallback(function(v97, v98) --[[ Line: 254 ]]
        -- upvalues: v96 (copy), v46 (copy)
        return function(...) --[[ Line: 255 ]]
            -- upvalues: v97 (copy), v96 (ref), v98 (copy), v46 (ref)
            return v97(...):andThen(function() --[[ Line: 257 ]]
                -- upvalues: v96 (ref), v98 (ref)
                v96(v98);
            end):catch(function() --[[ Line: 260 ]]
                -- upvalues: v96 (ref), v46 (ref)
                v96({
                    toastTitle = v46.networkErrorText
                });
            end);
        end;
    end, l_dependencyArray_0(v96, v46.networkErrorText));
    local v100 = v9.useCallback(function() --[[ Line: 266 ]]
        -- upvalues: v8 (ref), v56 (copy), v47 (copy), v72 (copy), l_FFlagAddFriendsUserListEnabled_0 (ref), v87 (copy), v84 (copy)
        return v8.all({
            v56(v47), 
            v72({
                isRefresh = true, 
                localUserId = v47, 
                limit = l_FFlagAddFriendsUserListEnabled_0 and 25 or v87()
            }), 
            v84({
                localUserId = v47
            })
        });
    end, {});
    local v103 = v9.useCallback(v99(function() --[[ Line: 279 ]]
        -- upvalues: l_reportPromiseLoadingTimeWrapper_0 (ref), v100 (copy), v94 (copy), v8 (ref)
        return l_reportPromiseLoadingTimeWrapper_0(v100, function() --[[ Line: 281 ]]
            return {
                fetch = "add_friends_page_load"
            };
        end, {
            fireEvent = v94
        })():andThen(function(v101) --[[ Line: 286 ]]
            -- upvalues: v8 (ref)
            return v8.resolve(v101);
        end):catch(function(_) --[[ Line: 289 ]]

        end);
    end), l_dependencyArray_0(v84, v72, v56, v47));
    local v105 = v9.useCallback(v99(function(v104) --[[ Line: 295 ]]
        -- upvalues: v72 (copy), l_FFlagAddFriendsUserListEnabled_0 (ref), v87 (copy), v47 (copy)
        return v72({
            limit = l_FFlagAddFriendsUserListEnabled_0 and 25 or v87(), 
            cursor = v104, 
            localUserId = v47
        });
    end), l_dependencyArray_0(if l_FFlagAddFriendsUserListEnabled_0 then nil else v87));
    local v107 = v9.useCallback(function(v106) --[[ Line: 305 ]]
        -- upvalues: v54 (copy), l_EventNames_0 (ref), l_Namespaces_0 (ref)
        v54(l_EventNames_0.ShowMoreBtnClick, {
            namespace = if v106 == l_Namespaces_0.FriendRequests then l_Namespaces_0.FriendRequests else l_Namespaces_0.PYMK
        });
    end, l_dependencyArray_0(v54));
    local v109 = v9.useCallback(function(v108) --[[ Line: 311 ]]
        -- upvalues: v53 (copy), v105 (copy), v107 (copy), v29 (ref)
        if v53 then
            v105(v53, v108);
        end;
        v107(v29.FriendRequests);
    end, l_dependencyArray_0(v51, v105, v53));
    local v110 = v9.useCallback(function() --[[ Line: 319 ]]
        -- upvalues: v54 (copy), l_EventNames_0 (ref)
        v54(l_EventNames_0.UserSearchClick);
    end, l_dependencyArray_0(v54));
    v9.useEffect(function() --[[ Line: 323 ]]
        -- upvalues: l_FFlagConnectionsHubLayerExposure_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v103 (copy), v58 (copy), v47 (copy)
        if l_FFlagConnectionsHubLayerExposure_0 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(l_AppUserLayers_0.ConnectionsHubExposureLayer);
        end;
        v103();
        v58(v47);
        return function() --[[ Line: 331 ]]
            -- upvalues: v58 (ref), v47 (ref)
            v58(v47);
        end;
    end, {});
    local v111 = v48 and #v48 or 0;
    local v112 = if l_FFlagAddFriendsUserListEnabled_0 then v111 > 0 and 10 or 25 else v111 > 0 and 5 or 6;
    return v9.createElement(v36, {
        initialRequestsRows = v112, 
        requestsPageSize = l_FFlagAddFriendsUserListEnabled_0 and 25 or v87(), 
        navigateToLuaAppPages = v43.navigateToLuaAppPages, 
        friendRecommendationsSessionId = v50, 
        friendRecommendations = v48, 
        friendRequests = v51, 
        handleLoadMoreRequests = v109, 
        refreshPage = v103, 
        fireSearchbarPressedEvent = v110, 
        fireOnShowMore = v107
    });
end;