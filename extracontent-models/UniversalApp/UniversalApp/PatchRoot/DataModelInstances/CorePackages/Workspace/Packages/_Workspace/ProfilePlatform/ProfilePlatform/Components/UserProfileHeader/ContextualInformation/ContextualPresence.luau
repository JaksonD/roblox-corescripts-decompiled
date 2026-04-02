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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v31 = {
    [v24.PresenceTypes.Offline] = l_Images_0["component_assets/circle_26_stroke_3"], 
    [v24.PresenceTypes.Online] = l_Images_0["component_assets/circle_16"], 
    [v24.PresenceTypes.InGame] = l_Images_0["icons/menu/games_small"], 
    [v24.PresenceTypes.InStudio] = l_Images_0["icons/logo/studiologo_small"]
};
return function(v32) --[[ Line: 57 ]] --[[ Name: contextualPresence ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useStyle_0 (copy), v25 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v2 (copy), v27 (copy), l_useEffectOnMount_0 (copy), v20 (copy), l_useSelector_0 (copy), v18 (copy), l_PresenceType_0 (copy), v28 (copy), v26 (copy), l_AppPage_0 (copy), l_OpenGameDetails_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useLocalization_0 (copy), v24 (copy), v23 (copy), v31 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), l_PlayerContext_0 (copy)
    local v33 = l_useDispatch_0();
    local v34 = l_useNavigation_0();
    local v35 = l_useStyle_0();
    local v36 = v25();
    local v37 = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0) else nil;
    local v38 = v2.useRef(false);
    local v39 = v2.useRef(false);
    local l_profileId_0 = v27().profileId;
    l_useEffectOnMount_0(function() --[[ Line: 71 ]]
        -- upvalues: v33 (copy), v20 (ref), l_profileId_0 (copy), v38 (copy)
        v33(v20.GetPresencesFromUserIds.API({
            l_profileId_0
        })):andThen(function() --[[ Line: 73 ]]
            -- upvalues: v38 (ref)
            v38.current = true;
        end):catch(function(_) --[[ Line: 76 ]]

        end);
    end);
    local v43 = l_useSelector_0(function(v42) --[[ Line: 79 ]]
        -- upvalues: v18 (ref), l_profileId_0 (copy), l_PresenceType_0 (ref)
        return v18.Selectors.getUserPresenceByUserId(v42, l_profileId_0) or {
            userPresenceType = l_PresenceType_0.Offline, 
            lastLocation = ""
        };
    end);
    local v44 = if not v38.current then v32.presenceInfoOverride or v43 else v43;
    v2.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v38 (copy), v39 (copy), v28 (ref), v44 (copy), v36 (copy), v26 (ref)
        if not v38.current or v39.current then
            return;
        else
            v39.current = true;
            local v45 = v28(v44.userPresenceType, v44.universeId);
            v36.fireAnalyticsEvent(v26.ProfilePresenceLoaded, {
                presenceType = v45, 
                universeId = v44.universeId
            });
            return;
        end;
    end, {
        v44
    });
    local v46 = v28(v44.userPresenceType, v44.universeId);
    local l_lastLocation_0 = v44.lastLocation;
    local l_universeId_0 = v44.universeId;
    local v49 = v2.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v36 (copy), v26 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v37 (copy), v44 (copy), l_AppPage_0 (ref), l_profileId_0 (copy), v33 (copy), l_OpenGameDetails_0 (ref), l_universeId_0 (copy), v34 (copy)
        v36.fireAnalyticsEvent(v26.GameDetailsButton);
        if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then
            v37.reportOpenGameDetailFromProfileContext(v44.placeId, v44.universeId, l_AppPage_0.ProfilePlatform, l_profileId_0, "ProfilePlatformContextualPresence");
        end;
        v33(l_OpenGameDetails_0(l_universeId_0, v34, {
            mountAsFullView = true, 
            showBackButton = true
        }));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_universeId_0, 
        v34, 
        v36
    } else l_dependencyArray_0(l_universeId_0, v34, v36));
    local v50 = l_useLocalization_0({
        [v24.PresenceTypes.Online] = v23.Online, 
        [v24.PresenceTypes.Offline] = v23.Offline, 
        [v24.PresenceTypes.InStudio] = v23.InStudio
    });
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    if v44 then
        if v46 == v24.PresenceTypes.Online then
            v51 = v31[v24.PresenceTypes.Online];
            v52 = v35.Theme.OnlineStatus.Color;
            v53 = v35.Theme.OnlineStatus.Transparency;
            v54 = v50.Online;
            v55 = v35.Theme.TextMuted;
            v56 = 12;
        elseif v46 == v24.PresenceTypes.InGame then
            v51 = v31[v24.PresenceTypes.InGame];
            v52 = v35.Theme.IconEmphasis.Color;
            v53 = v35.Theme.IconEmphasis.Transparency;
            v54 = l_lastLocation_0;
            v55 = v35.Theme.TextEmphasis;
            v56 = l_getIconSize_0(l_IconSize_0.Small);
            v57 = v49;
        elseif v46 == v24.PresenceTypes.InStudio then
            v51 = v31[v24.PresenceTypes.InStudio];
            v52 = v35.Theme.TextDefault.Color;
            v53 = v35.Theme.TextDefault.Transparency;
            v54 = v50.InStudio;
            v55 = v35.Theme.TextMuted;
            v56 = l_getIconSize_0(l_IconSize_0.Small);
        else
            v51 = v31[v24.PresenceTypes.Offline];
            v52 = v35.Theme.OfflineStatus.Color;
            v53 = v35.Theme.OfflineStatus.Transparency;
            v56 = 12;
            v54 = v50.Offline;
            v55 = v35.Theme.TextMuted;
        end;
    end;
    return v2.createElement(l_PlayerContext_0, {
        fontStyle = v35.Font.CaptionBody, 
        icon = v51, 
        iconColor = v52, 
        iconSize = UDim2.fromOffset(v56, v56), 
        iconTransparency = v53, 
        layoutOrder = 2, 
        text = v54, 
        textColorStyle = v55, 
        onActivated = v57
    });
end;