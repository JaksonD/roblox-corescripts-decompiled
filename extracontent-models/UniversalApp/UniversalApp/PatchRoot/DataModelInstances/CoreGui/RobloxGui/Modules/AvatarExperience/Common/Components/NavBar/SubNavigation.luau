local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local v11 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v12 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_RoactFitComponents_0 = v11.RoactFitComponents;
local l_FitFrameHorizontal_0 = l_RoactFitComponents_0.FitFrameHorizontal;
local l_withStyle_0 = v10.Style.withStyle;
local l_SpringAnimatedItem_0 = v10.Utility.SpringAnimatedItem;
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_findValueKeyInRefCache_0 = v20.Utils.RoactGamepadMigration.findValueKeyInRefCache;
local l_useTableWrappedCallbackRef_0 = v20.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v23 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMigrateMainNavigationInputBindings_0 = v23.FFlagAXMigrateMainNavigationInputBindings;
local v25 = require(l_Modules_0.LuaApp.Constants);
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.DEPRECATED_CategoryButton);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavHighlight);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v34 = require(l_Modules_0.AvatarExperience.Common.Util.HeadCategoryTooltipStorage);
local v35 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v36 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient);
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v39 = require(script.Parent.useTabNavigationFocusNavigationBindings);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogCategoriesSDUI_0 = v23.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXSubNavigationRefsById_0 = v23.FFlagAXSubNavigationRefsById;
local l_FFlagAXCategoryUnifiedLogging_0 = v23.FFlagAXCategoryUnifiedLogging;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventLogForInstance_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventLogForInstance;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v48 = v5.PureComponent:extend("SubNavigation");
local v49 = {
    Style = true, 
    Heads = not v36.isEnabled() or nil
};
local v50 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local function _(v51, v52) --[[ Line: 88 ]] --[[ Name: findSubcategoryIndexById ]]
    if not v51 or not v52 then
        return nil;
    else
        for v53, v54 in v51 do
            if v54.Id == v52 then
                return v53;
            end;
        end;
        return nil;
    end;
end;
v48.validateProps = v4.strictInterface({
    layoutOrder = v4.number, 
    navHeight = v4.number, 
    selectedCategoryIndex = v4.optional(v4.number), 
    selectedSubcategoryIndex = v4.optional(v4.number), 
    selectSubcategory = v4.optional(v4.callback), 
    selectedCategoryId = v4.optional(v4.string), 
    selectedSubcategoryId = v4.optional(v4.string), 
    selectSubcategoryId = v4.optional(v4.callback), 
    shouldUseCategoryId = v4.optional(v4.boolean), 
    subcategories = v4.optional(v4.table), 
    onSubNavigationPropsDidUpdate = v4.callback, 
    isHidden = if v36.isEnabled() then v4.optional(v4.boolean) else nil, 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    BackgroundColor3 = if v38() then v4.optional(v4.Color3) else nil, 
    BackgroundTransparency = if v38() then v4.optional(v4.number) else nil, 
    subNavigationRef = v4.optional(v4.table), 
    lastInputGroup = v4.string, 
    newItemNotifications = v4.table, 
    unifiedLoggingSurface = if l_FFlagAXCategoryUnifiedLogging_0 then v4.optional(v4.integer) else nil, 
    navigation = v4.table, 
    frameRef = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v4.table else nil, 
    navButtonRefs = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v4.table else nil
});
local function v57(v56) --[[ Line: 140 ]] --[[ Name: animatedFrameMapValuesToProps ]]
    return {
        Size = UDim2.new(1, 0, 0, v56.height)
    };
end;
v48.init = function(v58) --[[ Line: 146 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), v7 (copy)
    v58.scrollingFrameRef = v5.createRef();
    v58.navButtonRefs = if l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else v7.createRefCache();
    v58.categoryButtonRefs = {};
    v58:setState({
        selectedCategoryButtonInstance = nil, 
        renderHighlight = false
    });
    v58.onNavFrameSizeChanged = function(v59) --[[ Line: 158 ]]
        -- upvalues: v58 (copy)
        if v58.scrollingFrameRef.current then
            v58.scrollingFrameRef.current.CanvasSize = UDim2.new(0, v59.AbsoluteSize.X, 1, 0);
        end;
    end;
end;
v48.getCategoryButtonRef = function(v60, v61) --[[ Line: 165 ]] --[[ Name: getCategoryButtonRef ]]
    -- upvalues: v5 (copy)
    if not v60.categoryButtonRefs[v61] then
        v60.categoryButtonRefs[v61] = v5.createRef();
    end;
    return v60.categoryButtonRefs[v61];
end;
v48.tryUpdateScrollingFramePosition = function(v62, v63, v64) --[[ Line: 173 ]] --[[ Name: tryUpdateScrollingFramePosition ]]
    local v65 = v62.scrollingFrameRef and v62.scrollingFrameRef:getValue();
    local v66 = (v63 or 0) - 50;
    if v65 then
        local l_X_0 = v65.AbsoluteWindowSize.X;
        if not l_X_0 or l_X_0 == 0 then
            return;
        else
            local v68 = false;
            if v63 + v64 > 0 then
                v68 = v63 + v64 < l_X_0;
            end;
            local v69 = false;
            if v63 > 0 then
                v69 = v63 < l_X_0;
            end;
            if not v69 and not v68 then
                v65.CanvasPosition = Vector2.new(v66, v65.CanvasPosition.Y);
            end;
        end;
    end;
end;
v48.setCategoryPositionAndWidthState = function(v70) --[[ Line: 196 ]] --[[ Name: setCategoryPositionAndWidthState ]]
    if v70.props.shouldUseCategoryId then
        if not v70.categoryButtonRefs or not v70.props.selectedSubcategoryId or not v70.categoryButtonRefs[v70.props.selectedSubcategoryId] then
            v70:setState({
                renderHighlight = false
            });
            return false;
        end;
    elseif not v70.categoryButtonRefs or not v70.props.selectedSubcategoryIndex or not v70.categoryButtonRefs[v70.props.selectedSubcategoryIndex] then
        v70:setState({
            renderHighlight = false
        });
        return false;
    end;
    local v71 = v70.categoryButtonRefs[if v70.props.shouldUseCategoryId then v70.props.selectedSubcategoryId else v70.props.selectedSubcategoryIndex]:getValue();
    if v71 == nil then
        v70:setState({
            renderHighlight = false
        });
        return false;
    else
        v70:tryUpdateScrollingFramePosition(v71.AbsolutePosition.X, v71.AbsoluteSize.X);
        v70:setState({
            selectedCategoryButtonInstance = v71, 
            renderHighlight = true
        });
        return true;
    end;
end;
v48.didMount = function(v72) --[[ Line: 250 ]] --[[ Name: didMount ]]
    v72:setCategoryPositionAndWidthState();
    if v72.scrollingFrameRef.current then
        v72.scrollingFrameRef.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Once(function() --[[ Line: 261 ]]
            -- upvalues: v72 (copy)
            v72:setCategoryPositionAndWidthState();
        end);
    end;
end;
v48.didUpdate = function(v73, v74) --[[ Line: 267 ]] --[[ Name: didUpdate ]]
    v73.props.onSubNavigationPropsDidUpdate(v74, v73.scrollingFrameRef);
    if v73.props.shouldUseCategoryId then
        if v73.props.selectedSubcategoryId ~= v74.selectedSubcategoryId or v73.props.selectedCategoryId ~= v74.selectedCategoryId then
            v73:setCategoryPositionAndWidthState();
            return;
        end;
    elseif v73.props.selectedSubcategoryIndex ~= v74.selectedSubcategoryIndex or v73.props.selectedCategoryIndex ~= v74.selectedCategoryIndex then
        v73:setCategoryPositionAndWidthState();
    end;
end;
v48.getRouteName = function(v75) --[[ Line: 288 ]] --[[ Name: getRouteName ]]
    return v75.props.navigation.state.routeName;
end;
local function _(v76, v77) --[[ Line: 293 ]] --[[ Name: hasOutfitNotification ]]
    -- upvalues: v27 (copy), v26 (copy)
    local v78 = false;
    if v76.SearchUuid == v27.PurchasedCharacterKey then
        v78 = v77[v26.NewOutfitNotificationKey];
    end;
    local v79 = false;
    if v76.OutfitType == v26.OutfitTypes.DynamicHead then
        v79 = v77[v26.NewDHOutfitNotificationKey];
    end;
    return v78 or v79;
end;
v48.hasNewItemNotification = function(v81, v82, v83) --[[ Line: 302 ]] --[[ Name: hasNewItemNotification ]]
    -- upvalues: l_AvatarScreen_0 (copy), v38 (copy), v28 (copy), v27 (copy), v26 (copy)
    if v81:getRouteName() ~= l_AvatarScreen_0.AvatarEditor then
        return false;
    else
        local l_newItemNotifications_0 = v81.props.newItemNotifications;
        local v85 = v83[v82];
        if v38() then
            return v28.shouldNotifyCategory(v85, l_newItemNotifications_0);
        else
            local l_AssetTypeIdStrings_0 = v85.AssetTypeIdStrings;
            if l_AssetTypeIdStrings_0 and v28.shouldNotifyAssetTypes(l_AssetTypeIdStrings_0, l_newItemNotifications_0) then
                return true;
            else
                local v87 = false;
                if v85.SearchUuid == v27.PurchasedCharacterKey then
                    v87 = l_newItemNotifications_0[v26.NewOutfitNotificationKey];
                end;
                local v88 = false;
                if v85.OutfitType == v26.OutfitTypes.DynamicHead then
                    v88 = l_newItemNotifications_0[v26.NewDHOutfitNotificationKey];
                end;
                if v87 or v88 then
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end;
end;
v48.hasNewItemNotificationV2 = function(v89, v90) --[[ Line: 326 ]] --[[ Name: hasNewItemNotificationV2 ]]
    -- upvalues: l_AvatarScreen_0 (copy), v38 (copy), v28 (copy), v27 (copy), v26 (copy)
    if v89:getRouteName() ~= l_AvatarScreen_0.AvatarEditor then
        return false;
    else
        local l_newItemNotifications_1 = v89.props.newItemNotifications;
        if v38() then
            return v28.shouldNotifyCategory(v90, l_newItemNotifications_1);
        else
            local l_AssetTypeIdStrings_1 = v90.AssetTypeIdStrings;
            if l_AssetTypeIdStrings_1 and v28.shouldNotifyAssetTypes(l_AssetTypeIdStrings_1, l_newItemNotifications_1) then
                return true;
            else
                local v93 = false;
                if v90.SearchUuid == v27.PurchasedCharacterKey then
                    v93 = l_newItemNotifications_1[v26.NewOutfitNotificationKey];
                end;
                local v94 = false;
                if v90.OutfitType == v26.OutfitTypes.DynamicHead then
                    v94 = l_newItemNotifications_1[v26.NewDHOutfitNotificationKey];
                end;
                if v93 or v94 then
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end;
end;
v48.onTooltipDismiss = function(_, v96) --[[ Line: 349 ]] --[[ Name: onTooltipDismiss ]]
    -- upvalues: v49 (copy), v34 (copy)
    if v49[v96.Name] then
        v34.setSeenTimestamp();
    end;
end;
v48.renderCategoryButton = function(v97, v98, v99, v100, v101, v102) --[[ Line: 355 ]] --[[ Name: renderCategoryButton ]]
    -- upvalues: v36 (copy), v35 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_withLocalization_0 (copy), v49 (copy), v34 (copy), v5 (copy), l_Focusable_0 (copy), v29 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXCategoryUnifiedLogging_0 (copy), l_FFlagAXSubNavigationRefsById_0 (copy), l_sendUnifiedEventLogForInstance_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy)
    local v103 = v100 == v101;
    if v97.props.shouldUseCategoryId then
        v103 = v97.props.selectedSubcategoryId == v102.Id;
    end;
    local l_subcategories_0 = v97.props.subcategories;
    local l_selectSubcategory_0 = v97.props.selectSubcategory;
    local l_selectSubcategoryId_0 = v97.props.selectSubcategoryId;
    local v107 = nil;
    if v36.isEnabled() then
        v107 = v35.readTestVariable(v36.EnableHeadCategoryCombination);
    end;
    local v108 = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v97.props.navButtonRefs else v97.navButtonRefs;
    if v36.isEnabled() and v107 then
        return l_withLocalization_0({
            headCombineTooltipTitle = "Feature.Avatar.Label.HeadRefinement.CombinedCategories.Tooltip"
        })(function(v109) --[[ Line: 382 ]]
            -- upvalues: v49 (ref), v102 (copy), v34 (ref), v5 (ref), l_Focusable_0 (ref), v29 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v101 (copy), v103 (ref), v97 (copy), l_subcategories_0 (copy), l_FFlagAXCategoryUnifiedLogging_0 (ref), v108 (copy), l_FFlagAXSubNavigationRefsById_0 (ref), l_sendUnifiedEventLogForInstance_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_selectSubcategoryId_0 (copy), v99 (copy), l_selectSubcategory_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v98 (copy), v7 (ref)
            local v110 = nil;
            if v49[v102.Name] and v34.shouldShowTooltip() then
                v110 = v109.headCombineTooltipTitle;
            end;
            return v5.createElement(l_Focusable_0[v29], {
                categoryTitle = v102.Title, 
                localizedCategoryTitle = if l_FFlagAXCatalogCategoriesSDUI_0 then v102.LocalizedTitle else nil, 
                layoutOrder = v101, 
                isSelected = v103, 
                shouldUseCategoryId = v97.props.shouldUseCategoryId, 
                hasNewItemNotification = if v97.props.shouldUseCategoryId then v97:hasNewItemNotificationV2(v102) else v97:hasNewItemNotification(v101, l_subcategories_0), 
                frameRef = v97:getCategoryButtonRef(if v97.props.shouldUseCategoryId then v102.Id else v101), 
                onActivate = function() --[[ Line: 401 ]] --[[ Name: onActivate ]]
                    -- upvalues: l_FFlagAXCategoryUnifiedLogging_0 (ref), v108 (ref), l_FFlagAXSubNavigationRefsById_0 (ref), v97 (ref), v102 (ref), v101 (ref), l_sendUnifiedEventLogForInstance_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_selectSubcategoryId_0 (ref), v99 (ref), l_selectSubcategory_0 (ref)
                    if l_FFlagAXCategoryUnifiedLogging_0 then
                        local v111 = v108[if l_FFlagAXSubNavigationRefsById_0 and v97.props.shouldUseCategoryId then v102.Id else v101];
                        if v111 and v111.current then
                            l_sendUnifiedEventLogForInstance_0(v111.current, {
                                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                                elementName = "SELECT_SUBCATEGORY_" .. string.upper(v102.Name), 
                                surface = v97.props.unifiedLoggingSurface
                            });
                        end;
                    end;
                    if v97.props.shouldUseCategoryId then
                        l_selectSubcategoryId_0(v99, v102.Id);
                        return;
                    else
                        l_selectSubcategory_0(v99, v101);
                        return;
                    end;
                end, 
                tooltipTitle = v110, 
                isHidden = v97.props.isHidden, 
                onTooltipDismiss = function() --[[ Line: 424 ]] --[[ Name: onTooltipDismiss ]]
                    -- upvalues: v97 (ref), v102 (ref)
                    v97:onTooltipDismiss(v102);
                end, 
                [v5.Ref] = v108[if l_FFlagAXSubNavigationRefsById_0 and v97.props.shouldUseCategoryId then v102.Id else v101], 
                NextSelectionLeft = if v101 > 1 then v108[if l_FFlagAXSubNavigationRefsById_0 and v97.props.shouldUseCategoryId then l_subcategories_0[v101 - 1].Id else v101 - 1] else nil, 
                NextSelectionRight = if v101 < #l_subcategories_0 then v108[if l_FFlagAXSubNavigationRefsById_0 and v97.props.shouldUseCategoryId then l_subcategories_0[v101 + 1].Id else v101 + 1] else nil, 
                inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else v98 ~= nil and {
                    ShiftLeft = v7.Input.onBegin(Enum.KeyCode.ButtonL1, function() --[[ Line: 444 ]]
                        -- upvalues: v101 (ref), v98 (ref)
                        if v101 > 1 then
                            v98.moveFocusLeft();
                        end;
                    end), 
                    ShiftRight = v7.Input.onBegin(Enum.KeyCode.ButtonR1, function() --[[ Line: 449 ]]
                        -- upvalues: v101 (ref), l_subcategories_0 (ref), v98 (ref)
                        if v101 < #l_subcategories_0 then
                            v98.moveFocusRight();
                        end;
                    end)
                } or nil
            });
        end);
    else
        return v5.createElement(l_Focusable_0[v29], {
            shouldUseCategoryId = v97.props.shouldUseCategoryId, 
            categoryTitle = v102.Title, 
            localizedCategoryTitle = if l_FFlagAXCatalogCategoriesSDUI_0 then v102.LocalizedTitle else nil, 
            layoutOrder = v101, 
            isSelected = v103, 
            hasNewItemNotification = if v97.props.shouldUseCategoryId then v97:hasNewItemNotificationV2(v102) else v97:hasNewItemNotification(v101, l_subcategories_0), 
            frameRef = v97:getCategoryButtonRef(if v97.props.shouldUseCategoryId then v102.Id else v101), 
            onActivate = function() --[[ Line: 469 ]] --[[ Name: onActivate ]]
                -- upvalues: l_FFlagAXCategoryUnifiedLogging_0 (ref), v108 (copy), l_FFlagAXSubNavigationRefsById_0 (ref), v97 (copy), v102 (copy), v101 (copy), l_sendUnifiedEventLogForInstance_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_selectSubcategoryId_0 (copy), v99 (copy), l_selectSubcategory_0 (copy)
                if l_FFlagAXCategoryUnifiedLogging_0 then
                    local v112 = v108[if l_FFlagAXSubNavigationRefsById_0 and v97.props.shouldUseCategoryId then v102.Id else v101];
                    if v112 and v112.current then
                        l_sendUnifiedEventLogForInstance_0(v112.current, {
                            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                            elementName = "SELECT_SUBCATEGORY_" .. string.upper(v102.Name), 
                            surface = v97.props.unifiedLoggingSurface
                        });
                    end;
                end;
                if v97.props.shouldUseCategoryId then
                    l_selectSubcategoryId_0(v99, v102.Id);
                    return;
                else
                    l_selectSubcategory_0(v99, v101);
                    return;
                end;
            end, 
            [v5.Ref] = v108[if l_FFlagAXSubNavigationRefsById_0 and v97.props.shouldUseCategoryId then v102.Id else v101], 
            NextSelectionLeft = if v101 > 1 then v108[if l_FFlagAXSubNavigationRefsById_0 and v97.props.shouldUseCategoryId then l_subcategories_0[v101 - 1].Id else v101 - 1] else nil, 
            NextSelectionRight = if v101 < #l_subcategories_0 then v108[if l_FFlagAXSubNavigationRefsById_0 and v97.props.shouldUseCategoryId then l_subcategories_0[v101 + 1].Id else v101 + 1] else nil, 
            inputBindings = if l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else v98 ~= nil and {
                ShiftLeft = v7.Input.onBegin(Enum.KeyCode.ButtonL1, function() --[[ Line: 505 ]]
                    -- upvalues: v101 (copy), v98 (copy)
                    if v101 > 1 then
                        v98.moveFocusLeft();
                    end;
                end), 
                ShiftRight = v7.Input.onBegin(Enum.KeyCode.ButtonR1, function() --[[ Line: 510 ]]
                    -- upvalues: v101 (copy), l_subcategories_0 (copy), v98 (copy)
                    if v101 < #l_subcategories_0 then
                        v98.moveFocusRight();
                    end;
                end)
            } or nil
        });
    end;
end;
v48.renderSubNavFrameChildren = function(v113, v114) --[[ Line: 519 ]] --[[ Name: renderSubNavFrameChildren ]]
    -- upvalues: l_FFlagAXSubNavigationRefsById_0 (copy)
    local l_subcategories_1 = v113.props.subcategories;
    local l_selectedSubcategoryIndex_0 = v113.props.selectedSubcategoryIndex;
    local l_selectedCategoryIndex_0 = v113.props.selectedCategoryIndex;
    local v118 = {};
    if l_subcategories_1 then
        for v119, v120 in l_subcategories_1 do
            local v121 = nil;
            if l_FFlagAXSubNavigationRefsById_0 then
                v121 = if v113.props.shouldUseCategoryId then tostring(v120.Id) else v120.Name;
            end;
            v118[if l_FFlagAXSubNavigationRefsById_0 then v121 else v120.Name] = v113:renderCategoryButton(v114, if v113.props.shouldUseCategoryId then v113.props.selectedCategoryId else l_selectedCategoryIndex_0, if v113.props.shouldUseCategoryId then v113.props.selectedSubcategoryId else l_selectedSubcategoryIndex_0, v119, v120);
        end;
    end;
    return v118;
end;
v48.getScrollingListChildren = function(v122) --[[ Line: 550 ]] --[[ Name: getScrollingListChildren ]]
    -- upvalues: v25 (copy), l_RoactFitComponents_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_FFlagAXSubNavigationRefsById_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v5 (copy), l_Focusable_0 (copy), l_FitFrameHorizontal_0 (copy), v7 (copy), v30 (copy)
    local l_subNavigationRef_0 = v122.props.subNavigationRef;
    local v124 = not (v122.props.lastInputGroup == v25.InputType.Gamepad) and v122.state.renderHighlight;
    local l_selectedSubcategoryIndex_1 = v122.props.selectedSubcategoryIndex;
    local v126 = UDim.new(0, 15);
    local v127 = l_RoactFitComponents_0.Rect.rectangle(10, 0);
    local v128 = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v122.props.navButtonRefs else v122.navButtonRefs;
    local v129 = (not (l_selectedSubcategoryIndex_1 ~= 0) or l_selectedSubcategoryIndex_1 == nil) and 1 or l_selectedSubcategoryIndex_1;
    if l_FFlagAXSubNavigationRefsById_0 and v122.props.shouldUseCategoryId then
        local l_subcategories_2 = v122.props.subcategories;
        v129 = if v122.props.selectedSubcategoryId then v122.props.selectedSubcategoryId else if l_subcategories_2 and #l_subcategories_2 > 0 then l_subcategories_2[1].Id else nil;
    end;
    return {
        SubNavFrame = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v5.createElement(l_Focusable_0[l_FitFrameHorizontal_0], {
            height = UDim.new(1, 0), 
            contentPadding = v126, 
            margin = v127, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal, 
            BackgroundTransparency = 1, 
            [v5.Change.AbsoluteSize] = v122.onNavFrameSizeChanged, 
            [v5.Ref] = l_subNavigationRef_0, 
            NextSelectionUp = v122.props.NextSelectionUp, 
            NextSelectionDown = v122.props.NextSelectionDown, 
            defaultChild = if not l_FFlagAXSubNavigationRefsById_0 then v128[v129] else if v129 then v128[v129] else nil
        }, v122:renderSubNavFrameChildren()) else v7.withFocusController(function(v131) --[[ Line: 598 ]]
            -- upvalues: v5 (ref), l_Focusable_0 (ref), l_FitFrameHorizontal_0 (ref), v126 (copy), v127 (copy), v122 (copy), l_subNavigationRef_0 (copy), l_FFlagAXSubNavigationRefsById_0 (ref), v128 (copy), v129 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v7 (ref)
            return v5.createElement(l_Focusable_0[l_FitFrameHorizontal_0], {
                height = UDim.new(1, 0), 
                contentPadding = v126, 
                margin = v127, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                [v5.Change.AbsoluteSize] = v122.onNavFrameSizeChanged, 
                [v5.Ref] = l_subNavigationRef_0, 
                NextSelectionUp = v122.props.NextSelectionUp, 
                NextSelectionDown = v122.props.NextSelectionDown, 
                defaultChild = if not l_FFlagAXSubNavigationRefsById_0 then v128[v129] else if v129 then v128[v129] else nil, 
                inputBindings = if l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else {
                    ToMainNav = v7.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 617 ]]
                        -- upvalues: v131 (copy)
                        v131.moveFocusUp();
                    end)
                }
            }, v122:renderSubNavFrameChildren(v131));
        end), 
        Highlight = v124 and v5.createElement(v30, {
            scrollingFrameRef = v122.scrollingFrameRef, 
            selectedCategoryButtonInstance = v122.state.selectedCategoryButtonInstance
        })
    };
end;
v48.getSubNavigationChildren = function(v132, _, v134) --[[ Line: 631 ]] --[[ Name: getSubNavigationChildren ]]
    -- upvalues: v5 (copy), v37 (copy)
    local l_selectedCategoryIndex_1 = v132.props.selectedCategoryIndex;
    local v136 = nil;
    v136 = if v132.props.shouldUseCategoryId then v132.props.selectedCategoryId else tostring(l_selectedCategoryIndex_1);
    return {
        ScrollingListWithArrowsAndGradient = v5.createElement(v37, {
            getScollingListContent = function() --[[ Line: 644 ]] --[[ Name: getScollingListContent ]]
                -- upvalues: v132 (copy)
                return v132:getScrollingListChildren();
            end, 
            listHeight = v134, 
            scrollingFrameRef = v132.scrollingFrameRef, 
            buttonRefs = v132.categoryButtonRefs, 
            childWidgetIndex = v136, 
            useIntroScroll = true, 
            buttonPadding = 15
        })
    };
end;
v48.render = function(v137) --[[ Line: 657 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), l_SpringAnimatedItem_0 (copy), v38 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), v57 (copy), v50 (copy)
    local l_layoutOrder_0 = v137.props.layoutOrder;
    local l_navHeight_0 = v137.props.navHeight;
    if not v137.props.subcategories then
        l_navHeight_0 = 0;
    end;
    return (l_withStyle_0(function(v140) --[[ Line: 666 ]]
        -- upvalues: v5 (ref), l_SpringAnimatedItem_0 (ref), v38 (ref), v137 (copy), l_layoutOrder_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), l_navHeight_0 (ref), v57 (ref), v50 (ref)
        local l_Theme_0 = v140.Theme;
        return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundColor3 = if v38() and v137.props.BackgroundColor3 then v137.props.BackgroundColor3 else l_Theme_0.BackgroundContrast.Color, 
                BackgroundTransparency = if v38() and v137.props.BackgroundTransparency then v137.props.BackgroundTransparency else l_Theme_0.BackgroundContrast.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = l_layoutOrder_0, 
                ClipsDescendants = true, 
                [v5.Ref] = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v137.props.frameRef else nil
            }, 
            animatedValues = {
                height = l_navHeight_0
            }, 
            mapValuesToProps = v57, 
            springOptions = v50
        }, v137:getSubNavigationChildren(l_Theme_0, l_navHeight_0));
    end));
end;
v48 = v32((v9.connect(function(v142, _) --[[ Line: 694 ]]
    -- upvalues: l_FFlagAXCategoryUnifiedLogging_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_AvatarScreenProperties_0 (copy)
    local v144 = nil;
    local v145 = nil;
    if l_FFlagAXCategoryUnifiedLogging_0 then
        v144 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentRoactNavigationRoute(v142) else v142.Navigation and v142.Navigation.currentRoute;
        v145 = v144 and l_AvatarScreenProperties_0[v144.routeName];
    end;
    return {
        newItemNotifications = v142.AvatarExperience.AvatarEditor.NewItemNotifications, 
        unifiedLoggingSurface = if l_FFlagAXCategoryUnifiedLogging_0 and v145 and v145.analyticsData then v145.analyticsData.unifiedLoggingSurface else nil
    };
end, nil)(v48)));
v48 = v12.withNavigation(v48);
if l_FFlagAXMigrateMainNavigationInputBindings_0 then
    return function(v146) --[[ Line: 717 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), l_useFocusGuiObject_0 (copy), v6 (copy), l_findValueKeyInRefCache_0 (copy), l_GuiService_0 (copy), l_FFlagAXSubNavigationRefsById_0 (copy), v39 (copy), l_useTableWrappedCallbackRef_0 (copy), v48 (ref)
        local v147 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useFocusController();
        local v148 = v7.useRefCache();
        local v149 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v157 = v6.useCallback(function(v150) --[[ Line: 722 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v148 (copy), l_FFlagAXSubNavigationRefsById_0 (ref), v146 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v149 (copy), v147 (copy)
            local v151 = false;
            v150.cancelled = true;
            local v152 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v148);
            if l_FFlagAXSubNavigationRefsById_0 and v146.shouldUseCategoryId then
                local l_subcategories_3 = v146.subcategories;
                local v154;
                if not l_subcategories_3 or not v152 then
                    v154 = nil;
                else
                    for v155, v156 in l_subcategories_3 do
                        if v156.Id == v152 then
                            v154 = v155;
                            v151 = true;
                        end;
                        if v151 then
                            break;
                        end;
                    end;
                    if not v151 then
                        v154 = nil;
                    end;
                end;
                v151 = false;
                if v154 and v154 > 1 then
                    l_subcategories_3 = v146.subcategories[v154 - 1].Id;
                    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                        if v149 and v148[l_subcategories_3] then
                            v149(v148[l_subcategories_3].current);
                            return;
                        end;
                    else
                        v147.moveFocusLeft();
                        return;
                    end;
                end;
            elseif v152 and v152 > 1 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v149 then
                        v149(v148[v152 - 1].current);
                        return;
                    end;
                else
                    v147.moveFocusLeft();
                end;
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v149 else v147, 
            if l_FFlagAXSubNavigationRefsById_0 then v146.shouldUseCategoryId else nil, 
            if l_FFlagAXSubNavigationRefsById_0 then v146.subcategories else nil
        });
        local v166 = v6.useCallback(function(v158) --[[ Line: 756 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v148 (copy), l_FFlagAXSubNavigationRefsById_0 (ref), v146 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v149 (copy), v147 (copy)
            local v159 = false;
            v158.cancelled = true;
            local v160 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v148);
            if l_FFlagAXSubNavigationRefsById_0 and v146.shouldUseCategoryId then
                local l_subcategories_4 = v146.subcategories;
                local v162;
                if not l_subcategories_4 or not v160 then
                    v162 = nil;
                else
                    for v163, v164 in l_subcategories_4 do
                        if v164.Id == v160 then
                            v162 = v163;
                            v159 = true;
                        end;
                        if v159 then
                            break;
                        end;
                    end;
                    if not v159 then
                        v162 = nil;
                    end;
                end;
                v159 = false;
                if v162 and l_subcategories_4 and v162 < #l_subcategories_4 then
                    local l_Id_0 = l_subcategories_4[v162 + 1].Id;
                    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                        if v149 and v148[l_Id_0] then
                            v149(v148[l_Id_0].current);
                            return;
                        end;
                    else
                        v147.moveFocusRight();
                        return;
                    end;
                end;
            elseif v160 and v160 < #v148 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v149 then
                        v149(v148[v160 + 1].current);
                        return;
                    end;
                else
                    v147.moveFocusRight();
                end;
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v149 else v147, 
            if l_FFlagAXSubNavigationRefsById_0 then v146.shouldUseCategoryId else nil, 
            if l_FFlagAXSubNavigationRefsById_0 then v146.subcategories else nil
        });
        local v168 = v6.useCallback(function(v167) --[[ Line: 791 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v149 (copy), v146 (copy), v147 (copy)
            v167.cancelled = true;
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v149 and v146.NextSelectionUp and v146.NextSelectionUp.current then
                    v149(v146.NextSelectionUp.current);
                    return;
                end;
            else
                v147.moveFocusUp();
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v149 else v147, 
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v146.NextSelectionUp else nil
        });
        local v169 = v39({
            onTabBackward = v157, 
            onTabForward = v166, 
            onNavigateBack = v168
        });
        local v170 = l_useTableWrappedCallbackRef_0(v169);
        local v171 = table.clone(v146);
        v171.frameRef = v170;
        v171.navButtonRefs = v148;
        return v6.createElement(v48, v171);
    end;
else
    return v48;
end;