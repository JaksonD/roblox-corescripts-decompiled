local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerContextualMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UserProfiles);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v7 = require(l_Parent_0.RoactUtils);
local l_RoactRodux_0 = v7.Hooks.RoactRodux;
local v9 = require(l_Parent_0.RobloxAppHooks);
local v10 = require(l_Parent_0.RobloxAppEnums);
local l_dependencyArray_0 = v7.Hooks.dependencyArray;
local l_AppPage_0 = v10.AppPage;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v14 = require(l_Parent_0.ToastRodux);
local v15 = require(l_Parent_0.DiscoveryAnalytics);
local v16 = require(l_Parent_0.Navigation);
local l_getCurrentRouteState_0 = v16.getCurrentRouteState;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local v20 = require(l_Parent_0.RobloxAppSessionization);
local v21 = require(l_Parent_0.Dash);
local l_SetGamePlaySession_0 = v20.SetGamePlaySession;
local l_SessionType_0 = v20.SessionType;
local v24 = require(l_Parent_0.Loggers).Logger:new(script.Name);
local v25 = require(l_Parent_0.SharedFlags);
local l_FFlagConnectionsToFriendsRename_0 = v25.FFlagConnectionsToFriendsRename;
local l_getFFlagAppChatPCMFixBlocking_0 = v25.getFFlagAppChatPCMFixBlocking;
local l_RecommendationContextType_0 = require(l_Parent_0.FriendsRodux).config({
    keyPath = "PlayerContextualMenu.Friends"
}).Enums.RecommendationContextType;
local l_useRecommendationContextualInfoDisplay_0 = require(l_Parent_0.SocialCommon).Hooks.useRecommendationContextualInfoDisplay;
local _ = require(script.Parent.Types);
local v31 = require(script.Parent.getPresenceIcon);
local v32 = require(script.Parent.getPresenceText);
local v33 = require(l_Parent_0.UIBlox);
local l_Images_0 = v33.App.ImageSet.Images;
local l_Button_0 = v33.App.Button.Button;
local l_ButtonType_0 = v33.App.Button.Enum.ButtonType;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v38 = require(l_script_FirstAncestor_0.Analytics);
local l_setupFireEvent_0 = v38.setupFireEvent;
local l_EventNames_0 = v38.EventNames;
local l_AnalyticsService_0 = v38.AnalyticsService;
local v42 = require(l_script_FirstAncestor_0.Http.Friends);
local v43 = require(l_script_FirstAncestor_0.Http.Blocking);
local v44 = require(l_script_FirstAncestor_0.Components.PlayerContextualMenuComponent);
local v45 = require(script.Parent.HttpRequest.useHttpRequest);
local _ = require(l_Parent_0.FriendsNetworking).Enums;
local v47 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfileConsoleUseNewReportFlow);
local v48 = nil;
local v49 = nil;
local v50 = nil;
local v51 = nil;
if v47 then
    v48 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
    v49 = require(l_Parent_0.GenericAbuseReporting);
    v50 = v49.Enums.AbuseVector;
    v51 = v49.Thunks.OpenDynamicAbuseReport;
end;
local v52 = game:DefineFastString("PlayerContextualMenuVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png");
local v53 = require(l_script_FirstAncestor_0.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled);
local v54 = game:DefineFastFlag("FFlagPCMAcceptWidthAsProp", false);
local l_FFlagSkipBlockModal_0 = require(l_Parent_0.SharedFlags).FFlagSkipBlockModal;
local v56 = if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then game:GetService("PlatformFriendsService") else nil;
local function v57() --[[ Line: 106 ]] --[[ Name: NO_OPT_CALLBACK ]]

end;
local function v64(v58, v59, v60, v61, v62) --[[ Line: 108 ]] --[[ Name: launchGameWithAnalytics ]]
    -- upvalues: l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_EventNames_0 (copy), l_HttpService_0 (copy), v15 (copy), l_AnalyticsService_0 (copy), l_ExperienceService_0 (copy)
    l_SetGamePlaySession_0(v62, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
    v58(l_EventNames_0.JoinExperience, {
        profileUserId = v60
    });
    local v63 = l_HttpService_0:GenerateGUID(false);
    v15.Events.gamePlayIntent(l_AnalyticsService_0.EventStream, v15.Constants.Context.PlayerContextualMenu, {
        friendId = v60, 
        pageName = v59, 
        placeId = if v61 then v61.locationPlaceId else nil, 
        rootPlaceId = if v61 then v61.locationRootPlaceId else nil, 
        joinAttemptId = v63
    });
    l_ExperienceService_0:LaunchExperience({
        userId = v60, 
        joinAttemptId = v63
    }, "PlayerContextualMenu");
end;
local v65 = {
    enableExperienceCTAs = true, 
    width = UDim.new(0, 400)
};
local v66 = {
    AcceptConnection = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.AcceptFriend" or "CommonUI.Features.Label.AcceptConnection", 
    AddConnection = l_FFlagConnectionsToFriendsRename_0 and "Feature.Profile.Label.AddFriend" or "CommonUI.Features.Label.AddConnection", 
    IgnoreConnectionRequest = l_FFlagConnectionsToFriendsRename_0 and "Feature.AddFriends.Action.IgnoreFriendRequest" or "Feature.AddFriends.Action.IgnoreConnectionRequest", 
    RemoveConnection = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.Unfriend" or "CommonUI.Features.Label.RemoveConnection", 
    Block = "Feature.Friends.Action.Block", 
    Unblock = "Feature.Friends.Action.Unblock", 
    Chat = "CommonUI.Features.Label.Chat", 
    Join = "Feature.Chat.Drawer.Join", 
    PendingRequest = "Feature.Friends.Action.PendingRequest", 
    Report = "Feature.Catalog.Action.Report", 
    ViewDetails = "Feature.Profile.Label.ViewDetails", 
    ViewPlatformProfile = "Feature.Friends.Action.ViewPlatformProfile", 
    ConnectionAdded = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendAdded" or "Feature.Friends.Action.ConnectionAdded", 
    ConnectionRequestSent = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendRequestSent" or "Feature.Friends.Action.ConnectionRequestSent", 
    ConnectionRemoved = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.Action.FriendRemoved" or "Feature.Friends.Label.ConnectionRemoved", 
    FriendRequestIgnored = "Feature.AddFriends.Action.RequestIgnored", 
    SomethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    UserBlocked = "Feature.Profile.Action.UserBlocked"
};
return function(v67) --[[ Line: 212 ]] --[[ Name: PlayerContextualMenuContainer ]]
    -- upvalues: v3 (copy), v65 (copy), l_RoactRodux_0 (copy), v9 (copy), v16 (copy), l_AppSessionService_0 (copy), l_useLocalization_0 (copy), v66 (copy), v14 (copy), v4 (copy), l_setupFireEvent_0 (copy), l_AnalyticsService_0 (copy), l_dependencyArray_0 (copy), v45 (copy), l_Url_0 (copy), l_getFFlagAppChatPCMFixBlocking_0 (copy), v53 (copy), v43 (copy), v24 (copy), l_useDesignTokens_0 (copy), v5 (copy), v56 (copy), l_RecommendationContextType_0 (copy), v31 (copy), v32 (copy), l_useRecommendationContextualInfoDisplay_0 (copy), l_EventNames_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v15 (copy), l_getCurrentRouteState_0 (copy), l_AppPage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v64 (copy), v47 (copy), v51 (ref), v50 (ref), v48 (ref), l_FFlagSkipBlockModal_0 (copy), v42 (copy), l_Images_0 (copy), v52 (copy), v57 (copy), v21 (copy), v44 (copy), v54 (copy)
    local v68 = v3.Dictionary.union(v65, v67);
    local v69 = l_RoactRodux_0.useDispatch();
    local v70 = v9.useLocalUserId();
    local v71 = v16.useNavigation();
    local v72 = v9.useRoactService(l_AppSessionService_0);
    local v73 = l_useLocalization_0(v66);
    local v74 = {
        toastMessage = v73.SomethingIsWrong, 
        isLocalized = true, 
        toastType = v14.Enums.ToastType.NetworkingError
    };
    local v75 = v4.useMemo(function() --[[ Line: 228 ]]
        -- upvalues: l_setupFireEvent_0 (ref), l_AnalyticsService_0 (ref), v70 (copy)
        return l_setupFireEvent_0({
            analytics = l_AnalyticsService_0, 
            infoForAllEvents = {
                uid = v70
            }
        });
    end, l_dependencyArray_0(v70));
    local v76 = v45();
    local v77, v78 = v4.useState({
        status = "NotStarted", 
        isPlayable = false
    });
    v4.useEffect(function() --[[ Line: 244 ]]
        -- upvalues: v68 (copy), v78 (copy), v76 (copy), l_Url_0 (ref)
        if v68.subjectPresence and v68.subjectPresence.locationUniverseId then
            v78({
                status = "Fetching", 
                isPlayable = false
            });
            v76(l_Url_0.GAME_URL .. "v1/games/multiget-playability-status?universeIds=" .. v68.subjectPresence.locationUniverseId, "GET"):andThen(function(v79) --[[ Line: 256 ]]
                -- upvalues: v78 (ref)
                if v79.responseBody and v79.responseBody[1] then
                    v78({
                        status = "Finished", 
                        isPlayable = v79.responseBody[1].isPlayable
                    });
                end;
            end):catch(function(_) --[[ Line: 264 ]]
                -- upvalues: v78 (ref)
                v78({
                    status = "Failed", 
                    isPlayable = false
                });
            end);
        end;
    end, {
        (tostring(v68.subjectPresence))
    });
    local v81 = nil;
    if l_getFFlagAppChatPCMFixBlocking_0() then
        v81 = l_RoactRodux_0.useSelector(function(v82) --[[ Line: 276 ]]
            -- upvalues: v53 (ref), v68 (copy)
            return (if v53 then v82.PlayerContextualMenu.UserBlocking.isBlockedByMe else v82.PlayerContextualMenu.IsBlockedByMe)[v68.subjectUserId] == nil;
        end);
        v4.useEffect(function() --[[ Line: 284 ]]
            -- upvalues: v81 (ref), v69 (copy), v43 (ref), v68 (copy), v24 (ref)
            if v81 then
                v69(v43.IsBlockedById.API({
                    userId = v68.subjectUserId
                })):andThen(function() --[[ Line: 289 ]]

                end):catch(function() --[[ Line: 290 ]]
                    -- upvalues: v24 (ref)
                    v24:warning("Failed to check if subject user is blocked");
                end);
            end;
        end, {
            v81, 
            v69, 
            v68.subjectUserId
        });
    end;
    local v84 = l_useDesignTokens_0(function(v83) --[[ Line: 297 ]]
        return {
            iconEmphasis = v83.Semantic.Icon.Emphasis, 
            onlinePresence = v83.Semantic.Color.Common.Online, 
            joinEventButtonHeight = v83.Global.Size_600
        };
    end);
    local v85 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v68.subjectUserId
        }, 
        query = v5.Queries.userProfilesDisplayUserPlatformNamesByUserIds
    });
    local v86 = "";
    local v87 = "";
    local v88 = "";
    local v89 = "";
    if v85.data then
        v86 = v5.Selectors.getUsernameFromId(v85.data, v68.subjectUserId);
        v87 = v5.Selectors.getDisplayNameFromId(v85.data, v68.subjectUserId);
        v88 = v5.Selectors.getPlatformNameFromId(v85.data, v68.subjectUserId);
        if v56 then
            v89 = v5.Selectors.getPlatformProfileIdFromId(v85.data, v68.subjectUserId);
        end;
    end;
    local v90 = if v88 then v88 ~= "" else false;
    if v68.recommendationContext == l_RecommendationContextType_0.Contacts then
        v87 = v68.contactName or "";
    end;
    local v91, v92 = v31(v68.subjectPresence, v84);
    if v68.robloxFriendshipStatus ~= Enum.FriendStatus.Friend then
        v91 = nil;
        v92 = nil;
    end;
    local v93 = if v68.robloxFriendshipStatus == Enum.FriendStatus.Friend then v32(v68.subjectPresence) else nil;
    if v68.recommendationContext then
        local v94 = l_useRecommendationContextualInfoDisplay_0({
            contextType = v68.recommendationContext, 
            mutualFriendsCount = v68.mutualFriendsCount
        });
        v93 = v94.text;
        v91 = v94.icon;
    end;
    local v96 = v4.useCallback(function() --[[ Line: 348 ]]
        -- upvalues: v75 (copy), l_EventNames_0 (ref), v68 (copy), v69 (copy), v72 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref), v15 (ref), l_AnalyticsService_0 (ref), l_getCurrentRouteState_0 (ref), v71 (copy), l_AppPage_0 (ref)
        v75(l_EventNames_0.ViewExperienceDetails, {
            profileUserId = v68.subjectUserId
        });
        v69(v68.closeCentralOverlayThunk());
        if v68.subjectPresence and v68.subjectPresence.locationUniverseId then
            local v95 = tostring(v68.subjectPresence.locationUniverseId);
            if v72 then
                l_SetGamePlaySession_0(v72, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            end;
            v15.Events.gameDetailReferral(l_AnalyticsService_0.EventStream, v15.Constants.Context.PlayerContextualMenu, {
                pg = l_getCurrentRouteState_0(v71).routeName, 
                universeId = v95, 
                pid = v68.subjectPresence.locationPlaceId, 
                friendId = v68.subjectUserId
            });
            v71.navigate(l_AppPage_0.ExperienceDetail, {
                detail = v95
            });
        end;
    end, {
        v75, 
        v68.subjectUserId, 
        v68.closeCentralOverlayThunk, 
        v68.subjectPresence, 
        v71, 
        v72
    });
    local v97 = v4.useMemo(function() --[[ Line: 386 ]]
        -- upvalues: v68 (copy), v77 (copy), v4 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v96 (copy), v84 (copy), v73 (copy)
        if v68.enableExperienceCTAs then
            if (if v68.subjectPresence then v68.subjectPresence.status == "InGame" else false) and not v77.isPlayable then
                return function() --[[ Line: 394 ]]
                    -- upvalues: v4 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v96 (ref), v84 (ref), v73 (ref)
                    return v4.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        onActivated = v96, 
                        isLoading = false, 
                        size = UDim2.new(1, 0, 0, v84.joinEventButtonHeight), 
                        text = v73.ViewDetails, 
                        layoutOrder = 100
                    });
                end;
            else
                return nil;
            end;
        else
            return function() --[[ Line: 411 ]]
                -- upvalues: v4 (ref)
                return v4.createElement("Folder");
            end;
        end;
    end, {
        v77, 
        tostring(v68.subjectPresence), 
        v68.enableExperienceCTAs
    });
    local v98 = if v68.robloxFriendshipStatus == Enum.FriendStatus.Friend and v68.subjectPresence and v68.subjectPresence.status == "InGame" then v73.Join else nil;
    local v99 = v4.useCallback(function() --[[ Line: 429 ]]
        -- upvalues: v64 (ref), v75 (copy), l_getCurrentRouteState_0 (ref), v71 (copy), v68 (copy), v72 (copy)
        v64(v75, l_getCurrentRouteState_0(v71).routeName, v68.subjectUserId, v68.subjectPresence, v72);
    end, l_dependencyArray_0(v75, v71, v68.subjectUserId, v68.subjectPresence, v72));
    local v100 = v4.useCallback(function() --[[ Line: 440 ]]
        -- upvalues: v75 (copy), l_EventNames_0 (ref), v68 (copy), v69 (copy), v47 (ref), v51 (ref), v50 (ref), v48 (ref), v71 (copy), l_AppPage_0 (ref)
        v75(l_EventNames_0.ReportPlayer, {
            profileUserId = v68.subjectUserId
        });
        if v68.onReportActivated then
            v68.onReportActivated();
            return;
        else
            v69(v68.closeCentralOverlayThunk());
            if v47 then
                v69(v51({
                    abuseVector = v50.UserProfile, 
                    targetId = v68.subjectUserId, 
                    onClose = function() --[[ Line: 451 ]] --[[ Name: onClose ]]
                        -- upvalues: v69 (ref), v48 (ref)
                        v69(v48());
                    end
                }));
                return;
            else
                v71.navigate(l_AppPage_0.ReportScreen, {
                    reportData = {
                        assetId = v68.subjectUserId, 
                        reportAbuseVector = "user", 
                        context = "profile", 
                        platform = "console"
                    }
                });
                return;
            end;
        end;
    end, l_dependencyArray_0(v69, v71, v68.subjectUserId, v68.closeCentralOverlayThunk, v68.onReportActivated));
    local v101 = if v56 then v4.useCallback(function() --[[ Line: 478 ]]
        -- upvalues: v75 (copy), l_EventNames_0 (ref), v68 (copy), v56 (ref), v89 (ref)
        v75(l_EventNames_0.ViewPlatformProfile, {
            profileUserId = v68.subjectUserId
        });
        v56:ShowProfile(v89);
    end, {
        v89, 
        v69, 
        v71, 
        v68.subjectUserId, 
        v68.closeCentralOverlayThunk
    }) else nil;
    local v103 = v4.useCallback(function() --[[ Line: 487 ]]
        -- upvalues: v75 (copy), l_EventNames_0 (ref), v68 (copy), l_FFlagSkipBlockModal_0 (ref), v69 (copy), v71 (copy), l_AppPage_0 (ref), v14 (ref), v73 (copy), v43 (ref), v70 (copy), v74 (copy)
        v75(l_EventNames_0.BlockPlayer, {
            profileUserId = v68.subjectUserId
        });
        if not l_FFlagSkipBlockModal_0 or not v68.skipBlockModal then
            if v68.onBlockActivated then
                v68.onBlockActivated();
                return;
            else
                v69(v68.closeCentralOverlayThunk());
                v71.push(l_AppPage_0.BlockingModal, {
                    navProps = {
                        userId = v68.subjectUserId, 
                        onBlockSuccess = function() --[[ Line: 498 ]] --[[ Name: onBlockSuccess ]]
                            -- upvalues: v69 (ref), v14 (ref), v73 (ref)
                            v69(v14.Actions.SetCurrentToastMessage({
                                toastMessage = v73.UserBlocked, 
                                isLocalized = true, 
                                toastType = v14.Enums.ToastType.SuccessConfirmation
                            }));
                        end
                    }
                });
                return;
            end;
        else
            v69(v43.BlockUserById.API({
                userId = v68.subjectUserId, 
                currentUserId = v70
            })):andThen(function() --[[ Line: 513 ]]
                -- upvalues: v69 (ref), v14 (ref), v73 (ref), v68 (ref)
                v69(v14.Actions.SetCurrentToastMessage({
                    toastMessage = v73.UserBlocked, 
                    isLocalized = true, 
                    toastType = v14.Enums.ToastType.SuccessConfirmation
                }));
                v69(v68.closeCentralOverlayThunk());
            end):catch(function(_) --[[ Line: 521 ]]
                -- upvalues: v69 (ref), v14 (ref), v74 (ref)
                v69(v14.Actions.SetCurrentToastMessage(v74));
            end);
            return;
        end;
    end, l_dependencyArray_0(v73, v70, v69, v68.closeCentralOverlayThunk, v68.subjectUserId, v68.onBlockActivated, if l_FFlagSkipBlockModal_0 then v68.skipBlockModal else nil));
    local v105 = v4.useCallback(function() --[[ Line: 537 ]]
        -- upvalues: v69 (copy), v43 (ref), v68 (copy), v70 (copy), v14 (ref), v74 (copy)
        v69(v43.UnblockUserById.API({
            userId = v68.subjectUserId, 
            currentUserId = v70
        })):andThen(function() --[[ Line: 542 ]]
            -- upvalues: v69 (ref), v68 (ref)
            v69(v68.closeCentralOverlayThunk());
        end):catch(function(_) --[[ Line: 545 ]]
            -- upvalues: v69 (ref), v14 (ref), v74 (ref)
            v69(v14.Actions.SetCurrentToastMessage(v74));
        end);
    end, l_dependencyArray_0(v70, v69, v68.closeCentralOverlayThunk, v68.subjectUserId));
    local v106 = v4.useCallback(function() --[[ Line: 550 ]]
        -- upvalues: v75 (copy), l_EventNames_0 (ref), v68 (copy), v69 (copy), v42 (ref), v70 (copy), v14 (ref), v73 (copy), v74 (copy)
        v75(l_EventNames_0.Unfriend, {
            profileUserId = v68.subjectUserId
        });
        v69(v42.UnfriendTargetUserId.API({
            targetUserId = v68.subjectUserId, 
            currentUserId = v70
        })):andThen(function() --[[ Line: 557 ]]
            -- upvalues: v69 (ref), v14 (ref), v73 (ref), v68 (ref)
            v69(v14.Actions.SetCurrentToastMessage({
                toastMessage = v73.ConnectionRemoved, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v69(v68.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 565 ]]
            -- upvalues: v69 (ref), v14 (ref), v74 (ref)
            v69(v14.Actions.SetCurrentToastMessage(v74));
        end);
    end, l_dependencyArray_0(v73, v70, v69, v68.subjectUserId, v68.closeCentralOverlayThunk));
    local v107 = v4.useCallback(function() --[[ Line: 571 ]]
        -- upvalues: v75 (copy), l_EventNames_0 (ref), v68 (copy), v69 (copy), l_RecommendationContextType_0 (ref), v42 (ref), v70 (copy), v14 (ref), v73 (copy), v74 (copy)
        v75(l_EventNames_0.RequestFriendship, {
            profileUserId = v68.subjectUserId
        });
        v69(if v68.recommendationContext == l_RecommendationContextType_0.Contacts and v68.contactId then v42.RequestFriendshipFromContactId.API({
            contactId = v68.contactId, 
            currentUserId = v70
        }) else v42.RequestFriendshipFromUserId.API({
            targetUserId = v68.subjectUserId, 
            currentUserId = v70, 
            friendshipOriginSourceType = v68.friendshipOriginSourceType
        })):andThen(function() --[[ Line: 583 ]]
            -- upvalues: v69 (ref), v14 (ref), v73 (ref), v68 (ref)
            v69(v14.Actions.SetCurrentToastMessage({
                toastMessage = v73.ConnectionRequestSent, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v69(v68.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 591 ]]
            -- upvalues: v69 (ref), v14 (ref), v74 (ref)
            v69(v14.Actions.SetCurrentToastMessage(v74));
        end);
    end, {
        v73, 
        v70, 
        v69, 
        v68.closeCentralOverlayThunk, 
        v68.subjectUserId, 
        v68.recommendationContext, 
        v68.contactId, 
        v68.friendshipOriginSourceType
    });
    local v108 = v4.useCallback(function() --[[ Line: 607 ]]
        -- upvalues: v75 (copy), l_EventNames_0 (ref), v68 (copy), v69 (copy), v42 (ref), v70 (copy), v14 (ref), v73 (copy), v74 (copy)
        v75(l_EventNames_0.AcceptFriendRequest, {
            profileUserId = v68.subjectUserId
        });
        v69(v42.AcceptFriendRequestFromUserId.API({
            targetUserId = v68.subjectUserId, 
            currentUserId = v70
        })):andThen(function() --[[ Line: 614 ]]
            -- upvalues: v69 (ref), v14 (ref), v73 (ref), v68 (ref)
            v69(v14.Actions.SetCurrentToastMessage({
                toastMessage = v73.ConnectionAdded, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v69(v68.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 622 ]]
            -- upvalues: v69 (ref), v14 (ref), v74 (ref)
            v69(v14.Actions.SetCurrentToastMessage(v74));
        end);
    end, l_dependencyArray_0(v73, v70, v69, v68.closeCentralOverlayThunk, v68.subjectUserId));
    local v109 = v4.useCallback(function() --[[ Line: 627 ]]
        -- upvalues: v75 (copy), l_EventNames_0 (ref), v68 (copy), v69 (copy), v42 (ref), v70 (copy), v14 (ref), v73 (copy), v74 (copy)
        v75(l_EventNames_0.IgnoreFriendRequest, {
            profileUserId = v68.subjectUserId
        });
        v69(v42.DeclineFriendRequestFromUserId.API({
            targetUserId = v68.subjectUserId, 
            currentUserId = v70
        })):andThen(function() --[[ Line: 634 ]]
            -- upvalues: v69 (ref), v14 (ref), v73 (ref), v68 (ref)
            v69(v14.Actions.SetCurrentToastMessage({
                toastMessage = v73.FriendRequestIgnored, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v69(v68.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 642 ]]
            -- upvalues: v69 (ref), v14 (ref), v74 (ref)
            v69(v14.Actions.SetCurrentToastMessage(v74));
        end);
    end, l_dependencyArray_0(v73, v70, v69, v68.closeCentralOverlayThunk, v68.subjectUserId));
    local v111 = l_RoactRodux_0.useSelector(function(v110) --[[ Line: 647 ]]
        -- upvalues: v53 (ref), v68 (copy)
        return (if v53 then v110.PlayerContextualMenu.UserBlocking.isBlockedByMe else v110.PlayerContextualMenu.IsBlockedByMe)[v68.subjectUserId] or false;
    end);
    local v124 = v4.useMemo(function() --[[ Line: 656 ]]
        -- upvalues: l_Images_0 (ref), v73 (copy), v100 (copy), v52 (ref), v101 (copy), v103 (copy), v81 (ref), v105 (copy), v106 (copy), v107 (copy), v57 (ref), v108 (copy), v109 (copy), v111 (copy), v68 (copy), l_getFFlagAppChatPCMFixBlocking_0 (ref), v3 (ref), v56 (ref), v89 (ref), v21 (ref)
        local v112 = {
            icon = l_Images_0["icons/actions/feedback"], 
            text = v73.Report, 
            onActivated = v100
        };
        local v113 = {
            icon = v52, 
            text = v73.ViewPlatformProfile, 
            onActivated = v101
        };
        local v114 = {
            icon = l_Images_0["icons/actions/block"], 
            text = v73.Block, 
            onActivated = v103, 
            disabled = v81
        };
        local v115 = {
            icon = l_Images_0["icons/actions/block"], 
            text = v73.Unblock, 
            onActivated = v105
        };
        local v116 = {
            icon = l_Images_0["icons/actions/friends/friendRemove"], 
            text = v73.RemoveConnection, 
            onActivated = v106
        };
        local v117 = {
            icon = l_Images_0["icons/actions/friends/friendAdd"], 
            text = v73.AddConnection, 
            onActivated = v107
        };
        local v118 = {
            icon = l_Images_0["icons/actions/friends/friendpending"], 
            text = v73.PendingRequest, 
            onActivated = v57
        };
        local v119 = {
            icon = l_Images_0["icons/actions/friends/friendpending"], 
            text = v73.AcceptConnection, 
            onActivated = v108
        };
        local v120 = {
            icon = l_Images_0["icons/actions/reject"], 
            text = v73.IgnoreConnectionRequest, 
            onActivated = v109
        };
        local function v123() --[[ Line: 712 ]] --[[ Name: makeCtas ]]
            -- upvalues: v111 (ref), v115 (copy), v114 (copy), v68 (ref), v112 (copy), l_getFFlagAppChatPCMFixBlocking_0 (ref), v116 (copy), v117 (copy), v118 (copy), v119 (copy), v120 (copy), v3 (ref)
            local v121 = if v111 then v115 else v114;
            local v122 = {};
            v122 = if v68.robloxFriendshipStatus == Enum.FriendStatus.Friend then {
                v112, 
                if l_getFFlagAppChatPCMFixBlocking_0() then v121 else v114, 
                v116
            } else if v68.robloxFriendshipStatus == Enum.FriendStatus.NotFriend then if v68.contactId then {
                v117
            } else {
                v117, 
                v112, 
                v121
            } else if v68.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestSent then {
                v118, 
                v112, 
                v121
            } else if v68.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestReceived then {
                v119, 
                v120, 
                v112, 
                v121
            } else {
                v112, 
                v121
            };
            if v68.additionalButtons then
                v122 = v3.List.join(v122, v68.additionalButtons);
            end;
            return v122;
        end;
        if v56 and v56:IsProfileEnabled() and v89 and v89 ~= "" then
            return v21.append({
                v113
            }, (v123()));
        else
            return (v123());
        end;
    end, v3.Dictionary.union(if v56 then {
        v68.robloxFriendshipStatus, 
        v111, 
        v89, 
        v68.contactId, 
        v68.additionalButtons
    } else {
        v68.robloxFriendshipStatus, 
        v111, 
        v68.contactId, 
        v68.additionalButtons
    }, if l_getFFlagAppChatPCMFixBlocking_0() then {
        v81
    } else {}));
    return v4.createElement(v44, {
        headerProps = v4.useMemo(function() --[[ Line: 790 ]]
            -- upvalues: v87 (ref), v85 (copy), v68 (copy), l_RecommendationContextType_0 (ref), v86 (ref), v88 (ref), v90 (copy), v52 (ref), v93 (ref), v91 (ref), v92 (ref), v98 (copy), v99 (copy), v97 (copy)
            return {
                displayNameItem = {
                    labelText = v87, 
                    icon = nil, 
                    isLoading = v85.loading
                }, 
                userNameItem = if v68.recommendationContext == l_RecommendationContextType_0.Contacts then nil else {
                    labelText = "@" .. v86, 
                    icon = nil, 
                    isLoading = v85.loading
                }, 
                vendorNameItem = if v88 == "" then nil else {
                    labelText = v88 or "", 
                    icon = v90 and {
                        Image = v52, 
                        ImageRectOffset = Vector2.zero, 
                        ImageRectSize = Vector2.zero
                    } or nil, 
                    isLoading = v85.loading
                }, 
                contextText = v93, 
                contextIcon = v91, 
                contextIconColor = if v92 then v92.Color3 else nil, 
                contextIconTransparency = if v92 then v92.Transparency else nil, 
                joinEventText = v98, 
                joinEventOnActivated = v99, 
                renderJoinEventButton = v97
            };
        end, l_dependencyArray_0(v85, v87, v86, v88, v90, v91, v93, v92, v97, v98, v99, v68.recommendationContext)), 
        buttonProps = v124, 
        width = if v54 then v68.width else UDim.new(0, 400)
    });
end;