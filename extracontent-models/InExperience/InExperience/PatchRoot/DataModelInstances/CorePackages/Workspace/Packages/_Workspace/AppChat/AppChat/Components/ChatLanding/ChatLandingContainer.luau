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
local l_SquadQuickStartExperimentation_0 = require(l_Parent_0.SocialExperiments).SquadQuickStartExperimentation;
local l_useCanAccessParty_0 = require(l_Parent_0.Squads).Hooks.useCanAccessParty;
local v78 = if game.PlaceId > 0 then tostring(game.PlaceId) else nil;
local v79 = if game.GameId > 0 then tostring(game.GameId) else nil;
local v80 = {
    topBarHeight = 0, 
    isShowingFilterBox = false, 
    navigateToSquadLobby = function() --[[ Line: 110 ]] --[[ Name: navigateToSquadLobby ]]

    end
};
local function _(v81, v82, v83) --[[ Line: 113 ]] --[[ Name: formatTitle ]]
    -- upvalues: v5 (copy), v38 (copy)
    local v84 = false;
    local v86 = v5.List.map(v81.otherParticipants, function(v85) --[[ Line: 115 ]]
        -- upvalues: v82 (copy), v84 (ref)
        if v82[tostring(v85)] == nil then
            v84 = true;
        end;
        return v82[tostring(v85)];
    end);
    if v84 and v81.isDefaultTitle then
        return "";
    else
        return v38(v81, v86, v83);
    end;
end;
ChatLandingContainer = function(v88) --[[ Line: 130 ]] --[[ Name: ChatLandingContainer ]]
    -- upvalues: v5 (copy), v80 (copy), v42 (copy), l_useChatPlacementContext_0 (copy), l_useDispatch_0 (copy), v50 (copy), v52 (copy), v56 (copy), v53 (copy), v48 (copy), v49 (copy), v45 (copy), v47 (copy), v54 (copy), l_useLocalUserId_0 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), v57 (copy), l_FFlagCreateConnectionsHub_0 (copy), v44 (copy), v8 (copy), v39 (copy), l_usePrevious_0 (copy), l_useEffect_0 (copy), v25 (copy), v37 (copy), v68 (copy), v19 (copy), v55 (copy), v31 (copy), v38 (copy), v58 (copy), v28 (copy), v29 (copy), l_useEffectOnMount_0 (copy), v22 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), l_PartyPageCarouselExperimentation_0 (copy), l_HttpService_0 (copy), v36 (copy), v78 (copy), v79 (copy), v35 (copy), v32 (copy), v59 (copy), v60 (copy), v40 (copy), v33 (copy), l_useSelector_0 (copy), v51 (copy), l_FFlagAppIaScrollAway_0 (copy), v4 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_SquadQuickStartExperimentation_0 (copy), v21 (copy), l_NoFriendsView_0 (copy), v34 (copy), l_AppPage_0 (copy), v26 (copy), v24 (copy), v69 (copy), l_IsVRAppBuild_0 (copy), v71 (copy), v70 (copy), v23 (copy), v46 (copy), l_dependencyArray_0 (copy), v73 (copy)
    local v89 = v5.Dictionary.join(v80, v88);
    local v90 = v42();
    local v91 = l_useChatPlacementContext_0();
    local v92 = l_useDispatch_0();
    local v93 = v50();
    local v94 = v52();
    local v95 = v56("privacySettingsEnabled");
    local v96 = v56("globalRulesEnabled");
    local v97 = v56("thirdPartyPrivacySettingsEnabled");
    local v98 = v53();
    local v99 = v48(v98);
    local v100 = v49();
    local v101 = v45();
    local v102 = v47();
    local v103 = v54();
    local v104 = l_useLocalUserId_0();
    local v105 = l_useNavigation_0();
    local v106 = l_useStyle_0();
    local v107 = l_useTextSizeOffset_0();
    local v108 = v57();
    local v109 = 64 + 2 * v107;
    local v110 = if l_FFlagCreateConnectionsHub_0 then v105.getScreenProps("navigateToLuaAppPages", {}) else nil;
    local v111 = v44();
    local v112 = v8.useRef({});
    local v113 = v8.useMemo(function() --[[ Line: 163 ]]
        -- upvalues: v39 (ref), v111 (copy)
        return v39(v111);
    end, {
        v111
    });
    local v114 = l_usePrevious_0(v93);
    l_useEffect_0(function() --[[ Line: 168 ]]
        -- upvalues: v25 (ref), v114 (copy), v93 (copy), v92 (copy), v37 (ref)
        v25:debug("Comparing previousIsChatEnabled ({}) --> isChatEnabled ({})", v114, v93);
        if v114 ~= nil and v114 ~= v93 and v93 then
            v25:info("Chat has become enabled, fetching conversations");
            v92(v37());
        end;
    end, {
        v92, 
        v93, 
        v114
    });
    local v115 = if v68 then nil else v19.Hooks.useUserProfilesFetch({
        userIds = v113, 
        query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v116 = if v68 then nil else v19.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v104))
        }, 
        query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v130, v131, v132 = v8.useMemo(function() --[[ Line: 199 ]]
        -- upvalues: v68 (ref), v112 (copy), v115 (copy), v5 (ref), v111 (copy), v55 (ref), v31 (ref), v38 (ref), v116 (copy), v19 (ref), v104 (copy), v94 (copy)
        local v117 = nil;
        if not v68 then
            v117 = v112.current;
            if v115.data then
                v5.List.map(v115.data.userProfiles, function(v118) --[[ Line: 204 ]]
                    -- upvalues: v117 (ref)
                    v117[v118.id] = v118;
                end);
            end;
        end;
        local v119 = 0;
        local v120 = 0;
        local v121 = {};
        for _, v123 in v111 do
            if v55(v123) then
                v119 = v119 + 1;
            end;
            if v123.moderationType == v31.ModerationType.TrustedComms then
                v120 = v120 + 1;
            end;
            local v124;
            if v68 then
                v124 = v38(v123);
            else
                local l_v117_0 = v117;
                local v126 = if v116.data then v19.Selectors.getCombinedNameFromId(v116.data, v104) else "";
                local v127 = false;
                local v129 = v5.List.map(v123.otherParticipants, function(v128) --[[ Line: 115 ]]
                    -- upvalues: l_v117_0 (copy), v127 (ref)
                    if l_v117_0[tostring(v128)] == nil then
                        v127 = true;
                    end;
                    return l_v117_0[tostring(v128)];
                end);
                if v127 and v123.isDefaultTitle then
                    v124 = "";
                    --[[ close >= 12 ]]
                else
                    v124 = v38(v123, v129, v126);
                    --[[ close >= 12 ]]
                end;
            end;
            if v94 or v123.conversationType ~= "MultiUserConversation" then
                table.insert(v121, v5.Dictionary.join(v123, {
                    title = v124
                }));
            end;
        end;
        return v121, v119, v120;
    end, if v68 then {
        v111, 
        v113, 
        v104, 
        v94
    } else {
        v111, 
        v113, 
        v115.data, 
        v116.data, 
        v104, 
        v94
    });
    local v133 = v58(v28.Context);
    local v134 = v29.useSetState();
    l_useEffect_0(function() --[[ Line: 261 ]]
        -- upvalues: v134 (copy), v5 (ref), v130 (copy), v131 (copy), v132 (copy)
        v134(function(v135) --[[ Line: 262 ]]
            -- upvalues: v5 (ref), v130 (ref), v131 (ref), v132 (ref)
            return v5.Dictionary.join(v135, {
                chatLandingListCount = #v130, 
                pendingConversationCount = v131, 
                unfilteredConversationCount = v132
            });
        end);
    end, {
        #v130, 
        v131, 
        v132, 
        v134
    });
    l_useEffectOnMount_0(function() --[[ Line: 271 ]]
        -- upvalues: v133 (copy), v22 (ref), v93 (copy)
        v133.emit(v22.ScreenRendered, {
            isChatEnabled = v93
        });
    end);
    local v136 = l_useLocalization_0({
        partyUnavailableWithUser = "Feature.Chat.Message.PartyUnavailableWithUser", 
        networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong"
    });
    local v138 = l_useCallback_0(function() --[[ Line: 282 ]]
        -- upvalues: l_PartyPageCarouselExperimentation_0 (ref), l_HttpService_0 (ref), v90 (copy), v36 (ref), v91 (copy), v78 (ref), v79 (ref), v105 (copy), v35 (ref)
        if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then
            local v137 = l_HttpService_0:GenerateGUID(false);
            v90.fireAnalyticsEvent(v36.ChatLandingPartyQuickStartButtonClicked, {
                clickLocation = v91.chatPlacement, 
                partyAttemptId = v137, 
                placeId = v78, 
                universeId = v79
            });
            v105.navigate(v35.QuickStartSquadInviteFriends, {
                uuid = v137
            });
        end;
    end, {
        v90, 
        v91, 
        v105, 
        v78, 
        v79
    });
    local v143 = l_useCallback_0(function(v139) --[[ Line: 299 ]]
        -- upvalues: l_PartyPageCarouselExperimentation_0 (ref), v92 (copy), v32 (ref), v108 (copy), v59 (ref), v60 (ref), v105 (copy), v35 (ref), v40 (ref), v136 (copy), v36 (ref), v33 (ref)
        if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then
            v92(v32("one_to_one", {
                v139
            }, v108, "navigateToConversationFromSocialCarousel")):andThen(function(v140) --[[ Line: 313 ]]
                -- upvalues: v59 (ref), v60 (ref), v105 (ref), v35 (ref)
                if v59 then
                    v60.start(v60.Events.ChatConversationTTI, {
                        conversationId = v140.id
                    });
                end;
                v105.navigate(v35.ChatConversation, {
                    conversationId = v140.id
                });
            end):catch(function(v141) --[[ Line: 323 ]]
                -- upvalues: v40 (ref), v136 (ref), v105 (ref), v35 (ref), v108 (ref), v36 (ref), v33 (ref)
                local v142 = if v40(v141) == "participant_chat_disabled" then v136.partyUnavailableWithUser else v136.networkErrorText;
                v105.navigate(v35.RoactChatToast, {
                    toastProps = {
                        toastContent = {
                            toastTitle = v142
                        }
                    }
                });
                if v108 then
                    v108.fireAnalyticsEvent(v36.NewConversationCreated, {
                        createConversationResult = v33.FetchConversationError
                    });
                end;
            end);
        end;
    end, {
        v92, 
        v136, 
        v40, 
        v105, 
        v108
    });
    local v144 = v5.isEmpty(v130);
    local v146 = l_useSelector_0(function(v145) --[[ Line: 346 ]]
        return v145.ChatAppReducer.ChatSettings.retrievalStatus ~= "Done";
    end) or v144 and v101 or v144 and v102;
    local v147 = nil;
    local v148 = false;
    local v149 = false;
    local v150 = v51({
        v35.AddFriends, 
        v35.PrivacySettings, 
        v35.Groups
    });
    local v151 = l_FFlagAppIaScrollAway_0 and not v98 and v4.getScrollAwayEnabled();
    local v152 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v153 = if l_FFlagIsSquadEnabledAMP_0 then l_SquadQuickStartExperimentation_0.getPartyQuickStartChangesEnabled() and v152 else nil;
    if v146 then
        v147 = v8.createElement(v21, {
            topBarHeight = v89.topBarHeight, 
            pageHeaderText = v89.pageHeaderText, 
            cellHeight = v109, 
            cellWidth = 375, 
            topPadding = if l_FFlagAppIaScrollAway_0 and v151 then v89.topBarHeight else nil
        });
        v148 = true;
    elseif not v93 or v144 and v100 and not v101 then
        if v93 then
            v147 = v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v106.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v106.Tokens.Global.Color.None.Transparency, 
                BorderSizePixel = 0
            }, {
                NoFriendsView = v8.createElement(l_NoFriendsView_0, {
                    pageRenderReport = function() --[[ Line: 392 ]] --[[ Name: pageRenderReport ]]
                        -- upvalues: v133 (copy), v22 (ref), v34 (ref)
                        v133.emit(v22.ChatEmptyStateScreenRendered, {
                            emptyStateType = v34.NoFriendsView
                        });
                    end, 
                    openAddFriendsPage = function() --[[ Line: 397 ]] --[[ Name: openAddFriendsPage ]]
                        -- upvalues: v133 (copy), v22 (ref), l_FFlagCreateConnectionsHub_0 (ref), v110 (copy), l_AppPage_0 (ref), v89 (copy)
                        v133.emit(v22.ChatAddFriendsBtnClicked, {});
                        if l_FFlagCreateConnectionsHub_0 then
                            v110[l_AppPage_0.CoHubAddConnections]();
                            return;
                        else
                            v89.navigateToAddFriends();
                            return;
                        end;
                    end, 
                    noFriendsHeaderKey = "Feature.Chat.Label.AddConnections", 
                    noFriendsTextLabelKey = "Feature.Chat.Text.NoConnections", 
                    addFriendsBtnLabelKey = "Feature.Chat.Label.AddConnections", 
                    addFriendsBtnEnabled = v150[v35.AddFriends]
                })
            });
            v148 = true;
        else
            v147 = v8.createElement(v26, {
                chatEnabled = v93, 
                privacySettingsEnabled = v95, 
                globalRulesEnabled = v96, 
                thirdPartyPrivacySettingsEnabled = v97, 
                canNavigateToPrivacySettings = v150[v35.PrivacySettings], 
                canNavigateToAddFriends = v150[v35.AddFriends], 
                onCallToAction = function(v154) --[[ Line: 421 ]] --[[ Name: onCallToAction ]]
                    -- upvalues: v89 (copy), v133 (copy), v22 (ref), l_FFlagCreateConnectionsHub_0 (ref), v110 (copy), l_AppPage_0 (ref)
                    if v154 == "privacy" then
                        v89.navigateToPrivacy();
                        return;
                    else
                        if v154 == "friends" then
                            v133.emit(v22.ChatAddFriendsBtnClicked, {});
                            if l_FFlagCreateConnectionsHub_0 then
                                v110[l_AppPage_0.CoHubAddConnections]();
                                return;
                            else
                                v89.navigateToAddFriends();
                            end;
                        end;
                        return;
                    end;
                end, 
                fireRenderEvent = function(v155) --[[ Line: 433 ]] --[[ Name: fireRenderEvent ]]
                    -- upvalues: v34 (ref), v133 (copy), v22 (ref)
                    local v156 = if v155 == "friends" then v34.NoFriendsView else if v155 == "privacy" then v34.ChatSettingsDisabledView else if v155 == "regional" then v34.ChatUnavailableRegionView else v34.EmptyConversationList;
                    v133.emit(v22.ChatEmptyStateScreenRendered, {
                        emptyStateType = v156
                    });
                end
            });
        end;
    else
        local v157 = ("conversationListWithTopBar%*"):format(v89.filterText);
        v148 = true;
        v149 = true;
        v147 = v8.createElement(v24, v5.Dictionary.join(v89, {
            filterText = v89.isShowingFilterBox and v89.filterText or nil, 
            key = v157, 
            itemList = v130, 
            appLoaded = v100, 
            localUserId = v104, 
            conversationsIsFetching = v101, 
            oldestConversationIsFetched = v103, 
            entryHeight = v109, 
            isInExperience = v98, 
            isWideMode = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v99 else nil, 
            navigateToConversationFromUserId = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v143 else nil, 
            navigateToQuickStartSquadInviteFriends = if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then v138 else nil, 
            showGroupsLink = v150[v35.Groups], 
            canvasTopPadding = if l_FFlagAppIaScrollAway_0 and v151 then v89.topBarHeight else nil, 
            isPartyQuickStartEnabled = v153
        }));
    end;
    if v69() and l_IsVRAppBuild_0() then
        v148 = true;
    end;
    if v71 then
        l_useEffect_0(function() --[[ Line: 488 ]]
            -- upvalues: v98 (copy), v70 (ref), v35 (ref), v149 (ref)
            if v98 then
                v70(false).setScreenTopBar(v35.ChatLanding, {
                    rightHidden = not v149
                });
            end;
        end, {
            v149, 
            v98
        });
    else
        local v158 = v105.getScreenProps("setScreenTopBar", function() --[[ Line: 496 ]]

        end);
        local l_v158_0 = v158 --[[ copy: 47 -> 51 ]];
        l_useEffect_0(function() --[[ Line: 497 ]]
            -- upvalues: v98 (copy), l_v158_0 (copy), v35 (ref), v149 (ref)
            if v98 then
                l_v158_0(v35.ChatLanding, {
                    rightHidden = not v149
                });
            end;
        end, {
            v149, 
            v158, 
            v98
        });
    end;
    local v160 = nil;
    v160 = if not v148 and v150[v35.Groups] then v8.createElement(v8.Fragment, nil, {
        UIPadding = if l_FFlagAppIaScrollAway_0 and v151 then v8.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v89.topBarHeight)
        }) else nil, 
        groupsLink = v8.createElement(v23, {
            entryHeight = v109
        }), 
        chatFrame = v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v109), 
            Position = UDim2.new(0, 0, 0, v109), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            chatContainer = v147
        })
    }) else v147;
    local v161 = v46();
    v8.useEffect(function() --[[ Line: 536 ]]
        -- upvalues: v161 (copy), v133 (copy), v22 (ref), v93 (copy), v146 (copy)
        if v161 then
            v133.emit(v22.AppChatVisible, {
                isChatEnabled = v93, 
                isChatLoading = v146
            });
        end;
    end, l_dependencyArray_0(v161, v146));
    if v59 then
        v8.useEffect(function() --[[ Line: 546 ]]
            -- upvalues: v161 (copy), v146 (copy), v93 (copy), v25 (ref), v130 (copy), v60 (ref)
            if not v161 then
                return;
            else
                local v162 = not v146 and v93;
                v25:debug("TTI Ready Check (ChatLanding): isLoading={}, isChatEnabled={}, itemCount={}, ready={}", v146, v93, #v130, v162);
                if v162 and v60.isActive(v60.Events.ChatLandingTTI) then
                    v60.finish(v60.Events.ChatLandingTTI, {
                        numElementsRendered = #v130
                    });
                end;
                return;
            end;
        end, {
            v161, 
            v146, 
            v93, 
            #v130
        });
    end;
    if v73() then
        local v163 = v8.useRef({
            isChatEnabled = v93, 
            isChatLoading = v146
        });
        v8.useEffect(function() --[[ Line: 572 ]]
            -- upvalues: v163 (copy), v93 (copy), v146 (copy)
            v163.current = {
                isChatEnabled = v93, 
                isChatLoading = v146
            };
        end, {
            v93, 
            v146
        });
        l_useEffect_0(function() --[[ Line: 579 ]]
            -- upvalues: v161 (copy), v133 (copy), v22 (ref), v163 (copy)
            return function() --[[ Line: 580 ]]
                -- upvalues: v161 (ref), v133 (ref), v22 (ref), v163 (ref)
                if v161 then
                    v133.emit(v22.AppChatClosed, v163.current);
                end;
            end;
        end, {
            v161
        });
    end;
    return v160;
end;
return l_compose_0(v9.connect(nil, v27), l_RoactPaginator_0.connect(function() --[[ Line: 594 ]]
    return {
        pageSize = 30
    };
end))(ChatLandingContainer);