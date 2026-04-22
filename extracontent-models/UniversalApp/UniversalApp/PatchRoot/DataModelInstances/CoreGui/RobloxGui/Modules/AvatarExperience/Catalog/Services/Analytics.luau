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
local l_WidgetConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants;
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortType);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SortAggregation);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_OrganicEventImpressionsSchema_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema;
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local l_UserInputService_0 = game:GetService("UserInputService");
local v29 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_AnalyticsService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService;
local v31 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v33 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_Constants_0 = v33.Constants;
local v35 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v36 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_reportAvatarEventCounterV1_0 = v33.reportAvatarEventCounterV1;
local l_Contexts_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_Components_0 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform.Enums).Components;
local l_FFlagProfilePlatformEnableStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableStore;
local l_FFlagAXAddLookTypeEnumForLogging_0 = v35.FFlagAXAddLookTypeEnumForLogging;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v36.FFlagAXFixPurchaseSurfaceLogging;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v44 = {
    [l_AvatarScreen_0.Catalog] = l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE, 
    [l_AvatarScreen_0.CatalogSearch] = l_ImpressionEnums_0.MarketplaceSurfaceType.SEARCH, 
    [l_AvatarScreen_0.ItemDetails] = l_ImpressionEnums_0.MarketplaceSurfaceType.ITEM_DETAIL, 
    [l_AvatarScreen_0.AvatarEditor] = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
    [l_AvatarScreen_0.MySharedAvatars] = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
    [l_Contexts_0.CommunityProfile] = l_ImpressionEnums_0.MarketplaceSurfaceType.COMMUNITY_PROFILE, 
    [l_Contexts_0.PlayerProfile] = l_ImpressionEnums_0.MarketplaceSurfaceType.USER_PROFILE
};
local v45 = {
    [l_Components_0.CurrentlyWearing] = l_ImpressionEnums_0.RecommendationSurfaceType.CURRENTLY_WEARING
};
local v46 = {
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
local v47 = {};
local v48 = nil;
local function _(v49) --[[ Line: 117 ]] --[[ Name: getCategoryNameById ]]
    -- upvalues: v29 (copy)
    local v50 = nil;
    if v49 then
        v50 = v29.getCategoryNameById(v49);
    end;
    return v50 or "";
end;
local function _(v52, v53) --[[ Line: 125 ]] --[[ Name: getSubcategoryNameById ]]
    -- upvalues: v29 (copy)
    local v54 = nil;
    if v52 and v53 then
        v54 = v29.getSubcategoryNameById(v52, v53);
    end;
    return v54 or "";
end;
local function v59(v56) --[[ Line: 133 ]] --[[ Name: getAXCounterV2Metadata ]]
    -- upvalues: l_UserInputService_0 (copy), l_isSpatial_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), v4 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_isSpatial_0() then
        l_l_UserInputService_0_Platform_0 = "VR";
    end;
    local v58 = {
        AppVersion = l_RunService_0:GetRobloxVersion(), 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
        Platform = l_l_UserInputService_0_Platform_0
    };
    if v56 and next(v56) ~= nil then
        v58 = v4.assign({}, v58, v56);
    end;
    return v58;
end;
v47.get = function(_) --[[ Line: 152 ]] --[[ Name: get ]]
    -- upvalues: v48 (ref), l_AnalyticsService_0 (copy), v29 (copy), v13 (copy), v20 (copy), l_FFlagProfilePlatformEnableStore_0 (copy), l_OrganicEventImpressionsSchema_0 (copy), l_ImpressionEnums_0 (copy), v44 (copy), v45 (copy), v46 (copy), v17 (copy), l_reportAvatarEventCounterV1_0 (copy), l_Constants_0 (copy), v18 (copy), v31 (copy), v59 (copy), l_default_0 (copy), v12 (copy), v10 (copy), v11 (copy), v14 (copy), v15 (copy), v8 (copy), v16 (copy), v9 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), l_RbxAnalyticsService_0 (copy), v19 (copy), l_WidgetConstants_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy)
    if v48 then
        return v48;
    else
        local l_l_AnalyticsService_0_0 = l_AnalyticsService_0;
        local v103 = {
            clickCatalogItem = function(v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74) --[[ Line: 162 ]] --[[ Name: clickCatalogItem ]]
                -- upvalues: v29 (ref), v13 (ref), l_l_AnalyticsService_0_0 (copy)
                local v75 = nil;
                if v64 then
                    v75 = v29.getCategoryNameById(v64);
                end;
                local v76 = v75 or "";
                local v77 = nil;
                if v64 and v65 then
                    v77 = v29.getSubcategoryNameById(v64, v65);
                end;
                v75 = v77 or "";
                v13(l_l_AnalyticsService_0_0.EventStream, v62, v63, v76, v75, v66, v67, v68, v69, v70, v71, v72, v73, v74);
            end, 
            clickCatalogItemFromProfile = function(v78, v79, v80, v81, v82, _) --[[ Line: 197 ]] --[[ Name: clickCatalogItemFromProfile ]]
                -- upvalues: v20 (ref), l_FFlagProfilePlatformEnableStore_0 (ref), l_OrganicEventImpressionsSchema_0 (ref), l_ImpressionEnums_0 (ref), v44 (ref), v45 (ref), l_l_AnalyticsService_0_0 (copy), v46 (ref)
                local v84 = {
                    feature = v20.ProfileAnalyticsTag, 
                    itemID = v79, 
                    itemType = v80, 
                    subpage = if l_FFlagProfilePlatformEnableStore_0 then v81 else "peekView", 
                    page = "playerProfile"
                };
                local l_enumMap_0 = l_OrganicEventImpressionsSchema_0.defaultItem.enumMap;
                local v86 = if l_enumMap_0 and l_enumMap_0.contentType then l_enumMap_0.contentType[v80] else nil;
                local v87 = {
                    itemId = v79, 
                    actionType = l_ImpressionEnums_0.ActionType.CLICK_ITEM_DETAIL, 
                    contentType = v86, 
                    price = 0, 
                    surface = v44[v78], 
                    recommendationSurface = v45[v81], 
                    absPositions = v82
                };
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(v78, v46.MARKETPLACE_ORGANIC_FE_LOG, v87);
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(v78, v46.ITEM_DETAIL_REFERRAL, v84);
            end, 
            purchaseAsset = function(v88, v89, v90, v91, v92, v93) --[[ Line: 234 ]] --[[ Name: purchaseAsset ]]
                -- upvalues: v17 (ref), l_l_AnalyticsService_0_0 (copy), v46 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref)
                v17(l_l_AnalyticsService_0_0.EventStream, v46.PURCHASE_ASSET, v88, v89, v90, v91, v92, v93);
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXPurchaseAsset);
            end, 
            purchaseBundle = function(v94, v95, v96, v97, v98) --[[ Line: 248 ]] --[[ Name: purchaseBundle ]]
                -- upvalues: v18 (ref), l_l_AnalyticsService_0_0 (copy), v46 (ref), l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref)
                v18(l_l_AnalyticsService_0_0.EventStream, v46.PURCHASE_BUNDLE, v94, v95, v96, v97, v98);
                l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.AXPurchaseBundle);
            end, 
            homepageWidgetItemClick = function(v99, v100) --[[ Line: 261 ]] --[[ Name: homepageWidgetItemClick ]]
                -- upvalues: l_ImpressionEnums_0 (ref), l_l_AnalyticsService_0_0 (copy), v46 (ref)
                local v101 = {
                    actionType = l_ImpressionEnums_0.ActionType.UI_BUTTON_CLICK, 
                    group = "HomePageAvatarWidgetClick", 
                    surface = l_ImpressionEnums_0.MarketplaceSurfaceType.HOMEPAGE, 
                    item_id = v99, 
                    item_type = v100, 
                    event_sender_api = l_ImpressionEnums_0.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
                };
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("HomeTryOnScreen", v46.MARKETPLACE_ORGANIC_FE_LOG, v101);
            end, 
            sendCounter = function(v102) --[[ Line: 276 ]] --[[ Name: sendCounter ]]
                -- upvalues: l_reportAvatarEventCounterV1_0 (ref)
                l_reportAvatarEventCounterV1_0(v102);
            end
        };
        v103.sendAXCounter = function(v104, v105, v106) --[[ Line: 282 ]] --[[ Name: sendAXCounter ]]
            -- upvalues: l_reportAvatarEventCounterV1_0 (ref), v31 (ref), v103 (copy)
            l_reportAvatarEventCounterV1_0(v31.Counter.PREFIX .. v104);
            if v105 then
                v103.sendAXCounterV2(v104, v106);
            end;
        end;
        v103.sendAXCounterV2 = function(v107, v108) --[[ Line: 292 ]] --[[ Name: sendAXCounterV2 ]]
            -- upvalues: v20 (ref), v59 (ref), l_default_0 (ref)
            local v109 = {
                eventName = v20.Counter.PREFIX .. v107, 
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
            local v110 = v59(v108);
            l_default_0:logRobloxTelemetryCounter(v109, 1, v110);
        end;
        v103.sendAXStat = function(v111, v112, v113) --[[ Line: 306 ]] --[[ Name: sendAXStat ]]
            -- upvalues: v59 (ref), l_default_0 (ref)
            local v114 = {
                eventName = "AXStat_" .. v111, 
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
            local v115 = v59(v113);
            l_default_0:logRobloxTelemetryStat(v114, v112, v115);
        end;
        v103.clickNavigationTab = function(v116, v117) --[[ Line: 318 ]] --[[ Name: clickNavigationTab ]]
            -- upvalues: v29 (ref), v12 (ref), l_l_AnalyticsService_0_0 (copy)
            local v118 = nil;
            if v116 then
                v118 = v29.getCategoryNameById(v116);
            end;
            local v119 = v118 or "";
            local v120 = nil;
            if v116 and v117 then
                v120 = v29.getSubcategoryNameById(v116, v117);
            end;
            v118 = v120 or "";
            v12(l_l_AnalyticsService_0_0.EventStream, "clickNavigationTab", v119, v118);
        end;
        v103.catalogSearch = function(v121, v122, v123, v124, v125, v126) --[[ Line: 324 ]] --[[ Name: catalogSearch ]]
            -- upvalues: v10 (ref), l_l_AnalyticsService_0_0 (copy)
            v10(l_l_AnalyticsService_0_0.EventStream, v121, v122, v126, v123, v124, v125);
        end;
        v103.clickCustomizeAvatarFromItemDetailPage = function() --[[ Line: 328 ]] --[[ Name: clickCustomizeAvatarFromItemDetailPage ]]
            -- upvalues: v11 (ref), l_l_AnalyticsService_0_0 (copy)
            v11(l_l_AnalyticsService_0_0.EventStream, "clickCustomizeAvatarFromItemDetailPage");
        end;
        v103.closeItemDetailPage = function(v127, v128) --[[ Line: 332 ]] --[[ Name: closeItemDetailPage ]]
            -- upvalues: v14 (ref), l_l_AnalyticsService_0_0 (copy)
            v14(l_l_AnalyticsService_0_0.EventStream, "closeItemDetailPage", v127, v128);
        end;
        v103.expandItemDetailPage = function(v129, v130) --[[ Line: 336 ]] --[[ Name: expandItemDetailPage ]]
            -- upvalues: v15 (ref), l_l_AnalyticsService_0_0 (copy)
            v15(l_l_AnalyticsService_0_0.EventStream, "expandItemDetailPage", v129, v130);
        end;
        v103.avatarToCatalogButton = function() --[[ Line: 340 ]] --[[ Name: avatarToCatalogButton ]]
            -- upvalues: v8 (ref), l_l_AnalyticsService_0_0 (copy)
            v8(l_l_AnalyticsService_0_0.EventStream, "avatarToCatalogButton");
        end;
        v103.moreMenuToCatalogButton = function() --[[ Line: 344 ]] --[[ Name: moreMenuToCatalogButton ]]
            -- upvalues: v16 (ref), l_l_AnalyticsService_0_0 (copy)
            v16(l_l_AnalyticsService_0_0.EventStream, "moreMenuToCatalogButton");
        end;
        v103.catalogOpenedFromLandingPage = function() --[[ Line: 348 ]] --[[ Name: catalogOpenedFromLandingPage ]]
            -- upvalues: v9 (ref), l_l_AnalyticsService_0_0 (copy)
            v9(l_l_AnalyticsService_0_0.EventStream, "catalogOpenedFromLandingPage");
        end;
        v103.clickPurchaseItemButton = function(v131, v132, v133, v134, v135, v136, v137, v138, v139, v140) --[[ Line: 353 ]] --[[ Name: clickPurchaseItemButton ]]
            -- upvalues: l_OrganicEventImpressionsSchema_0 (ref), v20 (ref), l_ImpressionEnums_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v44 (ref), l_l_AnalyticsService_0_0 (copy), v46 (ref), l_RbxAnalyticsService_0 (ref)
            local l_enumMap_1 = l_OrganicEventImpressionsSchema_0.defaultItem.enumMap;
            local v142 = if l_enumMap_1 and l_enumMap_1.contentType then l_enumMap_1.contentType[v132] else nil;
            local l_AnalyticsTag_0 = v20.AnalyticsTag;
            local v144 = nil;
            local v145 = nil;
            if v133 then
                l_AnalyticsTag_0 = v20.ProfileAnalyticsTag;
                v144 = "playerProfile";
                v145 = "peekView";
            elseif v139 then
                l_AnalyticsTag_0 = v20.ContentFeedAnalyticsTag;
                v144 = "contentFeed";
            end;
            local v146 = {
                feature = l_AnalyticsTag_0, 
                btn = "PriceButton", 
                itemId = v131, 
                actionType = l_ImpressionEnums_0.ActionType.PURCHASE_ATTEMPT, 
                contentType = v142, 
                requestId = v135, 
                subpage = v145, 
                page = v144, 
                keyword = v136, 
                surface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v140 or v44[v134] else v44[v134], 
                sort = v138.sortEnumValue, 
                filterSalesType = v138.filterSalesTypeEnumValue, 
                filterCreators = v138.filterCreatorsTypeEnumValue, 
                filterPrice = v138.filterPriceEnumValue, 
                filterUnavailableItems = v138.filterUnavailableItemsEnumValue, 
                filterCreatorsName = v138.filterCreatorsName, 
                filterPriceMin = v138.filterPriceMin, 
                filterPriceMax = v138.filterPriceMax
            };
            local v147 = {
                feature = l_AnalyticsTag_0, 
                btn = "PriceButton", 
                itemID = v131, 
                itemType = v132, 
                subpage = v145, 
                page = v144, 
                fromScreen = v134
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", v46.MARKETPLACE_ORGANIC_FE_LOG, v146);
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClick", v147);
            if v137 then
                local v148 = {
                    feature = l_AnalyticsTag_0, 
                    btn = "PriceButton", 
                    itemID = v131, 
                    itemType = v132, 
                    subpage = v145, 
                    page = v144, 
                    fromScreen = v134, 
                    refineSessionId = l_RbxAnalyticsService_0:GetSessionId()
                };
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", "buttonClickHasAccessoryAdjustment", v148);
            end;
        end;
        v103.shownEnableTwoStepAuthOnPurchase = function() --[[ Line: 441 ]] --[[ Name: shownEnableTwoStepAuthOnPurchase ]]
            -- upvalues: l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref)
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownEnableTwoStepAuth);
        end;
        v103.shownTwoStepAuthOnPurchase = function() --[[ Line: 447 ]] --[[ Name: shownTwoStepAuthOnPurchase ]]
            -- upvalues: l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref)
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseShownTwoStepAuth);
        end;
        v103.failedShowTwoStepAuthOnPurchase = function() --[[ Line: 453 ]] --[[ Name: failedShowTwoStepAuthOnPurchase ]]
            -- upvalues: l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref)
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseFailedShowTwoStepAuth);
        end;
        v103.completedTwoStepAuthOnPurchase = function() --[[ Line: 459 ]] --[[ Name: completedTwoStepAuthOnPurchase ]]
            -- upvalues: l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref)
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseCompletedTwoStepAuth);
        end;
        v103.invalidatedTwoStepAuthOnPurchase = function() --[[ Line: 465 ]] --[[ Name: invalidatedTwoStepAuthOnPurchase ]]
            -- upvalues: l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref)
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseInvalidatedTwoStepAuth);
        end;
        v103.abandonedTwoStepAuthOnPurchase = function() --[[ Line: 471 ]] --[[ Name: abandonedTwoStepAuthOnPurchase ]]
            -- upvalues: l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref)
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseAbandonedTwoStepAuth);
        end;
        v103.loadFailedTwoStepAuthOnPurchase = function() --[[ Line: 477 ]] --[[ Name: loadFailedTwoStepAuthOnPurchase ]]
            -- upvalues: l_reportAvatarEventCounterV1_0 (ref), l_Constants_0 (ref)
            l_reportAvatarEventCounterV1_0(l_Constants_0.AVATAR_EVENT_COUNTER_NAME.CatalogPurchaseLoadFailedTwoStepAuth);
        end;
        v103.clickCustomizeItemButton = function(v149, v150) --[[ Line: 484 ]] --[[ Name: clickCustomizeItemButton ]]
            -- upvalues: v46 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_0 = v46.BUTTON_CLICK;
            local v152 = {
                feature = v20.AnalyticsTag, 
                itemID = v149, 
                itemType = v150, 
                btn = "Customize", 
                cstm = "Shop"
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", l_BUTTON_CLICK_0, v152);
        end;
        v103.clickFavoriteItemButton = function(v153, v154, v155) --[[ Line: 499 ]] --[[ Name: clickFavoriteItemButton ]]
            -- upvalues: v46 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_1 = v46.BUTTON_CLICK;
            local v157 = {
                feature = v20.AnalyticsTag, 
                itemID = v153, 
                itemType = v154, 
                btn = "Favorite", 
                cstm = "Shop", 
                checked = v155
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", l_BUTTON_CLICK_1, v157);
        end;
        v103.clickShareItemButton = function(v158, v159) --[[ Line: 515 ]] --[[ Name: clickShareItemButton ]]
            -- upvalues: v46 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_2 = v46.BUTTON_CLICK;
            local v161 = {
                feature = v20.AnalyticsTag, 
                itemID = v158, 
                itemType = v159, 
                btn = "Share", 
                cstm = "Shop"
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("itemDetailPageBottomButtonClick", l_BUTTON_CLICK_2, v161);
        end;
        v103.applySortAndFilters = function(v162) --[[ Line: 529 ]] --[[ Name: applySortAndFilters ]]
            -- upvalues: v46 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_3 = v46.BUTTON_CLICK;
            local v164 = {
                feature = v20.AnalyticsTag, 
                btn = "Apply", 
                minPrice = v162.minPrice, 
                maxPrice = v162.maxPrice, 
                sortType = v162.sortType, 
                sortAggregation = v162.sortAggregation, 
                salesTypeFilter = v162.salesTypeFilter, 
                creatorFilter = v162.creatorFilter, 
                includeOffSale = v162.includeOffSale
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("SortAndFilters", l_BUTTON_CLICK_3, v164);
        end;
        v103.applyPriceFilter = function(v165, v166) --[[ Line: 548 ]] --[[ Name: applyPriceFilter ]]
            -- upvalues: v46 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_4 = v46.BUTTON_CLICK;
            local v168 = {
                feature = v20.AnalyticsTag, 
                btn = "Apply", 
                PriceLowerBound = v165, 
                PriceUpperBound = v166
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("PriceFilter", l_BUTTON_CLICK_4, v168);
        end;
        v103.navigateToProfile = function(v169) --[[ Line: 561 ]] --[[ Name: navigateToProfile ]]
            -- upvalues: v46 (ref), l_reportAvatarEventCounterV1_0 (ref), v20 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_BUTTON_CLICK_5 = v46.BUTTON_CLICK;
            l_reportAvatarEventCounterV1_0(v169 .. "LuaProfile");
            local v171 = {
                feature = v20.ProfileAnalyticsTag, 
                btn = "creator", 
                subpage = "peekView", 
                page = "playerProfile"
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(v169, l_BUTTON_CLICK_5, v171);
        end;
        v103.selectTopic = function(v172, v173, v174, v175, v176, v177, v178) --[[ Line: 575 ]] --[[ Name: selectTopic ]]
            -- upvalues: v19 (ref), v46 (ref), v29 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_Catalog_0 = v19.AnalyticsContext.Catalog;
            local l_SELECT_CATALOG_TOPIC_0 = v46.SELECT_CATALOG_TOPIC;
            local v181 = nil;
            if v174 then
                v181 = v29.getCategoryNameById(v174);
            end;
            local v182 = v181 or "";
            local v183 = nil;
            if v174 and v175 then
                v183 = v29.getSubcategoryNameById(v174, v175);
            end;
            v181 = v183 or "";
            v183 = {
                topic = v172, 
                allTopics = if v177 then table.concat(v177, ",") else nil, 
                previousSelectedTopics = if v178 then table.concat(v178, ",") else nil, 
                rank = v173, 
                category = v182, 
                subcategory = v181, 
                query = v176
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_Catalog_0, l_SELECT_CATALOG_TOPIC_0, v183);
        end;
        v103.openItemDetails = function(v184, v185, v186, v187) --[[ Line: 603 ]] --[[ Name: openItemDetails ]]
            -- upvalues: v19 (ref), v46 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_AvatarShop_0 = v19.AnalyticsContext.AvatarShop;
            local l_OPEN_ITEM_DETAILS_0 = v46.OPEN_ITEM_DETAILS;
            local v190 = {
                assetId = v184, 
                assetType = v185, 
                price = v186, 
                entryPoint = v187
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_AvatarShop_0, l_OPEN_ITEM_DETAILS_0, v190);
        end;
        v103.openItemDetailsV2 = function(v191, v192, v193, v194, v195, v196, v197, v198, v199) --[[ Line: 616 ]] --[[ Name: openItemDetailsV2 ]]
            -- upvalues: v19 (ref), l_OrganicEventImpressionsSchema_0 (ref), l_ImpressionEnums_0 (ref), v44 (ref), l_l_AnalyticsService_0_0 (copy), v46 (ref)
            local l_AvatarShop_1 = v19.AnalyticsContext.AvatarShop;
            local l_enumMap_2 = l_OrganicEventImpressionsSchema_0.defaultItem.enumMap;
            local v202 = if l_enumMap_2 and l_enumMap_2.contentType then l_enumMap_2.contentType[v192] else nil;
            local v203 = {
                itemId = v191, 
                actionType = l_ImpressionEnums_0.ActionType.CLICK_ITEM_DETAIL, 
                contentType = v202, 
                price = v193, 
                surface = v44[v194], 
                requestId = v195, 
                absPositions = v199.selectedItemIndex, 
                keyword = v196, 
                category = v197, 
                subcategory = v198, 
                sort = v199.sortEnumValue, 
                filterSalesType = v199.filterSalesTypeEnumValue, 
                filterCreators = v199.filterCreatorsTypeEnumValue, 
                filterPrice = v199.filterPriceEnumValue, 
                filterUnavailableItems = v199.filterUnavailableItemsEnumValue, 
                filterCreatorsName = v199.filterCreatorsName, 
                filterPriceMin = v199.filterPriceMin, 
                filterPriceMax = v199.filterPriceMax
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_AvatarShop_1, v46.MARKETPLACE_ORGANIC_FE_LOG, v203);
        end;
        v103.resizeOutfitScreen = function(v204) --[[ Line: 655 ]] --[[ Name: resizeOutfitScreen ]]
            -- upvalues: v19 (ref), v46 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_AvatarShop_2 = v19.AnalyticsContext.AvatarShop;
            local l_OPEN_OUTFIT_SCREEN_0 = v46.OPEN_OUTFIT_SCREEN;
            local v207 = {
                stateChange = v204
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent(l_AvatarShop_2, l_OPEN_OUTFIT_SCREEN_0, v207);
        end;
        v103.avatarShopBuyItem = function(v208, v209, v210, v211, v212, v213, v214, v215, v216, v217) --[[ Line: 665 ]] --[[ Name: avatarShopBuyItem ]]
            -- upvalues: v19 (ref), l_OrganicEventImpressionsSchema_0 (ref), l_l_AnalyticsService_0_0 (copy), v46 (ref), l_ImpressionEnums_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v44 (ref)
            local l_AvatarShop_3 = v19.AnalyticsContext.AvatarShop;
            local l_enumMap_3 = l_OrganicEventImpressionsSchema_0.defaultItem.enumMap;
            local v220 = if l_enumMap_3 and l_enumMap_3.contentType then l_enumMap_3.contentType[v209] else nil;
            l_l_AnalyticsService_0_0.EventStream:sendEventImmediately(l_AvatarShop_3, v46.MARKETPLACE_ORGANIC_FE_LOG, {
                itemId = v208, 
                actionType = l_ImpressionEnums_0.ActionType.PURCHASE_SUCCESS, 
                contentType = v220, 
                price = v210, 
                surface = if l_FFlagAXFixPurchaseSurfaceLogging_0 then v217 or v44[v211] else v44[v211], 
                requestId = v212, 
                absPositions = v216.selectedItemIndex, 
                sort = v216.sortEnumValue, 
                filterSalesType = v216.filterSalesTypeEnumValue, 
                filterCreators = v216.filterCreatorsTypeEnumValue, 
                filterPrice = v216.filterPriceEnumValue, 
                filterUnavailableItems = v216.filterUnavailableItemsEnumValue, 
                filterCreatorsName = v216.filterCreatorsName, 
                filterPriceMin = v216.filterPriceMin, 
                filterPriceMax = v216.filterPriceMax, 
                keyword = v213, 
                category = v214, 
                subcategory = v215
            });
        end;
        v103.widgetInteraction = function(v221, v222, v223, v224, v225, v226, v227) --[[ Line: 706 ]] --[[ Name: widgetInteraction ]]
            -- upvalues: v46 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_WIDGET_API_FE_LOG_0 = v46.WIDGET_API_FE_LOG;
            local v229 = {
                request_id = v221, 
                action_type = v222, 
                item_position = v223, 
                widget_position = v224, 
                item_id = v225, 
                item_type = v226, 
                widget_id = v227
            };
            l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("catalog", l_WIDGET_API_FE_LOG_0, v229);
        end;
        v103.widgetInteractionV2 = function(v230, v231) --[[ Line: 731 ]] --[[ Name: widgetInteractionV2 ]]
            -- upvalues: v46 (ref), l_WidgetConstants_0 (ref), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), l_l_AnalyticsService_0_0 (copy)
            local l_WIDGET_API_FE_LOG_1 = v46.WIDGET_API_FE_LOG;
            local v233 = v231 == l_WidgetConstants_0.ActionType.PURCHASE_SUCCESS;
            local v234 = {
                Outfit = "1", 
                Avatar = "2", 
                Makeup = "3"
            };
            local v235 = {
                action_type = v231, 
                request_id = v230.requestId, 
                item_position = v230.itemPosition, 
                widget_position = v230.widgetPosition, 
                item_id = v230.itemId, 
                item_type = v230.itemType, 
                look_type = if l_FFlagAXAddLookTypeEnumForLogging_0 and v230.lookType then v234[v230.lookType] else nil, 
                widget_id = v230.widgetId, 
                widget_type = v230.widgetType, 
                widget_abs_position = v230.widgetAbsPosition, 
                widget_item_ids = if v230.widgetItemIds then table.concat(v230.widgetItemIds, ",") else nil, 
                kwd = v230.query, 
                organic_result_ids = if v230.organicResultIds then table.concat(v230.organicResultIds, ",") else nil, 
                time_spent_sec = v230.timeSpentSec, 
                asset_ids = if v230.assetIds then table.concat(v230.assetIds, ",") else nil, 
                bundle_ids = if v230.bundleIds then table.concat(v230.bundleIds, ",") else nil, 
                total_robux = v230.totalRobux, 
                ui_treatment_type = v230.uiTreatmentType
            };
            if v233 then
                l_l_AnalyticsService_0_0.EventStream:sendEventImmediately("catalog", l_WIDGET_API_FE_LOG_1, v235);
                return;
            else
                l_l_AnalyticsService_0_0.EventStream:sendTelemetryEvent("catalog", l_WIDGET_API_FE_LOG_1, v235);
                return;
            end;
        end;
        v48 = v103;
        return v103;
    end;
end;
return v47;