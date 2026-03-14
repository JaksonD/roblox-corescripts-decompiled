local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactNavigation);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.t);
local l_withNavigation_0 = v4.withNavigation;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveNewAssetNotification);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveNewOutfitNotification);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavigationFrame);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withOpaqueAvatarRoute);
local v19 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NavigatedToDeepLinkAvatarEditor);
local v23 = require(l_Modules_0.AvatarExperience.Common.DeepLinkUtils);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v27 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v29 = v2.PureComponent:extend("Navigation");
v29.validateProps = v7.strictInterface({
    analytics = v7.table, 
    axAnalytics = v7.table, 
    layoutOrderMain = v7.number, 
    layoutOrderSub = v7.number, 
    navHeightMain = v7.number, 
    navHeightSub = v7.number, 
    absoluteSizeChanged = v7.callback, 
    navBarRef = v7.table, 
    NextSelectionDown = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table), 
    backToTopSignal = v7.optional(v7.table), 
    avatarType = v7.string, 
    selectedCategoryIndex = v7.number, 
    selectedSubcategoryIndex = v7.number, 
    newItemNotifications = v7.table, 
    externalNavigationRequest = v7.table, 
    exit3DFullView = v7.callback, 
    setCategoryAndSubcategory = v7.callback, 
    clearTryOns = v7.callback, 
    removeNewAssetNotification = v7.callback, 
    removeNewOutfitNotification = v7.callback, 
    navigatedToDeepLinkAvatarEditor = v7.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.table, 
    navigation = v7.table, 
    opaqueRoute = v7.table, 
    networking = v7.callback
});
v29.removeNewItemNotificationIfNeeded = function(v30, v31, v32) --[[ Line: 82 ]] --[[ Name: removeNewItemNotificationIfNeeded ]]
    -- upvalues: v15 (copy), v19 (copy), v24 (copy)
    local v33 = v15();
    local l_Subcategories_0 = v33[v31].Subcategories;
    local v35 = l_Subcategories_0 and l_Subcategories_0[v32] and l_Subcategories_0[v32].AssetTypeIdStrings or v33[v31].AssetTypeIdStrings;
    if v35 then
        for _, v37 in v35 do
            if v30.props.newItemNotifications[v37] then
                v30.props.removeNewAssetNotification(v37);
            end;
        end;
        return;
    else
        if v30.props.newItemNotifications[v19.NewOutfitNotificationKey] then
            if l_Subcategories_0 and l_Subcategories_0[v32] and l_Subcategories_0[v32].SearchUuid == v24.PurchasedCharacterKey then
                v30.props.removeNewOutfitNotification(v19.OutfitTypes.Avatar);
                return;
            end;
        elseif v30.props.newItemNotifications[v19.NewDHOutfitNotificationKey] and l_Subcategories_0 and l_Subcategories_0[v32] and l_Subcategories_0[v32].Name == "Style" then
            v30.props.removeNewOutfitNotification(v19.OutfitTypes.DynamicHead);
        end;
        return;
    end;
end;
v29.setCategoryAndSubcategory = function(v38, v39, v40) --[[ Line: 118 ]] --[[ Name: setCategoryAndSubcategory ]]
    local l_analytics_0 = v38.props.analytics;
    local l_axAnalytics_0 = v38.props.axAnalytics;
    local l_navigation_0 = v38.props.navigation;
    local l_backToTopSignal_0 = v38.props.backToTopSignal;
    if l_backToTopSignal_0 and (v39 == nil or v39 == v38.props.selectedCategoryIndex) and (v40 == nil or v40 == v38.props.selectedSubcategoryIndex) then
        l_backToTopSignal_0:fire();
    end;
    v38.props.setCategoryAndSubcategory(v39, v40, l_analytics_0);
    v38.props.exit3DFullView(l_axAnalytics_0, l_navigation_0.state.routeName);
end;
v29.init = function(v45) --[[ Line: 138 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), l_AvatarScreen_0 (copy), v15 (copy), l_wasLastInputGamepad_0 (copy), v26 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    local function v48(v46) --[[ Line: 139 ]] --[[ Name: promptR15UpgradeIfNecessary ]]
        -- upvalues: v19 (ref), v45 (copy), l_AvatarScreen_0 (ref)
        local v47 = ({
            [v19.PageType.Animation] = "Feature.Avatar.Message.R15AnimationsPrompt", 
            [v19.PageType.Emotes] = "Feature.Avatar.Message.R15EmotesPrompt", 
            [v19.PageType.BodyStyle] = "Feature.Avatar.Message.R15StylesPrompt"
        })[v46];
        if v47 ~= nil then
            v45.props.navigation.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                onOverlayClosed = v45.onR15PromptClosed, 
                bodyTextKey = v47
            });
        end;
    end;
    v45.selectCategory = function(v49) --[[ Line: 160 ]]
        -- upvalues: v45 (copy), v19 (ref), v15 (ref), v48 (copy)
        v45:removeNewItemNotificationIfNeeded(v49, 1);
        v45:setCategoryAndSubcategory(v49, nil);
        if v45.props.avatarType == v19.AvatarType.R6 then
            local v50 = v15()[v49];
            v48(v50.PageType);
        end;
    end;
    v45.onR15PromptClosed = function() --[[ Line: 175 ]]
        -- upvalues: l_wasLastInputGamepad_0 (ref), v26 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v45 (copy)
        local v51 = l_wasLastInputGamepad_0();
        v26("Navigation", v51);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v51 then
            v45.props.focusController.captureFocus();
        end;
    end;
    v45.selectSubcategory = function(v52, v53) --[[ Line: 184 ]]
        -- upvalues: v45 (copy), v19 (ref), v15 (ref), v48 (copy)
        v45:removeNewItemNotificationIfNeeded(v52, v53);
        if v45.props.avatarType == v19.AvatarType.R6 then
            local v54 = v15()[v52];
            if v54 then
                local v55 = v54.Subcategories[v53];
                if v55 then
                    v48(v55.PageType);
                end;
            end;
        end;
        v45:setCategoryAndSubcategory(nil, v53);
    end;
    local v56 = v45.props.navigation.getParam("avatarEditorCategory");
    if v56 then
        v45.selectCategory(v56);
    end;
    local v57 = v45.props.navigation.getParam("avatarEditorSubcategory");
    if v57 then
        v45.selectSubcategory(v56, v57);
    end;
end;
v29.onSubNavigationPropsDidUpdate = function(v58) --[[ Line: 213 ]] --[[ Name: onSubNavigationPropsDidUpdate ]]
    local l_selectedCategoryIndex_0 = v58.props.selectedCategoryIndex;
    local l_selectedSubcategoryIndex_0 = v58.props.selectedSubcategoryIndex;
    return function(v61, v62) --[[ Line: 217 ]]
        -- upvalues: l_selectedCategoryIndex_0 (copy), l_selectedSubcategoryIndex_0 (copy)
        local l_selectedCategoryIndex_1 = v61.selectedCategoryIndex;
        local l_selectedSubcategoryIndex_1 = v61.selectedSubcategoryIndex;
        local v65 = l_selectedCategoryIndex_0 ~= l_selectedCategoryIndex_1;
        local v66 = l_selectedSubcategoryIndex_0 ~= l_selectedSubcategoryIndex_1;
        if not v65 and not v66 then
            return;
        else
            if v65 and v62.current then
                v62.current.CanvasPosition = Vector2.new();
            end;
            return;
        end;
    end;
end;
v29.willUpdate = function(v67, v68) --[[ Line: 234 ]] --[[ Name: willUpdate ]]
    -- upvalues: v23 (copy), v25 (copy)
    local v69 = true;
    if v68.selectedCategoryIndex == v67.props.selectedCategoryIndex then
        v69 = v68.selectedSubcategoryIndex ~= v67.props.selectedSubcategoryIndex;
    end;
    if v23.avatarEditorDeepLinkExists(v67.props.externalNavigationRequest) then
        v69 = false;
    end;
    if v69 then
        v67.props.clearTryOns();
        v25.closeFiltersAndItemDetails(v67.props.navigation);
    end;
end;
v29.render = function(v70) --[[ Line: 255 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v2 (copy), v17 (copy)
    local l_layoutOrderMain_0 = v70.props.layoutOrderMain;
    local l_layoutOrderSub_0 = v70.props.layoutOrderSub;
    local l_navHeightMain_0 = v70.props.navHeightMain;
    local l_navHeightSub_0 = v70.props.navHeightSub;
    local l_selectedCategoryIndex_2 = v70.props.selectedCategoryIndex;
    local l_selectedSubcategoryIndex_2 = v70.props.selectedSubcategoryIndex;
    local l_absoluteSizeChanged_0 = v70.props.absoluteSizeChanged;
    local v78 = v15();
    local l_navBarRef_0 = v70.props.navBarRef;
    return v2.createElement(v17, {
        layoutOrderMain = l_layoutOrderMain_0, 
        navHeightMain = l_navHeightMain_0, 
        layoutOrderSub = l_layoutOrderSub_0, 
        navHeightSub = l_navHeightSub_0, 
        categoryTable = v78, 
        selectedCategoryIndex = l_selectedCategoryIndex_2, 
        shouldUseCategoryId = false, 
        selectCategory = v70.selectCategory, 
        selectedSubcategoryIndex = l_selectedSubcategoryIndex_2, 
        subcategoryTable = v78[l_selectedCategoryIndex_2].Subcategories, 
        onSubNavigationPropsDidUpdate = v70:onSubNavigationPropsDidUpdate(), 
        selectSubcategory = v70.selectSubcategory, 
        absoluteSizeChanged = l_absoluteSizeChanged_0, 
        navigationFrameRef = l_navBarRef_0, 
        NextSelectionUp = v70.props.NextSelectionUp, 
        NextSelectionDown = v70.props.NextSelectionDown
    });
end;
v29.processAvatarEditorDeepLink = function(v80) --[[ Line: 288 ]] --[[ Name: processAvatarEditorDeepLink ]]
    -- upvalues: v23 (copy)
    local l_externalNavigationRequest_0 = v80.props.externalNavigationRequest;
    local v82 = l_externalNavigationRequest_0.params or {};
    if v23.avatarEditorDeepLinkExists(l_externalNavigationRequest_0) then
        v80.props.navigatedToDeepLinkAvatarEditor({
            category = v82.category, 
            subcategory = v82.subcategory
        });
    end;
end;
v29.didMount = function(v83) --[[ Line: 299 ]] --[[ Name: didMount ]]
    v83:processAvatarEditorDeepLink();
end;
v29.didUpdate = function(v84, v85) --[[ Line: 303 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    v84:processAvatarEditorDeepLink();
    local l_name_0 = v84.props.opaqueRoute.name;
    local l_name_1 = v85.opaqueRoute.name;
    local v88 = false;
    if l_name_0 ~= l_name_1 then
        v88 = l_name_0 == l_AvatarScreen_0.AvatarEditor;
    end;
    if v88 then
        v84:removeNewItemNotificationIfNeeded(v84.props.selectedCategoryIndex, v84.props.selectedSubcategoryIndex);
    end;
    local v89 = v85.navigation.getParam("avatarEditorCategory");
    local v90 = v84.props.navigation.getParam("avatarEditorCategory");
    if v90 and v90 ~= v89 then
        v84.selectCategory(v90);
    end;
    local v91 = v85.navigation.getParam("avatarEditorSubcategory");
    local v92 = v84.props.navigation.getParam("avatarEditorSubcategory");
    if v92 and v92 ~= v91 then
        v84.selectSubcategory(v90, v92);
    end;
end;
v29 = l_RoactServices_0.connect({
    networking = v10
})(v29);
v29 = v18((l_withNavigation_0((v3.connect(function(v93) --[[ Line: 333 ]] --[[ Name: mapStateToProps ]]
    return {
        avatarType = v93.AvatarExperience.AvatarEditor.Character.AvatarType, 
        selectedCategoryIndex = v93.AvatarExperience.AvatarEditor.Categories.category, 
        selectedSubcategoryIndex = v93.AvatarExperience.AvatarEditor.Categories.subcategory, 
        newItemNotifications = v93.AvatarExperience.AvatarEditor.NewItemNotifications, 
        externalNavigationRequest = v93.AvatarExperience.ExternalNavigationRequest or {}
    };
end, function(v94) --[[ Line: 345 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v16 (copy), v12 (copy), v13 (copy), v14 (copy), v27 (copy), v22 (copy)
    return {
        setCategoryAndSubcategory = function(v95, v96, v97) --[[ Line: 347 ]] --[[ Name: setCategoryAndSubcategory ]]
            -- upvalues: v94 (copy), v16 (ref)
            v94(v16(v95, v96, v97));
        end, 
        clearTryOns = function() --[[ Line: 351 ]] --[[ Name: clearTryOns ]]
            -- upvalues: v94 (copy), v12 (ref)
            v94(v12());
        end, 
        removeNewAssetNotification = function(v98) --[[ Line: 355 ]] --[[ Name: removeNewAssetNotification ]]
            -- upvalues: v94 (copy), v13 (ref)
            v94(v13(v98));
        end, 
        removeNewOutfitNotification = function(v99) --[[ Line: 359 ]] --[[ Name: removeNewOutfitNotification ]]
            -- upvalues: v94 (copy), v14 (ref)
            v94(v14(v99));
        end, 
        exit3DFullView = function(v100, v101) --[[ Line: 363 ]] --[[ Name: exit3DFullView ]]
            -- upvalues: v94 (copy), v27 (ref)
            v94(v27(v100, v101));
        end, 
        navigatedToDeepLinkAvatarEditor = function(v102) --[[ Line: 367 ]] --[[ Name: navigatedToDeepLinkAvatarEditor ]]
            -- upvalues: v94 (copy), v22 (ref)
            v94(v22(v102));
        end
    };
end)(v29)))));
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v29;
else
    return function(v103) --[[ Line: 382 ]]
        -- upvalues: v5 (copy), v2 (copy), v29 (ref), v6 (copy)
        return v5.withFocusController(function(v104) --[[ Line: 383 ]]
            -- upvalues: v2 (ref), v29 (ref), v6 (ref), v103 (copy)
            return v2.createElement(v29, v6.Dictionary.join(v103, {
                focusController = v104
            }));
        end);
    end;
end;