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
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v37.FFlagAXFixPurchaseSurfaceLogging;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v45 = {
    [l_AvatarScreen_0.Catalog] = l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE, 
    [l_AvatarScreen_0.CatalogSearch] = l_ImpressionEnums_0.MarketplaceSurfaceType.SEARCH, 
    [l_AvatarScreen_0.ItemDetails] = l_ImpressionEnums_0.MarketplaceSurfaceType.ITEM_DETAIL, 
    [l_AvatarScreen_0.AvatarEditor] = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
    [l_AvatarScreen_0.MySharedAvatars] = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
    [l_Contexts_0.CommunityProfile] = l_ImpressionEnums_0.MarketplaceSurfaceType.COMMUNITY_PROFILE, 
    [l_Contexts_0.PlayerProfile] = l_ImpressionEnums_0.MarketplaceSurfaceType.USER_PROFILE
};
local v46 = {
    [l_Components_0.CurrentlyWearing] = l_ImpressionEnums_0.RecommendationSurfaceType.CURRENTLY_WEARING
};
local v47 = {
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
local v48 = {};
local v49 = nil;
local function _(v50) --[[ Line: 117 ]] --[[ Name: getCategoryNameById ]]
    -- upvalues: v29 (copy)
    local v51 = nil;
    if v50 then
        v51 = v29.getCategoryNameById(v50);
    end;
    return v51 or "";
end;
local function _(v53, v54) --[[ Line: 125 ]] --[[ Name: getSubcategoryNameById ]]
    -- upvalues: v29 (copy)
    local v55 = nil;
    if v53 and v54 then
        v55 = v29.getSubcategoryNameById(v53, v54);
    end;
    return v55 or "";
end;
local function v60(v57) --[[ Line: 133 ]] --[[ Name: getAXCounterV2Metadata ]]
    -- upvalues: l_UserInputService_0 (copy), l_isSpatial_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), v4 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_isSpatial_0() then
        l_l_UserInputService_0_Platform_0 = "VR";
    end;
    local v59 = {
        AppVersion = l_RunService_0:GetRobloxVersion(), 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
        Platform = l_l_UserInputService_0_Platform_0
    };
    if v57 and next(v57) ~= nil then
        v59 = v4.assign({}, v59, v57);
    end;
    return v59;
end;
v48.get = function(_) --[[ Line: 152 ]] --[[ Name: get ]]
    -- upvalues: v49 (ref), l_AnalyticsService_0 (copy), v29 (copy), v13 (copy), v20 (copy), l_FFlagProfilePlatformEnableStore_0 (copy), v26 (copy), l_ImpressionEnums_0 (copy), v45 (copy), v46 (copy), v47 (copy), v17 (copy), l_FFlagAXMigrateReportAvatarEventCounter_0 (copy), l_reportAvatarEventCounterV1_0 (copy), l_Constants_0 (copy), v31 (copy), v18 (copy), v32 (copy), v60 (copy), l_default_0 (copy), v12 (copy), v10 (copy), v11 (copy), v14 (copy), v15 (copy), v8 (copy), v16 (copy), v9 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), l_RbxAnalyticsService_0 (copy), v19 (copy), v21 (copy)
    if v49 then
        return v49;
    else
        local l_l_AnalyticsService_0_0 = l_AnalyticsService_0;
        local v104 = {
            clickCatalogItem = function(v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75) --[[ Line: 162 ]] --[[ Name: clickCatalogItem ]]
                -- upvalues: v29 (ref), v13 (ref), l_l_AnalyticsService_0_0 (copy)
                local v76 = nil;
                if v65 then
                    v76 = v29.getCategoryNameById(v65);
                end;
                local v77 = v76 or "";
                local v78 = nil;
                if v65 and v66 then
                    v78 = v29.getSubcategoryNameById(v65, v66);
                end;
                v76 = v78 or "";
                v13(l_l_AnalyticsService_0_0.EventStream, v63, v64, v77, v76, v67, v68, v69, v70, v71, v72, v73, v74, v75);
            end, 
            clickCatalogItemFromProfile = function(v79, v80, v81, v82, v83, _) --[[ Line: 197 ]] --[[ Name: clickCatalogItemFromProfile ]]
                -- upvalues: v20 (ref), l_FFlagProfilePlatformEnableStore_0 (ref), v26 (ref), l_ImpressionEnums_0 (ref), v45 (ref), v46 (ref), l_l_AnalyticsService_0_0 (copy), v47 (ref)
                local v85 = {
                    feature = v20.ProfileAnalyticsTag, 
                    itemID = v80, 
                    itemType = v81, 
                    subpage = if l_FFlagProfilePlatformEnableStore_0 then v82 else "peekView", 
                    page = "playerProfile"
                };
                local l_enumMap_0 = v26.defaultItem.enumMap;
                local v87 = if l_enumMap_0 and l_enumMap_0.contentType then l_enumMap_0.contentType[v81] else nil;
                local v88 = {
                    itemId = v80, 
                    actionType = l_ImpressionEnums_0.ActionType.CLICK_ITEM_DETAIL, 
                    contentType = v87, 
                    price = 0, 
                    surface = v45[v79], 
                    recommendationSurface = v46[v82], 
                    absPositions = v83
                };
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(v79, v47.MARKETPLACE_ORGANIC_FE_LOG, v88);
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(v79, v47.ITEM_DETAIL_REFERRAL, v85);
            end, 
            purchaseAsset = function(v89, v90, v91, v92, v93, v94) --[[ Line: 234 ]] --[[ Name: purchaseAsset ]]
                -- upvalues: v17 (ref), l_l_AnalyticsService_0_0 (copy), v47 (ref), l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref)
                v17(l_l_AnalyticsService_0_0.EventStream, v47.PURCHASE_ASSET, v89, v90, v91, v92, v93, v94);
                if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                    l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXPurchaseAsset);
                    return;
                else
                    v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXPurchaseAsset);
                    return;
                end;
            end, 
            purchaseBundle = function(v95, v96, v97, v98, v99) --[[ Line: 255 ]] --[[ Name: purchaseBundle ]]
                -- upvalues: v18 (ref), l_l_AnalyticsService_0_0 (copy), v47 (ref), l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref)
                v18(l_l_AnalyticsService_0_0.EventStream, v47.PURCHASE_BUNDLE, v95, v96, v97, v98, v99);
                if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                    l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXPurchaseBundle);
                    return;
                else
                    v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXPurchaseBundle);
                    return;
                end;
            end, 
            homepageWidgetItemClick = function(v100, v101) --[[ Line: 275 ]] --[[ Name: homepageWidgetItemClick ]]
                -- upvalues: l_ImpressionEnums_0 (ref), l_l_AnalyticsService_0_0 (copy), v47 (ref)
                local v102 = {
                    actionType = l_ImpressionEnums_0.ActionType.UI_BUTTON_CLICK, 
                    group = "HomePageAvatarWidgetClick", 
                    surface = l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE, 
                    item_id = v100, 
                    item_type = v101, 
                    event_sender_api = l_ImpressionEnums_0.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
                };
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("HomeTryOnScreen", v47.MARKETPLACE_ORGANIC_FE_LOG, v102);
            end, 
            sendCounter = function(v103) --[[ Line: 290 ]] --[[ Name: sendCounter ]]
                -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
                if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                    l_reportAvatarEventCounterV1_0(v103);
                    return;
                else
                    v31(l_l_AnalyticsService_0_0, v103);
                    return;
                end;
            end
        };
        v104.sendAXCounter = function(v105, v106, v107) --[[ Line: 300 ]] --[[ Name: sendAXCounter ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), v32 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy), v104 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(v32.Counter.PREFIX .. v105);
            else
                v31(l_l_AnalyticsService_0_0, v32.Counter.PREFIX .. v105);
            end;
            if v106 then
                v104.sendAXCounterV2(v105, v107);
            end;
        end;
        v104.sendAXCounterV2 = function(v108, v109) --[[ Line: 314 ]] --[[ Name: sendAXCounterV2 ]]
            -- upvalues: v20 (ref), v60 (ref), l_default_0 (ref)
            local v110 = {
                eventName = v20.Counter.PREFIX .. v108, 
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
            local v111 = v60(v109);
            l_default_0:logRobloxTelemetryCounter(v110, 1, v111);
        end;
        v104.sendAXStat = function(v112, v113, v114) --[[ Line: 328 ]] --[[ Name: sendAXStat ]]
            -- upvalues: v60 (ref), l_default_0 (ref)
            local v115 = {
                eventName = "AXStat_" .. v112, 
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
            local v116 = v60(v114);
            l_default_0:logRobloxTelemetryStat(v115, v113, v116);
        end;
        v104.clickNavigationTab = function(v117, v118) --[[ Line: 340 ]] --[[ Name: clickNavigationTab ]]
            -- upvalues: v29 (ref), v12 (ref), l_l_AnalyticsService_0_0 (copy)
            local v119 = nil;
            if v117 then
                v119 = v29.getCategoryNameById(v117);
            end;
            local v120 = v119 or "";
            local v121 = nil;
            if v117 and v118 then
                v121 = v29.getSubcategoryNameById(v117, v118);
            end;
            v119 = v121 or "";
            v12(l_l_AnalyticsService_0_0.EventStream, "clickNavigationTab", v120, v119);
        end;
        v104.catalogSearch = function(v122, v123, v124, v125, v126, v127) --[[ Line: 346 ]] --[[ Name: catalogSearch ]]
            -- upvalues: v10 (ref), l_l_AnalyticsService_0_0 (copy)
            v10(l_l_AnalyticsService_0_0.EventStream, v122, v123, v127, v124, v125, v126);
        end;
        v104.clickCustomizeAvatarFromItemDetailPage = function() --[[ Line: 350 ]] --[[ Name: clickCustomizeAvatarFromItemDetailPage ]]
            -- upvalues: v11 (ref), l_l_AnalyticsService_0_0 (copy)
            v11(l_l_AnalyticsService_0_0.EventStream, "clickCustomizeAvatarFromItemDetailPage");
        end;
        v104.closeItemDetailPage = function(v128, v129) --[[ Line: 354 ]] --[[ Name: closeItemDetailPage ]]
            -- upvalues: v14 (ref), l_l_AnalyticsService_0_0 (copy)
            v14(l_l_AnalyticsService_0_0.EventStream, "closeItemDetailPage", v128, v129);
        end;
        v104.expandItemDetailPage = function(v130, v131) --[[ Line: 358 ]] --[[ Name: expandItemDetailPage ]]
            -- upvalues: v15 (ref), l_l_AnalyticsService_0_0 (copy)
            v15(l_l_AnalyticsService_0_0.EventStream, "expandItemDetailPage", v130, v131);
        end;
        v104.avatarToCatalogButton = function() --[[ Line: 362 ]] --[[ Name: avatarToCatalogButton ]]
            -- upvalues: v8 (ref), l_l_AnalyticsService_0_0 (copy)
            v8(l_l_AnalyticsService_0_0.EventStream, "avatarToCatalogButton");
        end;
        v104.moreMenuToCatalogButton = function() --[[ Line: 366 ]] --[[ Name: moreMenuToCatalogButton ]]
            -- upvalues: v16 (ref), l_l_AnalyticsService_0_0 (copy)
            v16(l_l_AnalyticsService_0_0.EventStream, "moreMenuToCatalogButton");
        end;
        v104.catalogOpenedFromLandingPage = function() --[[ Line: 370 ]] --[[ Name: catalogOpenedFromLandingPage ]]
            -- upvalues: v9 (ref), l_l_AnalyticsService_0_0 (copy)
            v9(l_l_AnalyticsService_0_0.EventStream, "catalogOpenedFromLandingPage");
        end;
        v104.clickPurchaseItemButton = function(v132, v133, v134, v135, v136, v137, v138, v139, v140, v141) --[[ Line: 375 ]] --[[ Name: clickPurchaseItemButton ]]
            -- upvalues: v26 (ref), v20 (ref), l_ImpressionEnums_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v45 (ref), l_l_AnalyticsService_0_0 (copy), v47 (ref), l_RbxAnalyticsService_0 (ref)
            local l_enumMap_1 = v26.defaultItem.enumMap;
            local v143 = if l_enumMap_1 and l_enumMap_1.contentType then l_enumMap_1.contentType[v133] else nil;
            local l_AnalyticsTag_0 = v20.AnalyticsTag;
            local v145 = nil;
            local v146 = nil;
            if v134 then
                l_AnalyticsTag_0 = v20.ProfileAnalyticsTag;
                v145 = "playerProfile";
                v146 = "peekView";
            elseif v140 then
                l_AnalyticsTag_0 = v20.ContentFeedAnalyticsTag;
                v145 = "contentFeed";
            end;
            local v147 = {
                feature = l_AnalyticsTag_0, 
                btn = "PriceButton", 
                itemId = v132, 
                actionType = l_ImpressionEnums_0.ActionType.PURCHASE_ATTEMPT, 
                contentType = v143, 
                requestId = v136, 
                subpage = v146, 
                page = v145, 
                keyword = v137, 
                surface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v141 or v45[v135] else v45[v135], 
                sort = v139.sortEnumValue, 
                filterSalesType = v139.filterSalesTypeEnumValue, 
                filterCreators = v139.filterCreatorsTypeEnumValue, 
                filterPrice = v139.filterPriceEnumValue, 
                filterUnavailableItems = v139.filterUnavailableItemsEnumValue, 
                filterCreatorsName = v139.filterCreatorsName, 
                filterPriceMin = v139.filterPriceMin, 
                filterPriceMax = v139.filterPriceMax
            };
            local v148 = {
                feature = l_AnalyticsTag_0, 
                btn = "PriceButton", 
                itemID = v132, 
                itemType = v133, 
                subpage = v146, 
                page = v145, 
                fromScreen = v135
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", v47.MARKETPLACE_ORGANIC_FE_LOG, v147);
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClick", v148);
            if v138 then
                local v149 = {
                    feature = l_AnalyticsTag_0, 
                    btn = "PriceButton", 
                    itemID = v132, 
                    itemType = v133, 
                    subpage = v146, 
                    page = v145, 
                    fromScreen = v135, 
                    refineSessionId = l_RbxAnalyticsService_0:GetSessionId()
                };
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClickHasAccessoryAdjustment", v149);
            end;
        end;
        v104.shownEnableTwoStepAuthOnPurchase = function() --[[ Line: 463 ]] --[[ Name: shownEnableTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownEnableTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownEnableTwoStepAuth);
                return;
            end;
        end;
        v104.shownTwoStepAuthOnPurchase = function() --[[ Line: 476 ]] --[[ Name: shownTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownTwoStepAuth);
                return;
            end;
        end;
        v104.failedShowTwoStepAuthOnPurchase = function() --[[ Line: 489 ]] --[[ Name: failedShowTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseFailedShowTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseFailedShowTwoStepAuth);
                return;
            end;
        end;
        v104.completedTwoStepAuthOnPurchase = function() --[[ Line: 502 ]] --[[ Name: completedTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseCompletedTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseCompletedTwoStepAuth);
                return;
            end;
        end;
        v104.invalidatedTwoStepAuthOnPurchase = function() --[[ Line: 515 ]] --[[ Name: invalidatedTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseInvalidatedTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseInvalidatedTwoStepAuth);
                return;
            end;
        end;
        v104.abandonedTwoStepAuthOnPurchase = function() --[[ Line: 528 ]] --[[ Name: abandonedTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseAbandonedTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseAbandonedTwoStepAuth);
                return;
            end;
        end;
        v104.loadFailedTwoStepAuthOnPurchase = function() --[[ Line: 541 ]] --[[ Name: loadFailedTwoStepAuthOnPurchase ]]
            -- upvalues: l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy)
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseLoadFailedTwoStepAuth);
                return;
            else
                v31(l_l_AnalyticsService_0_0, l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseLoadFailedTwoStepAuth);
                return;
            end;
        end;
        v104.clickCustomizeItemButton = function(v150, v151) --[[ Line: 555 ]] --[[ Name: clickCustomizeItemButton ]]
            -- upvalues: v47 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_0 = v47.BUTTON_CLICK;
            local v153 = {
                feature = v20.AnalyticsTag, 
                itemID = v150, 
                itemType = v151, 
                btn = "Customize", 
                cstm = "Shop"
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", l_BUTTON_CLICK_0, v153);
        end;
        v104.clickFavoriteItemButton = function(v154, v155, v156) --[[ Line: 570 ]] --[[ Name: clickFavoriteItemButton ]]
            -- upvalues: v47 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_1 = v47.BUTTON_CLICK;
            local v158 = {
                feature = v20.AnalyticsTag, 
                itemID = v154, 
                itemType = v155, 
                btn = "Favorite", 
                cstm = "Shop", 
                checked = v156
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", l_BUTTON_CLICK_1, v158);
        end;
        v104.clickShareItemButton = function(v159, v160) --[[ Line: 586 ]] --[[ Name: clickShareItemButton ]]
            -- upvalues: v47 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_2 = v47.BUTTON_CLICK;
            local v162 = {
                feature = v20.AnalyticsTag, 
                itemID = v159, 
                itemType = v160, 
                btn = "Share", 
                cstm = "Shop"
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", l_BUTTON_CLICK_2, v162);
        end;
        v104.applySortAndFilters = function(v163) --[[ Line: 600 ]] --[[ Name: applySortAndFilters ]]
            -- upvalues: v47 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_3 = v47.BUTTON_CLICK;
            local v165 = {
                feature = v20.AnalyticsTag, 
                btn = "Apply", 
                minPrice = v163.minPrice, 
                maxPrice = v163.maxPrice, 
                sortType = v163.sortType, 
                sortAggregation = v163.sortAggregation, 
                salesTypeFilter = v163.salesTypeFilter, 
                creatorFilter = v163.creatorFilter, 
                includeOffSale = v163.includeOffSale
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("SortAndFilters", l_BUTTON_CLICK_3, v165);
        end;
        v104.applyPriceFilter = function(v166, v167) --[[ Line: 619 ]] --[[ Name: applyPriceFilter ]]
            -- upvalues: v47 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_4 = v47.BUTTON_CLICK;
            local v169 = {
                feature = v20.AnalyticsTag, 
                btn = "Apply", 
                PriceLowerBound = v166, 
                PriceUpperBound = v167
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("PriceFilter", l_BUTTON_CLICK_4, v169);
        end;
        v104.navigateToProfile = function(v170) --[[ Line: 632 ]] --[[ Name: navigateToProfile ]]
            -- upvalues: v47 (ref), l_FFlagAXMigrateReportAvatarEventCounter_0 (ref), l_reportAvatarEventCounterV1_0 (ref), v31 (ref), l_l_AnalyticsService_0_0 (copy), v20 (ref)
            local l_BUTTON_CLICK_5 = v47.BUTTON_CLICK;
            if l_FFlagAXMigrateReportAvatarEventCounter_0 then
                l_reportAvatarEventCounterV1_0(v170 .. "LuaProfile");
            else
                v31(l_l_AnalyticsService_0_0, v170 .. "LuaProfile");
            end;
            local v172 = {
                feature = v20.ProfileAnalyticsTag, 
                btn = "creator", 
                subpage = "peekView", 
                page = "playerProfile"
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(v170, l_BUTTON_CLICK_5, v172);
        end;
        v104.selectTopic = function(v173, v174, v175, v176, v177, v178, v179) --[[ Line: 650 ]] --[[ Name: selectTopic ]]
            -- upvalues: v19 (ref), v47 (ref), v29 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_Catalog_0 = v19.AnalyticsContext.Catalog;
            local l_SELECT_CATALOG_TOPIC_0 = v47.SELECT_CATALOG_TOPIC;
            local v182 = nil;
            if v175 then
                v182 = v29.getCategoryNameById(v175);
            end;
            local v183 = v182 or "";
            local v184 = nil;
            if v175 and v176 then
                v184 = v29.getSubcategoryNameById(v175, v176);
            end;
            v182 = v184 or "";
            v184 = {
                topic = v173, 
                allTopics = if v178 then table.concat(v178, ",") else nil, 
                previousSelectedTopics = if v179 then table.concat(v179, ",") else nil, 
                rank = v174, 
                category = v183, 
                subcategory = v182, 
                query = v177
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_Catalog_0, l_SELECT_CATALOG_TOPIC_0, v184);
        end;
        v104.openItemDetails = function(v185, v186, v187, v188) --[[ Line: 678 ]] --[[ Name: openItemDetails ]]
            -- upvalues: v19 (ref), v47 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_AvatarShop_0 = v19.AnalyticsContext.AvatarShop;
            local l_OPEN_ITEM_DETAILS_0 = v47.OPEN_ITEM_DETAILS;
            local v191 = {
                assetId = v185, 
                assetType = v186, 
                price = v187, 
                entryPoint = v188
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_AvatarShop_0, l_OPEN_ITEM_DETAILS_0, v191);
        end;
        v104.openItemDetailsV2 = function(v192, v193, v194, v195, v196, v197, v198, v199, v200) --[[ Line: 691 ]] --[[ Name: openItemDetailsV2 ]]
            -- upvalues: v19 (ref), v26 (ref), l_ImpressionEnums_0 (ref), v45 (ref), l_l_AnalyticsService_0_0 (copy), v47 (ref)
            local l_AvatarShop_1 = v19.AnalyticsContext.AvatarShop;
            local l_enumMap_2 = v26.defaultItem.enumMap;
            local v203 = if l_enumMap_2 and l_enumMap_2.contentType then l_enumMap_2.contentType[v193] else nil;
            local v204 = {
                itemId = v192, 
                actionType = l_ImpressionEnums_0.ActionType.CLICK_ITEM_DETAIL, 
                contentType = v203, 
                price = v194, 
                surface = v45[v195], 
                requestId = v196, 
                absPositions = v200.selectedItemIndex, 
                keyword = v197, 
                category = v198, 
                subcategory = v199, 
                sort = v200.sortEnumValue, 
                filterSalesType = v200.filterSalesTypeEnumValue, 
                filterCreators = v200.filterCreatorsTypeEnumValue, 
                filterPrice = v200.filterPriceEnumValue, 
                filterUnavailableItems = v200.filterUnavailableItemsEnumValue, 
                filterCreatorsName = v200.filterCreatorsName, 
                filterPriceMin = v200.filterPriceMin, 
                filterPriceMax = v200.filterPriceMax
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_AvatarShop_1, v47.MARKETPLACE_ORGANIC_FE_LOG, v204);
        end;
        v104.resizeOutfitScreen = function(v205) --[[ Line: 730 ]] --[[ Name: resizeOutfitScreen ]]
            -- upvalues: v19 (ref), v47 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_AvatarShop_2 = v19.AnalyticsContext.AvatarShop;
            local l_OPEN_OUTFIT_SCREEN_0 = v47.OPEN_OUTFIT_SCREEN;
            local v208 = {
                stateChange = v205
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_AvatarShop_2, l_OPEN_OUTFIT_SCREEN_0, v208);
        end;
        v104.avatarShopBuyItem = function(v209, v210, v211, v212, v213, v214, v215, v216, v217, v218) --[[ Line: 740 ]] --[[ Name: avatarShopBuyItem ]]
            -- upvalues: v19 (ref), v26 (ref), l_l_AnalyticsService_0_0 (copy), v47 (ref), l_ImpressionEnums_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v45 (ref)
            local l_AvatarShop_3 = v19.AnalyticsContext.AvatarShop;
            local l_enumMap_3 = v26.defaultItem.enumMap;
            local v221 = if l_enumMap_3 and l_enumMap_3.contentType then l_enumMap_3.contentType[v210] else nil;
            l_l_AnalyticsService_0_0.EventStream:sendEventImmediately(l_AvatarShop_3, v47.MARKETPLACE_ORGANIC_FE_LOG, {
                itemId = v209, 
                actionType = l_ImpressionEnums_0.ActionType.PURCHASE_SUCCESS, 
                contentType = v221, 
                price = v211, 
                surface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v218 or v45[v212] else v45[v212], 
                requestId = v213, 
                absPositions = v217.selectedItemIndex, 
                sort = v217.sortEnumValue, 
                filterSalesType = v217.filterSalesTypeEnumValue, 
                filterCreators = v217.filterCreatorsTypeEnumValue, 
                filterPrice = v217.filterPriceEnumValue, 
                filterUnavailableItems = v217.filterUnavailableItemsEnumValue, 
                filterCreatorsName = v217.filterCreatorsName, 
                filterPriceMin = v217.filterPriceMin, 
                filterPriceMax = v217.filterPriceMax, 
                keyword = v214, 
                category = v215, 
                subcategory = v216
            });
        end;
        v104.widgetInteraction = function(v222, v223, v224, v225, v226, v227, v228) --[[ Line: 781 ]] --[[ Name: widgetInteraction ]]
            -- upvalues: v47 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_WIDGET_API_FE_LOG_0 = v47.WIDGET_API_FE_LOG;
            local v230 = {
                request_id = v222, 
                action_type = v223, 
                item_position = v224, 
                widget_position = v225, 
                item_id = v226, 
                item_type = v227, 
                widget_id = v228
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("catalog", l_WIDGET_API_FE_LOG_0, v230);
        end;
        v104.widgetInteractionV2 = function(v231, v232) --[[ Line: 806 ]] --[[ Name: widgetInteractionV2 ]]
            -- upvalues: v47 (ref), v21 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_WIDGET_API_FE_LOG_1 = v47.WIDGET_API_FE_LOG;
            local v234 = v232 == v21.ActionType.PURCHASE_SUCCESS;
            local v235 = {
                action_type = v232, 
                request_id = v231.requestId, 
                item_position = v231.itemPosition, 
                widget_position = v231.widgetPosition, 
                item_id = v231.itemId, 
                item_type = v231.itemType, 
                widget_id = v231.widgetId, 
                widget_type = v231.widgetType, 
                widget_abs_position = v231.widgetAbsPosition, 
                widget_item_ids = if v231.widgetItemIds then table.concat(v231.widgetItemIds, ",") else nil, 
                kwd = v231.query, 
                organic_result_ids = if v231.organicResultIds then table.concat(v231.organicResultIds, ",") else nil, 
                time_spent_sec = v231.timeSpentSec, 
                asset_ids = if v231.assetIds then table.concat(v231.assetIds, ",") else nil, 
                bundle_ids = if v231.bundleIds then table.concat(v231.bundleIds, ",") else nil, 
                total_robux = v231.totalRobux, 
                ui_treatment_type = v231.uiTreatmentType
            };
            if v234 then
                l_l_AnalyticsService_0_0.EventStream:sendEventImmediately("catalog", l_WIDGET_API_FE_LOG_1, v235);
                return;
            else
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("catalog", l_WIDGET_API_FE_LOG_1, v235);
                return;
            end;
        end;
        v49 = v104;
        return v104;
    end;
end;
return v48;