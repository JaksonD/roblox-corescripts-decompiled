local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_useSlotBasedEditorContext_0 = v8.Context.useSlotBasedEditorContext;
local l_ScreenLayout_0 = v8.Enums.ScreenLayout;
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v11.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v11.Enums.AvatarScreen;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v15 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveNewAssetNotification);
local v16 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveNewOutfitNotification);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavigationFrame);
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.NavigatedToDeepLinkAvatarEditor);
local v23 = require(l_Modules_0.AvatarExperience.Common.DeepLinkUtils);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v25 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local l_ItemView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.ItemView;
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_logOnOverlayClosed_0 = v11.Debug.logOnOverlayClosed;
local v30 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v31 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v33 = {
    [v20.PageType.Animation] = "Feature.Avatar.Message.R15AnimationsPrompt", 
    [v20.PageType.Emotes] = "Feature.Avatar.Message.R15EmotesPrompt", 
    [v20.PageType.BodyStyle] = "Feature.Avatar.Message.R15StylesPrompt"
};
local function v35(v34) --[[ Line: 68 ]] --[[ Name: selectAvatarType ]]
    return v34.AvatarExperience.AvatarEditor.Character.AvatarType;
end;
local function v37(v36) --[[ Line: 71 ]] --[[ Name: selectSelectedCategoryIndex ]]
    return v36.AvatarExperience.AvatarEditor.Categories.category;
end;
local function v39(v38) --[[ Line: 74 ]] --[[ Name: selectSelectedSubcategoryIndex ]]
    return v38.AvatarExperience.AvatarEditor.Categories.subcategory;
end;
local function v41(v40) --[[ Line: 77 ]] --[[ Name: selectNewItemNotifications ]]
    return v40.AvatarExperience.AvatarEditor.NewItemNotifications;
end;
local function v43(v42) --[[ Line: 80 ]] --[[ Name: selectExternalNavigationRequest ]]
    return v42.AvatarExperience.ExternalNavigationRequest or {};
end;
return v2.memo(function(v44) --[[ Line: 84 ]] --[[ Name: Navigation ]]
    -- upvalues: v17 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), l_useSelector_0 (copy), v35 (copy), v37 (copy), v39 (copy), v41 (copy), v43 (copy), l_useSlotBasedEditorContext_0 (copy), l_ScreenLayout_0 (copy), l_ItemView_0 (copy), v2 (copy), v31 (copy), v24 (copy), v15 (copy), v20 (copy), v27 (copy), v16 (copy), l_wasLastInputGamepad_0 (copy), l_logOnOverlayClosed_0 (copy), v33 (copy), l_AvatarScreen_0 (copy), v18 (copy), v30 (copy), v23 (copy), v22 (copy), l_usePrevious_0 (copy), v25 (copy), v28 (copy), l_useAvatarRoute_0 (copy), v19 (copy)
    local v45 = v17();
    local v46 = l_useDispatch_0();
    local v47 = l_useNavigation_0();
    local v48 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useFocusController();
    local v49 = l_useSelector_0(v35);
    local v50 = l_useSelector_0(v37);
    local v51 = l_useSelector_0(v39);
    local v52 = l_useSelector_0(v41);
    local v53 = l_useSelector_0(v43);
    local v54 = l_useSlotBasedEditorContext_0();
    local v55 = false;
    if v54 then
        local v56 = false;
        if v54.screenLayout == l_ScreenLayout_0.PortraitItems then
            v56 = v54.itemView == l_ItemView_0.SlotItems;
        end;
        v55 = v56;
    end;
    local v57 = v2.useCallback(function() --[[ Line: 107 ]]
        -- upvalues: v54 (copy)
        if v54 and v54.handleExitPortraitItems then
            v54.handleExitPortraitItems();
        end;
    end, {
        v54
    });
    local v69 = v2.useCallback(function(v58, v59) --[[ Line: 113 ]]
        -- upvalues: v17 (ref), v31 (ref), v24 (ref), v52 (copy), v46 (copy), v15 (ref), v20 (ref), v27 (ref), v16 (ref)
        local v60 = v17();
        if v31() then
            local v61 = v60[v58];
            if v61 then
                local v62 = if v61.Subcategories then v61.Subcategories[v59] else nil;
                for _, v64 in (v24.getNotificationItemTypesForCategory(v62 or v61, v52)) do
                    if v52[v64] then
                        v46(v15(v64));
                    end;
                end;
            end;
            return;
        else
            local l_Subcategories_0 = v60[v58].Subcategories;
            local v66 = l_Subcategories_0 and l_Subcategories_0[v59] and l_Subcategories_0[v59].AssetTypeIdStrings or v60[v58].AssetTypeIdStrings;
            if v66 then
                for _, v68 in v66 do
                    if v52[v68] then
                        v46(v15(v68));
                    end;
                end;
                return;
            else
                if v52[v20.NewOutfitNotificationKey] then
                    if l_Subcategories_0 and l_Subcategories_0[v59] and l_Subcategories_0[v59].SearchUuid == v27.PurchasedCharacterKey then
                        v46(v16(v20.OutfitTypes.Avatar));
                        return;
                    end;
                elseif v52[v20.NewDHOutfitNotificationKey] and l_Subcategories_0 and l_Subcategories_0[v59] and l_Subcategories_0[v59].Name == "Style" then
                    v46(v16(v20.OutfitTypes.DynamicHead));
                end;
                return;
            end;
        end;
    end, {
        v52, 
        v46
    });
    local v71 = v2.useCallback(function() --[[ Line: 165 ]]
        -- upvalues: l_wasLastInputGamepad_0 (ref), l_logOnOverlayClosed_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v48 (copy)
        local v70 = l_wasLastInputGamepad_0();
        l_logOnOverlayClosed_0("Navigation", v70);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v70 then
            v48.captureFocus();
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v48
    });
    local v74 = v2.useCallback(function(v72) --[[ Line: 174 ]]
        -- upvalues: v33 (ref), v47 (copy), l_AvatarScreen_0 (ref), v71 (copy)
        local v73 = v33[v72];
        if v73 ~= nil then
            v47.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                onOverlayClosed = v71, 
                bodyTextKey = v73
            });
        end;
    end, {
        v47, 
        v71
    });
    local v77 = v2.useCallback(function(v75, v76) --[[ Line: 192 ]]
        -- upvalues: v44 (copy), v50 (copy), v51 (copy), v46 (copy), v18 (ref), v30 (ref), v47 (copy)
        if v44.backToTopSignal and (v75 == nil or v75 == v50) and (v76 == nil or v76 == v51) then
            v44.backToTopSignal:fire();
        end;
        v46(v18(v75, v76, v44.analytics));
        v46(v30(v44.axAnalytics, v47.state.routeName));
    end, {
        v44.backToTopSignal, 
        v50, 
        v51, 
        v44.analytics, 
        v44.axAnalytics, 
        v47.state.routeName, 
        v46
    });
    local v80 = v2.useCallback(function(v78) --[[ Line: 216 ]]
        -- upvalues: v69 (copy), v77 (copy), v49 (copy), v20 (ref), v17 (ref), v74 (copy)
        v69(v78, 1);
        v77(v78, nil);
        if v49 == v20.AvatarType.R6 then
            local v79 = v17()[v78];
            v74(v79.PageType);
        end;
    end, {
        v69, 
        v77, 
        v49
    });
    local v87 = v2.useCallback(function(v81, v82) --[[ Line: 231 ]]
        -- upvalues: v50 (copy), v51 (copy)
        local l_selectedCategoryIndex_0 = v81.selectedCategoryIndex;
        local l_selectedSubcategoryIndex_0 = v81.selectedSubcategoryIndex;
        local v85 = v50 ~= l_selectedCategoryIndex_0;
        local v86 = v51 ~= l_selectedSubcategoryIndex_0;
        if not v85 and not v86 then
            return;
        else
            if v85 and v82.current then
                v82.current.CanvasPosition = Vector2.new();
            end;
            return;
        end;
    end, {
        v50, 
        v51
    });
    local v92 = v2.useCallback(function(v88, v89) --[[ Line: 248 ]]
        -- upvalues: v69 (copy), v49 (copy), v20 (ref), v17 (ref), v74 (copy), v77 (copy)
        v69(v88, v89);
        if v49 == v20.AvatarType.R6 then
            local v90 = v17()[v88];
            if v90 then
                local v91 = v90.Subcategories[v89];
                if v91 then
                    v74(v91.PageType);
                end;
            end;
        end;
        v77(nil, v89);
    end, {
        v69, 
        v49, 
        v74, 
        v77
    });
    local v94 = v2.useCallback(function() --[[ Line: 268 ]]
        -- upvalues: v53 (copy), v23 (ref), v46 (copy), v22 (ref)
        local v93 = v53.params or {};
        if v23.avatarEditorDeepLinkExists(v53) then
            v46(v22({
                category = v93.category, 
                subcategory = v93.subcategory
            }));
        end;
    end, {
        v53, 
        v46
    });
    v2.useEffect(function() --[[ Line: 278 ]]
        -- upvalues: v47 (copy), v80 (copy), v92 (copy)
        local v95 = v47.getParam("avatarEditorCategory");
        if v95 then
            v80(v95);
        end;
        local v96 = v47.getParam("avatarEditorSubcategory");
        if v96 then
            v92(v95, v96);
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 290 ]]
        -- upvalues: v94 (copy)
        v94();
    end);
    local v97 = l_usePrevious_0(v50);
    local v98 = l_usePrevious_0(v51);
    local v99 = v2.useRef(true);
    v2.useLayoutEffect(function() --[[ Line: 298 ]]
        -- upvalues: v99 (copy), v50 (copy), v97 (copy), v51 (copy), v98 (copy), v23 (ref), v53 (copy), v46 (copy), v25 (ref), v28 (ref), v47 (copy)
        if v99.current then
            v99.current = false;
            return;
        else
            local v100 = true;
            if v50 == v97 then
                v100 = v51 ~= v98;
            end;
            if v23.avatarEditorDeepLinkExists(v53) then
                v100 = false;
            end;
            if v100 then
                v46(v25());
                v28.closeFiltersAndItemDetails(v47);
            end;
            return;
        end;
    end, {
        v50, 
        v51, 
        v53, 
        v46, 
        v47
    });
    local l_name_0 = l_useAvatarRoute_0().opaque.name;
    local v102 = l_usePrevious_0(l_name_0);
    v2.useEffect(function() --[[ Line: 328 ]]
        -- upvalues: l_name_0 (copy), l_AvatarScreen_0 (ref), v102 (copy), v69 (copy), v50 (copy), v51 (copy)
        local v103 = l_name_0 == l_AvatarScreen_0.AvatarEditor;
        local v104 = false;
        if l_name_0 ~= v102 then
            v104 = v103;
        end;
        if v104 then
            v69(v50, v51);
        end;
    end, {
        l_name_0, 
        v50, 
        v51, 
        v69
    });
    local v105 = v47.getParam("avatarEditorCategory");
    local v106 = l_usePrevious_0(v105);
    v2.useEffect(function() --[[ Line: 342 ]]
        -- upvalues: v105 (copy), v106 (copy), v80 (copy)
        if v105 and v105 ~= v106 then
            v80(v105);
        end;
    end, {
        v105, 
        v80
    });
    local v107 = v47.getParam("avatarEditorSubcategory");
    local v108 = l_usePrevious_0(v107);
    v2.useEffect(function() --[[ Line: 350 ]]
        -- upvalues: v107 (copy), v108 (copy), v92 (copy), v105 (copy)
        if v107 and v107 ~= v108 then
            v92(v105, v107);
        end;
    end, {
        v105, 
        v107, 
        v92
    });
    return v2.createElement(v19, {
        layoutOrderMain = v44.layoutOrderMain, 
        navHeightMain = v44.navHeightMain, 
        layoutOrderSub = v44.layoutOrderSub, 
        navHeightSub = v44.navHeightSub, 
        categoryTable = v45, 
        shouldUseCategoryId = false, 
        selectedCategoryIndex = v50, 
        selectCategory = v80, 
        selectedSubcategoryIndex = v51, 
        selectCategoryId = nil, 
        selectedSubcategoryId = nil, 
        selectSubcategoryId = nil, 
        subcategoryTable = v45[v50].Subcategories, 
        onSubNavigationPropsDidUpdate = v87, 
        selectSubcategory = v92, 
        absoluteSizeChanged = v44.absoluteSizeChanged, 
        replaceMainNavigationWithCloseableHeader = v55, 
        onCloseableHeaderClosed = v57, 
        navigationFrameRef = v44.navBarRef, 
        NextSelectionUp = v44.NextSelectionUp, 
        NextSelectionDown = v44.NextSelectionDown
    });
end);