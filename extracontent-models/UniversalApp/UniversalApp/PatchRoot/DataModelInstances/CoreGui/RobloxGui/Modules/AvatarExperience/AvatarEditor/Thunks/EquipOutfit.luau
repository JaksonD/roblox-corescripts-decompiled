local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.EquipOutfit);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UnequipOutfit);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarType);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetBodyColor3sFromOutfit);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v12 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip);
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_InventoryItemAvailability_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local v21 = {
    Torso = "27", 
    RightArm = "28", 
    LeftArm = "29", 
    LeftLeg = "30", 
    RightLeg = "31"
};
local _ = function(v22) --[[ Line: 52 ]] --[[ Name: isFullyQualifiedOutfit ]]
    -- upvalues: v21 (copy)
    for _, v24 in v21 do
        if not v22[v24] then
            return false;
        end;
    end;
    return true;
end;
return function(v26) --[[ Line: 70 ]]
    -- upvalues: v12 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v11 (copy), l_InventoryItemAvailability_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v14 (copy), v16 (copy), v21 (copy), v17 (copy), v5 (copy), v10 (copy), v4 (copy), v9 (copy), v13 (copy), v8 (copy), v7 (copy), v6 (copy)
    local l_outfitInfo_0 = v26.outfitInfo;
    local l_analytics_0 = v26.analytics;
    local l_navigation_0 = v26.navigation;
    local l_isSelected_0 = v26.isSelected;
    local l_fromOutfitPurchase_0 = v26.fromOutfitPurchase;
    local l_tryOnBundleInfo_0 = v26.tryOnBundleInfo;
    local l_blockFullReset_0 = v26.blockFullReset;
    return function(v34) --[[ Line: 79 ]]
        -- upvalues: v12 (ref), l_outfitInfo_0 (ref), l_analytics_0 (copy), l_navigation_0 (copy), l_blockFullReset_0 (copy), l_FFlagAXModeratedItemsFlow_0 (ref), v11 (ref), l_InventoryItemAvailability_0 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v14 (ref), v16 (ref), v21 (ref), v17 (ref), l_isSelected_0 (copy), v5 (ref), v10 (ref), l_tryOnBundleInfo_0 (copy), v4 (ref), l_fromOutfitPurchase_0 (copy), v9 (ref), v13 (ref), v8 (ref), v7 (ref), v6 (ref)
        local v35 = false;
        v12.isType(l_outfitInfo_0, "table", "EquipOutfit thunk expects outfitInfo to be a table");
        v12.isType(l_analytics_0, "table", "EquipOutfit thunk expects analytics");
        v12.isType(l_navigation_0, "table", "EquipOutfit thunk expects navigation");
        v12.isTypeOrNil(l_blockFullReset_0, "boolean", "EquipOutfit thunk expects blockFullReset");
        l_outfitInfo_0 = if l_FFlagAXModeratedItemsFlow_0 then v11.filterOutfitAssetsWithStatus(l_outfitInfo_0, {
            l_InventoryItemAvailability_0.Unavailable, 
            l_InventoryItemAvailability_0.Revoked
        }) else l_outfitInfo_0;
        local v36 = if l_FFlagAXCustomizeMakeupSupport_0 then l_outfitInfo_0.outfitType == v14.OutfitTypes.Avatar else nil;
        local v37 = if l_FFlagAXCustomizeMakeupSupport_0 then l_outfitInfo_0.isEditable and v36 else l_outfitInfo_0.isEditable;
        if not v37 then
            if v16() then
                v37 = v11.isFullyQualifiedOutfit(l_outfitInfo_0.assets);
            else
                local l_assets_0 = l_outfitInfo_0.assets;
                for _, v40 in v21 do
                    if not l_assets_0[v40] then
                        v37 = false;
                        v35 = true;
                    end;
                    if v35 then
                        break;
                    end;
                end;
                if not v35 then
                    v37 = true;
                end;
            end;
        end;
        v35 = false;
        if l_analytics_0 then
            l_analytics_0.outfitClicked(l_outfitInfo_0.outfitId, l_outfitInfo_0.outfitType, l_outfitInfo_0.isEditable);
        end;
        local v41 = l_outfitInfo_0.outfitType == v14.OutfitTypes.DynamicHead;
        if v41 then
            for v42, _ in v14.DynamicHeadAssetTypes do
                if not l_outfitInfo_0.assets[v42] then
                    l_outfitInfo_0.assets[v42] = {};
                end;
            end;
            l_outfitInfo_0.assets[v14.AssetTypeIdStrings.Head] = {};
            l_outfitInfo_0.assets[v14.AssetTypeIdStrings.Face] = {};
        end;
        local v44 = if v17() then l_outfitInfo_0.outfitType == v14.OutfitTypes.Shoes else nil;
        local v45 = if v17() then l_outfitInfo_0.inventoryType == v14.OutfitTypes.Animations else nil;
        if (v41 or v17() and v44 or v17() and v45) and l_isSelected_0 then
            v34:dispatch(v5(l_outfitInfo_0.assets));
            return false;
        else
            local v46 = if l_FFlagAXCustomizeMakeupSupport_0 then l_outfitInfo_0.outfitType == v14.OutfitTypes.Makeup else nil;
            if l_FFlagAXCustomizeMakeupSupport_0 and v46 then
                for _, v48 in {
                    v14.AssetTypeIdStrings.EyebrowAccessory, 
                    v14.AssetTypeIdStrings.EyelashAccessory, 
                    v14.AssetTypeIdStrings.FaceMakeup, 
                    v14.AssetTypeIdStrings.EyeMakeup, 
                    v14.AssetTypeIdStrings.LipMakeup
                } do
                    if not l_outfitInfo_0.assets[v48] then
                        l_outfitInfo_0.assets[v48] = {};
                    end;
                end;
            end;
            if l_FFlagAXCustomizeMakeupSupport_0 then
                local v49 = {};
                for _, v51 in {
                    v14.AssetTypeIdStrings.FaceMakeup, 
                    v14.AssetTypeIdStrings.EyeMakeup, 
                    v14.AssetTypeIdStrings.LipMakeup
                } do
                    if l_outfitInfo_0.assets[v51] then
                        for v52, v53 in l_outfitInfo_0.assets[v51] do
                            table.insert(v49, {
                                itemId = v52, 
                                assetTypeId = v51, 
                                metadata = v53
                            });
                        end;
                    end;
                end;
                table.sort(v49, function(v54, v55) --[[ Line: 187 ]]
                    local v56 = false;
                    if v54.metadata.order ~= nil then
                        v56 = true;
                        if v55.metadata.order ~= nil then
                            v56 = v54.metadata.order < v55.metadata.order;
                        end;
                    end;
                    return v56;
                end);
                for v57, v58 in v49 do
                    l_outfitInfo_0.assets[v58.assetTypeId][v58.itemId].order = v57 - 1;
                end;
            end;
            v34:dispatch(v10());
            if l_tryOnBundleInfo_0 then
                local v59 = {};
                for v60, v61 in l_outfitInfo_0.assets do
                    local v62 = {};
                    for v63, v64 in v61 do
                        if v64.order and l_tryOnBundleInfo_0[v63] and l_tryOnBundleInfo_0[v63].order then
                            v64.order = l_tryOnBundleInfo_0[v63].order;
                        end;
                        v62[v63] = v64;
                    end;
                    v59[v60] = v62;
                end;
                local l_v37_0 = v37;
                if l_blockFullReset_0 then
                    l_v37_0 = false;
                end;
                v34:dispatch(v4(v11.removeEmoteAnimationAsset(v59), l_v37_0));
            else
                v34:dispatch(v4(v11.removeEmoteAnimationAsset(l_outfitInfo_0.assets), v37));
            end;
            if not l_fromOutfitPurchase_0 then
                v34:dispatch(v9());
                v13.closeFiltersAndItemDetails(l_navigation_0);
            end;
            local l_DefaultBodyColorRanges_0 = v34:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
            if v37 then
                if not v11.isPresetOutfit(l_outfitInfo_0) then
                    v34:dispatch(v8(l_outfitInfo_0.bodyColor3s, l_DefaultBodyColorRanges_0));
                end;
                v34:dispatch(v7(l_outfitInfo_0.scales));
                v34:dispatch(v6(l_outfitInfo_0.avatarType));
            end;
            return true;
        end;
    end;
end;