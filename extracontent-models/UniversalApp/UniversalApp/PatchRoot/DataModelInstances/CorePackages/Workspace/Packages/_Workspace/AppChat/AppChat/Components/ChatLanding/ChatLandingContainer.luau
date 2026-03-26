local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.AppCommonLib);
local v4 = require(l_Parent_0.AppNavBar);
local v5 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v7 = require(l_Parent_0.FriendsLanding);
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.RoactRodux);
local v10 = require(l_Parent_0.SharedFlags);
local v11 = require(l_Parent_0.UIBlox);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_usePrevious_0 = require(l_Parent_0.RoactUtils).Hooks.usePrevious;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v19 = require(l_Parent_0.UserProfiles);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v21 = require(script.Parent.ChatLoading.ChatLoadingContainer);
local v22 = require(script.Parent.ChatLandingTelemetryEvents);
local v23 = require(script.Parent.ConversationGroupsEntryContainer);
local v24 = require(script.Parent.ConversationListWithTopBar);
local v25 = require(script.Parent.Logger):new(script.Name);
local v26 = require(script.Parent.NoConversationsLanding);
local v27 = require(script.Parent.mapDispatchToProps);
local v28 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v29 = require(l_script_FirstAncestor_0.Contexts.TelemetryState.ChatLandingTelemetryState);
local l_compose_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoduxTools.compose;
local v31 = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v32 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v33 = require(l_script_FirstAncestor_0.Analytics.Enums.CreateConversationError);
local v34 = require(l_script_FirstAncestor_0.Analytics.Enums.EmptyStateType);
local v35 = require(l_script_FirstAncestor_0.EnumScreens);
local v36 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v37 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchConversationsByPage);
local v38 = require(l_script_FirstAncestor_0.Conversations.getConversationTitle);
local v39 = require(l_script_FirstAncestor_0.Conversations.getAllParticipants);
local v40 = require(l_script_FirstAncestor_0.Conversations.Thunks.parseCreateConversationErrors);
local l_RoactPaginator_0 = require(l_script_FirstAncestor_0.SocialLibraries).RoactPaginator;
local v42 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local v44 = require(l_script_FirstAncestor_0.Hooks.useGetConversations);
local v45 = require(l_script_FirstAncestor_0.Hooks.useAreConversationsFetching);
local v46 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local v47 = require(l_script_FirstAncestor_0.Hooks.useHasConversations);
local v48 = require(l_script_FirstAncestor_0.Hooks.useAppChatIsWideMode);
local v49 = require(l_script_FirstAncestor_0.Hooks.useIsAppLoaded);
local v50 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v51 = require(l_script_FirstAncestor_0.Hooks.useIsExternalNavigationAvailable);
local v52 = require(l_script_FirstAncestor_0.Hooks.useIsGroupChatEnabled);
local v53 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v54 = require(l_script_FirstAncestor_0.Hooks.useIsOldestConversationFetched);
local v55 = require(l_script_FirstAncestor_0.Hooks.useIsUserPending);
local v56 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabledFromReason);
local v57 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v58 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v59 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v60 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local l_useCallback_0 = v8.useCallback;
local l_useEffect_0 = v8.useEffect;
local l_IsVRAppBuild_0 = v3.IsVRAppBuild;
local l_useStyle_0 = v11.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v11.Core.Style.useTextSizeOffset;
local l_NoFriendsView_0 = v7.Components.NoFriendsView;
local l_FFlagAppIaScrollAway_0 = v10.FFlagAppIaScrollAway;
local v68 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatRemoveUserProfileTitles);
local v69 = require(l_script_FirstAncestor_0.Flags.getFFlagChatTabHideGroupsLinkOnVR);
local v70 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v71 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local l_PartyPageCarouselExperimentation_0 = require(l_Parent_0.SocialExperiments).PartyPageCarouselExperimentation;
local v73 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatClosedEvent);
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v10.FFlagRemoveDependencyArrayAntipattern;
local l_SquadQuickStartExperimentation_0 = require(l_Parent_0.SocialExperiments).SquadQuickStartExperimentation;
local l_useCanAccessParty_0 = require(l_Parent_0.Squads).Hooks.useCanAccessParty;
local v80 = if game.PlaceId > 0 then tostring(game.PlaceId) else nil;
local v81 = if game.GameId > 0 then tostring(game.GameId) else nil;
local v82 = {
    topBarHeight = 0, 
    isShowingFilterBox = false, 
    navigateToSquadLobby = function() --[[ Line: 113 ]] --[[ Name: navigateToSquadLobby ]]

    end
};
local function _(v83, v84, v85) --[[ Line: 116 ]] --[[ Name: formatTitle ]]
    -- upvalues: v5 (copy), v38 (copy)
    local v86 = false;
    local v88 = v5.List.map(v83.otherParticipants, function(v87) --[[ Line: 118 ]]
        -- upvalues: v84 (copy), v86 (ref)
        if v84[tostring(v87)] == nil then
            v86 = true;
        end;
        return v84[tostring(v87)];
    end);
    if v86 and v83.isDefaultTitle then
        return "";
    else
        return v38(v83, v88, v85);
    end;
end;
ChatLandingContainer = function(v90) --[[ Line: 133 ]] --[[ Name: ChatLandingContainer ]]
    -- upvalues: v5 (copy), v82 (copy), v42 (copy), l_useChatPlacementContext_0 (copy), l_useDispatch_0 (copy), v50 (copy), v52 (copy), v56 (copy), v53 (copy), v48 (copy), v49 (copy), v45 (copy), v47 (copy), v54 (copy), l_useLocalUserId_0 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), v57 (copy), l_FFlagCreateConnectionsHub_0 (copy), v44 (copy), v8 (copy), v39 (copy), l_usePrevious_0 (copy), l_useEffect_0 (copy), v25 (copy), v37 (copy), v68 (copy), v19 (copy), v55 (copy), v31 (copy), v38 (copy), v58 (copy), v28 (copy), v29 (copy), l_useEffectOnMount_0 (copy), v22 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), l_PartyPageCarouselExperimentation_0 (copy), l_HttpService_0 (copy), v36 (copy), v80 (copy), v81 (copy), v35 (copy), v32 (copy), v59 (copy), v60 (copy), v40 (copy), v33 (copy), l_useSelector_0 (copy), v51 (copy), l_FFlagAppIaScrollAway_0 (copy), v4 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_SquadQuickStartExperimentation_0 (copy), v21 (copy), l_NoFriendsView_0 (copy), v34 (copy), l_AppPage_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v26 (copy), v24 (copy), v69 (copy), l_IsVRAppBuild_0 (copy), v71 (copy), v70 (copy), v23 (copy), v46 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v73 (copy)
    local v91 = v5.Dictionary.join(v82, v90);
    local v92 = v42();
    local v93 = l_useChatPlacementContext_0();
    local v94 = l_useDispatch_0();
    local v95 = v50();
    local v96 = v52();
    local v97 = v56("privacySettingsEnabled");
    local v98 = v56("globalRulesEnabled");
    local v99 = v56("thirdPartyPrivacySettingsEnabled");
    local v100 = v53();
    local v101 = v48(v100);
    local v102 = v49();
    local v103 = v45();
    local v104 = v47();
    local v105 = v54();
    local v106 = l_useLocalUserId_0();
    local v107 = l_useNavigation_0();
    local v108 = l_useStyle_0();
    local v109 = l_useTextSizeOffset_0();
    local v110 = v57();
    local v111 = 64 + 2 * v109;
    local v112 = if l_FFlagCreateConnectionsHub_0 then v107.getScreenProps("navigateToLuaAppPages", {}) else nil;
    local v113 = v44();
    local v114 = v8.useRef({});
    local v115 = v8.useMemo(function() --[[ Line: 166 ]]
        -- upvalues: v39 (ref), v113 (copy)
        return v39(v113);
    end, {
        v113
    });
    local v116 = l_usePrevious_0(v95);
    l_useEffect_0(function() --[[ Line: 171 ]]
        -- upvalues: v25 (ref), v116 (copy), v95 (copy), v94 (copy), v37 (ref)
        v25:debug("Comparing previousIsChatEnabled ({}) --> isChatEnabled ({})", v116, v95);
        if v116 ~= nil and v116 ~= v95 and v95 then
            v25:info("Chat has become enabled, fetching conversations");
            v94(v37());
        end;
    end, {
        v94, 
        v95, 
        v116
    });
    local v117 = if v68 then nil else v19.Hooks.useUserProfilesFetch({
        userIds = v115, 
        query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v118 = if v68 then nil else v19.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v106))
        }, 
        query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v132, v133, v134 = v8.useMemo(function() --[[ Line: 202 ]]
        -- upvalues: v68 (ref), v114 (copy), v117 (copy), v5 (ref), v113 (copy), v55 (ref), v31 (ref), v38 (ref), v118 (copy), v19 (ref), v106 (copy), v96 (copy)
        local v119 = nil;
        if not v68 then
            v119 = v114.current;
            if v117.data then
                v5.List.map(v117.data.userProfiles, function(v120) --[[ Line: 207 ]]
                    -- upvalues: v119 (ref)
                    v119[v120.id] = v120;
                end);
            end;
        end;
        local v121 = 0;
        local v122 = 0;
        local v123 = {};
        for _, v125 in v113 do
            if v55(v125) then
                v121 = v121 + 1;
            end;
            if v125.moderationType == v31.ModerationType.TrustedComms then
                v122 = v122 + 1;
            end;
            local v126;
            if v68 then
                v126 = v38(v125);
            else
                local l_v119_0 = v119;
                local v128 = if v118.data then v19.Selectors.getCombinedNameFromId(v118.data, v106) else "";
                local v129 = false;
                local v131 = v5.List.map(v125.otherParticipants, function(v130) --[[ Line: 118 ]]
                    -- upvalues: l_v119_0 (copy), v129 (ref)
                    if l_v119_0[tostring(v130)] == nil then
                        v129 = true;
                    end;
                    return l_v119_0[tostring(v130)];
                end);
                if v129 and v125.isDefaultTitle then
                    v126 = "";
                    --[[ close >= 12 ]]
                else
                    v126 = v38(v125, v131, v128);
                    --[[ close >= 12 ]]
                end;
            end;
            if v96 or v125.conversationType ~= "MultiUserConversation" then
                table.insert(v123, v5.Dictionary.join(v125, {
                    title = v126
                }));
            end;
        end;
        return v123, v121, v122;
    end, if v68 then {
        v113, 
        v115, 
        v106, 
        v96
    } else {
        v113, 
        v115, 
        v117.data, 
        v118.data, 
        v106, 
        v96
    });
    local v135 = v58(v28.Context);
    local v136 = v29.useSetState();
    l_useEffect_0(function() --[[ Line: 264 ]]
        -- upvalues: v136 (copy), v5 (ref), v132 (copy), v133 (copy), v134 (copy)
        v136(function(v137) --[[ Line: 265 ]]
            -- upvalues: v5 (ref), v132 (ref), v133 (ref), v134 (ref)
            return v5.Dictionary.join(v137, {
                chatLandingListCount = #v132, 
                pendingConversationCount = v133, 
                unfilteredConversationCount = v134
            });
        end);
    end, {
        #v132, 
        v133, 
        v134, 
        v136
    });
    l_useEffectOnMount_0(function() --[[ Line: 274 ]]
        -- upvalues: v135 (copy), v22 (ref), v95 (copy)
        v135.emit(v22.ScreenRendered, {
            isChatEnabled = v95
        });
    end);
    local v138 = l_useLocalization_0({
        partyUnavailableWithUser = "Feature.Chat.Message.PartyUnavailableWithUser", 
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong"
    });
    local v140 = l_useCallback_0(function() --[[ Line: 285 ]]
        -- upvalues: l_PartyPageCarouselExperimentation_0 (ref), l_HttpService_0 (ref), v92 (copy), v36 (ref), v93 (copy), v80 (ref), v81 (ref), v107 (copy), v35 (ref)
        if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then
            local v139 = l_HttpService_0:GenerateGUID(false);
            v92.fireAnalyticsEvent(v36.ChatLandingPartyQuickStartButtonClicked, {
                clickLocation = v93.chatPlacement, 
                partyAttemptId = v139, 
                placeId = v80, 
                universeId = v81
            });
            v107.navigate(v35.QuickStartSquadInviteFriends, {
                uuid = v139
            });
        end;
    end, {
        v92, 
        v93, 
        v107, 
        v80, 
        v81
    });
    local v145 = l_useCallback_0(function(v141) --[[ Line: 302 ]]
        -- upvalues: l_PartyPageCarouselExperimentation_0 (ref), v94 (copy), v32 (ref), v110 (copy), v59 (ref), v60 (ref), v107 (copy), v35 (ref), v40 (ref), v138 (copy), v36 (ref), v33 (ref)
        if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then
            v94(v32("one_to_one", {
                v141
            }, v110, "navigateToConversationFromSocialCarousel")):andThen(function(v142) --[[ Line: 316 ]]
                -- upvalues: v59 (ref), v60 (ref), v107 (ref), v35 (ref)
                if v59 then
                    v60.start(v60.Events.ChatConversationTTI, {
                        conversationId = v142.id
                    });
                end;
                v107.navigate(v35.ChatConversation, {
                    conversationId = v142.id
                });
            end):catch(function(v143) --[[ Line: 326 ]]
                -- upvalues: v40 (ref), v138 (ref), v107 (ref), v35 (ref), v110 (ref), v36 (ref), v33 (ref)
                local v144 = if v40(v143) == "participant_chat_disabled" then v138.partyUnavailableWithUser else v138.networkErrorText;
                v107.navigate(v35.RoactChatToast, {
                    toastProps = {
                        toastContent = {
                            toastTitle = v144
                        }
                    }
                });
                if v110 then
                    v110.fireAnalyticsEvent(v36.NewConversationCreated, {
                        createConversationResult = v33.FetchConversationError
                    });
                end;
            end);
        end;
    end, {
        v94, 
        v138, 
        v40, 
        v107, 
        v110
    });
    local v146 = v5.isEmpty(v132);
    local v148 = l_useSelector_0(function(v147) --[[ Line: 349 ]]
        return v147.ChatAppReducer.ChatSettings.retrievalStatus ~= "Done";
    end) or v146 and v103 or v146 and v104;
    local v149 = nil;
    local v150 = false;
    local v151 = false;
    local v152 = v51({
        v35.AddFriends, 
        v35.PrivacySettings, 
        v35.Groups
    });
    local v153 = l_FFlagAppIaScrollAway_0 and not v100 and v4.getScrollAwayEnabled();
    local v154 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v155 = if l_FFlagIsSquadEnabledAMP_0 then l_SquadQuickStartExperimentation_0.getPartyQuickStartChangesEnabled() and v154 else nil;
    if v148 then
        v149 = v8.createElement(v21, {
            topBarHeight = v91.topBarHeight, 
            pageHeaderText = v91.pageHeaderText, 
            cellHeight = v111, 
            cellWidth = 375, 
            topPadding = if l_FFlagAppIaScrollAway_0 and v153 then v91.topBarHeight else nil
        });
        v150 = true;
    elseif not v95 or v146 and v102 and not v103 then
        if v95 then
            v149 = v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v108.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v108.Tokens.Global.Color.None.Transparency, 
                BorderSizePixel = 0
            }, {
                NoFriendsView = v8.createElement(l_NoFriendsView_0, {
                    pageRenderReport = function() --[[ Line: 395 ]] --[[ Name: pageRenderReport ]]
                        -- upvalues: v135 (copy), v22 (ref), v34 (ref)
                        v135.emit(v22.ChatEmptyStateScreenRendered, {
                            emptyStateType = v34.NoFriendsView
                        });
                    end, 
                    openAddFriendsPage = function() --[[ Line: 400 ]] --[[ Name: openAddFriendsPage ]]
                        -- upvalues: v135 (copy), v22 (ref), l_FFlagCreateConnectionsHub_0 (ref), v112 (copy), l_AppPage_0 (ref), v91 (copy)
                        v135.emit(v22.ChatAddFriendsBtnClicked, {});
                        if l_FFlagCreateConnectionsHub_0 then
                            v112[l_AppPage_0.CoHubAddConnections]();
                            return;
                        else
                            v91.navigateToAddFriends();
                            return;
                        end;
                    end, 
                    noFriendsHeaderKey = l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Label.AddFriends" or "Feature.Chat.Label.AddConnections", 
                    noFriendsTextLabelKey = l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Text.NoFriends" or "Feature.Chat.Text.NoConnections", 
                    addFriendsBtnLabelKey = l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Label.AddFriends" or "Feature.Chat.Label.AddConnections", 
                    addFriendsBtnEnabled = v152[v35.AddFriends]
                })
            });
            v150 = true;
        else
            v149 = v8.createElement(v26, {
                chatEnabled = v95, 
                privacySettingsEnabled = v97, 
                globalRulesEnabled = v98, 
                thirdPartyPrivacySettingsEnabled = v99, 
                canNavigateToPrivacySettings = v152[v35.PrivacySettings], 
                canNavigateToAddFriends = v152[v35.AddFriends], 
                onCallToAction = function(v156) --[[ Line: 430 ]] --[[ Name: onCallToAction ]]
                    -- upvalues: v91 (copy), v135 (copy), v22 (ref), l_FFlagCreateConnectionsHub_0 (ref), v112 (copy), l_AppPage_0 (ref)
                    if v156 == "privacy" then
                        v91.navigateToPrivacy();
                        return;
                    else
                        if v156 == "friends" then
                            v135.emit(v22.ChatAddFriendsBtnClicked, {});
                            if l_FFlagCreateConnectionsHub_0 then
                                v112[l_AppPage_0.CoHubAddConnections]();
                                return;
                            else
                                v91.navigateToAddFriends();
                            end;
                        end;
                        return;
                    end;
                end, 
                fireRenderEvent = function(v157) --[[ Line: 442 ]] --[[ Name: fireRenderEvent ]]
                    -- upvalues: v34 (ref), v135 (copy), v22 (ref)
                    local v158 = if v157 == "friends" then v34.NoFriendsView else if v157 == "privacy" then v34.ChatSettingsDisabledView else if v157 == "regional" then v34.ChatUnavailableRegionView else v34.EmptyConversationList;
                    v135.emit(v22.ChatEmptyStateScreenRendered, {
                        emptyStateType = v158
                    });
                end
            });
        end;
    else
        local v159 = ("conversationListWithTopBar%*"):format(v91.filterText);
        v150 = true;
        v151 = true;
        v149 = v8.createElement(v24, v5.Dictionary.join(v91, {
            filterText = v91.isShowingFilterBox and v91.filterText or nil, 
            key = v159, 
            itemList = v132, 
            appLoaded = v102, 
            localUserId = v106, 
            conversationsIsFetching = v103, 
            oldestConversationIsFetched = v105, 
            entryHeight = v111, 
            isInExperience = v100, 
            isWideMode = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v101 else nil, 
            navigateToConversationFromUserId = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v145 else nil, 
            navigateToQuickStartSquadInviteFriends = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v140 else nil, 
            showGroupsLink = v152[v35.Groups], 
            canvasTopPadding = if l_FFlagAppIaScrollAway_0 and v153 then v91.topBarHeight else nil, 
            isPartyQuickStartEnabled = v155
        }));
    end;
    if v69() and l_IsVRAppBuild_0() then
        v150 = true;
    end;
    if v71 then
        l_useEffect_0(function() --[[ Line: 497 ]]
            -- upvalues: v100 (copy), v70 (ref), v35 (ref), v151 (ref)
            if v100 then
                v70(false).setScreenTopBar(v35.ChatLanding, {
                    rightHidden = not v151
                });
            end;
        end, {
            v151, 
            v100
        });
    else
        local v160 = v107.getScreenProps("setScreenTopBar", function() --[[ Line: 505 ]]

        end);
        local l_v160_0 = v160 --[[ copy: 47 -> 51 ]];
        l_useEffect_0(function() --[[ Line: 506 ]]
            -- upvalues: v100 (copy), l_v160_0 (copy), v35 (ref), v151 (ref)
            if v100 then
                l_v160_0(v35.ChatLanding, {
                    rightHidden = not v151
                });
            end;
        end, {
            v151, 
            v160, 
            v100
        });
    end;
    local v162 = nil;
    v162 = if not v150 and v152[v35.Groups] then v8.createElement(v8.Fragment, nil, {
        UIPadding = if l_FFlagAppIaScrollAway_0 and v153 then v8.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v91.topBarHeight)
        }) else nil, 
        groupsLink = v8.createElement(v23, {
            entryHeight = v111
        }), 
        chatFrame = v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v111), 
            Position = UDim2.new(0, 0, 0, v111), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            chatContainer = v149
        })
    }) else v149;
    local v163 = v46();
    v8.useEffect(function() --[[ Line: 546 ]]
        -- upvalues: v163 (copy), v135 (copy), v22 (ref), v95 (copy), v148 (copy)
        if v163 then
            v135.emit(v22.AppChatVisible, {
                isChatEnabled = v95, 
                isChatLoading = v148
            });
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v163, 
        v148
    } else l_dependencyArray_0(v163, v148));
    if v59 then
        v8.useEffect(function() --[[ Line: 560 ]]
            -- upvalues: v163 (copy), v148 (copy), v95 (copy), v25 (ref), v132 (copy), v60 (ref)
            if not v163 then
                return;
            else
                local v164 = not v148 and v95;
                v25:debug("TTI Ready Check (ChatLanding): isLoading={}, isChatEnabled={}, itemCount={}, ready={}", v148, v95, #v132, v164);
                if v164 and v60.isActive(v60.Events.ChatLandingTTI) then
                    v60.finish(v60.Events.ChatLandingTTI, {
                        numElementsRendered = #v132
                    });
                end;
                return;
            end;
        end, {
            v163, 
            v148, 
            v95, 
            #v132
        });
    end;
    if v73() then
        local v165 = v8.useRef({
            isChatEnabled = v95, 
            isChatLoading = v148
        });
        v8.useEffect(function() --[[ Line: 586 ]]
            -- upvalues: v165 (copy), v95 (copy), v148 (copy)
            v165.current = {
                isChatEnabled = v95, 
                isChatLoading = v148
            };
        end, {
            v95, 
            v148
        });
        l_useEffect_0(function() --[[ Line: 593 ]]
            -- upvalues: v163 (copy), v135 (copy), v22 (ref), v165 (copy)
            return function() --[[ Line: 594 ]]
                -- upvalues: v163 (ref), v135 (ref), v22 (ref), v165 (ref)
                if v163 then
                    v135.emit(v22.AppChatClosed, v165.current);
                end;
            end;
        end, {
            v163
        });
    end;
    return v162;
end;
return l_compose_0(v9.connect(nil, v27), l_RoactPaginator_0.connect(function() --[[ Line: 608 ]]
    return {
        pageSize = 30
    };
end))(ChatLandingContainer);