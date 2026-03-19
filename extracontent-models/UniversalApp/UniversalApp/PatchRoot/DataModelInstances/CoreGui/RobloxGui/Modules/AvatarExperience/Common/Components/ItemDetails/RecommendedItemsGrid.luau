local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_useFocusController_0 = v5.useFocusController;
local l_Focusable_0 = v5.Focusable;
local v9 = require(l_CorePackages_0.Packages.RoactNavigation);
local v10 = require(l_CorePackages_0.Packages.RoactRodux);
local v11 = require(l_CorePackages_0.Packages.t);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v14 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v14.useFocusGuiObject;
local v16 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v13.FocusNavigationEventNameEnum;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v19 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetRecommendedAssets);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.GetRecommendedBundles);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.BaseItemCard);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics);
local v30 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local v33 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v34 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXHideRecommendationsOnFetchFailure);
local v35 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v36 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAXEnableHomeTryOnComplexView_0 = v36.FFlagAXEnableHomeTryOnComplexView;
local l_FFlagAXMigrateRecommendedItemsGridToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateRecommendedItemsGridToFocusNavigation;
local l_FFlagAXItemDetailsIxpExposure_0 = v35.FFlagAXItemDetailsIxpExposure;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXTryOnScreenImprovements_0 = v36.FFlagAXTryOnScreenImprovements;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v36.FFlagAXFixPurchaseSurfaceLogging;
local v43 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v43.Style.withStyle;
local l_withTextSizeOffset_0 = v43.Core.Style.withTextSizeOffset;
local v46 = v4.PureComponent:extend("RecommendedItemsGrid");
v46.validateProps = v11.strictInterface({
    itemId = v11.string, 
    itemType = v11.string, 
    itemSubType = v11.optional(v11.string), 
    LayoutOrder = v11.optional(v11.integer), 
    hideItemTitle = v11.optional(v11.boolean), 
    getItemMetrics = v11.optional(v11.callback), 
    onActivatedMountAsFullView = v11.optional(v11.boolean), 
    onFetchRecommendationsFailed = if v34() then v11.optional(v11.callback) else nil, 
    focusNavigationRef = if l_FFlagAXMigrateRecommendedItemsGridToFocusNavigation_0 then v11.union(v11.callback, v11.table) else nil, 
    recommendedItemSummaries = v11.optional(v11.array(v11.strictInterface({
        id = v11.string, 
        type = v11.string, 
        subType = v11.string, 
        gridInformation = v11.optional(v11.table)
    }))), 
    NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v11.optional(v11.table), 
    NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v11.optional(v11.table), 
    resultsListRef = v11.optional(v11.table), 
    forwardRef = v11.optional(v11.table), 
    itemDetailsPeekViewRefs = v11.optional(v11.table), 
    getRecommendedAssets = v11.callback, 
    getRecommendedBundles = v11.callback, 
    sendDetailedCatalogAnalytics = v11.callback, 
    maybePromptForR15Upgrade = v11.callback, 
    navigateDownToAvatarScreen = v11.callback, 
    navigation = v11.table, 
    analytics = v11.table
});
v46.defaultProps = {
    itemType = v20.ItemType.Asset
};
local v47 = {
    [Enum.KeyCode.ButtonR2] = l_FocusNavigationEventNameEnum_0.MoveToActionBar
};
local function v53(v48, v49) --[[ Line: 120 ]] --[[ Name: useRecommendedItemsGridFocusNavigationBindings ]]
    -- upvalues: v14 (copy), v47 (copy), v3 (copy), l_FocusNavigationEventNameEnum_0 (copy), v16 (copy)
    local v50 = v14.useEventMap(v47, v48);
    local v52 = v3.useMemo(function() --[[ Line: 122 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v16 (ref), v49 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.MoveToActionBar] = {
                handler = v16.onRelease(function(_) --[[ Line: 125 ]]
                    -- upvalues: v49 (ref)
                    v49();
                end)
            }
        };
    end, {
        v49
    });
    return v14.useEventHandlerMap(v52, v50);
end;
v46.init = function(v54) --[[ Line: 134 ]] --[[ Name: init ]]
    -- upvalues: l_wasLastInputGamepad_0 (copy), v26 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v20 (copy), l_FFlagAXTryOnScreenImprovements_0 (copy), l_AvatarScreen_0 (copy), v19 (copy), v4 (copy), v24 (copy), v34 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy)
    v54.selectRecommendedItem = function(v55, v56, _) --[[ Line: 135 ]]
        -- upvalues: l_wasLastInputGamepad_0 (ref), v26 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v54 (copy)
        local l_id_0 = v55.id;
        local l_type_0 = v55.type;
        local l_subType_0 = v55.subType;
        local function v62() --[[ Line: 140 ]]
            -- upvalues: l_wasLastInputGamepad_0 (ref), v26 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v54 (ref)
            local v61 = l_wasLastInputGamepad_0();
            v26("RecommendedItemsGrid", v61);
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v61 then
                v54.props.focusController.captureFocus();
            end;
        end;
        local function v63() --[[ Line: 149 ]]
            -- upvalues: v54 (ref), l_id_0 (copy), l_type_0 (copy), l_subType_0 (copy), v56 (copy)
            v54.navigateToRecommendedItem(l_id_0, l_type_0, l_subType_0, v56);
        end;
        local function _() --[[ Line: 153 ]]
            -- upvalues: v54 (ref), l_id_0 (copy), l_type_0 (copy), v62 (copy), v63 (copy)
            return v54.props.maybePromptForR15Upgrade(v54.props.navigation, l_id_0, l_type_0, v62, v63);
        end;
        if v54.props.maybePromptForR15Upgrade(v54.props.navigation, l_id_0, l_type_0, v62, v63) then
            return;
        else
            v54.navigateToRecommendedItem(l_id_0, l_type_0, l_subType_0, v56);
            return;
        end;
    end;
    v54.navigateToRecommendedItem = function(v65, v66, v67, v68) --[[ Line: 170 ]]
        -- upvalues: v54 (copy), l_FFlagAXEnableHomeTryOnComplexView_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v20 (ref), l_FFlagAXTryOnScreenImprovements_0 (ref), l_AvatarScreen_0 (ref), v19 (ref)
        if not v65 or not v66 or not v67 then
            return;
        else
            local v69 = true;
            if v54.props.onActivatedMountAsFullView ~= nil then
                v69 = v54.props.onActivatedMountAsFullView;
            end;
            local v70 = v54.props.navigation.getParam("fromProfile");
            local v71 = if l_FFlagAXEnableHomeTryOnComplexView_0 then v54.props.navigation.getParam("fromHome") else nil;
            local v72 = v54.props.navigation.getParam("showFullWithNoPeekView");
            local v73 = {
                itemId = v65, 
                itemType = v66, 
                itemSubType = v67, 
                mountAsFullView = v69, 
                mountAnimation = false, 
                itemDetailsPeekViewRefs = v54.props.itemDetailsPeekViewRefs, 
                resultsListRef = v54.props.resultsListRef, 
                isFirstItemDetails = false, 
                fromProfile = v70, 
                showFullWithNoPeekView = v72, 
                fromSurface = if l_FFlagAXFixPurchaseSurfaceLogging_0 and v54.props.navigation then v54.props.navigation.getParam(v20.NavigationParams.fromSurface) else nil
            };
            if l_FFlagAXTryOnScreenImprovements_0 then
                if v70 then
                    v73.mountAnimation = false;
                    v73.isFirstItemDetails = false;
                    local v74 = v66 .. v65;
                    v54.props.navigateDownToAvatarScreen(l_AvatarScreen_0.ItemDetails, v74, v73);
                elseif v54.props.navigation.getParam("shouldNavigateDown") then
                    v73.mountAnimation = v54.props.navigation.getParam("mountAnimation");
                    v73.showRobuxBalance = v54.props.navigation.getParam("showRobuxBalance");
                    v73.showDropDownTopBar = v54.props.navigation.getParam("showDropDownTopBar");
                    v73.shouldNavigateDown = v54.props.navigation.getParam("shouldNavigateDown");
                    v73.hideTab = v54.props.navigation.getParam("hideTab");
                    v73.simpleView = v54.props.navigation.getParam("simpleView");
                    local v75 = v66 .. v65;
                    v54.props.navigateDownToAvatarScreen(v54.props.navigation.state.routeName, v75, v73);
                else
                    v73.mountAnimation = false;
                    v73.isFirstItemDetails = false;
                    v54.props.navigation.push(l_AvatarScreen_0.ItemDetails, v73);
                end;
            elseif l_FFlagAXEnableHomeTryOnComplexView_0 and v71 then
                local v76 = {
                    itemId = v65, 
                    itemType = v66, 
                    itemSubType = v67, 
                    mountAsFullView = false, 
                    mountAnimation = true, 
                    showRobuxBalance = true, 
                    showDropDownTopBar = true, 
                    fromHome = true
                };
                local v77 = v66 .. v65;
                v54.props.navigateDownToAvatarScreen(l_AvatarScreen_0.TryOnItem, v77, v76);
            elseif v70 then
                local v78 = v66 .. v65;
                v54.props.navigateDownToAvatarScreen(l_AvatarScreen_0.ItemDetails, v78, v73);
            else
                v54.props.navigation.push(l_AvatarScreen_0.ItemDetails, v73);
            end;
            local l_analytics_0 = v54.props.analytics;
            v54.props.sendDetailedCatalogAnalytics(v19.AnalyticsContext.ItemDetailsRecommendedItem, l_analytics_0.clickCatalogItem, v65, v66, v68, v20.NumRecommendedItems, v70);
            return;
        end;
    end;
    v54.renderRecommendedItem = function(v80, v81, v82) --[[ Line: 259 ]]
        -- upvalues: v4 (ref), v24 (ref), v54 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        return v4.createElement(v24, {
            itemId = v80.id, 
            itemType = v80.type, 
            itemSubType = v80.subtype, 
            hideItemTitle = v54.props.hideItemTitle, 
            gridInformation = v80.gridInformation, 
            onActivated = function() --[[ Line: 266 ]] --[[ Name: onActivated ]]
                -- upvalues: v54 (ref), v80 (copy), v81 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v82 (copy)
                v54.selectRecommendedItem(v80, v81, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v82);
            end
        });
    end;
    v54.fetchRecommended = function() --[[ Line: 276 ]]
        -- upvalues: v54 (copy), v34 (ref), v20 (ref), l_FFlagAXItemDetailsIxpExposure_0 (ref)
        local l_itemId_0 = v54.props.itemId;
        local l_itemType_0 = v54.props.itemType;
        local l_itemSubType_0 = v54.props.itemSubType;
        if not l_itemId_0 or not l_itemType_0 or not l_itemSubType_0 then
            return nil;
        elseif v34() then
            local v86 = if l_itemType_0 == v20.ItemType.Asset then v54.props.getRecommendedAssets(l_itemId_0, l_itemSubType_0, v20.NumRecommendedItems, true) else v54.props.getRecommendedBundles(l_itemId_0, l_itemSubType_0, v20.NumRecommendedItems, true);
            v86:catch(function() --[[ Line: 289 ]]
                -- upvalues: v54 (ref)
                if v54.props.onFetchRecommendationsFailed then
                    v54.props.onFetchRecommendationsFailed();
                end;
            end);
            if l_FFlagAXItemDetailsIxpExposure_0 then
                return v86;
            else
                return nil;
            end;
        else
            if l_itemType_0 == v20.ItemType.Asset then
                v54.props.getRecommendedAssets(l_itemId_0, l_itemSubType_0, v20.NumRecommendedItems, true);
            else
                v54.props.getRecommendedBundles(l_itemId_0, l_itemSubType_0, v20.NumRecommendedItems, true);
            end;
            return nil;
        end;
    end;
end;
v46.didMount = function(v87) --[[ Line: 319 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAXItemDetailsIxpExposure_0 (copy), l_addUnifiedEventLogging_0 (copy)
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v88 = v87.fetchRecommended();
        if v88 then
            v88:andThen(function() --[[ Line: 323 ]]
                -- upvalues: v87 (copy), l_addUnifiedEventLogging_0 (ref)
                if v87.props.forwardRef then
                    l_addUnifiedEventLogging_0(v87.props.forwardRef, {});
                end;
            end);
            return;
        end;
    else
        v87.fetchRecommended();
    end;
end;
v46.didUpdate = function(v89, v90) --[[ Line: 334 ]] --[[ Name: didUpdate ]]
    local l_itemSubType_1 = v90.itemSubType;
    if v89.props.itemSubType and not l_itemSubType_1 then
        v89.fetchRecommended();
    end;
end;
v46.render = function(v92) --[[ Line: 343 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), l_FFlagAXMigrateRecommendedItemsGridToFocusNavigation_0 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v25 (copy), l_Focusable_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), v21 (copy), v20 (copy), l_withTextSizeOffset_0 (copy)
    if v92.props.itemId == nil then
        return;
    else
        local l_LayoutOrder_0 = v92.props.LayoutOrder;
        local l_recommendedItemSummaries_0 = v92.props.recommendedItemSummaries;
        local function v110(v95) --[[ Line: 351 ]]
            -- upvalues: l_withStyle_0 (ref), v92 (copy), v5 (ref), l_FFlagAXMigrateRecommendedItemsGridToFocusNavigation_0 (ref), v4 (ref), l_LayoutOrder_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v25 (ref), l_Focusable_0 (ref), l_recommendedItemSummaries_0 (copy), l_FFlagAXItemDetailsIxpExposure_0 (ref), v21 (ref), v20 (ref)
            return l_withStyle_0(function(v96) --[[ Line: 352 ]]
                -- upvalues: v92 (ref), v5 (ref), l_FFlagAXMigrateRecommendedItemsGridToFocusNavigation_0 (ref), v4 (ref), l_LayoutOrder_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v25 (ref), l_Focusable_0 (ref), l_recommendedItemSummaries_0 (ref), l_FFlagAXItemDetailsIxpExposure_0 (ref), v21 (ref), v95 (copy), v20 (ref)
                local l_Font_0 = v96.Font;
                local l_forwardRef_0 = v92.props.forwardRef;
                return v5.withFocusController(function(v99) --[[ Line: 356 ]]
                    -- upvalues: l_FFlagAXMigrateRecommendedItemsGridToFocusNavigation_0 (ref), v4 (ref), l_LayoutOrder_0 (ref), v92 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v25 (ref), l_Focusable_0 (ref), l_recommendedItemSummaries_0 (ref), l_FFlagAXItemDetailsIxpExposure_0 (ref), v21 (ref), l_Font_0 (copy), v95 (ref), v20 (ref), l_forwardRef_0 (copy), v5 (ref)
                    if l_FFlagAXMigrateRecommendedItemsGridToFocusNavigation_0 then
                        return v4.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.fromScale(1, 0), 
                            LayoutOrder = l_LayoutOrder_0, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            ref = v92.props.focusNavigationRef
                        }, v4.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v25 else l_Focusable_0[v25], {
                            items = l_recommendedItemSummaries_0, 
                            renderItem = function(v100, v101, v102) --[[ Line: 371 ]] --[[ Name: renderItem ]]
                                -- upvalues: l_FFlagAXItemDetailsIxpExposure_0 (ref), v92 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v99 (copy)
                                if l_FFlagAXItemDetailsIxpExposure_0 then
                                    v100.gridInformation = v102;
                                end;
                                return v92.renderRecommendedItem(v100, v101, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v99);
                            end, 
                            getItemHeight = function(v103) --[[ Line: 381 ]] --[[ Name: getItemHeight ]]
                                -- upvalues: v21 (ref), l_Font_0 (ref), v95 (ref)
                                local v104 = v21.getRecommendedItemsGridItemTitleHeight(l_Font_0, v95);
                                return v103 + 10 + v104;
                            end, 
                            totalNumItems = v20.NumRecommendedItems, 
                            getItemMetrics = v92.props.getItemMetrics, 
                            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v92.props.NextSelectionUp, 
                            NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v92.props.NextSelectionDown, 
                            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v92.props.NextSelectionLeft, 
                            [v4.Ref] = l_forwardRef_0
                        }));
                    else
                        return v4.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v25 else l_Focusable_0[v25], {
                            items = l_recommendedItemSummaries_0, 
                            renderItem = function(v105, v106, v107) --[[ Line: 408 ]] --[[ Name: renderItem ]]
                                -- upvalues: v92 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v99 (copy)
                                v105.gridInformation = v107;
                                return v92.renderRecommendedItem(v105, v106, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v99);
                            end, 
                            getItemHeight = function(v108) --[[ Line: 416 ]] --[[ Name: getItemHeight ]]
                                -- upvalues: v21 (ref), l_Font_0 (ref), v95 (ref)
                                local v109 = v21.getRecommendedItemsGridItemTitleHeight(l_Font_0, v95);
                                return v108 + 10 + v109;
                            end, 
                            LayoutOrder = l_LayoutOrder_0, 
                            totalNumItems = v20.NumRecommendedItems, 
                            getItemMetrics = v92.props.getItemMetrics, 
                            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v92.props.NextSelectionUp, 
                            NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v92.props.NextSelectionDown, 
                            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v92.props.NextSelectionLeft, 
                            [v4.Ref] = l_forwardRef_0, 
                            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                                MoveToActionBar = v5.Input.onBegin(Enum.KeyCode.ButtonR2, function() --[[ Line: 435 ]]
                                    -- upvalues: v99 (copy), v92 (ref)
                                    v99.moveFocusTo(v92.props.NextSelectionDown);
                                end)
                            }
                        });
                    end;
                end);
            end);
        end;
        return l_withTextSizeOffset_0(function(v111) --[[ Line: 446 ]]
            -- upvalues: v110 (copy)
            return v110(v111);
        end);
    end;
end;
v46 = v10.connect(function(v112, v113) --[[ Line: 451 ]]
    -- upvalues: v33 (copy)
    local v114 = v33(v112.AvatarExperience.Common, v113.itemId, v113.itemType);
    return {
        recommendedItemSummaries = v114 and v114.recommendedItemSummaries
    };
end, function(v115) --[[ Line: 456 ]]
    -- upvalues: v34 (copy), v23 (copy), v22 (copy), v29 (copy), v30 (copy), v27 (copy)
    local function v120(v116, v117, v118, v119) --[[ Line: 457 ]]
        -- upvalues: v34 (ref), v115 (copy), v23 (ref)
        if v34() then
            return v115(v23(v116, v117, v118, v119));
        else
            v115(v23(v116, v117, v118, v119));
            return;
        end;
    end;
    return {
        getRecommendedAssets = function(v121, v122, v123, v124) --[[ Line: 465 ]]
            -- upvalues: v34 (ref), v115 (copy), v22 (ref)
            if v34() then
                return v115(v22(v121, v122, v123, v124));
            else
                v115(v22(v121, v122, v123, v124));
                return;
            end;
        end, 
        getRecommendedBundles = v120, 
        sendDetailedCatalogAnalytics = function(v125, v126, v127, v128, v129, v130, v131) --[[ Line: 477 ]] --[[ Name: sendDetailedCatalogAnalytics ]]
            -- upvalues: v115 (copy), v29 (ref)
            v115(v29(v125, v126, v127, v128, v129, v130, v131));
        end, 
        maybePromptForR15Upgrade = function(v132, v133, v134, v135, v136) --[[ Line: 498 ]] --[[ Name: maybePromptForR15Upgrade ]]
            -- upvalues: v115 (copy), v30 (ref)
            return v115(v30(v132, v133, v134, v135, v136, false));
        end, 
        navigateDownToAvatarScreen = function(v137, v138, v139) --[[ Line: 510 ]] --[[ Name: navigateDownToAvatarScreen ]]
            -- upvalues: v115 (copy), v27 (ref)
            return v115(v27(v137, v138, v139));
        end
    };
end)(v46);
v46 = l_RoactServices_0.connect({
    analytics = v28
})(v46);
v46 = v9.withNavigation(v46);
return v4.forwardRef(function(v140, v141) --[[ Line: 522 ]]
    -- upvalues: l_FFlagAXMigrateRecommendedItemsGridToFocusNavigation_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), l_useFocusGuiObject_0 (copy), v3 (copy), v53 (copy), v4 (copy), v46 (ref), v2 (copy)
    local v142 = nil;
    if l_FFlagAXMigrateRecommendedItemsGridToFocusNavigation_0 then
        local v143 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
        local v144 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v145 = v3.useCallback(function() --[[ Line: 528 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v144 (copy), v140 (copy), v143 (copy)
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v144 and v140.NextSelectionDown and v140.NextSelectionDown.current then
                    v144(v140.NextSelectionDown.current);
                    return;
                end;
            else
                v143.moveFocusTo(v140.NextSelectionDown);
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v143, 
            v140.NextSelectionDown
        });
        v142 = v53(nil, v145);
    end;
    return v4.createElement(v46, v2.Dictionary.join(v140, {
        forwardRef = v141, 
        focusNavigationRef = if l_FFlagAXMigrateRecommendedItemsGridToFocusNavigation_0 then v142 else nil
    }));
end);