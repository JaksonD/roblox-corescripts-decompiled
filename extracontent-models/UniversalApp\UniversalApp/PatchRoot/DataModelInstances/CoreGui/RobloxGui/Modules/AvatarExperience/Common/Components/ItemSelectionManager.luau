local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearAnimationPreview);
local v8 = require(l_Modules_0.AvatarExperience.Common.Thunks.StoreAndClearTryOns);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearAllResultsListFocusedWidgets);
local v10 = require(l_Modules_0.LuaApp.AppPage);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOutfitTryOns);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v13 = require(l_Modules_0.AvatarExperience.Common.DeepLinkUtils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAppRoute);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v20 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v23 = require(l_Modules_0.AvatarExperience.Common.Actions.NavigatedToNonTryOnPage);
local v24 = require(l_Modules_0.AvatarExperience.Common.Actions.NavigatedToTryOnPage);
local v25 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v26 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMISEnableMultiShopping_0 = v26.FFlagAXMISEnableMultiShopping;
local l_FFlagAXTryOnScreenFixes_0 = v26.FFlagAXTryOnScreenFixes;
local v29 = v2.PureComponent:extend("ItemSelectionManager");
v29.validateProps = v4.strictInterface({
    avatarRoute = v4.table, 
    itemSubType = v4.optional(v4.string), 
    selectedAnimationPreview = v4.optional(v4.string), 
    lastToggledItem = v4.optional(v4.table), 
    lastSavedTriedOnOutfit = v4.optional(v4.table), 
    tryOnItems = v4.optional(v4.table), 
    externalNavigationRequestParams = v4.optional(v4.table), 
    storeAndClearTryOns = v4.callback, 
    setOutfitTryOns = v4.callback, 
    clearAnimationPreview = v4.callback, 
    toggleTryOn = v4.callback, 
    clearAllResultsListFocusedWidget = v4.callback, 
    onNavigatedToNonTryOnPage = v4.callback, 
    onNavigatedToTryOnPage = v4.callback, 
    networking = v4.callback, 
    appAnalytics = v4.table, 
    catalogAnalytics = v4.table
});
v29.defaultProps = {
    lastToggledItem = {}
};
v29.render = function(_) --[[ Line: 83 ]] --[[ Name: render ]]
    return nil;
end;
local v31 = {
    [l_AvatarScreen_0.ItemDetails] = true, 
    [l_AvatarScreen_0.TryOnItem] = not l_FFlagAXTryOnScreenFixes_0 or nil
};
local v32 = {
    [l_AvatarScreen_0.LayeredClothingSort] = true, 
    [l_AvatarScreen_0.AccessoryAdjustment] = true, 
    [l_AvatarScreen_0.TryOnItem] = l_FFlagAXTryOnScreenFixes_0 and true or nil
};
local function _(v33) --[[ Line: 98 ]] --[[ Name: getIdAndType ]]
    -- upvalues: v31 (copy)
    local l_current_0 = v33.avatarRoute.current;
    if v31[l_current_0.name] then
        return l_current_0.params.itemId, l_current_0.params.itemType;
    else
        return nil, nil;
    end;
end;
local function _(v36) --[[ Line: 107 ]] --[[ Name: shouldClearAnimationPreview ]]
    -- upvalues: v17 (copy)
    if v36.isUnequipped then
        return true;
    elseif v36.itemType == v17.ItemType.Asset then
        return v17.AssetTypeIdToCategory[v36.itemSubType] ~= v17.AssetCategories.Animation;
    else
        return v36.itemSubType ~= v17.BundleTypeIdStrings.Animations;
    end;
end;
local function _(v38) --[[ Line: 119 ]] --[[ Name: isSingleTryOn ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), l_AvatarScreenProperties_0 (copy)
    if l_FFlagAXMISEnableMultiShopping_0 then
        return false;
    else
        local l_avatarRoute_0 = v38.avatarRoute;
        return l_AvatarScreenProperties_0[l_avatarRoute_0.opaque.name] and not l_AvatarScreenProperties_0[l_avatarRoute_0.opaque.name].isMultiTryOn;
    end;
end;
v29.willUpdate = function(v41, v42) --[[ Line: 129 ]] --[[ Name: willUpdate ]]
    -- upvalues: v32 (copy), v31 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_AvatarScreenProperties_0 (copy), v13 (copy)
    if v32[v42.avatarRoute.current.name] then
        return;
    else
        local l_current_1 = v42.avatarRoute.current;
        local v44, v45;
        if v31[l_current_1.name] then
            v44 = l_current_1.params.itemId;
            v45 = l_current_1.params.itemType;
        else
            v44 = nil;
            v45 = nil;
        end;
        l_current_1 = v42.itemSubType;
        local v46;
        if l_FFlagAXMISEnableMultiShopping_0 then
            v46 = false;
        else
            local l_avatarRoute_1 = v42.avatarRoute;
            v46 = l_AvatarScreenProperties_0[l_avatarRoute_1.opaque.name] and not l_AvatarScreenProperties_0[l_avatarRoute_1.opaque.name].isMultiTryOn;
        end;
        local l_props_0 = v41.props;
        local v49;
        if l_FFlagAXMISEnableMultiShopping_0 then
            v49 = false;
        else
            local l_avatarRoute_2 = l_props_0.avatarRoute;
            v49 = l_AvatarScreenProperties_0[l_avatarRoute_2.opaque.name] and not l_AvatarScreenProperties_0[l_avatarRoute_2.opaque.name].isMultiTryOn;
        end;
        if v46 and not v49 then
            l_props_0 = v42.lastToggledItem;
            if l_props_0.itemId ~= v44 or l_props_0.itemType ~= v45 or l_props_0.itemSubType ~= l_current_1 then
                if v44 ~= nil then
                    v41.props.toggleTryOn(v41.props.networking, v41.props.catalogAnalytics, v45, l_current_1, v44, true, v42.avatarRoute, nil);
                    return;
                elseif v41.props.externalNavigationRequestParams ~= v42.externalNavigationRequestParams and v13.wasItemFromDeepLinkEquipped(v42.externalNavigationRequestParams, v41.props.avatarRoute) then
                    return;
                else
                    v41.props.onNavigatedToTryOnPage();
                end;
            end;
        end;
        return;
    end;
end;
v29.didUpdate = function(v51, v52) --[[ Line: 187 ]] --[[ Name: didUpdate ]]
    -- upvalues: v17 (copy), l_AvatarScreenProperties_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v5 (copy), l_AvatarScreen_0 (copy), v10 (copy)
    if v51.props.selectedAnimationPreview and v51.props.lastToggledItem ~= v52.lastToggledItem then
        local l_lastToggledItem_0 = v51.props.lastToggledItem;
        if l_lastToggledItem_0.isUnequipped and true or if l_lastToggledItem_0.itemType == v17.ItemType.Asset then v17.AssetTypeIdToCategory[l_lastToggledItem_0.itemSubType] ~= v17.AssetCategories.Animation else l_lastToggledItem_0.itemSubType ~= v17.BundleTypeIdStrings.Animations then
            v51.props.clearAnimationPreview();
        end;
    end;
    local l_name_0 = v51.props.avatarRoute.opaque.name;
    local v55 = l_AvatarScreenProperties_0[l_name_0] and l_AvatarScreenProperties_0[l_name_0].isTryOnOutfitResetPage;
    local l_name_1 = v52.avatarRoute.opaque.name;
    local v57 = l_AvatarScreenProperties_0[l_name_1] and l_AvatarScreenProperties_0[l_name_1].isMultiTryOn;
    local v58 = l_AvatarScreenProperties_0[l_name_1] and l_AvatarScreenProperties_0[l_name_1].isRefinementPage;
    if v55 and l_name_0 ~= l_name_1 and not v58 then
        if not l_FFlagAXMISEnableMultiShopping_0 and v57 then
            v51.props.storeAndClearTryOns();
        else
            v51.props.onNavigatedToNonTryOnPage();
        end;
    end;
    local v59 = l_AvatarScreenProperties_0[l_name_0] and l_AvatarScreenProperties_0[l_name_0].isMultiTryOn;
    if not l_FFlagAXMISEnableMultiShopping_0 and v59 and not v57 and not l_AvatarScreenProperties_0[l_name_0].isRefinementPage and v51.props.lastSavedTriedOnOutfit and not v5.isEmpty(v51.props.lastSavedTriedOnOutfit) then
        v51.props.setOutfitTryOns(v51.props.lastSavedTriedOnOutfit);
    end;
    local v60 = l_AvatarScreenProperties_0[l_name_0] and l_AvatarScreenProperties_0[l_name_0].isRefinementPage;
    if l_name_0 ~= l_name_1 and l_name_1 == l_AvatarScreen_0.Catalog and l_name_0 ~= v10.ExperienceDetail and not v55 and not v60 then
        v51.props.clearAllResultsListFocusedWidget();
    end;
end;
v29 = v3.connect(function(v61, v62) --[[ Line: 253 ]]
    -- upvalues: v31 (copy), v25 (copy), v12 (copy)
    local l_current_2 = v62.avatarRoute.current;
    local v64, v65;
    if v31[l_current_2.name] then
        v64 = l_current_2.params.itemId;
        v65 = l_current_2.params.itemType;
    else
        v64 = nil;
        v65 = nil;
    end;
    l_current_2 = nil;
    local v66 = v25(v61.AvatarExperience.Common, v64, v65);
    l_current_2 = v12.GetItemSubType(v65, v66);
    local l_LastToggledItem_0 = v61.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem;
    local v68 = v61.AvatarExperience.ExternalNavigationRequest.params or {};
    return {
        itemSubType = l_current_2, 
        lastToggledItem = l_LastToggledItem_0, 
        lastSavedTriedOnOutfit = v61.AvatarExperience.AvatarScene.LastSavedTriedOnOutfit, 
        tryOnItems = v61.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        selectedAnimationPreview = v61.AvatarExperience.AvatarScene.TryOn.AnimationPreview, 
        externalNavigationRequestParams = v68
    };
end, function(v69) --[[ Line: 270 ]]
    -- upvalues: v8 (copy), v11 (copy), v7 (copy), v9 (copy), v23 (copy), v24 (copy), v6 (copy)
    return {
        storeAndClearTryOns = function() --[[ Line: 272 ]] --[[ Name: storeAndClearTryOns ]]
            -- upvalues: v69 (copy), v8 (ref)
            v69(v8());
        end, 
        setOutfitTryOns = function(v70) --[[ Line: 276 ]] --[[ Name: setOutfitTryOns ]]
            -- upvalues: v69 (copy), v11 (ref)
            v69(v11(v70));
        end, 
        clearAnimationPreview = function() --[[ Line: 280 ]] --[[ Name: clearAnimationPreview ]]
            -- upvalues: v69 (copy), v7 (ref)
            v69(v7());
        end, 
        clearAllResultsListFocusedWidget = function() --[[ Line: 284 ]] --[[ Name: clearAllResultsListFocusedWidget ]]
            -- upvalues: v69 (copy), v9 (ref)
            return v69(v9());
        end, 
        onNavigatedToNonTryOnPage = function() --[[ Line: 288 ]] --[[ Name: onNavigatedToNonTryOnPage ]]
            -- upvalues: v69 (copy), v23 (ref)
            return v69(v23());
        end, 
        onNavigatedToTryOnPage = function() --[[ Line: 292 ]] --[[ Name: onNavigatedToTryOnPage ]]
            -- upvalues: v69 (copy), v24 (ref)
            return v69(v24());
        end, 
        toggleTryOn = function(v71, v72, v73, v74, v75, v76, v77, v78) --[[ Line: 296 ]] --[[ Name: toggleTryOn ]]
            -- upvalues: v69 (copy), v6 (ref)
            v69(v6(v71, v72, v73, v74, v75, v76, v77, v78));
        end
    };
end)(v29);
return (v14((l_RoactServices_0.connect({
    catalogAnalytics = v21, 
    appAnalytics = v19, 
    networking = v20
})(v29))));