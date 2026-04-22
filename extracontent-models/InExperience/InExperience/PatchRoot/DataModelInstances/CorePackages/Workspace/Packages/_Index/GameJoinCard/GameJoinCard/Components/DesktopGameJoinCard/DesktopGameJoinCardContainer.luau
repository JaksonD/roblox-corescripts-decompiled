local l_Parent_0 = script:FindFirstAncestor("GameJoinCard").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Responsive);
local v5 = require(l_Parent_0.GameDetail);
local _ = require(l_Parent_0.SocialCommon);
local v7 = require(l_Parent_0.DiscoveryAnalytics);
local v8 = require(l_Parent_0.SocialExperienceJoin);
local l_gamePlayIntent_0 = v7.Events.gamePlayIntent;
local l_gameDetailReferral_0 = v7.Events.gameDetailReferral;
local l_PeopleListInHomePage_0 = v7.Constants.Context.PeopleListInHomePage;
local v12 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v12.AppEventIngestService;
local l_AppSessionService_0 = v12.AppSessionService;
local l_SetGamePlaySession_0 = require(l_Parent_0.RobloxAppSessionization).SetGamePlaySession;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v19 = require(script.Parent.DesktopGameJoinCard);
local v20 = require(script.Parent.GamepadJoinFocusBehavior);
local l_OpenGameDetails_0 = v5.OpenGameDetails;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local l_Hooks_0 = require(l_Parent_0.RoactUtils).Hooks;
local l_dependencyArray_0 = l_Hooks_0.dependencyArray;
local l_useDispatch_0 = l_Hooks_0.RoactRodux.useDispatch;
local l_getRbxThumb_0 = v3.Utility.getRbxThumb;
local l_ThumbnailType_0 = v3.Enums.ThumbnailType;
local l_ThumbnailSize_0 = v3.Enums.ThumbnailSize;
local l_useJoinUserInExperience_0 = v8.useJoinUserInExperience;
local l_usePreferredInput_0 = v4.usePreferredInput;
local v32 = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants);
local l_GameJoinCardButtonAction_0 = v32.GameJoinCardButtonAction;
local l_viewEDPsourceValues_0 = v32.viewEDPsourceValues;
local v35 = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics);
return function(v36) --[[ Line: 67 ]] --[[ Name: DesktopGameJoinCardContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useNavigationFocus_0 (copy), v2 (copy), l_getRbxThumb_0 (copy), l_ThumbnailType_0 (copy), l_ThumbnailSize_0 (copy), l_ContentProvider_0 (copy), l_useJoinUserInExperience_0 (copy), v35 (copy), l_dependencyArray_0 (copy), l_usePreferredInput_0 (copy), v4 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_gamePlayIntent_0 (copy), l_PeopleListInHomePage_0 (copy), l_HttpService_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_gameDetailReferral_0 (copy), l_OpenGameDetails_0 (copy), l_viewEDPsourceValues_0 (copy), l_GameJoinCardButtonAction_0 (copy), v19 (copy), v20 (copy)
    local v37 = l_useDispatch_0();
    local v38 = l_useNavigation_0();
    local v39 = l_useNavigationFocus_0() ~= false;
    local l_layoutOrder_0 = v36.layoutOrder;
    local l_playerName_0 = v36.playerName;
    local l_platformName_0 = v36.platformName;
    local l_presence_0 = v36.presence;
    local v44 = tostring(l_presence_0.universeId);
    local l_lastLocation_0 = l_presence_0.lastLocation;
    local v46 = v2.useMemo(function() --[[ Line: 77 ]]
        -- upvalues: l_getRbxThumb_0 (ref), l_ThumbnailType_0 (ref), v44 (copy), l_ThumbnailSize_0 (ref)
        return l_getRbxThumb_0(l_ThumbnailType_0.GameIcon, v44, l_ThumbnailSize_0.Small);
    end, {
        v44
    });
    local v47, v48 = v2.useState(Enum.AssetFetchStatus.None);
    v2.useEffect(function() --[[ Line: 81 ]]
        -- upvalues: v48 (copy), l_ContentProvider_0 (ref), v46 (copy)
        v48(l_ContentProvider_0:GetAssetFetchStatus(v46));
    end, {
        v46
    });
    v2.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: l_ContentProvider_0 (ref), v46 (copy), v48 (copy)
        local v49 = l_ContentProvider_0:GetAssetFetchStatusChangedSignal(v46):Connect(v48);
        return function() --[[ Line: 87 ]]
            -- upvalues: v49 (copy)
            v49:Disconnect();
        end;
    end, {
        v46
    });
    local v50 = l_useJoinUserInExperience_0(v36.userId, {
        isHomePageCarousel = true, 
        homepageCarouselAbsolutePosition = v36.homepageCarouselAbsolutePosition, 
        presence = v36.presence
    });
    local v51 = v2.useRef(false);
    v2.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v36 (copy), v39 (copy), v51 (copy), v35 (ref)
        local v52 = false;
        if v36.isOpen == true then
            v52 = v39;
        end;
        if v52 and not v51.current then
            local l_universeId_0 = v36.presence.universeId;
            v35.logGameJoinCardPageLoaded({
                friendId = v36.userId, 
                universeId = if l_universeId_0 ~= nil and tostring(l_universeId_0) ~= "" then tostring(l_universeId_0) else nil, 
                absolutePosition = v36.homepageCarouselAbsolutePosition
            });
        end;
        v51.current = v52;
    end, l_dependencyArray_0(v36.isOpen, v39, v36.userId, v36.presence, v36.homepageCarouselAbsolutePosition));
    local v54 = true;
    if v44 ~= "" then
        v54 = true;
        if l_lastLocation_0 ~= nil then
            v54 = true;
            if l_lastLocation_0 ~= "" then
                v54 = v47 == Enum.AssetFetchStatus.Loading;
            end;
        end;
    end;
    local v55 = l_usePreferredInput_0() == v4.Input.Directional;
    local v56 = l_useRoactService_0(l_AppEventIngestService_0);
    local v57 = l_useRoactService_0(l_AppSessionService_0);
    local v61 = v2.useCallback(function() --[[ Line: 135 ]]
        -- upvalues: v36 (copy), l_presence_0 (copy), l_gamePlayIntent_0 (ref), v56 (copy), l_PeopleListInHomePage_0 (ref), l_HttpService_0 (ref)
        local l_userId_0 = v36.userId;
        if l_userId_0 == "" then
            return;
        else
            local v59 = if l_presence_0.placeId ~= nil and tostring(l_presence_0.placeId) ~= "" then tostring(l_presence_0.placeId) else "";
            local v60 = tonumber(l_presence_0.rootPlaceId);
            if v59 == "" or v60 == nil then
                return;
            else
                l_gamePlayIntent_0(v56, l_PeopleListInHomePage_0, {
                    placeId = v59, 
                    rootPlaceId = v60, 
                    friendId = l_userId_0, 
                    joinAttemptId = l_HttpService_0:GenerateGUID(false)
                });
                return;
            end;
        end;
    end, l_dependencyArray_0(v36.userId, l_presence_0));
    local v65 = v2.useCallback(function() --[[ Line: 156 ]]
        -- upvalues: v44 (copy), l_presence_0 (copy), v36 (copy), v57 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref), l_gameDetailReferral_0 (ref), v56 (copy), v37 (copy), l_OpenGameDetails_0 (ref), v38 (copy)
        if v44 == "" then
            return;
        else
            local l_rootPlaceId_0 = l_presence_0.rootPlaceId;
            local v63 = if l_rootPlaceId_0 ~= nil and tostring(l_rootPlaceId_0) ~= "" then tostring(l_rootPlaceId_0) else v44;
            local v64 = v36.homepageCarouselAbsolutePosition or 0;
            if v57 then
                l_SetGamePlaySession_0(v57, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            end;
            l_gameDetailReferral_0(v56, "home", {
                ad = "no", 
                friendId = v36.userId, 
                pg = "home", 
                pid = v63, 
                pos = v64, 
                rowOnPage = 1, 
                sortPos = v36.layoutOrder, 
                tis = 1, 
                universeId = v44
            });
            v37(l_OpenGameDetails_0(v44, v38));
            return;
        end;
    end, l_dependencyArray_0(v37, v38, v44, l_presence_0, v36.homepageCarouselAbsolutePosition, v36.layoutOrder, v36.userId));
    local v68 = v2.useCallback(function(v66) --[[ Line: 192 ]]
        -- upvalues: v44 (copy), v36 (copy), l_viewEDPsourceValues_0 (ref), v35 (ref), l_GameJoinCardButtonAction_0 (ref), v65 (copy)
        if v44 == "" then
            return;
        else
            if v36.userId ~= "" then
                local v67 = {
                    friendId = v36.userId, 
                    universeId = if v44 ~= "" then v44 else nil, 
                    absolutePosition = v36.homepageCarouselAbsolutePosition
                };
                if v66 == l_viewEDPsourceValues_0.Thumbnail then
                    v35.logGameJoinCardButtonEvent(l_GameJoinCardButtonAction_0.ViewExperienceDetailsFromThumbnail, v67);
                elseif v66 == l_viewEDPsourceValues_0.Title then
                    v35.logGameJoinCardButtonEvent(l_GameJoinCardButtonAction_0.ViewExperienceDetailsFromTitle, v67);
                end;
            end;
            v65();
            return;
        end;
    end, l_dependencyArray_0(v65, v44, v36.userId, v36.homepageCarouselAbsolutePosition));
    local v69 = v2.useCallback(function() --[[ Line: 218 ]]
        -- upvalues: v36 (copy), v35 (ref), l_GameJoinCardButtonAction_0 (ref), v44 (copy), v61 (copy), v50 (copy)
        if v36.userId ~= "" then
            v35.logGameJoinCardButtonEvent(l_GameJoinCardButtonAction_0.JoinGame, {
                friendId = v36.userId, 
                universeId = if v44 ~= "" then v44 else nil, 
                absolutePosition = v36.homepageCarouselAbsolutePosition
            });
        end;
        v61();
        v50.joinExperience();
    end, l_dependencyArray_0(v61, v50.joinExperience, v36.userId, v44, v36.homepageCarouselAbsolutePosition));
    local v70 = v2.createElement(v19, {
        layoutOrder = l_layoutOrder_0, 
        playerName = l_playerName_0, 
        experienceName = l_lastLocation_0, 
        gameIconUrl = v46, 
        isLoading = v54, 
        onJoin = v69, 
        onViewExperienceDetails = v68, 
        anchorRef = v36.anchorRef, 
        isOpen = v36.isOpen and v39, 
        onPopoverStateChanged = v36.onPopoverStateChanged, 
        isConsole = v55, 
        consolePlatformLabel = l_platformName_0
    });
    if v36.showGamepadJoinFocus then
        return v2.createElement(v2.Fragment, nil, {
            GamepadJoinFocus = v2.createElement(v20, {
                tileRef = v36.anchorRef, 
                joinExperience = v69
            }), 
            Card = v70
        });
    else
        return v70;
    end;
end;