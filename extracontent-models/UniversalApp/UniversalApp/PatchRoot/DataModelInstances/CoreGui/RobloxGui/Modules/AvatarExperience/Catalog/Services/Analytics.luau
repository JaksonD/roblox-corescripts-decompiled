local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v4 = require(l_CorePackages_0.Packages.Dash);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.avatarToCatalogButton);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.catalogOpenedFromLandingPage);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.catalogSearch);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.clickCustomizeAvatarFromItemDetailPage);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.clickNavigationTab);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.clickCatalogItem);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.closeItemDetailPage);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.expandItemDetailPage);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.moreMenuToCatalogButton);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.purchaseAsset);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Analytics.purchaseBundle);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local l_UserInputService_0 = game:GetService("UserInputService");
local v29 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_AnalyticsService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService;
local v31 = require(l_Modules_0.AvatarExperience.Common.Analytics.reportAvatarEventCounter);
local v32 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v34 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_Constants_0 = v34.Constants;
local v36 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v37 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_reportAvatarEventCounterV1_0 = v34.reportAvatarEventCounterV1;
local l_Contexts_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_Components_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform).Components;
local l_FFlagProfilePlatformEnableStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableStore;
local l_FFlagAXMigrateReportAvatarEventCounter_0 = v36.FFlagAXMigrateReportAvatarEventCounter;
local l_FFlagAXAddLookTypeEnumForLogging_0 = v36.FFlagAXAddLookTypeEnumForLogging;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v37.FFlagAXFixPurchaseSurfaceLogging;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v46 = {
    [l_AvatarScreen_0.Catalog] = l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE, 
    [l_AvatarScreen_0.CatalogSearch] = l_ImpressionEnums_0.MarketplaceSurfaceType.SEARCH, 
    [l_AvatarScreen_0.ItemDetails] = l_ImpressionEnums_0.MarketplaceSurfaceType.ITEM_DETAIL, 
    [l_AvatarScreen_0.AvatarEditor] = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
    [l_AvatarScreen_0.MySharedAvatars] = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
    [l_Contexts_0.CommunityProfile] = l_ImpressionEnums_0.MarketplaceSurfaceType.COMMUNITY_PROFILE, 
    [l_Contexts_0.PlayerProfile] = l_ImpressionEnums_0.MarketplaceSurfaceType.USER_PROFILE
};
local v47 = {
    [l_Components_0.CurrentlyWearing] = l_ImpressionEnums_0.RecommendationSurfaceType.CURRENTLY_WEARING
};
local v48 = {
    ITEM_DETAIL_REFERRAL = "itemDetailReferral", 
    PURCHASE_ASSET = "purchaseAsset", 
    PURCHASE_BUNDLE = "purchaseBundle", 
    TRY_ON_AVATAR_ITEM = "tryOnAvatarItem", 
    BUTTON_CLICK = "buttonClick", 
    CATALOG_IMPRESSIONS = "catalogImpressions", 
    SELECT_CATALOG_TOPIC = "selectCatalogTopic", 
    DESELECT_CATALOG_TOPIC = "deselectCatalogTopic", 
    CLEAR_ALL_TOPICS = "clearAllTopics", 
    CHARACTER_BUNDLE_SWAP_ACTION = "characterBundleSwapAction", 
    OPEN_ITEM_DETAILS = "openItemDetails", 
    OPEN_OUTFIT_SCREEN = "openOutfitScreen", 
    AVATAR_SHOP_EQUIP = "avatarShopEquip", 
    AVATAR_SHOP_UNEQUIP = "avatarShopUnequip", 
    AVATAR_SHOP_BUY_ITEM = "avatarShopBuyItem", 
    AVATAR_SHOP_BUY_OUTFIT = "avatarShopBuyOutfit", 
    AVATAR_SHOP_LEAVE = "avatarShopLeave", 
    WIDGET_API_FE_LOG = "widgetApiFELog", 
    LEGACY_WIDGET_API_FE_LOG = "legacyWidgetApiFELog", 
    MARKETPLACE_ORGANIC_FE_LOG = "marketplaceOrganicFELog", 
    CONFIRM_DELETE_AVATAR = "confirmDeleteAvatar", 
    CONFIRM_SHARE_COMMUNITY_AVATAR = "confirmShareCommunityAvatar"
};
local v49 = {};
local v50 = nil;
local function _(v51) --[[ Line: 118 ]] --[[ Name: getCategoryNameById ]]
    -- upvalues: v29 (copy)
    local v52 = nil;
    if v51 then
        v52 = v29.getCategoryNameById(v51);
    end;
    return v52 or "";
end;
local function _(v54, v55) --[[ Line: 126 ]] --[[ Name: getSubcategoryNameById ]]
    -- upvalues: v29 (copy)
    local v56 = nil;
    if v54 and v55 then
        v56 = v29.getSubcategoryNameById(v54, v55);
    end;
    return v56 or "";
end;
local function v61(v58) --[[ Line: 134 ]] --[[ Name: getAXCounterV2Metadata ]]
    -- upvalues: l_UserInputService_0 (copy), l_isSpatial_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), v4 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_isSpatial_0() then
        l_l_UserInputService_0_Platform_0 = "VR";
    end;
    local v60 = {
        AppVersion = l_RunService_0:GetRobloxVersion(), 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
        Platform = l_l_UserInputService_0_Platform_0
    };
    if v58 and next(v58) ~= nil then
        v60 = v4.assign({}, v60, v58);
    end;
    return v60;
end;
v49.get = function(_) --[[ Line: 153 ]] --[[ Name: get ]]
    -- upvalues: v50 (ref), l_AnalyticsService_0 (copy), v29 (copy), v13 (copy), v20 (copy), l_FFlagProfilePlatformEnableStore_0 (copy), v26 (copy), l_ImpressionEnums_0 (copy), v46 (copy), v47 (copy), v48 (copy), v17 (copy), l_FFlagAXMigrateReportAvatarEventCounter_0 (copy), l_reportAvatarEventCounterV1_0 (copy), l_Constants_0 (copy), v31 (copy), v18 (copy), v32 (copy), v61 (copy), l_default_0 (copy), v12 (copy), v10 (copy), v11 (copy), v14 (copy), v15 (copy), v8 (copy), v16 (copy), v9 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), l_RbxAnalyticsService_0 (copy), v19 (copy), v21 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy)
    if v50 then
        return v50;
    else
        local l_l_AnalyticsService_0_0 = l_AnalyticsService_0;
        local v105 = {
            clickCatalogItem = function(v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76) --[[ Line: 163 ]] --[[ Name: clickCatalogItem ]]
                -- upvalues: v29 (ref), v13 (ref), l_l_AnalyticsService_0_0 (copy)
                local v77 = nil;
                if v66 then
                    v77 = v29.getCategoryNameById(v66);
                end;
                local v78 = v77 or "";
                local v79 = nil;
                if v66 and v67 then
                    v79 = v29.getSubcategoryNameById(v66, v67);
                end;
                v77 = v79 or "";
                v13(l_l_AnalyticsService_0_0.EventStream, v64, v65, v78, v77, v68, v69, v70, v71, v72, v73, v74, v75, v76);
            end, 
            clickCatalogItemFromProfile = function(v80, v81, v82, v83, v84, _) --[[ Line: 198 ]] --[[ Name: clickCatalogItemFromProfile ]]
                -- upvalues: v20 (ref), l_FFlagProfilePlatformEnableStore_0 (ref), v26 (ref), l_ImpressionEnums_0 (ref), v46 (ref), v47 (ref), l_l_AnalyticsService_0_0 (copy), v48 (ref)
                local v86 = {
                    feature = v20.ProfileAnalyticsTag, 
                    itemID = v81, 
                    itemType = v82, 
                    subpage = if l_FFlagProfilePlatformEnableStore_0 then v83 else "peekView", 
                    page = "playerProfile"
                };
                local l_enumMap_0 = v26.defaultItem.enumMap;
                local v88 = if l_enumMap_0 and l_enumMap_0.contentType then l_enumMap_0.contentType[v82] else nil;
                local v89 = {
                    itemId = v81, 
                    actionType = l_ImpressionEnums_0.ActionType.CLICK_ITEM_DETAIL, 
                    contentType = v88, 
                    price = 0, 
                    surface = v46[v80], 
                    recommendationSurface = v47[v83], 
                    absPositions = v84
                };
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(v80, v48.MARKETPLACE_ORGANIC_FE_LOG, v89);
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(v80, v48.ITEM_DETAIL_REFERRAL, v86);
            end, 
            purchaseAsset = function(v90, v91, v92, v93, v94, v95) --[[ Line: 235 ]] --[[ Name: purchaseAsset ]]
                -- upvalues: v17 (ref), l_l_AnalyticsService_0_0 (copy), v48 (ref), l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref)
                v17(l_l_AnalyticsService_0_0.EventStream, v48.PURCHASE_ASSET, v90, v91, v92, v93, v94, v95);
                if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                    l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXPurchaseAsset);
                    return;
                else
                    v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXPurchaseAsset);
                    return;
                end;
            end, 
            purchaseBundle = function(v96, v97, v98, v99, v100) --[[ Line: 256 ]] --[[ Name: purchaseBundle ]]
                -- upvalues: v18 (ref), l_l_AnalyticsService_0_0 (copy), v48 (ref), l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref)
                v18(l_l_AnalyticsService_0_0.EventStream, v48.PURCHASE_BUNDLE, v96, v97, v98, v99, v100);
                if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                    l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXPurchaseBundle);
                    return;
                else
                    v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXPurchaseBundle);
                    return;
                end;
            end, 
            homepageWidgetItemClick = function(v101, v102) --[[ Line: 276 ]] --[[ Name: homepageWidgetItemClick ]]
                -- upvalues: l_ImpressionEnums_0 (ref), l_l_AnalyticsService_0_0 (copy), v48 (ref)
                local v103 = {
                    actionType = l_ImpressionEnums_0.ActionType.UI_BUTTON_CLICK, 
                    group = "HomePageAvatarWidgetClick", 
                    surface = l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE, 
                    item_id = v101, 
                    item_type = v102, 
                    event_sender_api = l_ImpressionEnums_0.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
                };
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("HomeTryOnScreen", v48.MARKETPLACE_ORGANIC_FE_LOG, v103);
            end, 
            sendCounter = function(v104) --[[ Line: 291 ]] --[[ Name: sendCounter ]]
                -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
                if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                    l_reportAvatarEventCounterV1_0(v104);
                    return;
                else
                    v31(l_l_AnalyticsService_0_0, v104);
                    return;
                end;
            end
        };
        v105.sendAXCounter = function(v106, v107, v108) --[[ Line: 301 ]] --[[ Name: sendAXCounter ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), v32 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy), v105 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(v32.Counter.PREFIX .. v106);
            else
                v31(l_l_AnalyticsService_0_0, v32.Counter.PREFIX .. v106);
            end;
            if v107 then
                v105.sendAXCounterV2(v106, v108);
            end;
        end;
        v105.sendAXCounterV2 = function(v109, v110) --[[ Line: 315 ]] --[[ Name: sendAXCounterV2 ]]
            -- upvalues: v20 (ref), v61 (ref), l_default_0 (ref)
            local v111 = {
                eventName = v20.Counter.PREFIX .. v109, 
                backends = {
                    "RobloxTelemetryCounter"
                }, 
                lastUpdated = {
                    2024, 
                    4, 
                    30
                }, 
                description = "Counter to track various Avatar Experience events.", 
                links = "https://roblox.atlassian.net/wiki/spaces/AMSD/pages/2800779286/Tech+Spec+-+Q3+Grafana+Dashboard+Improvements"
            };
            local v112 = v61(v110);
            l_default_0:logRobloxTelemetryCounter(v111, 1, v112);
        end;
        v105.sendAXStat = function(v113, v114, v115) --[[ Line: 329 ]] --[[ Name: sendAXStat ]]
            -- upvalues: v61 (ref), l_default_0 (ref)
            local v116 = {
                eventName = "AXStat_" .. v113, 
                backends = {
                    "RobloxTelemetryStat"
                }, 
                lastUpdated = {
                    2024, 
                    4, 
                    30
                }, 
                description = "Stat to track various Avatar Experience events.", 
                links = "https://roblox.atlassian.net/wiki/spaces/AMSD/pages/2800779286/Tech+Spec+-+Q3+Grafana+Dashboard+Improvements"
            };
            local v117 = v61(v115);
            l_default_0:logRobloxTelemetryStat(v116, v114, v117);
        end;
        v105.clickNavigationTab = function(v118, v119) --[[ Line: 341 ]] --[[ Name: clickNavigationTab ]]
            -- upvalues: v29 (ref), v12 (ref), l_l_AnalyticsService_0_0 (copy)
            local v120 = nil;
            if v118 then
                v120 = v29.getCategoryNameById(v118);
            end;
            local v121 = v120 or "";
            local v122 = nil;
            if v118 and v119 then
                v122 = v29.getSubcategoryNameById(v118, v119);
            end;
            v120 = v122 or "";
            v12(l_l_AnalyticsService_0_0.EventStream, "clickNavigationTab", v121, v120);
        end;
        v105.catalogSearch = function(v123, v124, v125, v126, v127, v128) --[[ Line: 347 ]] --[[ Name: catalogSearch ]]
            -- upvalues: v10 (ref), l_l_AnalyticsService_0_0 (copy)
            v10(l_l_AnalyticsService_0_0.EventStream, v123, v124, v128, v125, v126, v127);
        end;
        v105.clickCustomizeAvatarFromItemDetailPage = function() --[[ Line: 351 ]] --[[ Name: clickCustomizeAvatarFromItemDetailPage ]]
            -- upvalues: v11 (ref), l_l_AnalyticsService_0_0 (copy)
            v11(l_l_AnalyticsService_0_0.EventStream, "clickCustomizeAvatarFromItemDetailPage");
        end;
        v105.closeItemDetailPage = function(v129, v130) --[[ Line: 355 ]] --[[ Name: closeItemDetailPage ]]
            -- upvalues: v14 (ref), l_l_AnalyticsService_0_0 (copy)
            v14(l_l_AnalyticsService_0_0.EventStream, "closeItemDetailPage", v129, v130);
        end;
        v105.expandItemDetailPage = function(v131, v132) --[[ Line: 359 ]] --[[ Name: expandItemDetailPage ]]
            -- upvalues: v15 (ref), l_l_AnalyticsService_0_0 (copy)
            v15(l_l_AnalyticsService_0_0.EventStream, "expandItemDetailPage", v131, v132);
        end;
        v105.avatarToCatalogButton = function() --[[ Line: 363 ]] --[[ Name: avatarToCatalogButton ]]
            -- upvalues: v8 (ref), l_l_AnalyticsService_0_0 (copy)
            v8(l_l_AnalyticsService_0_0.EventStream, "avatarToCatalogButton");
        end;
        v105.moreMenuToCatalogButton = function() --[[ Line: 367 ]] --[[ Name: moreMenuToCatalogButton ]]
            -- upvalues: v16 (ref), l_l_AnalyticsService_0_0 (copy)
            v16(l_l_AnalyticsService_0_0.EventStream, "moreMenuToCatalogButton");
        end;
        v105.catalogOpenedFromLandingPage = function() --[[ Line: 371 ]] --[[ Name: catalogOpenedFromLandingPage ]]
            -- upvalues: v9 (ref), l_l_AnalyticsService_0_0 (copy)
            v9(l_l_AnalyticsService_0_0.EventStream, "catalogOpenedFromLandingPage");
        end;
        v105.clickPurchaseItemButton = function(v133, v134, v135, v136, v137, v138, v139, v140, v141, v142) --[[ Line: 376 ]] --[[ Name: clickPurchaseItemButton ]]
            -- upvalues: v26 (ref), v20 (ref), l_ImpressionEnums_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v46 (ref), l_l_AnalyticsService_0_0 (copy), v48 (ref), l_RbxAnalyticsService_0 (ref)
            local l_enumMap_1 = v26.defaultItem.enumMap;
            local v144 = if l_enumMap_1 and l_enumMap_1.contentType then l_enumMap_1.contentType[v134] else nil;
            local l_AnalyticsTag_0 = v20.AnalyticsTag;
            local v146 = nil;
            local v147 = nil;
            if v135 then
                l_AnalyticsTag_0 = v20.ProfileAnalyticsTag;
                v146 = "playerProfile";
                v147 = "peekView";
            elseif v141 then
                l_AnalyticsTag_0 = v20.ContentFeedAnalyticsTag;
                v146 = "contentFeed";
            end;
            local v148 = {
                feature = l_AnalyticsTag_0, 
                btn = "PriceButton", 
                itemId = v133, 
                actionType = l_ImpressionEnums_0.ActionType.PURCHASE_ATTEMPT, 
                contentType = v144, 
                requestId = v137, 
                subpage = v147, 
                page = v146, 
                keyword = v138, 
                surface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v142 or v46[v136] else v46[v136], 
                sort = v140.sortEnumValue, 
                filterSalesType = v140.filterSalesTypeEnumValue, 
                filterCreators = v140.filterCreatorsTypeEnumValue, 
                filterPrice = v140.filterPriceEnumValue, 
                filterUnavailableItems = v140.filterUnavailableItemsEnumValue, 
                filterCreatorsName = v140.filterCreatorsName, 
                filterPriceMin = v140.filterPriceMin, 
                filterPriceMax = v140.filterPriceMax
            };
            local v149 = {
                feature = l_AnalyticsTag_0, 
                btn = "PriceButton", 
                itemID = v133, 
                itemType = v134, 
                subpage = v147, 
                page = v146, 
                fromScreen = v136
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", v48.MARKETPLACE_ORGANIC_FE_LOG, v148);
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClick", v149);
            if v139 then
                local v150 = {
                    feature = l_AnalyticsTag_0, 
                    btn = "PriceButton", 
                    itemID = v133, 
                    itemType = v134, 
                    subpage = v147, 
                    page = v146, 
                    fromScreen = v136, 
                    refineSessionId = l_RbxAnalyticsService_0:GetSessionId()
                };
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClickHasAccessoryAdjustment", v150);
            end;
        end;
        v105.shownEnableTwoStepAuthOnPurchase = function() --[[ Line: 464 ]] --[[ Name: shownEnableTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownEnableTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownEnableTwoStepAuth);
                return;
            end;
        end;
        v105.shownTwoStepAuthOnPurchase = function() --[[ Line: 477 ]] --[[ Name: shownTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownTwoStepAuth);
                return;
            end;
        end;
        v105.failedShowTwoStepAuthOnPurchase = function() --[[ Line: 490 ]] --[[ Name: failedShowTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseFailedShowTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseFailedShowTwoStepAuth);
                return;
            end;
        end;
        v105.completedTwoStepAuthOnPurchase = function() --[[ Line: 503 ]] --[[ Name: completedTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseCompletedTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseCompletedTwoStepAuth);
                return;
            end;
        end;
        v105.invalidatedTwoStepAuthOnPurchase = function() --[[ Line: 516 ]] --[[ Name: invalidatedTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseInvalidatedTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseInvalidatedTwoStepAuth);
                return;
            end;
        end;
        v105.abandonedTwoStepAuthOnPurchase = function() --[[ Line: 529 ]] --[[ Name: abandonedTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseAbandonedTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseAbandonedTwoStepAuth);
                return;
            end;
        end;
        v105.loadFailedTwoStepAuthOnPurchase = function() --[[ Line: 542 ]] --[[ Name: loadFailedTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseLoadFailedTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseLoadFailedTwoStepAuth);
                return;
            end;
        end;
        v105.clickCustomizeItemButton = function(v151, v152) --[[ Line: 556 ]] --[[ Name: clickCustomizeItemButton ]]
            -- upvalues: v48 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_0 = v48.BUTTON_CLICK;
            local v154 = {
                feature = v20.AnalyticsTag, 
                itemID = v151, 
                itemType = v152, 
                btn = "Customize", 
                cstm = "Shop"
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", l_BUTTON_CLICK_0, v154);
        end;
        v105.clickFavoriteItemButton = function(v155, v156, v157) --[[ Line: 571 ]] --[[ Name: clickFavoriteItemButton ]]
            -- upvalues: v48 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_1 = v48.BUTTON_CLICK;
            local v159 = {
                feature = v20.AnalyticsTag, 
                itemID = v155, 
                itemType = v156, 
                btn = "Favorite", 
                cstm = "Shop", 
                checked = v157
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", l_BUTTON_CLICK_1, v159);
        end;
        v105.clickShareItemButton = function(v160, v161) --[[ Line: 587 ]] --[[ Name: clickShareItemButton ]]
            -- upvalues: v48 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_2 = v48.BUTTON_CLICK;
            local v163 = {
                feature = v20.AnalyticsTag, 
                itemID = v160, 
                itemType = v161, 
                btn = "Share", 
                cstm = "Shop"
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", l_BUTTON_CLICK_2, v163);
        end;
        v105.applySortAndFilters = function(v164) --[[ Line: 601 ]] --[[ Name: applySortAndFilters ]]
            -- upvalues: v48 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_3 = v48.BUTTON_CLICK;
            local v166 = {
                feature = v20.AnalyticsTag, 
                btn = "Apply", 
                minPrice = v164.minPrice, 
                maxPrice = v164.maxPrice, 
                sortType = v164.sortType, 
                sortAggregation = v164.sortAggregation, 
                salesTypeFilter = v164.salesTypeFilter, 
                creatorFilter = v164.creatorFilter, 
                includeOffSale = v164.includeOffSale
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("SortAndFilters", l_BUTTON_CLICK_3, v166);
        end;
        v105.applyPriceFilter = function(v167, v168) --[[ Line: 620 ]] --[[ Name: applyPriceFilter ]]
            -- upvalues: v48 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_4 = v48.BUTTON_CLICK;
            local v170 = {
                feature = v20.AnalyticsTag, 
                btn = "Apply", 
                PriceLowerBound = v167, 
                PriceUpperBound = v168
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("PriceFilter", l_BUTTON_CLICK_4, v170);
        end;
        v105.navigateToProfile = function(v171) --[[ Line: 633 ]] --[[ Name: navigateToProfile ]]
            -- upvalues: v48 (ref), l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy), v20 (ref)
            local l_BUTTON_CLICK_5 = v48.BUTTON_CLICK;
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(v171 .. "LuaProfile");
            else
                v31(l_l_AnalyticsService_0_0, v171 .. "LuaProfile");
            end;
            local v173 = {
                feature = v20.ProfileAnalyticsTag, 
                btn = "creator", 
                subpage = "peekView", 
                page = "playerProfile"
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(v171, l_BUTTON_CLICK_5, v173);
        end;
        v105.selectTopic = function(v174, v175, v176, v177, v178, v179, v180) --[[ Line: 651 ]] --[[ Name: selectTopic ]]
            -- upvalues: v19 (ref), v48 (ref), v29 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_Catalog_0 = v19.AnalyticsContext.Catalog;
            local l_SELECT_CATALOG_TOPIC_0 = v48.SELECT_CATALOG_TOPIC;
            local v183 = nil;
            if v176 then
                v183 = v29.getCategoryNameById(v176);
            end;
            local v184 = v183 or "";
            local v185 = nil;
            if v176 and v177 then
                v185 = v29.getSubcategoryNameById(v176, v177);
            end;
            v183 = v185 or "";
            v185 = {
                topic = v174, 
                allTopics = if v179 then table.concat(v179, ",") else nil, 
                previousSelectedTopics = if v180 then table.concat(v180, ",") else nil, 
                rank = v175, 
                category = v184, 
                subcategory = v183, 
                query = v178
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_Catalog_0, l_SELECT_CATALOG_TOPIC_0, v185);
        end;
        v105.openItemDetails = function(v186, v187, v188, v189) --[[ Line: 679 ]] --[[ Name: openItemDetails ]]
            -- upvalues: v19 (ref), v48 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_AvatarShop_0 = v19.AnalyticsContext.AvatarShop;
            local l_OPEN_ITEM_DETAILS_0 = v48.OPEN_ITEM_DETAILS;
            local v192 = {
                assetId = v186, 
                assetType = v187, 
                price = v188, 
                entryPoint = v189
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_AvatarShop_0, l_OPEN_ITEM_DETAILS_0, v192);
        end;
        v105.openItemDetailsV2 = function(v193, v194, v195, v196, v197, v198, v199, v200, v201) --[[ Line: 692 ]] --[[ Name: openItemDetailsV2 ]]
            -- upvalues: v19 (ref), v26 (ref), l_ImpressionEnums_0 (ref), v46 (ref), l_l_AnalyticsService_0_0 (copy), v48 (ref)
            local l_AvatarShop_1 = v19.AnalyticsContext.AvatarShop;
            local l_enumMap_2 = v26.defaultItem.enumMap;
            local v204 = if l_enumMap_2 and l_enumMap_2.contentType then l_enumMap_2.contentType[v194] else nil;
            local v205 = {
                itemId = v193, 
                actionType = l_ImpressionEnums_0.ActionType.CLICK_ITEM_DETAIL, 
                contentType = v204, 
                price = v195, 
                surface = v46[v196], 
                requestId = v197, 
                absPositions = v201.selectedItemIndex, 
                keyword = v198, 
                category = v199, 
                subcategory = v200, 
                sort = v201.sortEnumValue, 
                filterSalesType = v201.filterSalesTypeEnumValue, 
                filterCreators = v201.filterCreatorsTypeEnumValue, 
                filterPrice = v201.filterPriceEnumValue, 
                filterUnavailableItems = v201.filterUnavailableItemsEnumValue, 
                filterCreatorsName = v201.filterCreatorsName, 
                filterPriceMin = v201.filterPriceMin, 
                filterPriceMax = v201.filterPriceMax
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_AvatarShop_1, v48.MARKETPLACE_ORGANIC_FE_LOG, v205);
        end;
        v105.resizeOutfitScreen = function(v206) --[[ Line: 731 ]] --[[ Name: resizeOutfitScreen ]]
            -- upvalues: v19 (ref), v48 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_AvatarShop_2 = v19.AnalyticsContext.AvatarShop;
            local l_OPEN_OUTFIT_SCREEN_0 = v48.OPEN_OUTFIT_SCREEN;
            local v209 = {
                stateChange = v206
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_AvatarShop_2, l_OPEN_OUTFIT_SCREEN_0, v209);
        end;
        v105.avatarShopBuyItem = function(v210, v211, v212, v213, v214, v215, v216, v217, v218, v219) --[[ Line: 741 ]] --[[ Name: avatarShopBuyItem ]]
            -- upvalues: v19 (ref), v26 (ref), l_l_AnalyticsService_0_0 (copy), v48 (ref), l_ImpressionEnums_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v46 (ref)
            local l_AvatarShop_3 = v19.AnalyticsContext.AvatarShop;
            local l_enumMap_3 = v26.defaultItem.enumMap;
            local v222 = if l_enumMap_3 and l_enumMap_3.contentType then l_enumMap_3.contentType[v211] else nil;
            l_l_AnalyticsService_0_0.EventStream:sendEventImmediately(l_AvatarShop_3, v48.MARKETPLACE_ORGANIC_FE_LOG, {
                itemId = v210, 
                actionType = l_ImpressionEnums_0.ActionType.PURCHASE_SUCCESS, 
                contentType = v222, 
                price = v212, 
                surface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v219 or v46[v213] else v46[v213], 
                requestId = v214, 
                absPositions = v218.selectedItemIndex, 
                sort = v218.sortEnumValue, 
                filterSalesType = v218.filterSalesTypeEnumValue, 
                filterCreators = v218.filterCreatorsTypeEnumValue, 
                filterPrice = v218.filterPriceEnumValue, 
                filterUnavailableItems = v218.filterUnavailableItemsEnumValue, 
                filterCreatorsName = v218.filterCreatorsName, 
                filterPriceMin = v218.filterPriceMin, 
                filterPriceMax = v218.filterPriceMax, 
                keyword = v215, 
                category = v216, 
                subcategory = v217
            });
        end;
        v105.widgetInteraction = function(v223, v224, v225, v226, v227, v228, v229) --[[ Line: 782 ]] --[[ Name: widgetInteraction ]]
            -- upvalues: v48 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_WIDGET_API_FE_LOG_0 = v48.WIDGET_API_FE_LOG;
            local v231 = {
                request_id = v223, 
                action_type = v224, 
                item_position = v225, 
                widget_position = v226, 
                item_id = v227, 
                item_type = v228, 
                widget_id = v229
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("catalog", l_WIDGET_API_FE_LOG_0, v231);
        end;
        v105.widgetInteractionV2 = function(v232, v233) --[[ Line: 807 ]] --[[ Name: widgetInteractionV2 ]]
            -- upvalues: v48 (ref), v21 (ref), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_WIDGET_API_FE_LOG_1 = v48.WIDGET_API_FE_LOG;
            local v235 = v233 == v21.ActionType.PURCHASE_SUCCESS;
            local v236 = {
                Outfit = "1", 
                Avatar = "2", 
                Makeup = "3"
            };
            local v237 = {
                action_type = v233, 
                request_id = v232.requestId, 
                item_position = v232.itemPosition, 
                widget_position = v232.widgetPosition, 
                item_id = v232.itemId, 
                item_type = v232.itemType, 
                look_type = if l_FFlagAXAddLookTypeEnumForLogging_0 and v232.lookType then v236[v232.lookType] else nil, 
                widget_id = v232.widgetId, 
                widget_type = v232.widgetType, 
                widget_abs_position = v232.widgetAbsPosition, 
                widget_item_ids = if v232.widgetItemIds then table.concat(v232.widgetItemIds, ",") else nil, 
                kwd = v232.query, 
                organic_result_ids = if v232.organicResultIds then table.concat(v232.organicResultIds, ",") else nil, 
                time_spent_sec = v232.timeSpentSec, 
                asset_ids = if v232.assetIds then table.concat(v232.assetIds, ",") else nil, 
                bundle_ids = if v232.bundleIds then table.concat(v232.bundleIds, ",") else nil, 
                total_robux = v232.totalRobux, 
                ui_treatment_type = v232.uiTreatmentType
            };
            if v235 then
                l_l_AnalyticsService_0_0.EventStream:sendEventImmediately("catalog", l_WIDGET_API_FE_LOG_1, v237);
                return;
            else
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("catalog", l_WIDGET_API_FE_LOG_1, v237);
                return;
            end;
        end;
        v50 = v105;
        return v105;
    end;
end;
return v49;