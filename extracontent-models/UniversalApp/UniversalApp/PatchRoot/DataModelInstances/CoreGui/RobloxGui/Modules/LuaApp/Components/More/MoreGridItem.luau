local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_MenuTile_0 = v5.App.Tile.MenuTile;
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_validateColorInfo_0 = v5.Style.Validator.validateColorInfo;
local l_validateFontInfo_0 = v5.Style.Validator.validateFontInfo;
local l_validateTypographyInfo_0 = v5.Style.Validator.validateTypographyInfo;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = require(l_Modules_0.LuaApp.AppPage);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v16 = require(l_Modules_0.LuaApp.Components.More.Config.MorePageSettings);
local v17 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v21 = require(l_Modules_0.LuaApp.withLocalization);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v23 = require(l_Modules_0.LuaApp.openExternalBrowser);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v25 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v26 = require(l_Modules_0.LuaApp.Constants);
local v27 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v28 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForReportLogs);
local v29 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v30 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v32 = require(l_Modules_0.LuaApp.Components.FriendsLanding.navigateToFriendsLandingEvent);
local l_Sources_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local l_FFlagCreateConnectionsHub_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCreateConnectionsHub;
local l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMorePageDirectionalLayoutRolloutFix;
local l_FFlagBlackbirdRequiresIAP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagBlackbirdRequiresIAP;
local l_GetFFlagEnableCommunityListExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableCommunityListExperimentation;
local l_CommunityListExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.Groups).Experiments.CommunityListExperimentation;
local v41 = v1.PureComponent:extend("MoreGridItem");
v41.validateProps = v4.strictInterface({
    item = v4.table, 
    layoutOrder = v4.integer, 
    formFactor = v4.string, 
    localUserId = v4.string, 
    navigateDown = v4.callback, 
    openLeaveRobloxAlertUIBlox = v4.callback, 
    openReportLogConfirmation = v4.callback, 
    closeAlert = v4.callback, 
    catalogAnalytics = v4.table, 
    shouldUseExternalBrowserForMorePageItem = v4.callback, 
    linking = v4.table, 
    linkingProtocol = v4.optional(v4.table), 
    navigation = v4.table, 
    eventIngest = v4.any, 
    disableWebViewSupport = v4.boolean, 
    disableIAPEntryPoint = v4.optional(v4.boolean), 
    shouldSkipWebViewCheck = v4.boolean, 
    showWebViewNotAvailableToastMessage = v4.callback, 
    isDirectional = if l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 then v4.boolean else nil, 
    itemStyleProps = v4.optional(v4.strictInterface({
        iconStyle = v4.optional(l_validateColorInfo_0), 
        iconSize = v4.optional(l_IconSize_0.isEnumValue), 
        titleStyle = v4.optional(l_validateColorInfo_0), 
        titleFont = v4.optional(v4.union(l_validateFontInfo_0, l_validateTypographyInfo_0))
    }))
});
v41.defaultProps = {
    linkingProtocol = l_LinkingProtocol_0.default
};
v41.init = function(v42) --[[ Line: 89 ]] --[[ Name: init ]]
    -- upvalues: v23 (copy), l_FFlagCreateConnectionsHub_0 (copy), v16 (copy), l_AvatarScreen_0 (copy), v7 (copy), l_Logging_0 (copy), l_FFlagBlackbirdRequiresIAP_0 (copy), v32 (copy), v14 (copy), l_Sources_0 (copy), l_GetFFlagEnableCommunityListExperimentation_0 (copy), l_CommunityListExperimentation_0 (copy)
    v42.navigateDown = function(v43) --[[ Line: 90 ]]
        -- upvalues: v42 (copy), v23 (ref), l_FFlagCreateConnectionsHub_0 (ref), v16 (ref), l_AvatarScreen_0 (ref), v7 (ref)
        local l_item_0 = v42.props.item;
        local l_url_0 = l_item_0.context.url;
        local l_titleKey_0 = l_item_0.context.titleKey;
        if l_item_0.urlGenerator then
            local l_localUserId_0 = v42.props.localUserId;
            l_url_0 = l_item_0.urlGenerator(l_localUserId_0);
        end;
        local v48 = nil;
        if l_item_0.getSearchParams then
            v48 = l_item_0.getSearchParams(v42.props.formFactor);
        end;
        local v49 = nil;
        if l_titleKey_0 or v48 then
            v49 = {
                titleKey = l_titleKey_0, 
                searchParams = v48
            };
        end;
        local v50 = l_item_0.shouldOpenInExternalBrowser and v42.props.shouldUseExternalBrowserForMorePageItem();
        local v51 = false;
        if v42.props.disableWebViewSupport == true then
            v51 = l_item_0.context.fallbackToExternalBrowser == true;
        end;
        local l_appURI_0 = l_item_0.context.appURI;
        if l_appURI_0 then
            v42.props.linkingProtocol:isURLRegistered(l_appURI_0):andThen(function(v53) --[[ Line: 119 ]]
                -- upvalues: v42 (ref), l_appURI_0 (copy)
                if v53 then
                    v42.props.linkingProtocol:detectURL(l_appURI_0);
                end;
            end);
            return;
        elseif v50 or v51 then
            v23(v42.props.linking, l_url_0);
            return;
        elseif l_FFlagCreateConnectionsHub_0 and l_item_0.itemType == v16.ItemType.Friends then
            v42.props.navigation.navigate(l_item_0.context.page);
            return;
        elseif l_item_0.itemType == v16.ItemType.Catalog then
            v42.props.navigation.navigate(l_AvatarScreen_0.Catalog);
            return;
        elseif l_item_0.itemType == v16.ItemType.OfficialStore then
            v42.props.openLeaveRobloxAlertUIBlox(v42.openUrl);
            return;
        elseif l_item_0.itemType == v16.ItemType.ReportLogs then
            v42.props.openReportLogConfirmation();
            return;
        else
            v42.props.navigateDown({
                name = l_item_0.context.page, 
                detail = l_url_0, 
                extraProps = v7.Dictionary.join(v49 or {}, v43 or {})
            });
            return;
        end;
    end;
    v42.openUrl = function() --[[ Line: 148 ]]
        -- upvalues: v42 (copy), l_Logging_0 (ref)
        local l_url_1 = v42.props.item.context.url;
        v42.props.linking:openURL(l_url_1):andThen(function(v55) --[[ Line: 150 ]]
            -- upvalues: l_Logging_0 (ref)
            if v55 == false then
                l_Logging_0.warn("LinkingProtocol:openURL failed for offical amazon store.");
            end;
        end);
        v42.props.closeAlert();
    end;
    v42.onActivated = function() --[[ Line: 159 ]]
        -- upvalues: v42 (copy), v16 (ref), l_FFlagBlackbirdRequiresIAP_0 (ref), v32 (ref), v14 (ref), l_Sources_0 (ref), l_GetFFlagEnableCommunityListExperimentation_0 (ref), l_CommunityListExperimentation_0 (ref)
        local l_catalogAnalytics_0 = v42.props.catalogAnalytics;
        local l_item_1 = v42.props.item;
        local v58 = nil;
        if not v42.props.shouldSkipWebViewCheck then
            local v59 = false;
            if l_item_1.itemType == v16.ItemType.Settings then
                v59 = v42.props.disableWebViewSupport;
            end;
            local v60 = false;
            if l_item_1.itemType == v16.ItemType.BuildersClub then
                v60 = v42.props.disableIAPEntryPoint;
            end;
            local v61 = l_FFlagBlackbirdRequiresIAP_0 and l_item_1.itemType == v16.ItemType.Blackbird and v42.props.disableIAPEntryPoint;
            if v59 or v60 or v61 then
                v42.props.showWebViewNotAvailableToastMessage();
                return;
            end;
        end;
        if l_item_1.itemType == v16.ItemType.Catalog then
            l_catalogAnalytics_0.moreMenuToCatalogButton();
        end;
        if l_item_1.itemType == v16.ItemType.Friends then
            v32({
                context = "morePage", 
                localUserId = v42.props.localUserId
            });
            v58 = {
                navigateToFriendsLandingEventStart = {
                    startPage = v14.More, 
                    startTime = os.clock()
                }
            };
        end;
        if l_item_1.itemType == v16.ItemType.Profile then
            v58 = {
                source = l_Sources_0.MorePageTile
            };
        end;
        if l_item_1.itemType == v16.ItemType.Groups and l_GetFFlagEnableCommunityListExperimentation_0() then
            l_CommunityListExperimentation_0.logExposure();
        end;
        v42.navigateDown(v58);
        v42.props.eventIngest:sendEventDeferred("moreGridItem", "moreGridItemClick", {
            itemType = l_item_1.itemType, 
            url = l_item_1.context.url, 
            localUserId = v42.props.localUserId
        });
    end;
end;
v41.render = function(v62) --[[ Line: 217 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), v1 (copy), l_MenuTile_0 (copy)
    local l_item_2 = v62.props.item;
    local l_badgeCount_0 = l_item_2.badgeCount;
    local l_icon_0 = l_item_2.icon;
    local l_layoutOrder_0 = v62.props.layoutOrder;
    local l_textKey_0 = l_item_2.textKey;
    local l_itemStyleProps_0 = v62.props.itemStyleProps;
    return v21({
        title = l_textKey_0
    })(function(v69) --[[ Line: 227 ]]
        -- upvalues: v1 (ref), l_MenuTile_0 (ref), l_badgeCount_0 (copy), l_icon_0 (copy), l_layoutOrder_0 (copy), v62 (copy), l_itemStyleProps_0 (copy)
        return (v1.createElement(l_MenuTile_0, {
            badgeValue = l_badgeCount_0 > 0 and l_badgeCount_0 or nil, 
            icon = l_icon_0, 
            layoutOrder = l_layoutOrder_0, 
            onActivated = function() --[[ Line: 232 ]] --[[ Name: onActivated ]]
                -- upvalues: v62 (ref)
                v62.onActivated();
            end, 
            title = v69.title, 
            styleProps = l_itemStyleProps_0
        }));
    end);
end;
v41 = v3.connect(function(v70, _) --[[ Line: 242 ]]
    return {
        formFactor = v70.FormFactor, 
        localUserId = v70.LocalUserId
    };
end, function(v72) --[[ Line: 247 ]]
    -- upvalues: v17 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v29 (copy)
    return {
        navigateDown = function(v73) --[[ Line: 249 ]] --[[ Name: navigateDown ]]
            -- upvalues: v72 (copy), v17 (ref)
            v72(v17(v73));
        end, 
        showWebViewNotAvailableToastMessage = function() --[[ Line: 252 ]] --[[ Name: showWebViewNotAvailableToastMessage ]]
            -- upvalues: v72 (copy), v25 (ref), v26 (ref)
            v72(v25(v26.WEBVIEWS_UNAVAILABLE_TOAST));
        end, 
        openLeaveRobloxAlertUIBlox = function(v74) --[[ Line: 255 ]] --[[ Name: openLeaveRobloxAlertUIBlox ]]
            -- upvalues: v72 (copy), v27 (ref)
            v72(v27(v74));
        end, 
        openReportLogConfirmation = function() --[[ Line: 258 ]] --[[ Name: openReportLogConfirmation ]]
            -- upvalues: v72 (copy), v28 (ref)
            v72(v28());
        end, 
        closeAlert = function() --[[ Line: 261 ]] --[[ Name: closeAlert ]]
            -- upvalues: v72 (copy), v29 (ref)
            v72(v29());
        end
    };
end)(v41);
v41 = l_RoactAppPolicy_0.connect(function(v75) --[[ Line: 267 ]]
    return {
        shouldUseExternalBrowserForMorePageItem = v75.shouldUseExternalBrowserForMorePageItem
    };
end)(v41);
v41 = v2.withNavigation(v41);
v41 = l_RoactAppPolicy_0.connect(function(v76) --[[ Line: 275 ]]
    local v77 = not v76.getWebViewSupport();
    local v78 = v76.getDisableIAPEntryPoint();
    return {
        disableWebViewSupport = v77, 
        disableIAPEntryPoint = v78
    };
end)(v41);
v41 = l_RoactServices_0.connect({
    catalogAnalytics = v15, 
    linking = l_AppLinking_0, 
    eventIngest = v19
})(v41);
return function(v79) --[[ Line: 290 ]]
    -- upvalues: l_useIsSpatial_0 (copy), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (copy), v30 (copy), l_useDesignTokens_0 (copy), l_IconSize_0 (copy), v1 (copy), v41 (ref), v7 (copy)
    local v80 = l_useIsSpatial_0();
    local v81 = if l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 then v79.isDirectional else v30.usePreferredInput() == v30.Input.Directional;
    local v82 = nil;
    if v81 then
        local v83 = l_useDesignTokens_0();
        local l_NavigationItemIconStyle_0 = v83.LuaApps.More.NavigationItemIconStyle;
        local l_NavigationItemTitleStyle_0 = v83.LuaApps.More.NavigationItemTitleStyle;
        local l_NavigationItemTitleFont_0 = v83.LuaApps.More.NavigationItemTitleFont;
        v82 = {
            iconStyle = l_NavigationItemIconStyle_0, 
            iconSize = l_IconSize_0.Large, 
            titleStyle = l_NavigationItemTitleStyle_0, 
            titleFont = l_NavigationItemTitleFont_0
        };
    end;
    local v87 = v80 or v81;
    return v1.createElement(v41, v7.Dictionary.join(v79, {
        shouldSkipWebViewCheck = v87, 
        itemStyleProps = if v81 then v82 else nil
    }));
end;