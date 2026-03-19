local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v13.Enums.AvatarScreen;
local l_AvatarRoute_0 = v13.AvatarRoute.AvatarRoute;
local l_Overlay_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.Overlay;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v20 = require(l_Modules_0.AvatarExperience.Common.Validators.ItemDataValidator);
local l_AssetTypeIdStringToName_0 = require(l_Modules_0.AvatarExperience.Common.Constants).AssetTypeIdStringToName;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local v23 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v24 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v26 = require(l_Modules_0.LuaApp.Constants);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetAssetFavorite);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetAssetFavorite);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetBundleFavorite);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetBundleFavorite);
local v32 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v33 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenAppItemDetails);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v35 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v38 = require(l_Modules_0.AvatarExperience.Common.Context.withNamedRefs);
local v39 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v40 = require(l_Modules_0.AvatarExperience.Common.NamedRefConstants);
local v41 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v43 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v44 = require(l_Modules_0.LuaApp.Http.Url);
local v45 = require(l_CorePackages_0.Packages.UIBlox);
local v46 = require(l_CorePackages_0.Packages.t);
local v47 = require(l_CorePackages_0.Workspace.Packages.GenericAbuseReporting);
local l_AbuseVector_0 = v47.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v47.Thunks.OpenDynamicAbuseReport;
local l_ContextualMenu_0 = v45.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v45.App.Menu.MenuDirection;
local l_Images_0 = v45.App.ImageSet.Images;
local l_withStyle_0 = v45.Style.withStyle;
local v54 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRestrictLimited2ToSoothsayers);
local l_GetFFlagLuafiedReportEntryPoints_0 = v39.GetFFlagLuafiedReportEntryPoints;
local l_GetFFlagEnableAbuseReport10ft_0 = v39.GetFFlagEnableAbuseReport10ft;
local l_GetFFlagFixCatalogContextItemReportURLConstruction_0 = v39.GetFFlagFixCatalogContextItemReportURLConstruction;
local l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 = v39.FFlagAXMigrateCatalogContextMenuFromRoactGamepad;
local l_FFlagEnableAbuseReportRevampFlow_0 = v39.FFlagEnableAbuseReportRevampFlow;
local v60 = game:DefineFastFlag("EnableAbuseReportRevampItem2", false);
local v61 = game:DefineFastFlag("EnableAbuseReportRevampUgcBundle", false);
local v62 = game:DefineFastFlag("AXOpenAppItemDetailsOnTryOnPage", false);
local v63 = game:DefineFastFlag("MigrateConsoleToReportingRevampFlow", false);
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v39.FFlagAXFixPurchaseSurfaceLogging;
local v65 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ReportBundle);
local v66 = l_GuiService_0:IsTenFootInterface();
local v67 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v68 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v69 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v70 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_ExternalContentSharingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v74 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
    v74 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
        v74 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Linux then
            v74 = l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
        end;
    end;
end;
local v75 = l_Images_0["icons/actions/favoriteOff"];
local v76 = l_Images_0["icons/actions/favoriteOn"];
local v77 = l_Images_0["icons/menu/customize"];
local v78 = l_Images_0["icons/menu/shop"];
local v79 = l_Images_0["icons/actions/share"];
local v80 = l_Images_0["icons/actions/feedback"];
local v81 = l_Images_0["icons/menu/link"];
local v82 = l_Images_0["icons/actions/info"];
local v83 = v4.PureComponent:extend("CatalogContextFrame");
v83.validateProps = v46.strictInterface({
    itemId = v46.string, 
    itemType = v46.string, 
    onOverlayClosed = v46.optional(v46.callback), 
    centered = v46.optional(v46.boolean), 
    itemDetailsPeekViewRefs = v46.optional(v46.table), 
    hideItemDetailsButtonVisible = v46.optional(v46.boolean), 
    defaultChildRef = if l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then nil else v46.optional(v46.table), 
    focusController = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then nil else v46.optional(v46.table), 
    navigation = v46.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    analytics = v46.any, 
    networking = v46.any, 
    namedRefs = v46.table, 
    shouldShowShareButton = v46.boolean, 
    shouldShareToProvider = v46.boolean, 
    reportingDisabled = v46.boolean, 
    webViewSupport = v46.boolean, 
    useLuafiedReportFlow = if not not l_GetFFlagLuafiedReportEntryPoints_0() or l_GetFFlagEnableAbuseReport10ft_0() then v46.boolean else nil, 
    favoritesFetchingState = v46.any, 
    localUserId = v46.string, 
    isFavorited = v46.optional(v46.boolean), 
    itemData = v46.optional(v20), 
    screenSize = v46.Vector2, 
    userHasMembership = v46.boolean, 
    boundInputs = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then nil else v46.table, 
    isCollectiblesEnabled = if v54() then v46.optional(v46.boolean) else nil, 
    collectiblesResaleRestriction = v46.number, 
    itemSubType = v46.optional(v46.string), 
    priceInRobux = v46.optional(v46.number), 
    navigateDown = v46.callback, 
    getAssetFavorite = v46.callback, 
    getBundleFavorite = v46.callback, 
    setAssetFavorite = v46.callback, 
    setBundleFavorite = v46.callback, 
    isPortrait = v46.optional(v46.boolean), 
    getOrGenerateShortShareLink = v46.callback, 
    externalContentSharingProtocol = v46.any, 
    setCurrentToastMessage = v46.callback, 
    openItemDetails = v46.callback, 
    openAppItemDetails = if v62 then v46.callback else nil, 
    reportBundle = v46.callback, 
    openDynamicAbuseReport = if l_FFlagEnableAbuseReportRevampFlow_0 then v46.callback else nil, 
    closeCentralOverlay = v46.callback
});
local function _(v84, v85) --[[ Line: 189 ]] --[[ Name: getIsFavorited ]]
    -- upvalues: v23 (copy)
    local v86 = nil;
    local l_itemId_0 = v85.itemId;
    local l_itemType_0 = v85.itemType;
    if l_itemType_0 == v23.ItemType.Asset then
        return v84.AvatarExperience.Catalog.AssetFavorites[l_itemId_0];
    else
        if l_itemType_0 == v23.ItemType.Bundle then
            v86 = v84.AvatarExperience.Catalog.BundleFavorites[l_itemId_0];
        end;
        return v86;
    end;
end;
local function _(v90, v91) --[[ Line: 201 ]] --[[ Name: getFavoritesFetchingState ]]
    -- upvalues: v23 (copy), v25 (copy), l_PerformFetch_0 (copy)
    local v92 = nil;
    local l_itemId_1 = v91.itemId;
    local l_itemType_1 = v91.itemType;
    if l_itemType_1 == v23.ItemType.Asset then
        v92 = v25.SetFavoriteAssetKey;
    elseif l_itemType_1 == v23.ItemType.Bundle then
        v92 = v25.SetFavoriteBundleKey;
    end;
    return l_PerformFetch_0.GetStatus(v90, v92 .. tostring(l_itemId_1));
end;
v83.init = function(v96) --[[ Line: 213 ]] --[[ Name: init ]]
    -- upvalues: v23 (copy), v4 (copy), v18 (copy), l_AvatarScreen_0 (copy), v54 (copy), v43 (copy), v69 (copy), l_UrlBuilder_0 (copy), l_GetFFlagFixCatalogContextItemReportURLConstruction_0 (copy), v44 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v61 (copy), l_AbuseVector_0 (copy), l_l_UserInputService_0_Platform_0 (copy), v63 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), v66 (copy), v12 (copy), v25 (copy), l_AssetTypeIdStringToName_0 (copy), v60 (copy), v62 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), l_ImpressionEnums_0 (copy), v40 (copy)
    if v96.props.analytics then
        v96.props.analytics.sendAXCounter(v23.Counter.ContextFrame.Open);
    end;
    local v97, v98 = v4.createBinding(UDim2.fromScale(1, 1));
    v96.contextMenuSize = v97;
    v96.updateContextMenuSize = v98;
    v96.goToAvatarPage = function() --[[ Line: 221 ]]
        -- upvalues: v96 (copy), v18 (ref), l_AvatarScreen_0 (ref)
        v96.props.analytics.clickCustomizeItemButton(v96.props.itemId, v96.props.itemType);
        v18.navigateFromOverlay(v96.props.navigation, l_AvatarScreen_0.AvatarEditor);
    end;
    v96.openSellPage = function() --[[ Line: 226 ]]
        -- upvalues: v96 (copy), v54 (ref), v18 (ref), l_AvatarScreen_0 (ref)
        local l_itemId_2 = v96.props.itemId;
        local l_itemType_2 = v96.props.itemType;
        local l_userHasMembership_0 = v96.props.userHasMembership;
        local l_navigation_0 = v96.props.navigation;
        if l_userHasMembership_0 then
            if not v54() or v96.props.isCollectiblesEnabled then
                local l_collectibleItemId_0 = v96.props.itemData.collectibleItemId;
                v18.navigateFromOverlay(v96.props.navigation, l_AvatarScreen_0.ItemOwnershipPage, {
                    itemId = l_itemId_2, 
                    collectibleItemId = l_collectibleItemId_0, 
                    itemType = l_itemType_2
                });
                return;
            else
                v18.navigateFromOverlay(v96.props.navigation, l_AvatarScreen_0.SellItemPage, {
                    itemId = l_itemId_2, 
                    itemType = l_itemType_2
                });
                return;
            end;
        else
            v18.navigateToNextOverlay(l_navigation_0, l_AvatarScreen_0.PremiumSellOnlyPrompt);
            return;
        end;
    end;
    v96.favoriteItem = function() --[[ Line: 254 ]]
        -- upvalues: v96 (copy), v43 (ref), v23 (ref)
        local l_isFavorited_0 = v96.props.isFavorited;
        local v105 = true;
        if l_isFavorited_0 ~= nil then
            v105 = v96.props.favoritesFetchingState == v43.Fetching;
        end;
        if v105 then
            return;
        else
            local l_itemId_3 = v96.props.itemId;
            local l_itemType_3 = v96.props.itemType;
            local l_analytics_0 = v96.props.analytics;
            if l_itemType_3 == v23.ItemType.Asset then
                v96.props.setAssetFavorite(l_itemId_3, not l_isFavorited_0);
            elseif l_itemType_3 == v23.ItemType.Bundle then
                v96.props.setBundleFavorite(l_itemId_3, not l_isFavorited_0);
            end;
            l_analytics_0.clickFavoriteItemButton(l_itemId_3, l_itemType_3, not l_isFavorited_0);
            return;
        end;
    end;
    v96.shareItemViaShortLink = function(v109, v110, v111) --[[ Line: 273 ]]
        -- upvalues: v96 (copy), v23 (ref)
        v96.props.getOrGenerateShortShareLink(v96.props.itemId, v96.props.itemType):andThen(function(v112) --[[ Line: 276 ]]
            -- upvalues: v96 (ref), v23 (ref), v109 (copy), v110 (copy)
            if v112 and v112.responseBody and v112.responseBody.shortUrl then
                v96.props.analytics.sendCounter(v23.Counter.GetOrGenerateShortShareLink.Success);
                if v109 then
                    v109();
                end;
                v96.openShareSheetOrCopyLink(v112.responseBody.shortUrl);
                return;
            else
                v96.props.analytics.sendCounter(v23.Counter.GetOrGenerateShortShareLink.Invalid);
                if v110 then
                    v110(v112);
                end;
                v96.shareItem();
                return;
            end;
        end):catch(function(v113) --[[ Line: 292 ]]
            -- upvalues: v96 (ref), v23 (ref), v111 (copy)
            v96.props.analytics.sendCounter(v23.Counter.GetOrGenerateShortShareLink.Failure);
            if v111 then
                v111(v113);
            end;
            v96.shareItem();
        end);
    end;
    v96.popupLinkCopiedToast = function() --[[ Line: 301 ]]
        -- upvalues: v96 (copy), v69 (ref), v23 (ref)
        v96.props.setCurrentToastMessage({
            toastMessage = "Feature.Catalog.Toast.LinkCopied", 
            toastType = v69.SuccessConfirmation
        });
        v96.props.analytics.sendCounter(v23.Counter.GetOrGenerateShortShareLink.LinkCopied);
    end;
    v96.openShareSheetOrCopyLink = function(v114) --[[ Line: 309 ]]
        -- upvalues: v96 (copy)
        v96.props.analytics.clickShareItemButton(v96.props.itemId, v96.props.itemType);
        v96.closePrompt();
        v96.props.externalContentSharingProtocol:shareUrl({
            context = "CatalogMoreMenu", 
            url = v114
        });
    end;
    v96.shareItem = function() --[[ Line: 319 ]]
        -- upvalues: l_UrlBuilder_0 (ref), v96 (copy)
        local v115 = l_UrlBuilder_0.catalog.info.appsflyer({
            assetId = v96.props.itemId, 
            assetType = v96.props.itemType
        });
        v96.openShareSheetOrCopyLink(v115);
    end;
    v96.reportItem = function(v116) --[[ Line: 328 ]]
        -- upvalues: v96 (copy), l_GetFFlagFixCatalogContextItemReportURLConstruction_0 (ref), v44 (ref), v23 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v61 (ref), l_AbuseVector_0 (ref), l_l_UserInputService_0_Platform_0 (ref), v63 (ref), l_GetFFlagEnableAbuseReport10ft_0 (ref), v66 (ref), v12 (ref), v25 (ref), l_AssetTypeIdStringToName_0 (ref), v18 (ref), l_AvatarScreen_0 (ref), v60 (ref)
        local l_navigation_1 = v96.props.navigation;
        local l_itemId_4 = v96.props.itemId;
        local l_itemType_4 = v96.props.itemType;
        local l_itemData_0 = v96.props.itemData;
        local l_localUserId_0 = v96.props.localUserId;
        local v122 = nil;
        v122 = if l_GetFFlagFixCatalogContextItemReportURLConstruction_0() then v44.BASE_URL .. "abusereport/asset?id=" .. l_itemId_4 else v44.BASE_URL .. "/abusereport/asset?id=" .. l_itemId_4;
        local v123 = nil;
        local v124 = nil;
        local v125 = nil;
        local v126 = nil;
        local v127 = nil;
        if l_itemData_0 then
            if l_itemData_0.creator then
                v123 = l_itemData_0.creator.id;
                v124 = l_itemData_0.creator.name;
            end;
            v125 = l_itemData_0.name;
            v126 = l_itemData_0.description;
            v127 = l_itemData_0.assetType;
        end;
        if l_itemType_4 == v23.ItemType.Bundle then
            if l_FFlagEnableAbuseReportRevampFlow_0 and v61 then
                v96.props.openDynamicAbuseReport({
                    abuseVector = l_AbuseVector_0.UgcBundle, 
                    targetId = l_itemId_4, 
                    onClose = function() --[[ Line: 360 ]] --[[ Name: onClose ]]
                        -- upvalues: v96 (ref)
                        v96.props.closeCentralOverlay();
                    end
                });
            else
                v96.props.reportBundle(v96.props.networking, l_itemId_4, l_l_UserInputService_0_Platform_0, DateTime.now().UnixTimestampMillis);
            end;
            v96.closePrompt();
            return;
        elseif not v63 and v96.props.useLuafiedReportFlow then
            if l_GetFFlagEnableAbuseReport10ft_0() and v66 then
                v96.props.navigateDown({
                    name = v12.ReportScreen, 
                    reportData = {
                        assetId = l_itemId_4, 
                        platform = v25.ReportScreen.Platforms.Console, 
                        context = v25.ReportScreen.Contexts.Item, 
                        reportAbuseVector = l_AssetTypeIdStringToName_0[v127]
                    }
                });
                return;
            else
                v18.navigateToNextOverlay(l_navigation_1, l_AvatarScreen_0.ReportDialog, {
                    userId = l_localUserId_0, 
                    itemId = l_itemId_4, 
                    itemCreatorId = v123, 
                    itemCreatorName = v124, 
                    itemName = v125, 
                    itemDescription = v126, 
                    assetTypeName = l_AssetTypeIdStringToName_0[v127]
                });
                return;
            end;
        elseif not v63 and v66 then
            v18.navigateToNextOverlay(l_navigation_1, l_AvatarScreen_0.CatalogReport, {
                userId = l_localUserId_0, 
                itemId = l_itemId_4, 
                itemCreatorId = v123, 
                itemName = v125, 
                itemDescription = v126
            });
            return;
        elseif l_FFlagEnableAbuseReportRevampFlow_0 and v60 then
            v96.props.openDynamicAbuseReport({
                abuseVector = l_AbuseVector_0.Accessory, 
                targetId = l_itemId_4, 
                onClose = function() --[[ Line: 407 ]] --[[ Name: onClose ]]
                    -- upvalues: v96 (ref)
                    v96.props.closeCentralOverlay();
                end, 
                custom = {
                    assetTypeName = l_AssetTypeIdStringToName_0[v127]
                }
            });
            return;
        else
            v96.closePrompt();
            v96.props.navigateDown({
                name = v12.GenericWebPage, 
                detail = v122, 
                extraProps = {
                    title = v116
                }
            });
            return;
        end;
    end;
    v96.closePrompt = function() --[[ Line: 426 ]]
        -- upvalues: v18 (ref), v96 (copy)
        v18.closeOverlay(v96.props.navigation);
    end;
    v96.onViewDetailsPageActivate = function() --[[ Line: 430 ]]
        -- upvalues: v96 (copy), v23 (ref), v62 (ref), l_AvatarScreen_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ImpressionEnums_0 (ref), v40 (ref)
        v96.props.analytics.sendAXCounter(v23.Counter.ContextFrame.ViewDetailsPageClick);
        v96.closePrompt();
        if v62 and v96.props.avatarRoute.current.name == l_AvatarScreen_0.TryOnItem then
            if l_FFlagAXFixPurchaseSurfaceLogging_0 then
                v96.props.openAppItemDetails(v96.props.itemId, v96.props.itemType, true, true, l_ImpressionEnums_0.MarketplaceSurfaceType.USER_PROFILE);
                return;
            else
                v96.props.openAppItemDetails(v96.props.itemId, v96.props.itemType, true);
                return;
            end;
        else
            v96.props.openItemDetails({
                itemId = v96.props.itemId, 
                itemType = v96.props.itemType, 
                itemSubType = v96.props.itemSubType, 
                priceInRobux = v96.props.priceInRobux, 
                showFullWithNoPeekView = true, 
                closePreviousItemDetails = true, 
                avatarRoute = v96.props.avatarRoute, 
                navigation = v96.props.navigation, 
                resultsListRef = v96.props.namedRefs[v96.props.avatarRoute.opaque.name .. v40.ItemsList], 
                itemDetailsPeekViewRefs = v96.props.itemDetailsPeekViewRefs, 
                catalogAnalytics = v96.props.analytics
            });
            return;
        end;
    end;
end;
v83.didMount = function(v128) --[[ Line: 463 ]] --[[ Name: didMount ]]
    -- upvalues: v23 (copy)
    if v128.props.isFavorited == nil then
        local l_itemId_5 = v128.props.itemId;
        local l_itemType_5 = v128.props.itemType;
        if l_itemType_5 == v23.ItemType.Asset then
            v128.props.getAssetFavorite(l_itemId_5);
            return;
        elseif l_itemType_5 == v23.ItemType.Bundle then
            v128.props.getBundleFavorite(l_itemId_5);
        end;
    end;
end;
v83.renderWithProviders = function(v131, v132, v133) --[[ Line: 477 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v76 (copy), v75 (copy), v27 (copy), l_AvatarScreen_0 (copy), v77 (copy), v82 (copy), v66 (copy), v25 (copy), v78 (copy), v74 (copy), v79 (copy), v81 (copy), v23 (copy), v80 (copy), l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 (copy), v24 (copy), v26 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Overlay_0 (copy), l_Focusable_0 (copy)
    local l_centered_0 = v131.props.centered;
    local l_itemType_6 = v131.props.itemType;
    local l_itemData_1 = v131.props.itemData;
    local l_isFavorited_1 = v131.props.isFavorited;
    local l_screenSize_0 = v131.props.screenSize;
    local l_name_0 = v131.props.avatarRoute.opaque.name;
    local l_userHasMembership_1 = v131.props.userHasMembership;
    local l_reportingDisabled_0 = v131.props.reportingDisabled;
    local l_collectiblesResaleRestriction_0 = v131.props.collectiblesResaleRestriction;
    local l_name_1 = v131.props.avatarRoute.current.name;
    local v144 = l_isFavorited_1 and v76 or v75;
    local v145 = l_itemData_1.creator and l_itemData_1.creator.id;
    local v146 = false;
    if v145 ~= "1" then
        v146 = not l_reportingDisabled_0;
    end;
    local v147 = v27.IsResellable(l_itemData_1);
    local v148 = l_isFavorited_1 and v132.unfavoriteLabel or v132.favoriteLabel;
    local l_reportLabel_0 = v132.reportLabel;
    local v150 = {};
    local l_isOwned_0 = l_itemData_1.isOwned;
    if l_isOwned_0 and l_name_0 ~= l_AvatarScreen_0.AvatarEditor then
        table.insert(v150, {
            icon = v77, 
            text = v132.customizeLabel, 
            onActivated = v131.goToAvatarPage
        });
    end;
    if l_name_1 ~= l_AvatarScreen_0.ItemDetails and not v131.props.hideItemDetailsButtonVisible then
        table.insert(v150, {
            icon = v82, 
            text = v132.viewDetailsPageLabel, 
            onActivated = v131.onViewDetailsPageActivate
        });
    end;
    table.insert(v150, {
        icon = v144, 
        text = v148, 
        onActivated = v131.favoriteItem
    });
    local v152 = (not v66 or l_userHasMembership_1) and l_collectiblesResaleRestriction_0 ~= v25.ResaleRestriction.Disabled;
    if l_isOwned_0 and v147 and v152 then
        table.insert(v150, {
            icon = v78, 
            text = v132.sellLabel, 
            onActivated = v131.openSellPage
        });
    end;
    local v153 = v131.props.shouldShowShareButton and not v66 and v131.props.webViewSupport;
    local l_v74_0 = v74;
    if v153 then
        if not v131.props.shouldShareToProvider then
            table.insert(v150, {
                icon = v79, 
                text = v132.shareLabel, 
                onActivated = function() --[[ Line: 547 ]] --[[ Name: onActivated ]]
                    -- upvalues: v131 (copy)
                    v131.shareItemViaShortLink();
                end
            });
        end;
    elseif l_v74_0 then
        table.insert(v150, {
            icon = v81, 
            onActivated = function() --[[ Line: 574 ]] --[[ Name: onActivated ]]
                -- upvalues: v131 (copy)
                v131.shareItemViaShortLink(v131.popupLinkCopiedToast, v131.popupLinkCopiedToast, v131.popupLinkCopiedToast);
            end, 
            text = v132.copyLink
        });
    end;
    local v155 = l_itemType_6 == v23.ItemType.Asset;
    local v156 = l_itemType_6 == v23.ItemType.Bundle;
    local v157 = v131.props.useLuafiedReportFlow or v131.props.webViewSupport or v156;
    local v158 = v155 or v156;
    if v146 and v158 and v157 then
        table.insert(v150, {
            icon = v80, 
            text = l_reportLabel_0, 
            onActivated = function() --[[ Line: 599 ]] --[[ Name: onActivated ]]
                -- upvalues: v131 (copy), l_reportLabel_0 (copy)
                v131.reportItem(l_reportLabel_0);
            end
        });
    end;
    local l_isPortrait_0 = v131.props.isPortrait;
    local v160 = l_isPortrait_0 and 0 or v23.LandscapeNavWidth;
    local v161 = -76;
    if not l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 and v24.getNumElementsWithKeyField(v131.props.boundInputs) > 0 then
        v161 = -76 - v26.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v162 = l_isPortrait_0 and 1 or v23.LandscapeSceneWidth;
    local v163 = nil;
    local v164 = nil;
    if l_centered_0 and not l_isPortrait_0 then
        local v165 = math.min(l_screenSize_0.X, 640);
        v163 = UDim2.fromOffset((l_screenSize_0.X - v165) / 2, 0);
        v164 = UDim2.new(0, v165, 1, 0);
    else
        v163 = UDim2.fromScale(v160, 0);
        v164 = UDim2.fromScale(v162, 1);
    end;
    if l_centered_0 then
        v163 = UDim2.fromScale(0.5, 0);
    end;
    return v4.createElement(if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then l_Overlay_0 else l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Position = v163, 
        Size = v164, 
        [v4.Ref] = if l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then nil else v131.props.defaultChildRef, 
        AnchorPoint = if l_centered_0 then Vector2.new(0.5, 0) else nil
    }, {
        SizeFrame = v131:renderInnerFrame(v150, v161, v133)
    });
end;
v83.renderInnerFrame = function(v166, v167, v168, v169) --[[ Line: 651 ]] --[[ Name: renderInnerFrame ]]
    -- upvalues: v4 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy)
    local l_Tokens_0 = v169.Tokens;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.fromScale(1, 1)
    }, {
        ContextMenuPadding = v4.createElement("UIPadding", {
            PaddingRight = UDim.new(0, l_Tokens_0.Global.Size_300), 
            PaddingLeft = UDim.new(0, l_Tokens_0.Global.Size_300)
        }), 
        ContextMenu = v4.createElement(l_ContextualMenu_0, {
            buttonProps = v167, 
            open = true, 
            menuDirection = l_MenuDirection_0.Up, 
            openPositionY = UDim.new(1, v168), 
            closeBackgroundVisible = true, 
            screenSize = v166.props.screenSize, 
            contextMenuWidthOverride = UDim.new(1, 0), 
            onDismiss = v166.closePrompt
        })
    });
end;
v83.render = function(v171) --[[ Line: 681 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    if not v171.props.itemData then
        return;
    else
        return l_withStyle_0(function(v172) --[[ Line: 685 ]]
            -- upvalues: l_withLocalization_0 (ref), v171 (copy)
            return l_withLocalization_0({
                copyLink = "Feature.Catalog.Action.CopyLink", 
                customizeLabel = "Feature.Catalog.Action.Customize", 
                favoriteLabel = "Feature.Catalog.Action.Favorite", 
                unfavoriteLabel = "Feature.Catalog.Action.RemoveFavorite", 
                sellLabel = "Feature.Catalog.Action.Sell", 
                shareLabel = "Feature.SocialShare.Action.Share", 
                reportLabel = "Feature.Catalog.Action.Report", 
                viewDetailsPageLabel = "Feature.Catalog.Action.ViewDetailsPage"
            })(function(v173) --[[ Line: 695 ]]
                -- upvalues: v171 (ref), v172 (copy)
                return v171:renderWithProviders(v173, v172);
            end);
        end);
    end;
end;
v83 = v5.connect(function(v174, v175) --[[ Line: 701 ]]
    -- upvalues: v35 (copy), v27 (copy), v25 (copy), v23 (copy), l_PerformFetch_0 (copy), l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 (copy), v54 (copy), v67 (copy), l_ExternalContentSharingProtocol_0 (copy)
    local l_itemId_6 = v175.itemId;
    local l_itemType_7 = v175.itemType;
    local v178 = v35(v174.AvatarExperience.Common, l_itemId_6, l_itemType_7);
    local v179 = v27.GetItemSubType(l_itemType_7, v178);
    local v180 = v178 and v178.priceInRobux;
    local v181 = v174.Users[v174.LocalUserId];
    local v182 = v181 and v181.membership;
    local v183 = if v178 then v178.collectibleItemId else nil;
    local v184 = if v183 then v174.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[v183] else nil;
    local v185 = if v184 then v184.resaleRestriction else v25.ResaleRestriction.None;
    local v186 = {};
    local v187 = nil;
    local l_itemId_7 = v175.itemId;
    local l_itemType_8 = v175.itemType;
    if l_itemType_8 == v23.ItemType.Asset then
        v187 = v25.SetFavoriteAssetKey;
    elseif l_itemType_8 == v23.ItemType.Bundle then
        v187 = v25.SetFavoriteBundleKey;
    end;
    v186.favoritesFetchingState = l_PerformFetch_0.GetStatus(v174, v187 .. tostring(l_itemId_7));
    v186.localUserId = v174.LocalUserId;
    v187 = nil;
    l_itemId_7 = v175.itemId;
    l_itemType_8 = v175.itemType;
    if l_itemType_8 == v23.ItemType.Asset then
        v187 = v174.AvatarExperience.Catalog.AssetFavorites[l_itemId_7];
    elseif l_itemType_8 == v23.ItemType.Bundle then
        v187 = v174.AvatarExperience.Catalog.BundleFavorites[l_itemId_7];
    end;
    v186.isFavorited = v187;
    v186.itemData = v178;
    v186.screenSize = v174.ScreenSize;
    v186.userHasMembership = v182 ~= Enum.MembershipType.None;
    v186.boundInputs = if l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then nil else v174.GamepadBottomBar.boundInputs;
    v186.isCollectiblesEnabled = if v54() then v174.AvatarExperience.Catalog.Metadata.isCollectiblesEnabled else nil;
    v186.isPortrait = v67(v174);
    v186.collectiblesResaleRestriction = v185;
    v186.externalContentSharingProtocol = l_ExternalContentSharingProtocol_0.default;
    v186.itemSubType = v179;
    v186.priceInRobux = v180;
    return v186;
end, function(v190) --[[ Line: 736 ]]
    -- upvalues: v9 (copy), v30 (copy), v28 (copy), v29 (copy), v31 (copy), v70 (copy), v68 (copy), v32 (copy), v62 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v33 (copy), v65 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_CloseCentralOverlay_0 (copy)
    return {
        navigateDown = function(v191) --[[ Line: 738 ]] --[[ Name: navigateDown ]]
            -- upvalues: v190 (copy), v9 (ref)
            v190(v9(v191));
        end, 
        getBundleFavorite = function(v192) --[[ Line: 741 ]] --[[ Name: getBundleFavorite ]]
            -- upvalues: v190 (copy), v30 (ref)
            v190(v30(v192));
        end, 
        getAssetFavorite = function(v193) --[[ Line: 744 ]] --[[ Name: getAssetFavorite ]]
            -- upvalues: v190 (copy), v28 (ref)
            v190(v28(v193));
        end, 
        setAssetFavorite = function(v194, v195) --[[ Line: 747 ]] --[[ Name: setAssetFavorite ]]
            -- upvalues: v190 (copy), v29 (ref)
            v190(v29(v194, v195));
        end, 
        setBundleFavorite = function(v196, v197) --[[ Line: 750 ]] --[[ Name: setBundleFavorite ]]
            -- upvalues: v190 (copy), v31 (ref)
            v190(v31(v196, v197));
        end, 
        getOrGenerateShortShareLink = function(v198, v199) --[[ Line: 753 ]] --[[ Name: getOrGenerateShortShareLink ]]
            -- upvalues: v190 (copy), v70 (ref)
            return v190(v70.GetOrGenerateShortShareLink(v198, v199));
        end, 
        setCurrentToastMessage = function(v200) --[[ Line: 756 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v190 (copy), v68 (ref)
            return v190(v68(v200));
        end, 
        openItemDetails = function(v201) --[[ Line: 759 ]] --[[ Name: openItemDetails ]]
            -- upvalues: v190 (copy), v32 (ref)
            v190(v32(v201));
        end, 
        openAppItemDetails = if v62 then l_FFlagAXFixPurchaseSurfaceLogging_0 and function(v202, v203, v204, v205, v206) --[[ Line: 764 ]]
            -- upvalues: v190 (copy), v33 (ref)
            v190(v33(v202, v203, v204, v205, v206));
        end or function(v207, v208, v209) --[[ Line: 767 ]]
            -- upvalues: v190 (copy), v33 (ref)
            v190(v33(v207, v208, v209));
        end else nil, 
        reportBundle = function(v210, v211, v212, v213) --[[ Line: 771 ]] --[[ Name: reportBundle ]]
            -- upvalues: v190 (copy), v65 (ref)
            v190(v65(v210, v211, v212, v213));
        end, 
        openDynamicAbuseReport = l_FFlagEnableAbuseReportRevampFlow_0 and function(v214) --[[ Line: 775 ]]
            -- upvalues: v190 (copy), l_OpenDynamicAbuseReport_0 (ref)
            v190(l_OpenDynamicAbuseReport_0(v214));
        end or nil, 
        closeCentralOverlay = function() --[[ Line: 779 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v190 (copy), l_CloseCentralOverlay_0 (ref)
            v190(l_CloseCentralOverlay_0());
        end
    };
end)(v83);
v83 = l_RoactServices_0.connect({
    analytics = v19, 
    networking = v41
})(v83);
v83 = l_RoactAppPolicy_0.connect(function(v215, _) --[[ Line: 790 ]]
    -- upvalues: l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy)
    return {
        shouldShowShareButton = v215.shouldShowCatalogShareButton(), 
        shouldShareToProvider = v215.shouldShareToAccountProvider(), 
        reportingDisabled = v215.getCatalogReportingDisabled(), 
        webViewSupport = v215.getWebViewSupport(), 
        useLuafiedReportFlow = if not not l_GetFFlagLuafiedReportEntryPoints_0() or l_GetFFlagEnableAbuseReport10ft_0() then v215.getUseLuafiedReportFlow() else nil
    };
end)(v83);
if l_FFlagAXMigrateAXToGlobalAutofocus_0 or not l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then
    v83 = v36(v83);
end;
return (v38((v17((v37(v83))))));