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
return function(v34, v35) --[[ Line: 46 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_AppSessionService_0 (copy), l_AppGame_0 (copy), v6 (copy), v15 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), v16 (copy), v17 (copy), l_NetworkStatus_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), v13 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), v14 (copy), v5 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_PlayabilityStatus_0 (copy), l_LaunchGame_0 (copy)
    local v36 = l_useDispatch_0();
    local v37 = l_useRoactService_0(l_AppSessionService_0);
    local v38 = l_useRoactService_0(l_AppGame_0);
    local v39 = v6.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: v15 (ref), v35 (copy)
        return v15(v35.analyticProps);
    end, {});
    local v40 = l_useLocalUserId_0();
    local v46 = l_useSelector_0(function(v41) --[[ Line: 66 ]]
        -- upvalues: l_getDeepValue_0 (ref), v16 (ref), v34 (copy), v17 (ref), l_NetworkStatus_0 (ref)
        local v42 = l_getDeepValue_0(v41, (("%*.Presence.byUserId.%*"):format(v16.RODUX_KEY, v34)));
        local v43 = if v42 and v42.universeId then tostring(v42.universeId) else "";
        local v44 = false;
        if v43 ~= "" then
            local v45 = true;
            if v17.GetExperiencesPlayabilityStatus.getStatus(v41, v43) ~= l_NetworkStatus_0.Fetching then
                v45 = true;
                if v17.GetExperiencesDetails.getStatus(v41, v43) ~= l_NetworkStatus_0.Fetching then
                    v45 = v17.GetExperiencesProductInfo.getStatus(v41, v43) == l_NetworkStatus_0.Fetching;
                end;
            end;
            v44 = v45;
        end;
        return {
            universeId = v43, 
            presenceType = if v42 and v42.userPresenceType then v42.userPresenceType else "", 
            lastLocation = if v42 and v42.lastLocation then v42.lastLocation else nil, 
            placeId = if v42 and v42.placeId then tostring(v42.placeId) else "", 
            rootPlaceId = if v42 and v42.rootPlaceId then tostring(v42.rootPlaceId) else "", 
            gameId = if v42 and v42.gameId then tostring(v42.gameId) else "", 
            isLoading = v44
        };
    end);
    local v69 = v6.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v36 (copy), v17 (ref), l_SetGamePlaySession_0 (ref), v37 (copy), l_SessionType_0 (ref), v39 (copy), v13 (ref), v46 (copy), v34 (copy), v40 (copy), v35 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v14 (ref), v5 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_PlayabilityStatus_0 (ref), l_LaunchGame_0 (ref), v38 (copy), v16 (ref)
        local function _(v47) --[[ Line: 92 ]]
            -- upvalues: v36 (ref), v17 (ref)
            return v36(v17.GetExperiencesDetails.API({
                v47
            }));
        end;
        local function v50(v49) --[[ Line: 96 ]]
            -- upvalues: v36 (ref), v17 (ref)
            return v36(v17.GetExperiencesProductInfo.API({
                v49
            }));
        end;
        local function _(v51) --[[ Line: 100 ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v37 (ref), l_SessionType_0 (ref), v39 (ref), v13 (ref), v46 (ref), v34 (ref), v40 (ref), v35 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
            return function(v52) --[[ Line: 101 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v37 (ref), l_SessionType_0 (ref), v39 (ref), v13 (ref), v46 (ref), v34 (ref), v40 (ref), v51 (copy), v35 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
                l_SetGamePlaySession_0(v37, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v39.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v46.placeId, 
                    rootPlaceId = v46.rootPlaceId, 
                    gameInstanceId = v46.gameId, 
                    profileUserId = v34, 
                    uid = v40, 
                    joinAttemptId = v52, 
                    status = v51, 
                    isHomePageCarousel = v35.isHomePageCarousel or false, 
                    absolutePosition = v35.homepageCarouselAbsolutePosition, 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v34 else nil
                });
            end;
        end;
        local function v57() --[[ Line: 120 ]]
            -- upvalues: v14 (ref), l_SetGamePlaySession_0 (ref), v37 (ref), l_SessionType_0 (ref), v39 (ref), v13 (ref), v46 (ref), v34 (ref), v40 (ref), v35 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v5 (ref), v36 (ref), v17 (ref), v50 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            local l_PurchaseRequired_0 = v14.PurchaseRequired;
            l_PurchaseRequired_0 = function(v55) --[[ Line: 101 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v37 (ref), l_SessionType_0 (ref), v39 (ref), v13 (ref), v46 (ref), v34 (ref), v40 (ref), l_PurchaseRequired_0 (copy), v35 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
                l_SetGamePlaySession_0(v37, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v39.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v46.placeId, 
                    rootPlaceId = v46.rootPlaceId, 
                    gameInstanceId = v46.gameId, 
                    profileUserId = v34, 
                    uid = v40, 
                    joinAttemptId = v55, 
                    status = l_PurchaseRequired_0, 
                    isHomePageCarousel = v35.isHomePageCarousel or false, 
                    absolutePosition = v35.homepageCarouselAbsolutePosition, 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v34 else nil
                });
            end;
            l_PurchaseRequired_0();
            l_PurchaseRequired_0 = v5.all;
            local l_universeId_0 = v46.universeId;
            l_PurchaseRequired_0(v36(v17.GetExperiencesDetails.API({
                l_universeId_0
            })), v50(v46.universeId)):andThen(function() --[[ Line: 128 ]]
                -- upvalues: v36 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v46 (ref), v34 (ref), v35 (ref)
                v36(l_NavigateDown_0({
                    name = l_AppPage_0.SocialPurchaseExperience, 
                    detail = v46.universeId, 
                    extraProps = {
                        userId = v34, 
                        analyticProps = v35.analyticProps
                    }
                }));
            end);
        end;
        local function v60() --[[ Line: 140 ]]
            -- upvalues: v14 (ref), l_SetGamePlaySession_0 (ref), v37 (ref), l_SessionType_0 (ref), v39 (ref), v13 (ref), v46 (ref), v34 (ref), v40 (ref), v35 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v36 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            local l_PurchaseRequired_1 = v14.PurchaseRequired;
            l_PurchaseRequired_1 = function(v59) --[[ Line: 101 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v37 (ref), l_SessionType_0 (ref), v39 (ref), v13 (ref), v46 (ref), v34 (ref), v40 (ref), l_PurchaseRequired_1 (copy), v35 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
                l_SetGamePlaySession_0(v37, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v39.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v46.placeId, 
                    rootPlaceId = v46.rootPlaceId, 
                    gameInstanceId = v46.gameId, 
                    profileUserId = v34, 
                    uid = v40, 
                    joinAttemptId = v59, 
                    status = l_PurchaseRequired_1, 
                    isHomePageCarousel = v35.isHomePageCarousel or false, 
                    absolutePosition = v35.homepageCarouselAbsolutePosition, 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v34 else nil
                });
            end;
            l_PurchaseRequired_1(v14.Unable);
            v36(l_NavigateDown_0({
                name = l_AppPage_0.SocialUnableToJoinExperience, 
                detail = v46.universeId, 
                extraProps = {
                    userId = v34, 
                    analyticProps = v35.analyticProps, 
                    openGameDetailsPeekViewClosed = v35.openGameDetailsPeekViewClosed
                }
            }));
        end;
        (function(v61) --[[ Line: 157 ]]
            -- upvalues: v36 (ref), v17 (ref)
            return v36(v17.GetExperiencesPlayabilityStatus.API({
                v61
            })):andThen(function(v62) --[[ Line: 159 ]]
                return v62.responseBody[1].playabilityStatus;
            end);
        end)(v46.universeId):andThen(function(v63) --[[ Line: 166 ]]
            -- upvalues: l_PlayabilityStatus_0 (ref), v57 (copy), v14 (ref), l_SetGamePlaySession_0 (ref), v37 (ref), l_SessionType_0 (ref), v39 (ref), v13 (ref), v46 (ref), v34 (ref), v40 (ref), v35 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), l_LaunchGame_0 (ref), v38 (ref), v16 (ref), v60 (copy)
            if v63 == l_PlayabilityStatus_0.PurchaseRequired.rawValue() then
                v57();
                return;
            elseif v63 == l_PlayabilityStatus_0.Playable.rawValue() then
                local l_Success_0 = v14.Success;
                local function v66(v65) --[[ Line: 101 ]]
                    -- upvalues: l_SetGamePlaySession_0 (ref), v37 (ref), l_SessionType_0 (ref), v39 (ref), v13 (ref), v46 (ref), v34 (ref), v40 (ref), l_Success_0 (copy), v35 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
                    l_SetGamePlaySession_0(v37, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                    v39.fireAnalyticsEvent(v13.JoinExperience, {
                        placeId = v46.placeId, 
                        rootPlaceId = v46.rootPlaceId, 
                        gameInstanceId = v46.gameId, 
                        profileUserId = v34, 
                        uid = v40, 
                        joinAttemptId = v65, 
                        status = l_Success_0, 
                        isHomePageCarousel = v35.isHomePageCarousel or false, 
                        absolutePosition = v35.homepageCarouselAbsolutePosition, 
                        friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v34 else nil
                    });
                end;
                l_LaunchGame_0(nil, nil, {
                    userId = v34
                }, v38, v16.AnalyticsContext.PeopleListInHomePage, v66);
                return;
            else
                v60();
                return;
            end;
        end):catch(function() --[[ Line: 184 ]]
            -- upvalues: v14 (ref), l_SetGamePlaySession_0 (ref), v37 (ref), l_SessionType_0 (ref), v39 (ref), v13 (ref), v46 (ref), v34 (ref), v40 (ref), v35 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
            local l_Failure_0 = v14.Failure;
            l_Failure_0 = function(v68) --[[ Line: 101 ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v37 (ref), l_SessionType_0 (ref), v39 (ref), v13 (ref), v46 (ref), v34 (ref), v40 (ref), l_Failure_0 (copy), v35 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref)
                l_SetGamePlaySession_0(v37, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
                v39.fireAnalyticsEvent(v13.JoinExperience, {
                    placeId = v46.placeId, 
                    rootPlaceId = v46.rootPlaceId, 
                    gameInstanceId = v46.gameId, 
                    profileUserId = v34, 
                    uid = v40, 
                    joinAttemptId = v68, 
                    status = l_Failure_0, 
                    isHomePageCarousel = v35.isHomePageCarousel or false, 
                    absolutePosition = v35.homepageCarouselAbsolutePosition, 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v34 else nil
                });
            end;
            l_Failure_0();
        end);
    end, {
        v36, 
        v46.universeId, 
        v46.placeId, 
        v46.rootPlaceId, 
        v46.gameId, 
        v34, 
        v40, 
        v39, 
        v37, 
        v38, 
        v35.isHomePageCarousel, 
        v35.homepageCarouselAbsolutePosition
    });
    local v70 = if v46.presenceType and v46.lastLocation then v46.universeId ~= "" else false;
    return v6.useMemo(function() --[[ Line: 211 ]]
        -- upvalues: v69 (copy), v70 (copy), v46 (copy)
        return {
            joinExperience = v69, 
            isInExperience = v70, 
            isLoading = v46.isLoading
        };
    end, {
        v46.presenceType, 
        v46.lastLocation, 
        v69, 
        v46.isLoading
    });
end;