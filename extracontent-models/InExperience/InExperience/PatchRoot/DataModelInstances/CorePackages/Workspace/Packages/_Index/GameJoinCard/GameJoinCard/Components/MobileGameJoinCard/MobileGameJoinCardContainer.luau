local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants);
local l_GameJoinCardButtonAction_0 = v3.GameJoinCardButtonAction;
local l_viewEDPsourceValues_0 = v3.viewEDPsourceValues;
local l_viewProfileSourceValues_0 = v3.viewProfileSourceValues;
local v7 = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics);
local v8 = require(l_Parent_0.RobloxAppEnums);
local v9 = require(l_Parent_0.RoactUtils);
local v10 = require(l_Parent_0.SocialExperienceJoin);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useQuery_0 = require(l_Parent_0.ApolloClient).useQuery;
local v13 = require(l_Parent_0.ApolloLocalState);
local l_Players_0 = game:GetService("Players");
local v15 = require(l_Parent_0.UserProfiles);
local l_FFlagSocialCarouselUseProfileStore_0 = require(l_Parent_0.SharedFlags).FFlagSocialCarouselUseProfileStore;
local v17 = if l_FFlagSocialCarouselUseProfileStore_0 then require(l_Parent_0.Signals) else nil;
local v18 = if l_FFlagSocialCarouselUseProfileStore_0 then require(l_Parent_0.SignalsReact) else nil;
local v19 = if l_FFlagSocialCarouselUseProfileStore_0 then v15.Stores.UserProfileStore.get() else nil;
local v20 = require(l_Parent_0.GameDetail);
local l_useExperienceBannerImage_0 = v20.useExperienceBannerImage;
local l_OpenGameDetails_0 = v20.OpenGameDetails;
local v23 = require(l_Parent_0.DiscoveryAnalytics);
local l_gamePlayIntent_0 = v23.Events.gamePlayIntent;
local l_gameDetailReferral_0 = v23.Events.gameDetailReferral;
local l_PeopleListInHomePage_0 = v23.Constants.Context.PeopleListInHomePage;
local v27 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v27.AppEventIngestService;
local l_AppSessionService_0 = v27.AppSessionService;
local l_SetGamePlaySession_0 = require(l_Parent_0.RobloxAppSessionization).SetGamePlaySession;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppPage_0 = v8.AppPage;
local l_dependencyArray_0 = v9.Hooks.dependencyArray;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local l_useJoinUserInExperience_0 = v10.useJoinUserInExperience;
local v37 = require(script.Parent.MobileGameJoinCard);
local v38 = {
    universeId = "", 
    lastLocation = "", 
    userPresenceType = "", 
    placeId = "", 
    rootPlaceId = "", 
    gameId = ""
};
return function() --[[ Line: 65 ]] --[[ Name: MobileGameJoinCardContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_Players_0 (copy), l_useQuery_0 (copy), v13 (copy), v2 (copy), v7 (copy), l_FFlagSocialCarouselUseProfileStore_0 (copy), v19 (copy), v17 (copy), v18 (copy), v15 (copy), l_useExperienceBannerImage_0 (copy), l_useJoinUserInExperience_0 (copy), v38 (copy), l_GameJoinCardButtonAction_0 (copy), l_gamePlayIntent_0 (copy), l_PeopleListInHomePage_0 (copy), l_HttpService_0 (copy), l_dependencyArray_0 (copy), l_AppPage_0 (copy), l_viewEDPsourceValues_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_gameDetailReferral_0 (copy), l_viewProfileSourceValues_0 (copy), l_OpenGameDetails_0 (copy), v37 (copy)
    local v39 = l_useDispatch_0();
    local v40 = l_useNavigation_0();
    local v41 = v40.getParam("userId") or "";
    local v42 = v40.getParam("homepageCarouselAbsolutePosition");
    local v43 = l_useRoactService_0(l_AppEventIngestService_0);
    local v44 = l_useRoactService_0(l_AppSessionService_0);
    local v45 = tostring(l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or "");
    local v46 = l_useQuery_0(v13.queries.onlineFriendsByUserId, {
        fetchPolicy = "cache-only", 
        variables = {
            userId = v45, 
            sort = 1
        }
    });
    local v50 = v2.useMemo(function() --[[ Line: 82 ]]
        -- upvalues: v46 (copy), v41 (copy)
        local v47 = v46.data and v46.data.onlineFriendsByUserId;
        if not v47 then
            return nil;
        else
            for _, v49 in v47 do
                if v49.id == v41 then
                    return v49.presence;
                end;
            end;
            return nil;
        end;
    end, {
        v46.data, 
        v41
    });
    local v51, v52 = v2.useState({
        universeId = "", 
        experienceName = ""
    });
    v2.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v50 (copy), v52 (copy)
        if not v50 or tostring(v50.universeId) == "" then
            return;
        else
            v52({
                universeId = tostring(v50.universeId), 
                experienceName = v50.lastLocation
            });
            return;
        end;
    end, {
        v50
    });
    local l_universeId_0 = v51.universeId;
    local l_experienceName_0 = v51.experienceName;
    v2.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: v41 (copy), v50 (copy), v7 (ref), v42 (copy)
        if v41 == "" then
            return;
        else
            local v55 = if v50 and v50.universeId ~= nil and tostring(v50.universeId) ~= "" then tostring(v50.universeId) else nil;
            v7.logGameJoinCardPageLoaded({
                friendId = v41, 
                universeId = v55, 
                absolutePosition = v42
            });
            return;
        end;
    end, {});
    local v56 = nil;
    if l_FFlagSocialCarouselUseProfileStore_0 then
        local v57 = v2.useMemo(function() --[[ Line: 131 ]]
            -- upvalues: v19 (ref), v41 (copy)
            return v19.fetchNamesByUserIds({
                v41
            });
        end, {
            v41
        });
        local l_v57_0 = v57 --[[ copy: 14 -> 25 ]];
        local v62 = v2.useMemo(function() --[[ Line: 135 ]]
            -- upvalues: v17 (ref), l_v57_0 (copy)
            return v17.createComputed(function(v59) --[[ Line: 136 ]]
                -- upvalues: l_v57_0 (ref)
                local v60 = l_v57_0(v59);
                local v61 = v60 and v60.data and v60.data[1];
                if v61 and v61.names then
                    return (v61.names.getCombinedName(v59));
                else
                    return nil;
                end;
            end);
        end, {
            v57
        });
        v56 = v18.useSignalState(v62) or "";
    else
        local v63 = v15.Hooks.useUserProfilesFetch({
            userIds = {
                v41
            }, 
            query = v15.Queries.userProfilesCombinedAndPlatformByUserIds
        });
        local l_v63_0 = v63 --[[ copy: 14 -> 24 ]];
        v56 = v2.useMemo(function() --[[ Line: 150 ]]
            -- upvalues: l_v63_0 (copy), v15 (ref), v41 (copy)
            if not l_v63_0.data then
                return "";
            else
                return v15.Selectors.getCombinedNameFromId(l_v63_0.data, v41) or "";
            end;
        end, {
            v63.data, 
            v41
        });
    end;
    local v65 = l_useExperienceBannerImage_0(l_universeId_0);
    local v66 = v2.useCallback(function() --[[ Line: 159 ]]
        -- upvalues: v40 (copy)
        v40.goBack();
    end, {
        v40
    });
    local v67 = l_useJoinUserInExperience_0(v41, {
        isHomePageCarousel = true, 
        presence = v50 or v38, 
        onBeforeJoin = v66
    });
    local v68 = v2.useCallback(function() --[[ Line: 169 ]]
        -- upvalues: v40 (copy)
        v40.goBack();
    end, {
        v40
    });
    local v72 = v2.useCallback(function() --[[ Line: 173 ]]
        -- upvalues: v41 (copy), v7 (ref), l_GameJoinCardButtonAction_0 (ref), l_universeId_0 (copy), v42 (copy), v50 (copy), l_gamePlayIntent_0 (ref), v43 (copy), l_PeopleListInHomePage_0 (ref), l_HttpService_0 (ref)
        local l_v41_0 = v41;
        if l_v41_0 ~= "" then
            v7.logGameJoinCardButtonEvent(l_GameJoinCardButtonAction_0.JoinGame, {
                friendId = l_v41_0, 
                universeId = if l_universeId_0 ~= "" then l_universeId_0 else nil, 
                absolutePosition = v42
            });
        end;
        if l_v41_0 == "" or not v50 then
            return;
        else
            local v70 = if v50.placeId ~= nil and tostring(v50.placeId) ~= "" then tostring(v50.placeId) else "";
            local v71 = tonumber(v50.rootPlaceId);
            if v70 == "" or v71 == nil then
                return;
            else
                l_gamePlayIntent_0(v43, l_PeopleListInHomePage_0, {
                    placeId = v70, 
                    rootPlaceId = v71, 
                    friendId = l_v41_0, 
                    joinAttemptId = l_HttpService_0:GenerateGUID(false)
                });
                return;
            end;
        end;
    end, l_dependencyArray_0(v41, l_universeId_0, v42, v50));
    local v73 = v2.useCallback(function() --[[ Line: 200 ]]
        -- upvalues: v40 (copy), l_AppPage_0 (ref), v41 (copy)
        v40.navigate(l_AppPage_0.ProfilePlatform, {
            detail = v41
        });
    end, {
        v40, 
        v41
    });
    local v79 = v2.useCallback(function(v74) --[[ Line: 206 ]]
        -- upvalues: v41 (copy), l_universeId_0 (copy), v42 (copy), l_viewEDPsourceValues_0 (ref), v7 (ref), l_GameJoinCardButtonAction_0 (ref), v50 (copy), v44 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref), l_gameDetailReferral_0 (ref), v43 (copy)
        if v41 ~= "" then
            local v75 = {
                friendId = v41, 
                universeId = if l_universeId_0 ~= "" then l_universeId_0 else nil, 
                absolutePosition = v42
            };
            if v74 == l_viewEDPsourceValues_0.Thumbnail then
                v7.logGameJoinCardButtonEvent(l_GameJoinCardButtonAction_0.ViewExperienceDetailsFromThumbnail, v75);
            elseif v74 == l_viewEDPsourceValues_0.Title then
                v7.logGameJoinCardButtonEvent(l_GameJoinCardButtonAction_0.ViewExperienceDetailsFromTitle, v75);
            end;
        end;
        if l_universeId_0 ~= "" then
            local v76 = if v50 then v50.rootPlaceId else nil;
            local v77 = if v76 ~= nil and tostring(v76) ~= "" then tostring(v76) else l_universeId_0;
            local v78 = v42 or 0;
            if v44 then
                l_SetGamePlaySession_0(v44, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            end;
            l_gameDetailReferral_0(v43, "home", {
                ad = "no", 
                friendId = v41, 
                pg = "home", 
                pid = v77, 
                pos = v78, 
                rowOnPage = 1, 
                sortPos = 0, 
                tis = 1, 
                universeId = l_universeId_0
            });
        end;
    end, l_dependencyArray_0(v41, l_universeId_0, v42, v50));
    local v82 = v2.useCallback(function(v80) --[[ Line: 248 ]]
        -- upvalues: v41 (copy), l_universeId_0 (copy), v42 (copy), l_viewProfileSourceValues_0 (ref), v7 (ref), l_GameJoinCardButtonAction_0 (ref), v73 (copy)
        if v41 ~= "" then
            local v81 = {
                friendId = v41, 
                universeId = if l_universeId_0 ~= "" then l_universeId_0 else nil, 
                absolutePosition = v42
            };
            if v80 == l_viewProfileSourceValues_0.UserTile then
                v7.logGameJoinCardButtonEvent(l_GameJoinCardButtonAction_0.OpenProfileFromUserTile, v81);
            elseif v80 == l_viewProfileSourceValues_0.ViewProfileButton then
                v7.logGameJoinCardButtonEvent(l_GameJoinCardButtonAction_0.OpenProfileFromViewProfile, v81);
            end;
        end;
        v73();
    end, l_dependencyArray_0(v73, v41, l_universeId_0, v42));
    local v84 = v2.useCallback(function(v83) --[[ Line: 270 ]]
        -- upvalues: l_universeId_0 (copy), v79 (copy), v39 (copy), l_OpenGameDetails_0 (ref), v40 (copy)
        if l_universeId_0 == "" then
            return;
        else
            v79(v83);
            v39(l_OpenGameDetails_0(l_universeId_0, v40, {
                mountAsFullView = true, 
                showBackButton = true
            }));
            return;
        end;
    end, l_dependencyArray_0(v79, v39, v40, l_universeId_0));
    local v85 = v2.useCallback(function() --[[ Line: 278 ]]
        -- upvalues: v72 (copy), v67 (copy)
        v72();
        v67.joinExperience();
    end, l_dependencyArray_0(v72, v67));
    return v2.createElement(v37, {
        onClose = v68, 
        onJoin = v85, 
        onViewProfile = v82, 
        onViewExperienceDetails = v84, 
        userId = v41, 
        universeId = l_universeId_0, 
        homepageCarouselAbsolutePosition = v42, 
        playerName = v56, 
        experienceName = l_experienceName_0, 
        bannerImageUrl = v65.url, 
        isLoading = v67.isLoading, 
        isInExperience = v67.isInExperience
    });
end;