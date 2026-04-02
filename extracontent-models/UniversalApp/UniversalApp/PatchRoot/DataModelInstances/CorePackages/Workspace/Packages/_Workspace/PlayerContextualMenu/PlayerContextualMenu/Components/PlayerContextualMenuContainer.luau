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
local l_FFlagRemoveDependencyArrayAntipattern_0 = v25.FFlagRemoveDependencyArrayAntipattern;
local v57 = if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then game:GetService("PlatformFriendsService") else nil;
local function v58() --[[ Line: 108 ]] --[[ Name: NO_OPT_CALLBACK ]]

end;
local function v65(v59, v60, v61, v62, v63) --[[ Line: 110 ]] --[[ Name: launchGameWithAnalytics ]]
    -- upvalues: l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_EventNames_0 (copy), l_HttpService_0 (copy), v15 (copy), l_AnalyticsService_0 (copy), l_ExperienceService_0 (copy)
    l_SetGamePlaySession_0(v63, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
    v59(l_EventNames_0.JoinExperience, {
        profileUserId = v61
    });
    local v64 = l_HttpService_0:GenerateGUID(false);
    v15.Events.gamePlayIntent(l_AnalyticsService_0.EventStream, v15.Constants.Context.PlayerContextualMenu, {
        friendId = v61, 
        pageName = v60, 
        placeId = if v62 then v62.locationPlaceId else nil, 
        rootPlaceId = if v62 then v62.locationRootPlaceId else nil, 
        joinAttemptId = v64
    });
    l_ExperienceService_0:LaunchExperience({
        userId = v61, 
        joinAttemptId = v64
    }, "PlayerContextualMenu");
end;
local v66 = {
    enableExperienceCTAs = true, 
    width = UDim.new(0, 400)
};
local v67 = {
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
return function(v68) --[[ Line: 214 ]] --[[ Name: PlayerContextualMenuContainer ]]
    -- upvalues: v3 (copy), v66 (copy), l_RoactRodux_0 (copy), v9 (copy), v16 (copy), l_AppSessionService_0 (copy), l_useLocalization_0 (copy), v67 (copy), v14 (copy), v4 (copy), l_setupFireEvent_0 (copy), l_AnalyticsService_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v45 (copy), l_Url_0 (copy), l_getFFlagAppChatPCMFixBlocking_0 (copy), v53 (copy), v43 (copy), v24 (copy), l_useDesignTokens_0 (copy), v5 (copy), v57 (copy), l_RecommendationContextType_0 (copy), v31 (copy), v32 (copy), l_useRecommendationContextualInfoDisplay_0 (copy), l_EventNames_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v15 (copy), l_getCurrentRouteState_0 (copy), l_AppPage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v65 (copy), v47 (copy), v51 (ref), v50 (ref), v48 (ref), l_FFlagSkipBlockModal_0 (copy), v42 (copy), l_Images_0 (copy), v52 (copy), v58 (copy), v21 (copy), v44 (copy), v54 (copy)
    local v69 = v3.Dictionary.union(v66, v68);
    local v70 = l_RoactRodux_0.useDispatch();
    local v71 = v9.useLocalUserId();
    local v72 = v16.useNavigation();
    local v73 = v9.useRoactService(l_AppSessionService_0);
    local v74 = l_useLocalization_0(v67);
    local v75 = {
        toastMessage = v74.SomethingIsWrong, 
        isLocalized = true, 
        toastType = v14.Enums.ToastType.NetworkingError
    };
    local v76 = v4.useMemo(function() --[[ Line: 230 ]]
        -- upvalues: l_setupFireEvent_0 (ref), l_AnalyticsService_0 (ref), v71 (copy)
        return l_setupFireEvent_0({
            analytics = l_AnalyticsService_0, 
            infoForAllEvents = {
                uid = v71
            }
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71
    } else l_dependencyArray_0(v71));
    local v77 = v45();
    local v78, v79 = v4.useState({
        status = "NotStarted", 
        isPlayable = false
    });
    v4.useEffect(function() --[[ Line: 246 ]]
        -- upvalues: v69 (copy), v79 (copy), v77 (copy), l_Url_0 (ref)
        if v69.subjectPresence and v69.subjectPresence.locationUniverseId then
            v79({
                status = "Fetching", 
                isPlayable = false
            });
            v77(l_Url_0.GAME_URL .. "v1/games/multiget-playability-status?universeIds=" .. v69.subjectPresence.locationUniverseId, "GET"):andThen(function(v80) --[[ Line: 258 ]]
                -- upvalues: v79 (ref)
                if v80.responseBody and v80.responseBody[1] then
                    v79({
                        status = "Finished", 
                        isPlayable = v80.responseBody[1].isPlayable
                    });
                end;
            end):catch(function(_) --[[ Line: 266 ]]
                -- upvalues: v79 (ref)
                v79({
                    status = "Failed", 
                    isPlayable = false
                });
            end);
        end;
    end, {
        (tostring(v69.subjectPresence))
    });
    local v82 = nil;
    if l_getFFlagAppChatPCMFixBlocking_0() then
        v82 = l_RoactRodux_0.useSelector(function(v83) --[[ Line: 278 ]]
            -- upvalues: v53 (ref), v69 (copy)
            return (if v53 then v83.PlayerContextualMenu.UserBlocking.isBlockedByMe else v83.PlayerContextualMenu.IsBlockedByMe)[v69.subjectUserId] == nil;
        end);
        v4.useEffect(function() --[[ Line: 286 ]]
            -- upvalues: v82 (ref), v70 (copy), v43 (ref), v69 (copy), v24 (ref)
            if v82 then
                v70(v43.IsBlockedById.API({
                    userId = v69.subjectUserId
                })):andThen(function() --[[ Line: 291 ]]

                end):catch(function() --[[ Line: 292 ]]
                    -- upvalues: v24 (ref)
                    v24:warning("Failed to check if subject user is blocked");
                end);
            end;
        end, {
            v82, 
            v70, 
            v69.subjectUserId
        });
    end;
    local v85 = l_useDesignTokens_0(function(v84) --[[ Line: 299 ]]
        return {
            iconEmphasis = v84.Semantic.Icon.Emphasis, 
            onlinePresence = v84.Semantic.Color.Common.Online, 
            joinEventButtonHeight = v84.Global.Size_600
        };
    end);
    local v86 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v69.subjectUserId
        }, 
        query = v5.Queries.userProfilesDisplayUserPlatformNamesByUserIds
    });
    local v87 = "";
    local v88 = "";
    local v89 = "";
    local v90 = "";
    if v86.data then
        v87 = v5.Selectors.getUsernameFromId(v86.data, v69.subjectUserId);
        v88 = v5.Selectors.getDisplayNameFromId(v86.data, v69.subjectUserId);
        v89 = v5.Selectors.getPlatformNameFromId(v86.data, v69.subjectUserId);
        if v57 then
            v90 = v5.Selectors.getPlatformProfileIdFromId(v86.data, v69.subjectUserId);
        end;
    end;
    local v91 = if v89 then v89 ~= "" else false;
    if v69.recommendationContext == l_RecommendationContextType_0.Contacts then
        v88 = v69.contactName or "";
    end;
    local v92, v93 = v31(v69.subjectPresence, v85);
    if v69.robloxFriendshipStatus ~= Enum.FriendStatus.Friend then
        v92 = nil;
        v93 = nil;
    end;
    local v94 = if v69.robloxFriendshipStatus == Enum.FriendStatus.Friend then v32(v69.subjectPresence) else nil;
    if v69.recommendationContext then
        local v95 = l_useRecommendationContextualInfoDisplay_0({
            contextType = v69.recommendationContext, 
            mutualFriendsCount = v69.mutualFriendsCount
        });
        v94 = v95.text;
        v92 = v95.icon;
    end;
    local v97 = v4.useCallback(function() --[[ Line: 350 ]]
        -- upvalues: v76 (copy), l_EventNames_0 (ref), v69 (copy), v70 (copy), v73 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref), v15 (ref), l_AnalyticsService_0 (ref), l_getCurrentRouteState_0 (ref), v72 (copy), l_AppPage_0 (ref)
        v76(l_EventNames_0.ViewExperienceDetails, {
            profileUserId = v69.subjectUserId
        });
        v70(v69.closeCentralOverlayThunk());
        if v69.subjectPresence and v69.subjectPresence.locationUniverseId then
            local v96 = tostring(v69.subjectPresence.locationUniverseId);
            if v73 then
                l_SetGamePlaySession_0(v73, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            end;
            v15.Events.gameDetailReferral(l_AnalyticsService_0.EventStream, v15.Constants.Context.PlayerContextualMenu, {
                pg = l_getCurrentRouteState_0(v72).routeName, 
                universeId = v96, 
                pid = v69.subjectPresence.locationPlaceId, 
                friendId = v69.subjectUserId
            });
            v72.navigate(l_AppPage_0.ExperienceDetail, {
                detail = v96
            });
        end;
    end, {
        v76, 
        v69.subjectUserId, 
        v69.closeCentralOverlayThunk, 
        v69.subjectPresence, 
        v72, 
        v73
    });
    local v98 = v4.useMemo(function() --[[ Line: 388 ]]
        -- upvalues: v69 (copy), v78 (copy), v4 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v97 (copy), v85 (copy), v74 (copy)
        if v69.enableExperienceCTAs then
            if (if v69.subjectPresence then v69.subjectPresence.status == "InGame" else false) and not v78.isPlayable then
                return function() --[[ Line: 396 ]]
                    -- upvalues: v4 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v97 (ref), v85 (ref), v74 (ref)
                    return v4.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        onActivated = v97, 
                        isLoading = false, 
                        size = UDim2.new(1, 0, 0, v85.joinEventButtonHeight), 
                        text = v74.ViewDetails, 
                        layoutOrder = 100
                    });
                end;
            else
                return nil;
            end;
        else
            return function() --[[ Line: 413 ]]
                -- upvalues: v4 (ref)
                return v4.createElement("Folder");
            end;
        end;
    end, {
        v78, 
        tostring(v69.subjectPresence), 
        v69.enableExperienceCTAs
    });
    local v99 = if v69.robloxFriendshipStatus == Enum.FriendStatus.Friend and v69.subjectPresence and v69.subjectPresence.status == "InGame" then v74.Join else nil;
    local v100 = v4.useCallback(function() --[[ Line: 432 ]]
        -- upvalues: v65 (ref), v76 (copy), l_getCurrentRouteState_0 (ref), v72 (copy), v69 (copy), v73 (copy)
        v65(v76, l_getCurrentRouteState_0(v72).routeName, v69.subjectUserId, v69.subjectPresence, v73);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v76, 
        v72, 
        v69.subjectUserId, 
        v69.subjectPresence, 
        v73
    } else l_dependencyArray_0(v76, v72, v69.subjectUserId, v69.subjectPresence, v73));
    local v101 = v4.useCallback(function() --[[ Line: 453 ]]
        -- upvalues: v76 (copy), l_EventNames_0 (ref), v69 (copy), v70 (copy), v47 (ref), v51 (ref), v50 (ref), v48 (ref), v72 (copy), l_AppPage_0 (ref)
        v76(l_EventNames_0.ReportPlayer, {
            profileUserId = v69.subjectUserId
        });
        if v69.onReportActivated then
            v69.onReportActivated();
            return;
        else
            v70(v69.closeCentralOverlayThunk());
            if v47 then
                v70(v51({
                    abuseVector = v50.UserProfile, 
                    targetId = v69.subjectUserId, 
                    onClose = function() --[[ Line: 464 ]] --[[ Name: onClose ]]
                        -- upvalues: v70 (ref), v48 (ref)
                        v70(v48());
                    end
                }));
                return;
            else
                v72.navigate(l_AppPage_0.ReportScreen, {
                    reportData = {
                        assetId = v69.subjectUserId, 
                        reportAbuseVector = "user", 
                        context = "profile", 
                        platform = "console"
                    }
                });
                return;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v70, 
        v72, 
        v69.subjectUserId, 
        v69.closeCentralOverlayThunk, 
        v69.onReportActivated
    } else l_dependencyArray_0(v70, v72, v69.subjectUserId, v69.closeCentralOverlayThunk, v69.onReportActivated));
    local v102 = if v57 then v4.useCallback(function() --[[ Line: 499 ]]
        -- upvalues: v76 (copy), l_EventNames_0 (ref), v69 (copy), v57 (ref), v90 (ref)
        v76(l_EventNames_0.ViewPlatformProfile, {
            profileUserId = v69.subjectUserId
        });
        v57:ShowProfile(v90);
    end, {
        v90, 
        v70, 
        v72, 
        v69.subjectUserId, 
        v69.closeCentralOverlayThunk
    }) else nil;
    local v104 = v4.useCallback(function() --[[ Line: 508 ]]
        -- upvalues: v76 (copy), l_EventNames_0 (ref), v69 (copy), l_FFlagSkipBlockModal_0 (ref), v70 (copy), v72 (copy), l_AppPage_0 (ref), v14 (ref), v74 (copy), v43 (ref), v71 (copy), v75 (copy)
        v76(l_EventNames_0.BlockPlayer, {
            profileUserId = v69.subjectUserId
        });
        if not l_FFlagSkipBlockModal_0 or not v69.skipBlockModal then
            if v69.onBlockActivated then
                v69.onBlockActivated();
                return;
            else
                v70(v69.closeCentralOverlayThunk());
                v72.push(l_AppPage_0.BlockingModal, {
                    navProps = {
                        userId = v69.subjectUserId, 
                        onBlockSuccess = function() --[[ Line: 519 ]] --[[ Name: onBlockSuccess ]]
                            -- upvalues: v70 (ref), v14 (ref), v74 (ref)
                            v70(v14.Actions.SetCurrentToastMessage({
                                toastMessage = v74.UserBlocked, 
                                isLocalized = true, 
                                toastType = v14.Enums.ToastType.SuccessConfirmation
                            }));
                        end
                    }
                });
                return;
            end;
        else
            v70(v43.BlockUserById.API({
                userId = v69.subjectUserId, 
                currentUserId = v71
            })):andThen(function() --[[ Line: 534 ]]
                -- upvalues: v70 (ref), v14 (ref), v74 (ref), v69 (ref)
                v70(v14.Actions.SetCurrentToastMessage({
                    toastMessage = v74.UserBlocked, 
                    isLocalized = true, 
                    toastType = v14.Enums.ToastType.SuccessConfirmation
                }));
                v70(v69.closeCentralOverlayThunk());
            end):catch(function(_) --[[ Line: 542 ]]
                -- upvalues: v70 (ref), v14 (ref), v75 (ref)
                v70(v14.Actions.SetCurrentToastMessage(v75));
            end);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v74, 
        v71, 
        v70, 
        v69.closeCentralOverlayThunk, 
        v69.subjectUserId, 
        v69.onBlockActivated, 
        if l_FFlagSkipBlockModal_0 then v69.skipBlockModal else nil
    } else l_dependencyArray_0(v74, v71, v70, v69.closeCentralOverlayThunk, v69.subjectUserId, v69.onBlockActivated, if l_FFlagSkipBlockModal_0 then v69.skipBlockModal else nil));
    local v106 = v4.useCallback(function() --[[ Line: 569 ]]
        -- upvalues: v70 (copy), v43 (ref), v69 (copy), v71 (copy), v14 (ref), v75 (copy)
        v70(v43.UnblockUserById.API({
            userId = v69.subjectUserId, 
            currentUserId = v71
        })):andThen(function() --[[ Line: 574 ]]
            -- upvalues: v70 (ref), v69 (ref)
            v70(v69.closeCentralOverlayThunk());
        end):catch(function(_) --[[ Line: 577 ]]
            -- upvalues: v70 (ref), v14 (ref), v75 (ref)
            v70(v14.Actions.SetCurrentToastMessage(v75));
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71, 
        v70, 
        v69.closeCentralOverlayThunk, 
        v69.subjectUserId
    } else l_dependencyArray_0(v71, v70, v69.closeCentralOverlayThunk, v69.subjectUserId));
    local v107 = v4.useCallback(function() --[[ Line: 587 ]]
        -- upvalues: v76 (copy), l_EventNames_0 (ref), v69 (copy), v70 (copy), v42 (ref), v71 (copy), v14 (ref), v74 (copy), v75 (copy)
        v76(l_EventNames_0.Unfriend, {
            profileUserId = v69.subjectUserId
        });
        v70(v42.UnfriendTargetUserId.API({
            targetUserId = v69.subjectUserId, 
            currentUserId = v71
        })):andThen(function() --[[ Line: 594 ]]
            -- upvalues: v70 (ref), v14 (ref), v74 (ref), v69 (ref)
            v70(v14.Actions.SetCurrentToastMessage({
                toastMessage = v74.ConnectionRemoved, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v70(v69.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 602 ]]
            -- upvalues: v70 (ref), v14 (ref), v75 (ref)
            v70(v14.Actions.SetCurrentToastMessage(v75));
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v74, 
        v71, 
        v70, 
        v69.subjectUserId, 
        v69.closeCentralOverlayThunk
    } else l_dependencyArray_0(v74, v71, v70, v69.subjectUserId, v69.closeCentralOverlayThunk));
    local v108 = v4.useCallback(function() --[[ Line: 618 ]]
        -- upvalues: v76 (copy), l_EventNames_0 (ref), v69 (copy), v70 (copy), l_RecommendationContextType_0 (ref), v42 (ref), v71 (copy), v14 (ref), v74 (copy), v75 (copy)
        v76(l_EventNames_0.RequestFriendship, {
            profileUserId = v69.subjectUserId
        });
        v70(if v69.recommendationContext == l_RecommendationContextType_0.Contacts and v69.contactId then v42.RequestFriendshipFromContactId.API({
            contactId = v69.contactId, 
            currentUserId = v71
        }) else v42.RequestFriendshipFromUserId.API({
            targetUserId = v69.subjectUserId, 
            currentUserId = v71, 
            friendshipOriginSourceType = v69.friendshipOriginSourceType
        })):andThen(function() --[[ Line: 630 ]]
            -- upvalues: v70 (ref), v14 (ref), v74 (ref), v69 (ref)
            v70(v14.Actions.SetCurrentToastMessage({
                toastMessage = v74.ConnectionRequestSent, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v70(v69.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 638 ]]
            -- upvalues: v70 (ref), v14 (ref), v75 (ref)
            v70(v14.Actions.SetCurrentToastMessage(v75));
        end);
    end, {
        v74, 
        v71, 
        v70, 
        v69.closeCentralOverlayThunk, 
        v69.subjectUserId, 
        v69.recommendationContext, 
        v69.contactId, 
        v69.friendshipOriginSourceType
    });
    local v109 = v4.useCallback(function() --[[ Line: 655 ]]
        -- upvalues: v76 (copy), l_EventNames_0 (ref), v69 (copy), v70 (copy), v42 (ref), v71 (copy), v14 (ref), v74 (copy), v75 (copy)
        v76(l_EventNames_0.AcceptFriendRequest, {
            profileUserId = v69.subjectUserId
        });
        v70(v42.AcceptFriendRequestFromUserId.API({
            targetUserId = v69.subjectUserId, 
            currentUserId = v71
        })):andThen(function() --[[ Line: 662 ]]
            -- upvalues: v70 (ref), v14 (ref), v74 (ref), v69 (ref)
            v70(v14.Actions.SetCurrentToastMessage({
                toastMessage = v74.ConnectionAdded, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v70(v69.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 670 ]]
            -- upvalues: v70 (ref), v14 (ref), v75 (ref)
            v70(v14.Actions.SetCurrentToastMessage(v75));
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v74, 
        v71, 
        v70, 
        v69.closeCentralOverlayThunk, 
        v69.subjectUserId
    } else l_dependencyArray_0(v74, v71, v70, v69.closeCentralOverlayThunk, v69.subjectUserId));
    local v110 = v4.useCallback(function() --[[ Line: 686 ]]
        -- upvalues: v76 (copy), l_EventNames_0 (ref), v69 (copy), v70 (copy), v42 (ref), v71 (copy), v14 (ref), v74 (copy), v75 (copy)
        v76(l_EventNames_0.IgnoreFriendRequest, {
            profileUserId = v69.subjectUserId
        });
        v70(v42.DeclineFriendRequestFromUserId.API({
            targetUserId = v69.subjectUserId, 
            currentUserId = v71
        })):andThen(function() --[[ Line: 693 ]]
            -- upvalues: v70 (ref), v14 (ref), v74 (ref), v69 (ref)
            v70(v14.Actions.SetCurrentToastMessage({
                toastMessage = v74.FriendRequestIgnored, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v70(v69.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 701 ]]
            -- upvalues: v70 (ref), v14 (ref), v75 (ref)
            v70(v14.Actions.SetCurrentToastMessage(v75));
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v74, 
        v71, 
        v70, 
        v69.closeCentralOverlayThunk, 
        v69.subjectUserId
    } else l_dependencyArray_0(v74, v71, v70, v69.closeCentralOverlayThunk, v69.subjectUserId));
    local v112 = l_RoactRodux_0.useSelector(function(v111) --[[ Line: 716 ]]
        -- upvalues: v53 (ref), v69 (copy)
        return (if v53 then v111.PlayerContextualMenu.UserBlocking.isBlockedByMe else v111.PlayerContextualMenu.IsBlockedByMe)[v69.subjectUserId] or false;
    end);
    local v125 = v4.useMemo(function() --[[ Line: 725 ]]
        -- upvalues: l_Images_0 (ref), v74 (copy), v101 (copy), v52 (ref), v102 (copy), v104 (copy), v82 (ref), v106 (copy), v107 (copy), v108 (copy), v58 (ref), v109 (copy), v110 (copy), v112 (copy), v69 (copy), l_getFFlagAppChatPCMFixBlocking_0 (ref), v3 (ref), v57 (ref), v90 (ref), v21 (ref)
        local v113 = {
            icon = l_Images_0["icons/actions/feedback"], 
            text = v74.Report, 
            onActivated = v101
        };
        local v114 = {
            icon = v52, 
            text = v74.ViewPlatformProfile, 
            onActivated = v102
        };
        local v115 = {
            icon = l_Images_0["icons/actions/block"], 
            text = v74.Block, 
            onActivated = v104, 
            disabled = v82
        };
        local v116 = {
            icon = l_Images_0["icons/actions/block"], 
            text = v74.Unblock, 
            onActivated = v106
        };
        local v117 = {
            icon = l_Images_0["icons/actions/friends/friendRemove"], 
            text = v74.RemoveConnection, 
            onActivated = v107
        };
        local v118 = {
            icon = l_Images_0["icons/actions/friends/friendAdd"], 
            text = v74.AddConnection, 
            onActivated = v108
        };
        local v119 = {
            icon = l_Images_0["icons/actions/friends/friendpending"], 
            text = v74.PendingRequest, 
            onActivated = v58
        };
        local v120 = {
            icon = l_Images_0["icons/actions/friends/friendpending"], 
            text = v74.AcceptConnection, 
            onActivated = v109
        };
        local v121 = {
            icon = l_Images_0["icons/actions/reject"], 
            text = v74.IgnoreConnectionRequest, 
            onActivated = v110
        };
        local function v124() --[[ Line: 781 ]] --[[ Name: makeCtas ]]
            -- upvalues: v112 (ref), v116 (copy), v115 (copy), v69 (ref), v113 (copy), l_getFFlagAppChatPCMFixBlocking_0 (ref), v117 (copy), v118 (copy), v119 (copy), v120 (copy), v121 (copy), v3 (ref)
            local v122 = if v112 then v116 else v115;
            local v123 = {};
            v123 = if v69.robloxFriendshipStatus == Enum.FriendStatus.Friend then {
                v113, 
                if l_getFFlagAppChatPCMFixBlocking_0() then v122 else v115, 
                v117
            } else if v69.robloxFriendshipStatus == Enum.FriendStatus.NotFriend then if v69.contactId then {
                v118
            } else {
                v118, 
                v113, 
                v122
            } else if v69.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestSent then {
                v119, 
                v113, 
                v122
            } else if v69.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestReceived then {
                v120, 
                v121, 
                v113, 
                v122
            } else {
                v113, 
                v122
            };
            if v69.additionalButtons then
                v123 = v3.List.join(v123, v69.additionalButtons);
            end;
            return v123;
        end;
        if v57 and v57:IsProfileEnabled() and v90 and v90 ~= "" then
            return v21.append({
                v114
            }, (v124()));
        else
            return (v124());
        end;
    end, v3.Dictionary.union(if v57 then {
        v69.robloxFriendshipStatus, 
        v112, 
        v90, 
        v69.contactId, 
        v69.additionalButtons
    } else {
        v69.robloxFriendshipStatus, 
        v112, 
        v69.contactId, 
        v69.additionalButtons
    }, if l_getFFlagAppChatPCMFixBlocking_0() then {
        v82
    } else {}));
    return v4.createElement(v44, {
        headerProps = v4.useMemo(function() --[[ Line: 859 ]]
            -- upvalues: v88 (ref), v86 (copy), v69 (copy), l_RecommendationContextType_0 (ref), v87 (ref), v89 (ref), v91 (copy), v52 (ref), v94 (ref), v92 (ref), v93 (ref), v99 (copy), v100 (copy), v98 (copy)
            return {
                displayNameItem = {
                    labelText = v88, 
                    icon = nil, 
                    isLoading = v86.loading
                }, 
                userNameItem = if v69.recommendationContext == l_RecommendationContextType_0.Contacts then nil else {
                    labelText = "@" .. v87, 
                    icon = nil, 
                    isLoading = v86.loading
                }, 
                vendorNameItem = if v89 == "" then nil else {
                    labelText = v89 or "", 
                    icon = v91 and {
                        Image = v52, 
                        ImageRectOffset = Vector2.zero, 
                        ImageRectSize = Vector2.zero
                    } or nil, 
                    isLoading = v86.loading
                }, 
                contextText = v94, 
                contextIcon = v92, 
                contextIconColor = if v93 then v93.Color3 else nil, 
                contextIconTransparency = if v93 then v93.Transparency else nil, 
                joinEventText = v99, 
                joinEventOnActivated = v100, 
                renderJoinEventButton = v98
            };
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v86, 
            v88, 
            v87, 
            v89, 
            v91, 
            v92, 
            v94, 
            v93, 
            v98, 
            v99, 
            v100, 
            v69.recommendationContext
        } else l_dependencyArray_0(v86, v88, v87, v89, v91, v92, v94, v93, v98, v99, v100, v69.recommendationContext)), 
        buttonProps = v125, 
        width = if v54 then v69.width else UDim.new(0, 400)
    });
end;