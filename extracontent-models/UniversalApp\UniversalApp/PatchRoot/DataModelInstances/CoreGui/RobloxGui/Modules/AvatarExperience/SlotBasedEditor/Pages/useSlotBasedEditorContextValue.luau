local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v5 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Utils.createInventoryStoresFromCategories);
local v6 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v9 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v10 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v11 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local l_createSlotBasedEditorStore_0 = v4.Stores.createSlotBasedEditorStore;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useAvatarRoute_0 = v3.AvatarRoute.Hooks.useAvatarRoute;
local v17 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useStore_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useStore;
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local l_createSortAndFiltersStore_0 = v4.Stores.createSortAndFiltersStore;
local l_ScreenLayout_0 = v4.Enums.ScreenLayout;
local l_ItemView_0 = v4.Enums.ItemView;
local l_AvatarEditorCategories_0 = v4.Enums.AvatarEditorCategories;
local l_NavigationParams_0 = v4.Enums.NavigationParams;
local l_AvatarScreen_0 = v3.Enums.AvatarScreen;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v28 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local v29 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters);
local v30 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixCatalogSearchRedirect);
local l_FFlagAXAvatarEditorStoresContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext;
local function _(v32) --[[ Line: 49 ]] --[[ Name: getScreenLayout ]]
    -- upvalues: l_ItemView_0 (copy), l_ScreenLayout_0 (copy)
    local l_isPortrait_0 = v32.isPortrait;
    local l_itemView_0 = v32.itemView;
    if l_isPortrait_0 then
        if l_itemView_0 ~= l_ItemView_0.Off then
            return l_ScreenLayout_0.PortraitItems;
        else
            return l_ScreenLayout_0.PortraitSlots;
        end;
    else
        return l_ScreenLayout_0.LandscapeSplit;
    end;
end;
return function() --[[ Line: 68 ]] --[[ Name: useSlotBasedEditorContextValue ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_DeviceOrientationMode_0 (copy), l_NavigationParams_0 (copy), l_ItemView_0 (copy), l_ScreenLayout_0 (copy), v28 (copy), v2 (copy), v5 (copy), v29 (copy), l_createSortAndFiltersStore_0 (copy), v17 (copy), v11 (copy), v12 (copy), v30 (copy), v7 (copy), l_AvatarEditorCategories_0 (copy), v8 (copy), v9 (copy), l_AvatarScreen_0 (copy), v20 (copy), v10 (copy), v6 (copy), l_useStore_0 (copy), l_createSlotBasedEditorStore_0 (copy), l_FFlagAXAvatarEditorStoresContext_0 (copy)
    local v36 = l_useAvatarRoute_0();
    local v37 = l_useNavigation_0();
    local v38 = l_useDispatch_0();
    local v40 = l_useSelector_0(function(v39) --[[ Line: 73 ]]
        -- upvalues: l_DeviceOrientationMode_0 (ref)
        return v39.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    end);
    local v41 = v37.getParam(l_NavigationParams_0.itemView) or v40 and l_ItemView_0.SlotItems or not v40 and l_ItemView_0.Off;
    local v42 = {
        isPortrait = v40, 
        itemView = v41
    };
    local l_isPortrait_1 = v42.isPortrait;
    local l_itemView_1 = v42.itemView;
    local v45 = if l_isPortrait_1 then if l_itemView_1 ~= l_ItemView_0.Off then l_ScreenLayout_0.PortraitItems else l_ScreenLayout_0.PortraitSlots else l_ScreenLayout_0.LandscapeSplit;
    v42 = if v28() then v2.useMemo(v5, {}) else nil;
    l_isPortrait_1 = if v29() then v2.useMemo(l_createSortAndFiltersStore_0, {}) else nil;
    l_itemView_1 = v17(v11);
    local v46 = v17(v12);
    local v47 = v37.getParam(l_NavigationParams_0.fromScreen);
    local v48 = if v30 then v37.getParam(l_NavigationParams_0.params) else nil;
    local v51 = v2.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v7 (ref), l_AvatarEditorCategories_0 (ref), v38 (copy), v8 (ref), v46 (copy), v9 (ref), l_itemView_1 (copy), v37 (copy)
        for _, v50 in (v7()) do
            if v50.NavigationKey == l_AvatarEditorCategories_0.All then
                v38(v8(v50.Category, nil, v46));
                break;
            end;
        end;
        v38(v9(l_itemView_1, v37.state.routeName));
    end, {
        v38, 
        l_itemView_1, 
        v37.state.routeName, 
        v46
    });
    local v54 = v2.useCallback(function() --[[ Line: 110 ]]
        -- upvalues: v36 (copy), l_AvatarScreen_0 (ref), v37 (copy), l_NavigationParams_0 (ref), l_ItemView_0 (ref), v51 (copy), v30 (ref), v47 (copy), v48 (copy), v38 (copy), v20 (ref), v10 (ref), l_itemView_1 (copy), v6 (ref)
        local v52 = v36.current.name == l_AvatarScreen_0.LookDetails;
        v37.navigate(l_AvatarScreen_0.AvatarEditor, {
            [l_NavigationParams_0.itemView] = l_ItemView_0.Off
        });
        if v52 then
            v37.navigate(l_AvatarScreen_0.LookDetails);
        end;
        v51();
        if v30 and v47 == l_AvatarScreen_0.CatalogSearch and v47 ~= v36.opaque.name then
            if v48 and v48.searchParams then
                local v53 = {
                    searchKeyword = v48.searchParams.searchKeyword, 
                    isKeywordSuggestionEnabled = true
                };
                v38(v20(v37, v53));
            end;
        elseif v47 and v47 ~= v36.opaque.name then
            v37.navigate(v47);
        end;
        v38(v10(l_itemView_1, v37.state.routeName, v6.None));
    end, {
        v51, 
        v37, 
        v47
    });
    local v55 = l_useStore_0();
    local v56 = v2.useMemo(function() --[[ Line: 142 ]]
        -- upvalues: l_createSlotBasedEditorStore_0 (ref), v55 (copy)
        return l_createSlotBasedEditorStore_0(v55);
    end, {
        v55
    });
    return {
        handleExitPortraitItems = v54, 
        itemView = v41, 
        signalStore = v56, 
        screenLayout = v45, 
        categoryInventoryStores = if not v28() or l_FFlagAXAvatarEditorStoresContext_0 then nil else v42, 
        sortAndFiltersStore = if not v29() or l_FFlagAXAvatarEditorStoresContext_0 then nil else l_isPortrait_1
    };
end;