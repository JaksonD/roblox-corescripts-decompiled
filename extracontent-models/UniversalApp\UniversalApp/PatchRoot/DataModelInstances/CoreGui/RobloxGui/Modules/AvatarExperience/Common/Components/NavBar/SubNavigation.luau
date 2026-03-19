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
local v19 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_findValueKeyInRefCache_0 = v19.Utils.RoactGamepadMigration.findValueKeyInRefCache;
local l_useTableWrappedCallbackRef_0 = v19.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v22 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMigrateMainNavigationInputBindings_0 = v22.FFlagAXMigrateMainNavigationInputBindings;
local v24 = require(l_Modules_0.LuaApp.Constants);
local v25 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.DEPRECATED_CategoryButton);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavHighlight);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v33 = require(l_Modules_0.AvatarExperience.Common.Util.HeadCategoryTooltipStorage);
local v34 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v35 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP);
local v36 = require(l_Modules_0.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient);
local v37 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v38 = require(script.Parent.useTabNavigationFocusNavigationBindings);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogCategoriesSDUI_0 = v22.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXSubNavigationRefsById_0 = v22.FFlagAXSubNavigationRefsById;
local l_FFlagAXCategoryUnifiedLogging_0 = v22.FFlagAXCategoryUnifiedLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventLogForInstance_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventLogForInstance;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v46 = v5.PureComponent:extend("SubNavigation");
local v47 = {
    Style = true, 
    Heads = not v35.isEnabled() or nil
};
local v48 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local function _(v49, v50) --[[ Line: 86 ]] --[[ Name: findSubcategoryIndexById ]]
    if not v49 or not v50 then
        return nil;
    else
        for v51, v52 in v49 do
            if v52.Id == v50 then
                return v51;
            end;
        end;
        return nil;
    end;
end;
v46.validateProps = v4.strictInterface({
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
    isHidden = if v35.isEnabled() then v4.optional(v4.boolean) else nil, 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    BackgroundColor3 = if v37() then v4.optional(v4.Color3) else nil, 
    BackgroundTransparency = if v37() then v4.optional(v4.number) else nil, 
    subNavigationRef = v4.optional(v4.table), 
    lastInputGroup = v4.string, 
    newItemNotifications = v4.table, 
    unifiedLoggingSurface = if l_FFlagAXCategoryUnifiedLogging_0 then v4.optional(v4.integer) else nil, 
    navigation = v4.table, 
    frameRef = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v4.table else nil, 
    navButtonRefs = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v4.table else nil
});
local function v55(v54) --[[ Line: 138 ]] --[[ Name: animatedFrameMapValuesToProps ]]
    return {
        Size = UDim2.new(1, 0, 0, v54.height)
    };
end;
v46.init = function(v56) --[[ Line: 144 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), v7 (copy)
    v56.scrollingFrameRef = v5.createRef();
    v56.navButtonRefs = if l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else v7.createRefCache();
    v56.categoryButtonRefs = {};
    v56:setState({
        selectedCategoryButtonInstance = nil, 
        renderHighlight = false
    });
    v56.onNavFrameSizeChanged = function(v57) --[[ Line: 156 ]]
        -- upvalues: v56 (copy)
        if v56.scrollingFrameRef.current then
            v56.scrollingFrameRef.current.CanvasSize = UDim2.new(0, v57.AbsoluteSize.X, 1, 0);
        end;
    end;
end;
v46.getCategoryButtonRef = function(v58, v59) --[[ Line: 163 ]] --[[ Name: getCategoryButtonRef ]]
    -- upvalues: v5 (copy)
    if not v58.categoryButtonRefs[v59] then
        v58.categoryButtonRefs[v59] = v5.createRef();
    end;
    return v58.categoryButtonRefs[v59];
end;
v46.tryUpdateScrollingFramePosition = function(v60, v61, v62) --[[ Line: 171 ]] --[[ Name: tryUpdateScrollingFramePosition ]]
    local v63 = v60.scrollingFrameRef and v60.scrollingFrameRef:getValue();
    local v64 = (v61 or 0) - 50;
    if v63 then
        local l_X_0 = v63.AbsoluteWindowSize.X;
        if not l_X_0 or l_X_0 == 0 then
            return;
        else
            local v66 = false;
            if v61 + v62 > 0 then
                v66 = v61 + v62 < l_X_0;
            end;
            local v67 = false;
            if v61 > 0 then
                v67 = v61 < l_X_0;
            end;
            if not v67 and not v66 then
                v63.CanvasPosition = Vector2.new(v64, v63.CanvasPosition.Y);
            end;
        end;
    end;
end;
v46.setCategoryPositionAndWidthState = function(v68) --[[ Line: 194 ]] --[[ Name: setCategoryPositionAndWidthState ]]
    if v68.props.shouldUseCategoryId then
        if not v68.categoryButtonRefs or not v68.props.selectedSubcategoryId or not v68.categoryButtonRefs[v68.props.selectedSubcategoryId] then
            v68:setState({
                renderHighlight = false
            });
            return false;
        end;
    elseif not v68.categoryButtonRefs or not v68.props.selectedSubcategoryIndex or not v68.categoryButtonRefs[v68.props.selectedSubcategoryIndex] then
        v68:setState({
            renderHighlight = false
        });
        return false;
    end;
    local v69 = v68.categoryButtonRefs[if v68.props.shouldUseCategoryId then v68.props.selectedSubcategoryId else v68.props.selectedSubcategoryIndex]:getValue();
    if v69 == nil then
        v68:setState({
            renderHighlight = false
        });
        return false;
    else
        v68:tryUpdateScrollingFramePosition(v69.AbsolutePosition.X, v69.AbsoluteSize.X);
        v68:setState({
            selectedCategoryButtonInstance = v69, 
            renderHighlight = true
        });
        return true;
    end;
end;
v46.didMount = function(v70) --[[ Line: 248 ]] --[[ Name: didMount ]]
    v70:setCategoryPositionAndWidthState();
    if v70.scrollingFrameRef.current then
        v70.scrollingFrameRef.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Once(function() --[[ Line: 259 ]]
            -- upvalues: v70 (copy)
            v70:setCategoryPositionAndWidthState();
        end);
    end;
end;
v46.didUpdate = function(v71, v72) --[[ Line: 265 ]] --[[ Name: didUpdate ]]
    v71.props.onSubNavigationPropsDidUpdate(v72, v71.scrollingFrameRef);
    if v71.props.shouldUseCategoryId then
        if v71.props.selectedSubcategoryId ~= v72.selectedSubcategoryId or v71.props.selectedCategoryId ~= v72.selectedCategoryId then
            v71:setCategoryPositionAndWidthState();
            return;
        end;
    elseif v71.props.selectedSubcategoryIndex ~= v72.selectedSubcategoryIndex or v71.props.selectedCategoryIndex ~= v72.selectedCategoryIndex then
        v71:setCategoryPositionAndWidthState();
    end;
end;
v46.getRouteName = function(v73) --[[ Line: 286 ]] --[[ Name: getRouteName ]]
    return v73.props.navigation.state.routeName;
end;
local function _(v74, v75) --[[ Line: 291 ]] --[[ Name: hasOutfitNotification ]]
    -- upvalues: v26 (copy), v25 (copy)
    local v76 = false;
    if v74.SearchUuid == v26.PurchasedCharacterKey then
        v76 = v75[v25.NewOutfitNotificationKey];
    end;
    local v77 = false;
    if v74.OutfitType == v25.OutfitTypes.DynamicHead then
        v77 = v75[v25.NewDHOutfitNotificationKey];
    end;
    return v76 or v77;
end;
v46.hasNewItemNotification = function(v79, v80, v81) --[[ Line: 300 ]] --[[ Name: hasNewItemNotification ]]
    -- upvalues: l_AvatarScreen_0 (copy), v37 (copy), v27 (copy), v26 (copy), v25 (copy)
    if v79:getRouteName() ~= l_AvatarScreen_0.AvatarEditor then
        return false;
    else
        local l_newItemNotifications_0 = v79.props.newItemNotifications;
        local v83 = v81[v80];
        if v37() then
            return v27.shouldNotifyCategory(v83, l_newItemNotifications_0);
        else
            local l_AssetTypeIdStrings_0 = v83.AssetTypeIdStrings;
            if l_AssetTypeIdStrings_0 and v27.shouldNotifyAssetTypes(l_AssetTypeIdStrings_0, l_newItemNotifications_0) then
                return true;
            else
                local v85 = false;
                if v83.SearchUuid == v26.PurchasedCharacterKey then
                    v85 = l_newItemNotifications_0[v25.NewOutfitNotificationKey];
                end;
                local v86 = false;
                if v83.OutfitType == v25.OutfitTypes.DynamicHead then
                    v86 = l_newItemNotifications_0[v25.NewDHOutfitNotificationKey];
                end;
                if v85 or v86 then
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end;
end;
v46.hasNewItemNotificationV2 = function(v87, v88) --[[ Line: 324 ]] --[[ Name: hasNewItemNotificationV2 ]]
    -- upvalues: l_AvatarScreen_0 (copy), v37 (copy), v27 (copy), v26 (copy), v25 (copy)
    if v87:getRouteName() ~= l_AvatarScreen_0.AvatarEditor then
        return false;
    else
        local l_newItemNotifications_1 = v87.props.newItemNotifications;
        if v37() then
            return v27.shouldNotifyCategory(v88, l_newItemNotifications_1);
        else
            local l_AssetTypeIdStrings_1 = v88.AssetTypeIdStrings;
            if l_AssetTypeIdStrings_1 and v27.shouldNotifyAssetTypes(l_AssetTypeIdStrings_1, l_newItemNotifications_1) then
                return true;
            else
                local v91 = false;
                if v88.SearchUuid == v26.PurchasedCharacterKey then
                    v91 = l_newItemNotifications_1[v25.NewOutfitNotificationKey];
                end;
                local v92 = false;
                if v88.OutfitType == v25.OutfitTypes.DynamicHead then
                    v92 = l_newItemNotifications_1[v25.NewDHOutfitNotificationKey];
                end;
                if v91 or v92 then
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end;
end;
v46.onTooltipDismiss = function(_, v94) --[[ Line: 347 ]] --[[ Name: onTooltipDismiss ]]
    -- upvalues: v47 (copy), v33 (copy)
    if v47[v94.Name] then
        v33.setSeenTimestamp();
    end;
end;
v46.renderCategoryButton = function(v95, v96, v97, v98, v99, v100) --[[ Line: 353 ]] --[[ Name: renderCategoryButton ]]
    -- upvalues: v35 (copy), v34 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_withLocalization_0 (copy), v47 (copy), v33 (copy), v5 (copy), l_Focusable_0 (copy), v28 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXCategoryUnifiedLogging_0 (copy), l_FFlagAXSubNavigationRefsById_0 (copy), l_sendUnifiedEventLogForInstance_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy)
    local v101 = v98 == v99;
    if v95.props.shouldUseCategoryId then
        v101 = v95.props.selectedSubcategoryId == v100.Id;
    end;
    local l_subcategories_0 = v95.props.subcategories;
    local l_selectSubcategory_0 = v95.props.selectSubcategory;
    local l_selectSubcategoryId_0 = v95.props.selectSubcategoryId;
    local v105 = nil;
    if v35.isEnabled() then
        v105 = v34.readTestVariable(v35.EnableHeadCategoryCombination);
    end;
    local v106 = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v95.props.navButtonRefs else v95.navButtonRefs;
    if v35.isEnabled() and v105 then
        return l_withLocalization_0({
            headCombineTooltipTitle = "Feature.Avatar.Label.HeadRefinement.CombinedCategories.Tooltip"
        })(function(v107) --[[ Line: 380 ]]
            -- upvalues: v47 (ref), v100 (copy), v33 (ref), v5 (ref), l_Focusable_0 (ref), v28 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v99 (copy), v101 (ref), v95 (copy), l_subcategories_0 (copy), l_FFlagAXCategoryUnifiedLogging_0 (ref), v106 (copy), l_FFlagAXSubNavigationRefsById_0 (ref), l_sendUnifiedEventLogForInstance_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_selectSubcategoryId_0 (copy), v97 (copy), l_selectSubcategory_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v96 (copy), v7 (ref)
            local v108 = nil;
            if v47[v100.Name] and v33.shouldShowTooltip() then
                v108 = v107.headCombineTooltipTitle;
            end;
            return v5.createElement(l_Focusable_0[v28], {
                categoryTitle = v100.Title, 
                localizedCategoryTitle = if l_FFlagAXCatalogCategoriesSDUI_0 then v100.LocalizedTitle else nil, 
                layoutOrder = v99, 
                isSelected = v101, 
                shouldUseCategoryId = v95.props.shouldUseCategoryId, 
                hasNewItemNotification = if v95.props.shouldUseCategoryId then v95:hasNewItemNotificationV2(v100) else v95:hasNewItemNotification(v99, l_subcategories_0), 
                frameRef = v95:getCategoryButtonRef(if v95.props.shouldUseCategoryId then v100.Id else v99), 
                onActivate = function() --[[ Line: 399 ]] --[[ Name: onActivate ]]
                    -- upvalues: l_FFlagAXCategoryUnifiedLogging_0 (ref), v106 (ref), l_FFlagAXSubNavigationRefsById_0 (ref), v95 (ref), v100 (ref), v99 (ref), l_sendUnifiedEventLogForInstance_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_selectSubcategoryId_0 (ref), v97 (ref), l_selectSubcategory_0 (ref)
                    if l_FFlagAXCategoryUnifiedLogging_0 then
                        local v109 = v106[if l_FFlagAXSubNavigationRefsById_0 and v95.props.shouldUseCategoryId then v100.Id else v99];
                        if v109 and v109.current then
                            l_sendUnifiedEventLogForInstance_0(v109.current, {
                                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                                elementName = "SELECT_SUBCATEGORY_" .. string.upper(v100.Name), 
                                surface = v95.props.unifiedLoggingSurface
                            });
                        end;
                    end;
                    if v95.props.shouldUseCategoryId then
                        l_selectSubcategoryId_0(v97, v100.Id);
                        return;
                    else
                        l_selectSubcategory_0(v97, v99);
                        return;
                    end;
                end, 
                tooltipTitle = v108, 
                isHidden = v95.props.isHidden, 
                onTooltipDismiss = function() --[[ Line: 422 ]] --[[ Name: onTooltipDismiss ]]
                    -- upvalues: v95 (ref), v100 (ref)
                    v95:onTooltipDismiss(v100);
                end, 
                [v5.Ref] = v106[if l_FFlagAXSubNavigationRefsById_0 and v95.props.shouldUseCategoryId then v100.Id else v99], 
                NextSelectionLeft = if v99 > 1 then v106[if l_FFlagAXSubNavigationRefsById_0 and v95.props.shouldUseCategoryId then l_subcategories_0[v99 - 1].Id else v99 - 1] else nil, 
                NextSelectionRight = if v99 < #l_subcategories_0 then v106[if l_FFlagAXSubNavigationRefsById_0 and v95.props.shouldUseCategoryId then l_subcategories_0[v99 + 1].Id else v99 + 1] else nil, 
                inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else v96 ~= nil and {
                    ShiftLeft = v7.Input.onBegin(Enum.KeyCode.ButtonL1, function() --[[ Line: 442 ]]
                        -- upvalues: v99 (ref), v96 (ref)
                        if v99 > 1 then
                            v96.moveFocusLeft();
                        end;
                    end), 
                    ShiftRight = v7.Input.onBegin(Enum.KeyCode.ButtonR1, function() --[[ Line: 447 ]]
                        -- upvalues: v99 (ref), l_subcategories_0 (ref), v96 (ref)
                        if v99 < #l_subcategories_0 then
                            v96.moveFocusRight();
                        end;
                    end)
                } or nil
            });
        end);
    else
        return v5.createElement(l_Focusable_0[v28], {
            shouldUseCategoryId = v95.props.shouldUseCategoryId, 
            categoryTitle = v100.Title, 
            localizedCategoryTitle = if l_FFlagAXCatalogCategoriesSDUI_0 then v100.LocalizedTitle else nil, 
            layoutOrder = v99, 
            isSelected = v101, 
            hasNewItemNotification = if v95.props.shouldUseCategoryId then v95:hasNewItemNotificationV2(v100) else v95:hasNewItemNotification(v99, l_subcategories_0), 
            frameRef = v95:getCategoryButtonRef(if v95.props.shouldUseCategoryId then v100.Id else v99), 
            onActivate = function() --[[ Line: 467 ]] --[[ Name: onActivate ]]
                -- upvalues: l_FFlagAXCategoryUnifiedLogging_0 (ref), v106 (copy), l_FFlagAXSubNavigationRefsById_0 (ref), v95 (copy), v100 (copy), v99 (copy), l_sendUnifiedEventLogForInstance_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_selectSubcategoryId_0 (copy), v97 (copy), l_selectSubcategory_0 (copy)
                if l_FFlagAXCategoryUnifiedLogging_0 then
                    local v110 = v106[if l_FFlagAXSubNavigationRefsById_0 and v95.props.shouldUseCategoryId then v100.Id else v99];
                    if v110 and v110.current then
                        l_sendUnifiedEventLogForInstance_0(v110.current, {
                            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                            elementName = "SELECT_SUBCATEGORY_" .. string.upper(v100.Name), 
                            surface = v95.props.unifiedLoggingSurface
                        });
                    end;
                end;
                if v95.props.shouldUseCategoryId then
                    l_selectSubcategoryId_0(v97, v100.Id);
                    return;
                else
                    l_selectSubcategory_0(v97, v99);
                    return;
                end;
            end, 
            [v5.Ref] = v106[if l_FFlagAXSubNavigationRefsById_0 and v95.props.shouldUseCategoryId then v100.Id else v99], 
            NextSelectionLeft = if v99 > 1 then v106[if l_FFlagAXSubNavigationRefsById_0 and v95.props.shouldUseCategoryId then l_subcategories_0[v99 - 1].Id else v99 - 1] else nil, 
            NextSelectionRight = if v99 < #l_subcategories_0 then v106[if l_FFlagAXSubNavigationRefsById_0 and v95.props.shouldUseCategoryId then l_subcategories_0[v99 + 1].Id else v99 + 1] else nil, 
            inputBindings = if l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else v96 ~= nil and {
                ShiftLeft = v7.Input.onBegin(Enum.KeyCode.ButtonL1, function() --[[ Line: 503 ]]
                    -- upvalues: v99 (copy), v96 (copy)
                    if v99 > 1 then
                        v96.moveFocusLeft();
                    end;
                end), 
                ShiftRight = v7.Input.onBegin(Enum.KeyCode.ButtonR1, function() --[[ Line: 508 ]]
                    -- upvalues: v99 (copy), l_subcategories_0 (copy), v96 (copy)
                    if v99 < #l_subcategories_0 then
                        v96.moveFocusRight();
                    end;
                end)
            } or nil
        });
    end;
end;
v46.renderSubNavFrameChildren = function(v111, v112) --[[ Line: 517 ]] --[[ Name: renderSubNavFrameChildren ]]
    -- upvalues: l_FFlagAXSubNavigationRefsById_0 (copy)
    local l_subcategories_1 = v111.props.subcategories;
    local l_selectedSubcategoryIndex_0 = v111.props.selectedSubcategoryIndex;
    local l_selectedCategoryIndex_0 = v111.props.selectedCategoryIndex;
    local v116 = {};
    if l_subcategories_1 then
        for v117, v118 in l_subcategories_1 do
            local v119 = nil;
            if l_FFlagAXSubNavigationRefsById_0 then
                v119 = if v111.props.shouldUseCategoryId then tostring(v118.Id) else v118.Name;
            end;
            v116[if l_FFlagAXSubNavigationRefsById_0 then v119 else v118.Name] = v111:renderCategoryButton(v112, if v111.props.shouldUseCategoryId then v111.props.selectedCategoryId else l_selectedCategoryIndex_0, if v111.props.shouldUseCategoryId then v111.props.selectedSubcategoryId else l_selectedSubcategoryIndex_0, v117, v118);
        end;
    end;
    return v116;
end;
v46.getScrollingListChildren = function(v120) --[[ Line: 548 ]] --[[ Name: getScrollingListChildren ]]
    -- upvalues: v24 (copy), l_RoactFitComponents_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), l_FFlagAXSubNavigationRefsById_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v5 (copy), l_Focusable_0 (copy), l_FitFrameHorizontal_0 (copy), v7 (copy), v29 (copy)
    local l_subNavigationRef_0 = v120.props.subNavigationRef;
    local v122 = not (v120.props.lastInputGroup == v24.InputType.Gamepad) and v120.state.renderHighlight;
    local l_selectedSubcategoryIndex_1 = v120.props.selectedSubcategoryIndex;
    local v124 = UDim.new(0, 15);
    local v125 = l_RoactFitComponents_0.Rect.rectangle(10, 0);
    local v126 = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v120.props.navButtonRefs else v120.navButtonRefs;
    local v127 = (not (l_selectedSubcategoryIndex_1 ~= 0) or l_selectedSubcategoryIndex_1 == nil) and 1 or l_selectedSubcategoryIndex_1;
    if l_FFlagAXSubNavigationRefsById_0 and v120.props.shouldUseCategoryId then
        local l_subcategories_2 = v120.props.subcategories;
        v127 = if v120.props.selectedSubcategoryId then v120.props.selectedSubcategoryId else if l_subcategories_2 and #l_subcategories_2 > 0 then l_subcategories_2[1].Id else nil;
    end;
    return {
        SubNavFrame = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v5.createElement(l_Focusable_0[l_FitFrameHorizontal_0], {
            height = UDim.new(1, 0), 
            contentPadding = v124, 
            margin = v125, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal, 
            BackgroundTransparency = 1, 
            [v5.Change.AbsoluteSize] = v120.onNavFrameSizeChanged, 
            [v5.Ref] = l_subNavigationRef_0, 
            NextSelectionUp = v120.props.NextSelectionUp, 
            NextSelectionDown = v120.props.NextSelectionDown, 
            defaultChild = if not l_FFlagAXSubNavigationRefsById_0 then v126[v127] else if v127 then v126[v127] else nil
        }, v120:renderSubNavFrameChildren()) else v7.withFocusController(function(v129) --[[ Line: 596 ]]
            -- upvalues: v5 (ref), l_Focusable_0 (ref), l_FitFrameHorizontal_0 (ref), v124 (copy), v125 (copy), v120 (copy), l_subNavigationRef_0 (copy), l_FFlagAXSubNavigationRefsById_0 (ref), v126 (copy), v127 (ref), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), v7 (ref)
            return v5.createElement(l_Focusable_0[l_FitFrameHorizontal_0], {
                height = UDim.new(1, 0), 
                contentPadding = v124, 
                margin = v125, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                [v5.Change.AbsoluteSize] = v120.onNavFrameSizeChanged, 
                [v5.Ref] = l_subNavigationRef_0, 
                NextSelectionUp = v120.props.NextSelectionUp, 
                NextSelectionDown = v120.props.NextSelectionDown, 
                defaultChild = if not l_FFlagAXSubNavigationRefsById_0 then v126[v127] else if v127 then v126[v127] else nil, 
                inputBindings = if l_FFlagAXMigrateMainNavigationInputBindings_0 then nil else {
                    ToMainNav = v7.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 615 ]]
                        -- upvalues: v129 (copy)
                        v129.moveFocusUp();
                    end)
                }
            }, v120:renderSubNavFrameChildren(v129));
        end), 
        Highlight = v122 and v5.createElement(v29, {
            scrollingFrameRef = v120.scrollingFrameRef, 
            selectedCategoryButtonInstance = v120.state.selectedCategoryButtonInstance
        })
    };
end;
v46.getSubNavigationChildren = function(v130, _, v132) --[[ Line: 629 ]] --[[ Name: getSubNavigationChildren ]]
    -- upvalues: v5 (copy), v36 (copy)
    local l_selectedCategoryIndex_1 = v130.props.selectedCategoryIndex;
    local v134 = nil;
    v134 = if v130.props.shouldUseCategoryId then v130.props.selectedCategoryId else tostring(l_selectedCategoryIndex_1);
    return {
        ScrollingListWithArrowsAndGradient = v5.createElement(v36, {
            getScollingListContent = function() --[[ Line: 642 ]] --[[ Name: getScollingListContent ]]
                -- upvalues: v130 (copy)
                return v130:getScrollingListChildren();
            end, 
            listHeight = v132, 
            scrollingFrameRef = v130.scrollingFrameRef, 
            buttonRefs = v130.categoryButtonRefs, 
            childWidgetIndex = v134, 
            useIntroScroll = true, 
            buttonPadding = 15
        })
    };
end;
v46.render = function(v135) --[[ Line: 655 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), l_SpringAnimatedItem_0 (copy), v37 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (copy), v55 (copy), v48 (copy)
    local l_layoutOrder_0 = v135.props.layoutOrder;
    local l_navHeight_0 = v135.props.navHeight;
    if not v135.props.subcategories then
        l_navHeight_0 = 0;
    end;
    return (l_withStyle_0(function(v138) --[[ Line: 664 ]]
        -- upvalues: v5 (ref), l_SpringAnimatedItem_0 (ref), v37 (ref), v135 (copy), l_layoutOrder_0 (copy), l_FFlagAXMigrateMainNavigationInputBindings_0 (ref), l_navHeight_0 (ref), v55 (ref), v48 (ref)
        local l_Theme_0 = v138.Theme;
        return v5.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
            regularProps = {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundColor3 = if v37() and v135.props.BackgroundColor3 then v135.props.BackgroundColor3 else l_Theme_0.BackgroundContrast.Color, 
                BackgroundTransparency = if v37() and v135.props.BackgroundTransparency then v135.props.BackgroundTransparency else l_Theme_0.BackgroundContrast.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = l_layoutOrder_0, 
                ClipsDescendants = true, 
                [v5.Ref] = if l_FFlagAXMigrateMainNavigationInputBindings_0 then v135.props.frameRef else nil
            }, 
            animatedValues = {
                height = l_navHeight_0
            }, 
            mapValuesToProps = v55, 
            springOptions = v48
        }, v135:getSubNavigationChildren(l_Theme_0, l_navHeight_0));
    end));
end;
v46 = v31((v9.connect(function(v140, _) --[[ Line: 692 ]]
    -- upvalues: l_FFlagAXCategoryUnifiedLogging_0 (copy), l_AvatarScreenProperties_0 (copy)
    local v142 = nil;
    local v143 = nil;
    if l_FFlagAXCategoryUnifiedLogging_0 then
        v142 = v140.Navigation and v140.Navigation.currentRoute;
        v143 = v142 and l_AvatarScreenProperties_0[v142.routeName];
    end;
    return {
        newItemNotifications = v140.AvatarExperience.AvatarEditor.NewItemNotifications, 
        unifiedLoggingSurface = if l_FFlagAXCategoryUnifiedLogging_0 and v143 and v143.analyticsData then v143.analyticsData.unifiedLoggingSurface else nil
    };
end, nil)(v46)));
v46 = v12.withNavigation(v46);
if l_FFlagAXMigrateMainNavigationInputBindings_0 then
    return function(v144) --[[ Line: 713 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), l_useFocusGuiObject_0 (copy), v6 (copy), l_findValueKeyInRefCache_0 (copy), l_GuiService_0 (copy), l_FFlagAXSubNavigationRefsById_0 (copy), v38 (copy), l_useTableWrappedCallbackRef_0 (copy), v46 (ref)
        local v145 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useFocusController();
        local v146 = v7.useRefCache();
        local v147 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v155 = v6.useCallback(function(v148) --[[ Line: 718 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v146 (copy), l_FFlagAXSubNavigationRefsById_0 (ref), v144 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v147 (copy), v145 (copy)
            local v149 = false;
            v148.cancelled = true;
            local v150 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v146);
            if l_FFlagAXSubNavigationRefsById_0 and v144.shouldUseCategoryId then
                local l_subcategories_3 = v144.subcategories;
                local v152;
                if not l_subcategories_3 or not v150 then
                    v152 = nil;
                else
                    for v153, v154 in l_subcategories_3 do
                        if v154.Id == v150 then
                            v152 = v153;
                            v149 = true;
                        end;
                        if v149 then
                            break;
                        end;
                    end;
                    if not v149 then
                        v152 = nil;
                    end;
                end;
                v149 = false;
                if v152 and v152 > 1 then
                    l_subcategories_3 = v144.subcategories[v152 - 1].Id;
                    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                        if v147 and v146[l_subcategories_3] then
                            v147(v146[l_subcategories_3].current);
                            return;
                        end;
                    else
                        v145.moveFocusLeft();
                        return;
                    end;
                end;
            elseif v150 and v150 > 1 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v147 then
                        v147(v146[v150 - 1].current);
                        return;
                    end;
                else
                    v145.moveFocusLeft();
                end;
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v147 else v145, 
            if l_FFlagAXSubNavigationRefsById_0 then v144.shouldUseCategoryId else nil, 
            if l_FFlagAXSubNavigationRefsById_0 then v144.subcategories else nil
        });
        local v164 = v6.useCallback(function(v156) --[[ Line: 752 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v146 (copy), l_FFlagAXSubNavigationRefsById_0 (ref), v144 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v147 (copy), v145 (copy)
            local v157 = false;
            v156.cancelled = true;
            local v158 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v146);
            if l_FFlagAXSubNavigationRefsById_0 and v144.shouldUseCategoryId then
                local l_subcategories_4 = v144.subcategories;
                local v160;
                if not l_subcategories_4 or not v158 then
                    v160 = nil;
                else
                    for v161, v162 in l_subcategories_4 do
                        if v162.Id == v158 then
                            v160 = v161;
                            v157 = true;
                        end;
                        if v157 then
                            break;
                        end;
                    end;
                    if not v157 then
                        v160 = nil;
                    end;
                end;
                v157 = false;
                if v160 and l_subcategories_4 and v160 < #l_subcategories_4 then
                    local l_Id_0 = l_subcategories_4[v160 + 1].Id;
                    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                        if v147 and v146[l_Id_0] then
                            v147(v146[l_Id_0].current);
                            return;
                        end;
                    else
                        v145.moveFocusRight();
                        return;
                    end;
                end;
            elseif v158 and v158 < #v146 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v147 then
                        v147(v146[v158 + 1].current);
                        return;
                    end;
                else
                    v145.moveFocusRight();
                end;
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v147 else v145, 
            if l_FFlagAXSubNavigationRefsById_0 then v144.shouldUseCategoryId else nil, 
            if l_FFlagAXSubNavigationRefsById_0 then v144.subcategories else nil
        });
        local v166 = v6.useCallback(function(v165) --[[ Line: 787 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v147 (copy), v144 (copy), v145 (copy)
            v165.cancelled = true;
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v147 and v144.NextSelectionUp and v144.NextSelectionUp.current then
                    v147(v144.NextSelectionUp.current);
                    return;
                end;
            else
                v145.moveFocusUp();
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v147 else v145, 
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v144.NextSelectionUp else nil
        });
        local v167 = v38({
            onTabBackward = v155, 
            onTabForward = v164, 
            onNavigateBack = v166
        });
        local v168 = l_useTableWrappedCallbackRef_0(v167);
        local v169 = table.clone(v144);
        v169.frameRef = v168;
        v169.navButtonRefs = v146;
        return v6.createElement(v46, v169);
    end;
else
    return v46;
end;