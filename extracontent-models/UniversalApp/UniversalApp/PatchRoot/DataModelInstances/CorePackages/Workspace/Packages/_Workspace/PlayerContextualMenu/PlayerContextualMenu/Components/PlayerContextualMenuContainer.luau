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
local l_getFFlagAppChatPCMFixBlocking_0 = require(l_Parent_0.SharedFlags).getFFlagAppChatPCMFixBlocking;
local l_RecommendationContextType_0 = require(l_Parent_0.FriendsRodux).config({
    keyPath = "PlayerContextualMenu.Friends"
}).Enums.RecommendationContextType;
local l_useRecommendationContextualInfoDisplay_0 = require(l_Parent_0.SocialCommon).Hooks.useRecommendationContextualInfoDisplay;
local _ = require(script.Parent.Types);
local v29 = require(script.Parent.getPresenceIcon);
local v30 = require(script.Parent.getPresenceText);
local v31 = require(l_Parent_0.UIBlox);
local l_Images_0 = v31.App.ImageSet.Images;
local l_Button_0 = v31.App.Button.Button;
local l_ButtonType_0 = v31.App.Button.Enum.ButtonType;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v36 = require(l_script_FirstAncestor_0.Analytics);
local l_setupFireEvent_0 = v36.setupFireEvent;
local l_EventNames_0 = v36.EventNames;
local l_AnalyticsService_0 = v36.AnalyticsService;
local v40 = require(l_script_FirstAncestor_0.Http.Friends);
local v41 = require(l_script_FirstAncestor_0.Http.Blocking);
local v42 = require(l_script_FirstAncestor_0.Components.PlayerContextualMenuComponent);
local v43 = require(script.Parent.HttpRequest.useHttpRequest);
local _ = require(l_Parent_0.FriendsNetworking).Enums;
local v45 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfileConsoleUseNewReportFlow);
local v46 = nil;
local v47 = nil;
local v48 = nil;
local v49 = nil;
if v45 then
    v46 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
    v47 = require(l_Parent_0.GenericAbuseReporting);
    v48 = v47.Enums.AbuseVector;
    v49 = v47.Thunks.OpenDynamicAbuseReport;
end;
local v50 = game:DefineFastString("PlayerContextualMenuVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png");
local v51 = require(l_script_FirstAncestor_0.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled);
local v52 = game:DefineFastFlag("FFlagPCMAcceptWidthAsProp", false);
local l_FFlagSkipBlockModal_0 = require(l_Parent_0.SharedFlags).FFlagSkipBlockModal;
local v54 = if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then game:GetService("PlatformFriendsService") else nil;
local function v55() --[[ Line: 105 ]] --[[ Name: NO_OPT_CALLBACK ]]

end;
local function v62(v56, v57, v58, v59, v60) --[[ Line: 107 ]] --[[ Name: launchGameWithAnalytics ]]
    -- upvalues: l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_EventNames_0 (copy), l_HttpService_0 (copy), v15 (copy), l_AnalyticsService_0 (copy), l_ExperienceService_0 (copy)
    l_SetGamePlaySession_0(v60, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
    v56(l_EventNames_0.JoinExperience, {
        profileUserId = v58
    });
    local v61 = l_HttpService_0:GenerateGUID(false);
    v15.Events.gamePlayIntent(l_AnalyticsService_0.EventStream, v15.Constants.Context.PlayerContextualMenu, {
        friendId = v58, 
        pageName = v57, 
        placeId = if v59 then v59.locationPlaceId else nil, 
        rootPlaceId = if v59 then v59.locationRootPlaceId else nil, 
        joinAttemptId = v61
    });
    l_ExperienceService_0:LaunchExperience({
        userId = v58, 
        joinAttemptId = v61
    }, "PlayerContextualMenu");
end;
local v63 = {
    enableExperienceCTAs = true, 
    width = UDim.new(0, 400)
};
local v64 = {
    AcceptConnection = "CommonUI.Features.Label.AcceptConnection", 
    AddConnection = "CommonUI.Features.Label.AddConnection", 
    IgnoreConnectionRequest = "Feature.AddFriends.Action.IgnoreConnectionRequest", 
    RemoveConnection = "CommonUI.Features.Label.RemoveConnection", 
    Block = "Feature.Friends.Action.Block", 
    Unblock = "Feature.Friends.Action.Unblock", 
    Chat = "CommonUI.Features.Label.Chat", 
    Join = "Feature.Chat.Drawer.Join", 
    PendingRequest = "Feature.Friends.Action.PendingRequest", 
    Report = "Feature.Catalog.Action.Report", 
    ViewDetails = "Feature.Profile.Label.ViewDetails", 
    ViewGamerCardWord = "Xbox.Old.ViewGamerCardWord", 
    ViewPlatformProfile = "Feature.Friends.Action.ViewPlatformProfile", 
    ConnectionAdded = "Feature.Friends.Action.ConnectionAdded", 
    ConnectionRequestSent = "Feature.Friends.Action.ConnectionRequestSent", 
    ConnectionRemoved = "Feature.Friends.Label.ConnectionRemoved", 
    FriendRequestIgnored = "Feature.AddFriends.Action.RequestIgnored", 
    SomethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    UserBlocked = "Feature.Profile.Action.UserBlocked"
};
return function(v65) --[[ Line: 198 ]] --[[ Name: PlayerContextualMenuContainer ]]
    -- upvalues: v3 (copy), v63 (copy), l_RoactRodux_0 (copy), v9 (copy), v16 (copy), l_AppSessionService_0 (copy), l_useLocalization_0 (copy), v64 (copy), v14 (copy), v4 (copy), l_setupFireEvent_0 (copy), l_AnalyticsService_0 (copy), l_dependencyArray_0 (copy), v43 (copy), l_Url_0 (copy), l_getFFlagAppChatPCMFixBlocking_0 (copy), v51 (copy), v41 (copy), v24 (copy), l_useDesignTokens_0 (copy), v5 (copy), v54 (copy), l_RecommendationContextType_0 (copy), v29 (copy), v30 (copy), l_useRecommendationContextualInfoDisplay_0 (copy), l_EventNames_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v15 (copy), l_getCurrentRouteState_0 (copy), l_AppPage_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v62 (copy), v45 (copy), v49 (ref), v48 (ref), v46 (ref), l_FFlagSkipBlockModal_0 (copy), v40 (copy), l_Images_0 (copy), v50 (copy), v55 (copy), v21 (copy), v42 (copy), v52 (copy)
    local v66 = v3.Dictionary.union(v63, v65);
    local v67 = l_RoactRodux_0.useDispatch();
    local v68 = v9.useLocalUserId();
    local v69 = v16.useNavigation();
    local v70 = v9.useRoactService(l_AppSessionService_0);
    local v71 = l_useLocalization_0(v64);
    local v72 = {
        toastMessage = v71.SomethingIsWrong, 
        isLocalized = true, 
        toastType = v14.Enums.ToastType.NetworkingError
    };
    local v73 = v4.useMemo(function() --[[ Line: 214 ]]
        -- upvalues: l_setupFireEvent_0 (ref), l_AnalyticsService_0 (ref), v68 (copy)
        return l_setupFireEvent_0({
            analytics = l_AnalyticsService_0, 
            infoForAllEvents = {
                uid = v68
            }
        });
    end, l_dependencyArray_0(v68));
    local v74 = v43();
    local v75, v76 = v4.useState({
        status = "NotStarted", 
        isPlayable = false
    });
    v4.useEffect(function() --[[ Line: 230 ]]
        -- upvalues: v66 (copy), v76 (copy), v74 (copy), l_Url_0 (ref)
        if v66.subjectPresence and v66.subjectPresence.locationUniverseId then
            v76({
                status = "Fetching", 
                isPlayable = false
            });
            v74(l_Url_0.GAME_URL .. "v1/games/multiget-playability-status?universeIds=" .. v66.subjectPresence.locationUniverseId, "GET"):andThen(function(v77) --[[ Line: 242 ]]
                -- upvalues: v76 (ref)
                if v77.responseBody and v77.responseBody[1] then
                    v76({
                        status = "Finished", 
                        isPlayable = v77.responseBody[1].isPlayable
                    });
                end;
            end):catch(function(_) --[[ Line: 250 ]]
                -- upvalues: v76 (ref)
                v76({
                    status = "Failed", 
                    isPlayable = false
                });
            end);
        end;
    end, {
        (tostring(v66.subjectPresence))
    });
    local v79 = nil;
    if l_getFFlagAppChatPCMFixBlocking_0() then
        v79 = l_RoactRodux_0.useSelector(function(v80) --[[ Line: 262 ]]
            -- upvalues: v51 (ref), v66 (copy)
            return (if v51 then v80.PlayerContextualMenu.UserBlocking.isBlockedByMe else v80.PlayerContextualMenu.IsBlockedByMe)[v66.subjectUserId] == nil;
        end);
        v4.useEffect(function() --[[ Line: 270 ]]
            -- upvalues: v79 (ref), v67 (copy), v41 (ref), v66 (copy), v24 (ref)
            if v79 then
                v67(v41.IsBlockedById.API({
                    userId = v66.subjectUserId
                })):andThen(function() --[[ Line: 275 ]]

                end):catch(function() --[[ Line: 276 ]]
                    -- upvalues: v24 (ref)
                    v24:warning("Failed to check if subject user is blocked");
                end);
            end;
        end, {
            v79, 
            v67, 
            v66.subjectUserId
        });
    end;
    local v82 = l_useDesignTokens_0(function(v81) --[[ Line: 283 ]]
        return {
            iconEmphasis = v81.Semantic.Icon.Emphasis, 
            onlinePresence = v81.Semantic.Color.Common.Online, 
            joinEventButtonHeight = v81.Global.Size_600
        };
    end);
    local v83 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v66.subjectUserId
        }, 
        query = v5.Queries.userProfilesDisplayUserPlatformNamesByUserIds
    });
    local v84 = "";
    local v85 = "";
    local v86 = "";
    local v87 = "";
    if v83.data then
        v84 = v5.Selectors.getUsernameFromId(v83.data, v66.subjectUserId);
        v85 = v5.Selectors.getDisplayNameFromId(v83.data, v66.subjectUserId);
        v86 = v5.Selectors.getPlatformNameFromId(v83.data, v66.subjectUserId);
        if v54 then
            v87 = v5.Selectors.getPlatformProfileIdFromId(v83.data, v66.subjectUserId);
        end;
    end;
    local v88 = if v86 then v86 ~= "" else false;
    if v66.recommendationContext == l_RecommendationContextType_0.Contacts then
        v85 = v66.contactName or "";
    end;
    local v89, v90 = v29(v66.subjectPresence, v82);
    if v66.robloxFriendshipStatus ~= Enum.FriendStatus.Friend then
        v89 = nil;
        v90 = nil;
    end;
    local v91 = if v66.robloxFriendshipStatus == Enum.FriendStatus.Friend then v30(v66.subjectPresence) else nil;
    if v66.recommendationContext then
        local v92 = l_useRecommendationContextualInfoDisplay_0({
            contextType = v66.recommendationContext, 
            mutualFriendsCount = v66.mutualFriendsCount
        });
        v91 = v92.text;
        v89 = v92.icon;
    end;
    local v94 = v4.useCallback(function() --[[ Line: 334 ]]
        -- upvalues: v73 (copy), l_EventNames_0 (ref), v66 (copy), v67 (copy), v70 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref), v15 (ref), l_AnalyticsService_0 (ref), l_getCurrentRouteState_0 (ref), v69 (copy), l_AppPage_0 (ref)
        v73(l_EventNames_0.ViewExperienceDetails, {
            profileUserId = v66.subjectUserId
        });
        v67(v66.closeCentralOverlayThunk());
        if v66.subjectPresence and v66.subjectPresence.locationUniverseId then
            local v93 = tostring(v66.subjectPresence.locationUniverseId);
            if v70 then
                l_SetGamePlaySession_0(v70, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            end;
            v15.Events.gameDetailReferral(l_AnalyticsService_0.EventStream, v15.Constants.Context.PlayerContextualMenu, {
                pg = l_getCurrentRouteState_0(v69).routeName, 
                universeId = v93, 
                pid = v66.subjectPresence.locationPlaceId, 
                friendId = v66.subjectUserId
            });
            v69.navigate(l_AppPage_0.ExperienceDetail, {
                detail = v93
            });
        end;
    end, {
        v73, 
        v66.subjectUserId, 
        v66.closeCentralOverlayThunk, 
        v66.subjectPresence, 
        v69, 
        v70
    });
    local v95 = v4.useMemo(function() --[[ Line: 372 ]]
        -- upvalues: v66 (copy), v75 (copy), v4 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v94 (copy), v82 (copy), v71 (copy)
        if v66.enableExperienceCTAs then
            if (if v66.subjectPresence then v66.subjectPresence.status == "InGame" else false) and not v75.isPlayable then
                return function() --[[ Line: 380 ]]
                    -- upvalues: v4 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v94 (ref), v82 (ref), v71 (ref)
                    return v4.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        onActivated = v94, 
                        isLoading = false, 
                        size = UDim2.new(1, 0, 0, v82.joinEventButtonHeight), 
                        text = v71.ViewDetails, 
                        layoutOrder = 100
                    });
                end;
            else
                return nil;
            end;
        else
            return function() --[[ Line: 397 ]]
                -- upvalues: v4 (ref)
                return v4.createElement("Folder");
            end;
        end;
    end, {
        v75, 
        tostring(v66.subjectPresence), 
        v66.enableExperienceCTAs
    });
    local v96 = if v66.robloxFriendshipStatus == Enum.FriendStatus.Friend and v66.subjectPresence and v66.subjectPresence.status == "InGame" then v71.Join else nil;
    local v97 = v4.useCallback(function() --[[ Line: 415 ]]
        -- upvalues: v62 (ref), v73 (copy), l_getCurrentRouteState_0 (ref), v69 (copy), v66 (copy), v70 (copy)
        v62(v73, l_getCurrentRouteState_0(v69).routeName, v66.subjectUserId, v66.subjectPresence, v70);
    end, l_dependencyArray_0(v73, v69, v66.subjectUserId, v66.subjectPresence, v70));
    local v98 = v4.useCallback(function() --[[ Line: 426 ]]
        -- upvalues: v73 (copy), l_EventNames_0 (ref), v66 (copy), v67 (copy), v45 (ref), v49 (ref), v48 (ref), v46 (ref), v69 (copy), l_AppPage_0 (ref)
        v73(l_EventNames_0.ReportPlayer, {
            profileUserId = v66.subjectUserId
        });
        if v66.onReportActivated then
            v66.onReportActivated();
            return;
        else
            v67(v66.closeCentralOverlayThunk());
            if v45 then
                v67(v49({
                    abuseVector = v48.UserProfile, 
                    targetId = v66.subjectUserId, 
                    onClose = function() --[[ Line: 437 ]] --[[ Name: onClose ]]
                        -- upvalues: v67 (ref), v46 (ref)
                        v67(v46());
                    end
                }));
                return;
            else
                v69.navigate(l_AppPage_0.ReportScreen, {
                    reportData = {
                        assetId = v66.subjectUserId, 
                        reportAbuseVector = "user", 
                        context = "profile", 
                        platform = "console"
                    }
                });
                return;
            end;
        end;
    end, l_dependencyArray_0(v67, v69, v66.subjectUserId, v66.closeCentralOverlayThunk, v66.onReportActivated));
    local v99 = if v54 then v4.useCallback(function() --[[ Line: 464 ]]
        -- upvalues: v73 (copy), l_EventNames_0 (ref), v66 (copy), v54 (ref), v87 (ref)
        v73(l_EventNames_0.ViewPlatformProfile, {
            profileUserId = v66.subjectUserId
        });
        v54:ShowProfile(v87);
    end, {
        v87, 
        v67, 
        v69, 
        v66.subjectUserId, 
        v66.closeCentralOverlayThunk
    }) else nil;
    local v101 = v4.useCallback(function() --[[ Line: 473 ]]
        -- upvalues: v73 (copy), l_EventNames_0 (ref), v66 (copy), l_FFlagSkipBlockModal_0 (ref), v67 (copy), v69 (copy), l_AppPage_0 (ref), v14 (ref), v71 (copy), v41 (ref), v68 (copy), v72 (copy)
        v73(l_EventNames_0.BlockPlayer, {
            profileUserId = v66.subjectUserId
        });
        if not l_FFlagSkipBlockModal_0 or not v66.skipBlockModal then
            if v66.onBlockActivated then
                v66.onBlockActivated();
                return;
            else
                v67(v66.closeCentralOverlayThunk());
                v69.push(l_AppPage_0.BlockingModal, {
                    navProps = {
                        userId = v66.subjectUserId, 
                        onBlockSuccess = function() --[[ Line: 484 ]] --[[ Name: onBlockSuccess ]]
                            -- upvalues: v67 (ref), v14 (ref), v71 (ref)
                            v67(v14.Actions.SetCurrentToastMessage({
                                toastMessage = v71.UserBlocked, 
                                isLocalized = true, 
                                toastType = v14.Enums.ToastType.SuccessConfirmation
                            }));
                        end
                    }
                });
                return;
            end;
        else
            v67(v41.BlockUserById.API({
                userId = v66.subjectUserId, 
                currentUserId = v68
            })):andThen(function() --[[ Line: 499 ]]
                -- upvalues: v67 (ref), v14 (ref), v71 (ref), v66 (ref)
                v67(v14.Actions.SetCurrentToastMessage({
                    toastMessage = v71.UserBlocked, 
                    isLocalized = true, 
                    toastType = v14.Enums.ToastType.SuccessConfirmation
                }));
                v67(v66.closeCentralOverlayThunk());
            end):catch(function(_) --[[ Line: 507 ]]
                -- upvalues: v67 (ref), v14 (ref), v72 (ref)
                v67(v14.Actions.SetCurrentToastMessage(v72));
            end);
            return;
        end;
    end, l_dependencyArray_0(v71, v68, v67, v66.closeCentralOverlayThunk, v66.subjectUserId, v66.onBlockActivated, if l_FFlagSkipBlockModal_0 then v66.skipBlockModal else nil));
    local v103 = v4.useCallback(function() --[[ Line: 523 ]]
        -- upvalues: v67 (copy), v41 (ref), v66 (copy), v68 (copy), v14 (ref), v72 (copy)
        v67(v41.UnblockUserById.API({
            userId = v66.subjectUserId, 
            currentUserId = v68
        })):andThen(function() --[[ Line: 528 ]]
            -- upvalues: v67 (ref), v66 (ref)
            v67(v66.closeCentralOverlayThunk());
        end):catch(function(_) --[[ Line: 531 ]]
            -- upvalues: v67 (ref), v14 (ref), v72 (ref)
            v67(v14.Actions.SetCurrentToastMessage(v72));
        end);
    end, l_dependencyArray_0(v68, v67, v66.closeCentralOverlayThunk, v66.subjectUserId));
    local v104 = v4.useCallback(function() --[[ Line: 536 ]]
        -- upvalues: v73 (copy), l_EventNames_0 (ref), v66 (copy), v67 (copy), v40 (ref), v68 (copy), v14 (ref), v71 (copy), v72 (copy)
        v73(l_EventNames_0.Unfriend, {
            profileUserId = v66.subjectUserId
        });
        v67(v40.UnfriendTargetUserId.API({
            targetUserId = v66.subjectUserId, 
            currentUserId = v68
        })):andThen(function() --[[ Line: 543 ]]
            -- upvalues: v67 (ref), v14 (ref), v71 (ref), v66 (ref)
            v67(v14.Actions.SetCurrentToastMessage({
                toastMessage = v71.ConnectionRemoved, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v67(v66.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 551 ]]
            -- upvalues: v67 (ref), v14 (ref), v72 (ref)
            v67(v14.Actions.SetCurrentToastMessage(v72));
        end);
    end, l_dependencyArray_0(v71, v68, v67, v66.subjectUserId, v66.closeCentralOverlayThunk));
    local v105 = v4.useCallback(function() --[[ Line: 557 ]]
        -- upvalues: v73 (copy), l_EventNames_0 (ref), v66 (copy), v67 (copy), l_RecommendationContextType_0 (ref), v40 (ref), v68 (copy), v14 (ref), v71 (copy), v72 (copy)
        v73(l_EventNames_0.RequestFriendship, {
            profileUserId = v66.subjectUserId
        });
        v67(if v66.recommendationContext == l_RecommendationContextType_0.Contacts and v66.contactId then v40.RequestFriendshipFromContactId.API({
            contactId = v66.contactId, 
            currentUserId = v68
        }) else v40.RequestFriendshipFromUserId.API({
            targetUserId = v66.subjectUserId, 
            currentUserId = v68, 
            friendshipOriginSourceType = v66.friendshipOriginSourceType
        })):andThen(function() --[[ Line: 569 ]]
            -- upvalues: v67 (ref), v14 (ref), v71 (ref), v66 (ref)
            v67(v14.Actions.SetCurrentToastMessage({
                toastMessage = v71.ConnectionRequestSent, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v67(v66.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 577 ]]
            -- upvalues: v67 (ref), v14 (ref), v72 (ref)
            v67(v14.Actions.SetCurrentToastMessage(v72));
        end);
    end, {
        v71, 
        v68, 
        v67, 
        v66.closeCentralOverlayThunk, 
        v66.subjectUserId, 
        v66.recommendationContext, 
        v66.contactId, 
        v66.friendshipOriginSourceType
    });
    local v106 = v4.useCallback(function() --[[ Line: 593 ]]
        -- upvalues: v73 (copy), l_EventNames_0 (ref), v66 (copy), v67 (copy), v40 (ref), v68 (copy), v14 (ref), v71 (copy), v72 (copy)
        v73(l_EventNames_0.AcceptFriendRequest, {
            profileUserId = v66.subjectUserId
        });
        v67(v40.AcceptFriendRequestFromUserId.API({
            targetUserId = v66.subjectUserId, 
            currentUserId = v68
        })):andThen(function() --[[ Line: 600 ]]
            -- upvalues: v67 (ref), v14 (ref), v71 (ref), v66 (ref)
            v67(v14.Actions.SetCurrentToastMessage({
                toastMessage = v71.ConnectionAdded, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v67(v66.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 608 ]]
            -- upvalues: v67 (ref), v14 (ref), v72 (ref)
            v67(v14.Actions.SetCurrentToastMessage(v72));
        end);
    end, l_dependencyArray_0(v71, v68, v67, v66.closeCentralOverlayThunk, v66.subjectUserId));
    local v107 = v4.useCallback(function() --[[ Line: 613 ]]
        -- upvalues: v73 (copy), l_EventNames_0 (ref), v66 (copy), v67 (copy), v40 (ref), v68 (copy), v14 (ref), v71 (copy), v72 (copy)
        v73(l_EventNames_0.IgnoreFriendRequest, {
            profileUserId = v66.subjectUserId
        });
        v67(v40.DeclineFriendRequestFromUserId.API({
            targetUserId = v66.subjectUserId, 
            currentUserId = v68
        })):andThen(function() --[[ Line: 620 ]]
            -- upvalues: v67 (ref), v14 (ref), v71 (ref), v66 (ref)
            v67(v14.Actions.SetCurrentToastMessage({
                toastMessage = v71.FriendRequestIgnored, 
                isLocalized = true, 
                toastType = v14.Enums.ToastType.SuccessConfirmation
            }));
            v67(v66.closeCentralOverlayThunk());
        end):catch(function() --[[ Line: 628 ]]
            -- upvalues: v67 (ref), v14 (ref), v72 (ref)
            v67(v14.Actions.SetCurrentToastMessage(v72));
        end);
    end, l_dependencyArray_0(v71, v68, v67, v66.closeCentralOverlayThunk, v66.subjectUserId));
    local v109 = l_RoactRodux_0.useSelector(function(v108) --[[ Line: 633 ]]
        -- upvalues: v51 (ref), v66 (copy)
        return (if v51 then v108.PlayerContextualMenu.UserBlocking.isBlockedByMe else v108.PlayerContextualMenu.IsBlockedByMe)[v66.subjectUserId] or false;
    end);
    local v122 = v4.useMemo(function() --[[ Line: 642 ]]
        -- upvalues: l_Images_0 (ref), v71 (copy), v98 (copy), v50 (ref), v99 (copy), v101 (copy), v79 (ref), v103 (copy), v104 (copy), v105 (copy), v55 (ref), v106 (copy), v107 (copy), v109 (copy), v66 (copy), l_getFFlagAppChatPCMFixBlocking_0 (ref), v3 (ref), v54 (ref), v87 (ref), v21 (ref)
        local v110 = {
            icon = l_Images_0["icons/actions/feedback"], 
            text = v71.Report, 
            onActivated = v98
        };
        local v111 = {
            icon = v50, 
            text = v71.ViewPlatformProfile, 
            onActivated = v99
        };
        local v112 = {
            icon = l_Images_0["icons/actions/block"], 
            text = v71.Block, 
            onActivated = v101, 
            disabled = v79
        };
        local v113 = {
            icon = l_Images_0["icons/actions/block"], 
            text = v71.Unblock, 
            onActivated = v103
        };
        local v114 = {
            icon = l_Images_0["icons/actions/friends/friendRemove"], 
            text = v71.RemoveConnection, 
            onActivated = v104
        };
        local v115 = {
            icon = l_Images_0["icons/actions/friends/friendAdd"], 
            text = v71.AddConnection, 
            onActivated = v105
        };
        local v116 = {
            icon = l_Images_0["icons/actions/friends/friendpending"], 
            text = v71.PendingRequest, 
            onActivated = v55
        };
        local v117 = {
            icon = l_Images_0["icons/actions/friends/friendpending"], 
            text = v71.AcceptConnection, 
            onActivated = v106
        };
        local v118 = {
            icon = l_Images_0["icons/actions/reject"], 
            text = v71.IgnoreConnectionRequest, 
            onActivated = v107
        };
        local function v121() --[[ Line: 698 ]] --[[ Name: makeCtas ]]
            -- upvalues: v109 (ref), v113 (copy), v112 (copy), v66 (ref), v110 (copy), l_getFFlagAppChatPCMFixBlocking_0 (ref), v114 (copy), v115 (copy), v116 (copy), v117 (copy), v118 (copy), v3 (ref)
            local v119 = if v109 then v113 else v112;
            local v120 = {};
            v120 = if v66.robloxFriendshipStatus == Enum.FriendStatus.Friend then {
                v110, 
                if l_getFFlagAppChatPCMFixBlocking_0() then v119 else v112, 
                v114
            } else if v66.robloxFriendshipStatus == Enum.FriendStatus.NotFriend then if v66.contactId then {
                v115
            } else {
                v115, 
                v110, 
                v119
            } else if v66.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestSent then {
                v116, 
                v110, 
                v119
            } else if v66.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestReceived then {
                v117, 
                v118, 
                v110, 
                v119
            } else {
                v110, 
                v119
            };
            if v66.additionalButtons then
                v120 = v3.List.join(v120, v66.additionalButtons);
            end;
            return v120;
        end;
        if v54 and v54:IsProfileEnabled() and v87 and v87 ~= "" then
            return v21.append({
                v111
            }, (v121()));
        else
            return (v121());
        end;
    end, v3.Dictionary.union(if v54 then {
        v66.robloxFriendshipStatus, 
        v109, 
        v87, 
        v66.contactId, 
        v66.additionalButtons
    } else {
        v66.robloxFriendshipStatus, 
        v109, 
        v66.contactId, 
        v66.additionalButtons
    }, if l_getFFlagAppChatPCMFixBlocking_0() then {
        v79
    } else {}));
    return v4.createElement(v42, {
        headerProps = v4.useMemo(function() --[[ Line: 776 ]]
            -- upvalues: v85 (ref), v83 (copy), v66 (copy), l_RecommendationContextType_0 (ref), v84 (ref), v86 (ref), v88 (copy), v50 (ref), v91 (ref), v89 (ref), v90 (ref), v96 (copy), v97 (copy), v95 (copy)
            return {
                displayNameItem = {
                    labelText = v85, 
                    icon = nil, 
                    isLoading = v83.loading
                }, 
                userNameItem = if v66.recommendationContext == l_RecommendationContextType_0.Contacts then nil else {
                    labelText = "@" .. v84, 
                    icon = nil, 
                    isLoading = v83.loading
                }, 
                vendorNameItem = if v86 == "" then nil else {
                    labelText = v86 or "", 
                    icon = v88 and {
                        Image = v50, 
                        ImageRectOffset = Vector2.zero, 
                        ImageRectSize = Vector2.zero
                    } or nil, 
                    isLoading = v83.loading
                }, 
                contextText = v91, 
                contextIcon = v89, 
                contextIconColor = if v90 then v90.Color3 else nil, 
                contextIconTransparency = if v90 then v90.Transparency else nil, 
                joinEventText = v96, 
                joinEventOnActivated = v97, 
                renderJoinEventButton = v95
            };
        end, l_dependencyArray_0(v83, v85, v84, v86, v88, v89, v91, v90, v95, v96, v97, v66.recommendationContext)), 
        buttonProps = v122, 
        width = if v52 then v66.width else UDim.new(0, 400)
    });
end;