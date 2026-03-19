local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v6 = require(l_Parent_0.RoactUtils);
local l_useEffectOnMount_0 = v6.Hooks.useEffectOnMount;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local v12 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v12.Core.Style.useStyle;
local l_Images_0 = v12.App.ImageSet.Images;
local l_IconSize_0 = v12.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v12.App.ImageSet.getIconSize;
local l_PlayerContext_0 = v12.App.Indicator.PlayerContext;
local v18 = require(l_script_FirstAncestor_0.Rodux.Presence);
local l_PresenceType_0 = v18.Enums.PresenceType;
local v20 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v23 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v24 = require(l_script_FirstAncestor_0.Common.Enums);
local v25 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v26 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v27 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v28 = require(l_script_FirstAncestor_0.Utils.convertPresenceEnum);
local l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics;
local v30 = {
    [v24.PresenceTypes.Offline] = l_Images_0["component_assets/circle_26_stroke_3"], 
    [v24.PresenceTypes.Online] = l_Images_0["component_assets/circle_16"], 
    [v24.PresenceTypes.InGame] = l_Images_0["icons/menu/games_small"], 
    [v24.PresenceTypes.InStudio] = l_Images_0["icons/logo/studiologo_small"]
};
return function(v31) --[[ Line: 55 ]] --[[ Name: contextualPresence ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), v25 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v2 (copy), v27 (copy), l_useEffectOnMount_0 (copy), v20 (copy), l_useSelector_0 (copy), v18 (copy), l_PresenceType_0 (copy), v28 (copy), v26 (copy), l_AppPage_0 (copy), l_OpenGameDetails_0 (copy), l_dependencyArray_0 (copy), l_useLocalization_0 (copy), v24 (copy), v23 (copy), v30 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_PlayerContext_0 (copy)
    local v32 = l_useDispatch_0();
    local v33 = l_useNavigation_0();
    local v34 = l_useStyle_0();
    local v35 = v25();
    local v36 = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0) else nil;
    local v37 = v2.useRef(false);
    local v38 = v2.useRef(false);
    local l_profileId_0 = v27().profileId;
    l_useEffectOnMount_0(function() --[[ Line: 69 ]]
        -- upvalues: v32 (copy), v20 (ref), l_profileId_0 (copy), v37 (copy)
        v32(v20.GetPresencesFromUserIds.API({
            l_profileId_0
        })):andThen(function() --[[ Line: 71 ]]
            -- upvalues: v37 (ref)
            v37.current = true;
        end):catch(function(_) --[[ Line: 74 ]]

        end);
    end);
    local v42 = l_useSelector_0(function(v41) --[[ Line: 77 ]]
        -- upvalues: v18 (ref), l_profileId_0 (copy), l_PresenceType_0 (ref)
        return v18.Selectors.getUserPresenceByUserId(v41, l_profileId_0) or {
            userPresenceType = l_PresenceType_0.Offline, 
            lastLocation = ""
        };
    end);
    local v43 = if not v37.current then v31.presenceInfoOverride or v42 else v42;
    v2.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v37 (copy), v38 (copy), v28 (ref), v43 (copy), v35 (copy), v26 (ref)
        if not v37.current or v38.current then
            return;
        else
            v38.current = true;
            local v44 = v28(v43.userPresenceType, v43.universeId);
            v35.fireAnalyticsEvent(v26.ProfilePresenceLoaded, {
                presenceType = v44, 
                universeId = v43.universeId
            });
            return;
        end;
    end, {
        v43
    });
    local v45 = v28(v43.userPresenceType, v43.universeId);
    local l_lastLocation_0 = v43.lastLocation;
    local l_universeId_0 = v43.universeId;
    local v48 = v2.useCallback(function() --[[ Line: 105 ]]
        -- upvalues: v35 (copy), v26 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v36 (copy), v43 (copy), l_AppPage_0 (ref), l_profileId_0 (copy), v32 (copy), l_OpenGameDetails_0 (ref), l_universeId_0 (copy), v33 (copy)
        v35.fireAnalyticsEvent(v26.GameDetailsButton);
        if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then
            v36.reportOpenGameDetailFromProfileContext(v43.placeId, v43.universeId, l_AppPage_0.ProfilePlatform, l_profileId_0, "ProfilePlatformContextualPresence");
        end;
        v32(l_OpenGameDetails_0(l_universeId_0, v33, {
            mountAsFullView = true, 
            showBackButton = true
        }));
    end, l_dependencyArray_0(l_universeId_0, v33, v35));
    local v49 = l_useLocalization_0({
        [v24.PresenceTypes.Online] = v23.Online, 
        [v24.PresenceTypes.Offline] = v23.Offline, 
        [v24.PresenceTypes.InStudio] = v23.InStudio
    });
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    if v43 then
        if v45 == v24.PresenceTypes.Online then
            v50 = v30[v24.PresenceTypes.Online];
            v51 = v34.Theme.OnlineStatus.Color;
            v52 = v34.Theme.OnlineStatus.Transparency;
            v53 = v49.Online;
            v54 = v34.Theme.TextMuted;
            v55 = 12;
        elseif v45 == v24.PresenceTypes.InGame then
            v50 = v30[v24.PresenceTypes.InGame];
            v51 = v34.Theme.IconEmphasis.Color;
            v52 = v34.Theme.IconEmphasis.Transparency;
            v53 = l_lastLocation_0;
            v54 = v34.Theme.TextEmphasis;
            v55 = l_getIconSize_0(l_IconSize_0.Small);
            v56 = v48;
        elseif v45 == v24.PresenceTypes.InStudio then
            v50 = v30[v24.PresenceTypes.InStudio];
            v51 = v34.Theme.TextDefault.Color;
            v52 = v34.Theme.TextDefault.Transparency;
            v53 = v49.InStudio;
            v54 = v34.Theme.TextMuted;
            v55 = l_getIconSize_0(l_IconSize_0.Small);
        else
            v50 = v30[v24.PresenceTypes.Offline];
            v51 = v34.Theme.OfflineStatus.Color;
            v52 = v34.Theme.OfflineStatus.Transparency;
            v55 = 12;
            v53 = v49.Offline;
            v54 = v34.Theme.TextMuted;
        end;
    end;
    return v2.createElement(l_PlayerContext_0, {
        fontStyle = v34.Font.CaptionBody, 
        icon = v50, 
        iconColor = v51, 
        iconSize = UDim2.fromOffset(v55, v55), 
        iconTransparency = v52, 
        layoutOrder = 2, 
        text = v53, 
        textColorStyle = v54, 
        onActivated = v56
    });
end;