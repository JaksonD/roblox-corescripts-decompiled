local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.GameLaunch);
local v3 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v4 = require(l_Parent_0.NavigationRodux);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RoactServiceTags);
local v8 = require(l_Parent_0.RoactUtils);
local v9 = require(l_Parent_0.RobloxAppEnums);
local v10 = require(l_Parent_0.RobloxAppHooks);
local v11 = require(l_Parent_0.RobloxAppSessionization);
local v12 = require(l_script_FirstAncestor_0.Rodux.Games);
local v13 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v14 = require(l_script_FirstAncestor_0.Analytics.JoinExperienceStatus);
local v15 = require(l_script_FirstAncestor_0.Analytics.initializeSocialExperienceJoinAnalytics);
local v16 = require(l_script_FirstAncestor_0.Common.Constants);
local v17 = require(l_script_FirstAncestor_0.Networking.NetworkingGames);
local v18 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworking);
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
local l_PlayabilityStatus_0 = v12.Enums.PlayabilityStatus;
local l_NetworkStatus_0 = v18.Enum.NetworkStatus;
local l_LaunchGame_0 = v2.LaunchGame;
local l_useDispatch_0 = v8.Hooks.RoactRodux.useDispatch;
local l_SetGamePlaySession_0 = v11.SetGamePlaySession;
local l_SessionType_0 = v11.SessionType;
local l_AppSessionService_0 = v7.AppSessionService;
local l_useRoactService_0 = v10.useRoactService;
local l_AppPage_0 = v9.AppPage;
local l_NavigateDown_0 = v4.Thunks.NavigateDown;
local l_AppGame_0 = v7.AppGame;
local l_useLocalUserId_0 = v10.useLocalUserId;
local l_getDeepValue_0 = v3.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics;
local l_FFlagEnableMobileGameJoinCard_0 = require(l_Parent_0.SharedFlags).FFlagEnableMobileGameJoinCard;
local l_FFlagEnableDesktopGameJoinCard_0 = require(l_Parent_0.SharedFlags).FFlagEnableDesktopGameJoinCard;
local l_FFlagProfilePlatformPassPresenceToJoinUserInExperience_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformPassPresenceToJoinUserInExperience;
local v37 = require(l_Parent_0.CentralOverlay);
local l_SetCentralOverlay_0 = v37.Actions.SetCentralOverlay;
local l_CloseCentralOverlay_0 = v37.Thunks.CloseCentralOverlay;
local l_CentralOverlayType_0 = v9.CentralOverlayType;
local v41 = game:DefineFastFlag("SocialJoinUseUnifiedPurchaseFlow", false);
local v42 = game:DefineFastFlag("GameJoinCardOnBeforeJoinCallback", false);
return function(v43, v44) --[[ Line: 58 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_AppSessionService_0 (copy), l_AppGame_0 (copy), v6 (copy), v15 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_FFlagEnableDesktopGameJoinCard_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), l_FFlagProfilePlatformPassPresenceToJoinUserInExperience_0 (copy), l_getDeepValue_0 (copy), v16 (copy), v17 (copy), l_NetworkStatus_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v13 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), v14 (copy), v5 (copy), v41 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_CloseCentralOverlay_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_PlayabilityStatus_0 (copy), v42 (copy), l_LaunchGame_0 (copy)
    local v45 = l_useDispatch_0();
    local v46 = l_useRoactService_0(l_AppSessionService_0);
    local v47 = l_useRoactService_0(l_AppGame_0);
    local v48 = v6.useMemo(function() --[[ Line: 75 ]]
        -- upvalues: v15 (ref), v44 (copy)
        return v15(v44.analyticProps);
    end, {});
    local v49 = l_useLocalUserId_0();
    local v55 = l_useSelector_0(function(v50) --[[ Line: 80 ]]
        -- upvalues: l_FFlagEnableDesktopGameJoinCard_0 (ref), l_FFlagEnableMobileGameJoinCard_0 (ref), l_FFlagProfilePlatformPassPresenceToJoinUserInExperience_0 (ref), v44 (copy), l_getDeepValue_0 (ref), v16 (ref), v43 (copy), v17 (ref), l_NetworkStatus_0 (ref)
        local v51 = if (not not l_FFlagEnableDesktopGameJoinCard_0 or l_FFlagEnableMobileGameJoinCard_0 or l_FFlagProfilePlatformPassPresenceToJoinUserInExperience_0) and v44.presence then v44.presence else l_getDeepValue_0(v50, (("%*.Presence.byUserId.%*"):format(v16.RODUX_KEY, v43)));
        local v52 = if v51 and v51.universeId then tostring(v51.universeId) else "";
        local v53 = false;
        if v52 ~= "" then
            local v54 = true;
            if v17.GetExperiencesPlayabilityStatus.getStatus(v50, v52) ~= l_NetworkStatus_0.Fetching then
                v54 = true;
                if v17.GetExperiencesDetails.getStatus(v50, v52) ~= l_NetworkStatus_0.Fetching then
                    v54 = v17.GetExperiencesProductInfo.getStatus(v50, v52) == l_NetworkStatus_0.Fetching;
                end;
            end;
            v53 = v54;
        end;
        return {
            universeId = v52, 
            presenceType = if v51 and v51.userPresenceType then v51.userPresenceType else "", 
            lastLocation = if v51 and v51.lastLocation then v51.lastLocation else nil, 
            placeId = if v51 and v51.placeId then tostring(v51.placeId) else "", 
            rootPlaceId = if v51 and v51.rootPlaceId then tostring(v51.rootPlaceId) else "", 
            gameId = if v51 and v51.gameId then tostring(v51.gameId) else "", 
            isLoading = v53
        };
    end);
    local v80 = v6.useCallback(function() --[[ Line: 111 ]]
        -- upvalues: v45 (copy), v17 (ref), l_SetGamePlaySession_0 (ref), v46 (copy), l_SessionType_0 (ref), v48 (copy), v13 (ref), v55 (copy), v43 (copy), v49 (copy), v44 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v14 (ref), v5 (ref), v41 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_CloseCentralOverlay_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_PlayabilityStatus_0 (ref), v42 (ref), l_LaunchGame_0 (ref), v47 (copy), v16 (ref)
        local function _(v56) --[[ Line: 112 ]]
            -- upvalues: v45 (ref), v17 (ref)
            return v45(v17.GetExperiencesDetails.API({
                v56
            }));
        end;
        local function v59(v58) --[[ Line: 116 ]]
            -- upvalues: v45 (ref), v17 (ref)
            return v45(v17.GetExperiencesProductInfo.API({
                v58
            }));
        end;
        local function _(v60) --[[ Line: 120 ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v46 (ref), l_SessionType_0 (ref), v48 (ref), v13 (ref), v55 (ref), v43 (ref), v49 (ref), v44 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
            return function(v61) --[[ Line: 121 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v46 (ref), l_SessionType_0 (ref), v48 (ref), v13 (ref), v55 (ref), v43 (ref), v49 (ref), v60 (copy), v44 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
                l_SetGamePlaySession_0(v46, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v48.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v55.placeId, 
                    rootPlaceId = v55.rootPlaceId, 
                    gameInstanceId = v55.gameId, 
                    profileUserId = v43, 
                    uid = v49, 
                    joinAttemptId = v61, 
                    status = v60, 
                    isHomePageCarousel = v44.isHomePageCarousel or false, 
                    absolutePosition = v44.homepageCarouselAbsolutePosition, 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v43 else nil
                });
            end;
        end;
        local function v68() --[[ Line: 140 ]]
            -- upvalues: v14 (ref), l_SetGamePlaySession_0 (ref), v46 (ref), l_SessionType_0 (ref), v48 (ref), v13 (ref), v55 (ref), v43 (ref), v49 (ref), v44 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v5 (ref), v45 (ref), v17 (ref), v59 (copy), v41 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_CloseCentralOverlay_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            local l_PurchaseRequired_0 = v14.PurchaseRequired;
            l_PurchaseRequired_0 = function(v64) --[[ Line: 121 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v46 (ref), l_SessionType_0 (ref), v48 (ref), v13 (ref), v55 (ref), v43 (ref), v49 (ref), l_PurchaseRequired_0 (copy), v44 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
                l_SetGamePlaySession_0(v46, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v48.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v55.placeId, 
                    rootPlaceId = v55.rootPlaceId, 
                    gameInstanceId = v55.gameId, 
                    profileUserId = v43, 
                    uid = v49, 
                    joinAttemptId = v64, 
                    status = l_PurchaseRequired_0, 
                    isHomePageCarousel = v44.isHomePageCarousel or false, 
                    absolutePosition = v44.homepageCarouselAbsolutePosition, 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v43 else nil
                });
            end;
            l_PurchaseRequired_0();
            l_PurchaseRequired_0 = v5.all;
            local l_universeId_0 = v55.universeId;
            l_PurchaseRequired_0(v45(v17.GetExperiencesDetails.API({
                l_universeId_0
            })), v59(v55.universeId)):andThen(function() --[[ Line: 148 ]]
                -- upvalues: v41 (ref), v55 (ref), v45 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), l_CloseCentralOverlay_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v43 (ref), v44 (ref)
                if v41 then
                    local v66 = v55.lastLocation or "";
                    local v67 = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", v55.universeId);
                    v45(l_SetCentralOverlay_0(l_CentralOverlayType_0.UnifiedProductPurchaseModal, {
                        productPayload = {
                            universeId = v55.universeId, 
                            kind = "Experience", 
                            experienceName = v66, 
                            experienceIconUrl = v67
                        }, 
                        purchaseCallbacks = {
                            onFlowComplete = function() --[[ Line: 162 ]] --[[ Name: onFlowComplete ]]
                                -- upvalues: v45 (ref), l_CloseCentralOverlay_0 (ref)
                                v45(l_CloseCentralOverlay_0());
                            end
                        }, 
                        purchaseAnalyticsMetadata = {
                            surface = "JoinUserInExperience"
                        }
                    }));
                    return;
                else
                    v45(l_NavigateDown_0({
                        name = l_AppPage_0.SocialPurchaseExperience, 
                        detail = v55.universeId, 
                        extraProps = {
                            userId = v43, 
                            analyticProps = v44.analyticProps
                        }
                    }));
                    return;
                end;
            end);
        end;
        local function v71() --[[ Line: 183 ]]
            -- upvalues: v41 (ref), v14 (ref), l_SetGamePlaySession_0 (ref), v46 (ref), l_SessionType_0 (ref), v48 (ref), v13 (ref), v55 (ref), v43 (ref), v49 (ref), v44 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v45 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            local v69 = if v41 then v14.Unable else v14.PurchaseRequired;
            (function(v70) --[[ Line: 121 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v46 (ref), l_SessionType_0 (ref), v48 (ref), v13 (ref), v55 (ref), v43 (ref), v49 (ref), v69 (copy), v44 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
                l_SetGamePlaySession_0(v46, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v48.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v55.placeId, 
                    rootPlaceId = v55.rootPlaceId, 
                    gameInstanceId = v55.gameId, 
                    profileUserId = v43, 
                    uid = v49, 
                    joinAttemptId = v70, 
                    status = v69, 
                    isHomePageCarousel = v44.isHomePageCarousel or false, 
                    absolutePosition = v44.homepageCarouselAbsolutePosition, 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v43 else nil
                });
            end)(v14.Unable);
            v45(l_NavigateDown_0({
                name = l_AppPage_0.SocialUnableToJoinExperience, 
                detail = v55.universeId, 
                extraProps = {
                    userId = v43, 
                    analyticProps = v44.analyticProps, 
                    openGameDetailsPeekViewClosed = v44.openGameDetailsPeekViewClosed
                }
            }));
        end;
        (function(v72) --[[ Line: 204 ]]
            -- upvalues: v45 (ref), v17 (ref)
            return v45(v17.GetExperiencesPlayabilityStatus.API({
                v72
            })):andThen(function(v73) --[[ Line: 206 ]]
                return v73.responseBody[1].playabilityStatus;
            end);
        end)(v55.universeId):andThen(function(v74) --[[ Line: 213 ]]
            -- upvalues: l_PlayabilityStatus_0 (ref), v68 (copy), v42 (ref), v44 (ref), v14 (ref), l_SetGamePlaySession_0 (ref), v46 (ref), l_SessionType_0 (ref), v48 (ref), v13 (ref), v55 (ref), v43 (ref), v49 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), l_LaunchGame_0 (ref), v47 (ref), v16 (ref), v71 (copy)
            if v74 == l_PlayabilityStatus_0.PurchaseRequired.rawValue() then
                v68();
                return;
            elseif v74 == l_PlayabilityStatus_0.Playable.rawValue() then
                if v42 and v44.onBeforeJoin then
                    v44.onBeforeJoin();
                end;
                local l_Success_0 = v14.Success;
                local function v77(v76) --[[ Line: 121 ]]
                    -- upvalues: l_SetGamePlaySession_0 (ref), v46 (ref), l_SessionType_0 (ref), v48 (ref), v13 (ref), v55 (ref), v43 (ref), v49 (ref), l_Success_0 (copy), v44 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
                    l_SetGamePlaySession_0(v46, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                    v48.fireAnalyticsEvent(v13.JoinExperience, {
                        placeId = v55.placeId, 
                        rootPlaceId = v55.rootPlaceId, 
                        gameInstanceId = v55.gameId, 
                        profileUserId = v43, 
                        uid = v49, 
                        joinAttemptId = v76, 
                        status = l_Success_0, 
                        isHomePageCarousel = v44.isHomePageCarousel or false, 
                        absolutePosition = v44.homepageCarouselAbsolutePosition, 
                        friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v43 else nil
                    });
                end;
                l_LaunchGame_0(nil, nil, {
                    userId = v43
                }, v47, v16.AnalyticsContext.PeopleListInHomePage, v77);
                return;
            else
                v71();
                return;
            end;
        end):catch(function() --[[ Line: 234 ]]
            -- upvalues: v14 (ref), l_SetGamePlaySession_0 (ref), v46 (ref), l_SessionType_0 (ref), v48 (ref), v13 (ref), v55 (ref), v43 (ref), v49 (ref), v44 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
            local l_Failure_0 = v14.Failure;
            l_Failure_0 = function(v79) --[[ Line: 121 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v46 (ref), l_SessionType_0 (ref), v48 (ref), v13 (ref), v55 (ref), v43 (ref), v49 (ref), l_Failure_0 (copy), v44 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
                l_SetGamePlaySession_0(v46, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v48.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v55.placeId, 
                    rootPlaceId = v55.rootPlaceId, 
                    gameInstanceId = v55.gameId, 
                    profileUserId = v43, 
                    uid = v49, 
                    joinAttemptId = v79, 
                    status = l_Failure_0, 
                    isHomePageCarousel = v44.isHomePageCarousel or false, 
                    absolutePosition = v44.homepageCarouselAbsolutePosition, 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v43 else nil
                });
            end;
            l_Failure_0();
        end);
    end, if v41 then {
        v45, 
        v55.universeId, 
        v55.placeId, 
        v55.rootPlaceId, 
        v55.gameId, 
        v55.lastLocation, 
        v43, 
        v49, 
        v48, 
        v46, 
        v47, 
        v44.isHomePageCarousel, 
        v44.homepageCarouselAbsolutePosition, 
        v44.analyticProps, 
        v44.openGameDetailsPeekViewClosed, 
        v44.onBeforeJoin
    } else {
        v45, 
        v55.universeId, 
        v55.placeId, 
        v55.rootPlaceId, 
        v55.gameId, 
        v43, 
        v49, 
        v48, 
        v46, 
        v47, 
        v44.isHomePageCarousel, 
        v44.homepageCarouselAbsolutePosition
    });
    local v81 = if v55.presenceType and v55.lastLocation then v55.universeId ~= "" else false;
    return v6.useMemo(function() --[[ Line: 281 ]]
        -- upvalues: v80 (copy), v81 (copy), v55 (copy)
        return {
            joinExperience = v80, 
            isInExperience = v81, 
            isLoading = v55.isLoading
        };
    end, if v41 then {
        v80, 
        v81, 
        v55.isLoading
    } else {
        v55.presenceType, 
        v55.lastLocation, 
        v80, 
        v55.isLoading
    });
end;