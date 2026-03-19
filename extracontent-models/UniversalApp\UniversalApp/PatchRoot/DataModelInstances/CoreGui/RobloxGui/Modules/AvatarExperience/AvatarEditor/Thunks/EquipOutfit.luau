local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.EquipOutfit);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UnequipOutfit);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarType);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarScales);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetBodyColor3sFromOutfit);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v13 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_InventoryItemAvailability_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability;
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXModeratedItemsFlow_0 = v20.FFlagAXModeratedItemsFlow;
local l_FFlagAXCustomizeMakeupSupport_0 = v20.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXLogFacialAnimationOnHeadChange_0 = v20.FFlagAXLogFacialAnimationOnHeadChange;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v20.FFlagHeadRefinementFacialAnimationToggle;
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_sendUnifiedEventLog_0 = v25.sendUnifiedEventLog;
local l_UnifiedEventLogEnums_0 = v25.UnifiedEventLogEnums;
local l_UnifiedLoggingSurface_0 = v3.Enums.UnifiedLoggingSurface;
local v29 = {
    Torso = "27", 
    RightArm = "28", 
    LeftArm = "29", 
    LeftLeg = "30", 
    RightLeg = "31"
};
local _ = function(v30) --[[ Line: 59 ]] --[[ Name: isFullyQualifiedOutfit ]]
    -- upvalues: v29 (copy)
    for _, v32 in v29 do
        if not v30[v32] then
            return false;
        end;
    end;
    return true;
end;
local function _(v34) --[[ Line: 68 ]] --[[ Name: getEquippedDynamicHeadInfo ]]
    -- upvalues: v15 (copy)
    local v35 = v34[v15.AssetTypeIdStrings.DynamicHead];
    if v35 then
        for v36, v37 in v35 do
            return v36, v37.staticFacialAnimation;
        end;
    end;
    return nil, nil;
end;
local function v52(v39, v40) --[[ Line: 80 ]] --[[ Name: logFacialAnimationChangeOnHeadSwap ]]
    -- upvalues: v15 (copy), l_sendUnifiedEventLog_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedLoggingSurface_0 (copy), l_HttpService_0 (copy)
    local v41 = false;
    local v42 = false;
    local v43 = v39[v15.AssetTypeIdStrings.DynamicHead];
    local v44, v45;
    if v43 then
        for v46, v47 in v43 do
            v44 = v46;
            v45 = v47.staticFacialAnimation;
            v41 = true;
            if v41 then
                break;
            end;
        end;
    end;
    if not v41 then
        v44 = nil;
        v45 = nil;
    end;
    v41 = false;
    local v48 = v40[v15.AssetTypeIdStrings.DynamicHead];
    local v49;
    if v48 then
        for v50, v51 in v48 do
            v43 = v50;
            v49 = v51.staticFacialAnimation;
            v42 = true;
            if v42 then
                break;
            end;
        end;
    end;
    if not v42 then
        v43 = nil;
        v49 = nil;
    end;
    v42 = false;
    if v44 ~= v43 and v43 ~= nil and v45 ~= v49 then
        l_sendUnifiedEventLog_0({
            action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
            elementName = "FACIAL_ANIMATION_TOGGLE", 
            surface = l_UnifiedLoggingSurface_0.CUSTOMIZE, 
            itemId = tostring(v43), 
            elementMetadata = l_HttpService_0:JSONEncode({
                trigger = "HEAD_CHANGE", 
                change_from_FACS_status = v45 == nil or not v45, 
                change_to_FACS_status = v49 == nil or not v49
            })
        });
    end;
end;
return function(v53) --[[ Line: 113 ]]
    -- upvalues: v13 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v12 (copy), l_InventoryItemAvailability_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v15 (copy), v17 (copy), v29 (copy), v18 (copy), v6 (copy), l_FFlagAXLogFacialAnimationOnHeadChange_0 (copy), l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v11 (copy), v5 (copy), v52 (copy), v10 (copy), v14 (copy), v9 (copy), v8 (copy), v7 (copy)
    local l_outfitInfo_0 = v53.outfitInfo;
    local l_analytics_0 = v53.analytics;
    local l_navigation_0 = v53.navigation;
    local l_isSelected_0 = v53.isSelected;
    local l_fromOutfitPurchase_0 = v53.fromOutfitPurchase;
    local l_tryOnBundleInfo_0 = v53.tryOnBundleInfo;
    local l_blockFullReset_0 = v53.blockFullReset;
    return function(v61) --[[ Line: 122 ]]
        -- upvalues: v13 (ref), l_outfitInfo_0 (ref), l_analytics_0 (copy), l_navigation_0 (copy), l_blockFullReset_0 (copy), l_FFlagAXModeratedItemsFlow_0 (ref), v12 (ref), l_InventoryItemAvailability_0 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v15 (ref), v17 (ref), v29 (ref), v18 (ref), l_isSelected_0 (copy), v6 (ref), l_FFlagAXLogFacialAnimationOnHeadChange_0 (ref), l_FFlagHeadRefinementFacialAnimationToggle_0 (ref), v11 (ref), l_tryOnBundleInfo_0 (copy), v5 (ref), v52 (ref), l_fromOutfitPurchase_0 (copy), v10 (ref), v14 (ref), v9 (ref), v8 (ref), v7 (ref)
        local v62 = false;
        v13.isType(l_outfitInfo_0, "table", "EquipOutfit thunk expects outfitInfo to be a table");
        v13.isType(l_analytics_0, "table", "EquipOutfit thunk expects analytics");
        v13.isType(l_navigation_0, "table", "EquipOutfit thunk expects navigation");
        v13.isTypeOrNil(l_blockFullReset_0, "boolean", "EquipOutfit thunk expects blockFullReset");
        l_outfitInfo_0 = if l_FFlagAXModeratedItemsFlow_0 then v12.filterOutfitAssetsWithStatus(l_outfitInfo_0, {
            l_InventoryItemAvailability_0.Unavailable, 
            l_InventoryItemAvailability_0.Revoked
        }) else l_outfitInfo_0;
        local v63 = if l_FFlagAXCustomizeMakeupSupport_0 then l_outfitInfo_0.outfitType == v15.OutfitTypes.Avatar else nil;
        local v64 = if l_FFlagAXCustomizeMakeupSupport_0 then l_outfitInfo_0.isEditable and v63 else l_outfitInfo_0.isEditable;
        if not v64 then
            if v17() then
                v64 = v12.isFullyQualifiedOutfit(l_outfitInfo_0.assets);
            else
                local l_assets_0 = l_outfitInfo_0.assets;
                for _, v67 in v29 do
                    if not l_assets_0[v67] then
                        v64 = false;
                        v62 = true;
                    end;
                    if v62 then
                        break;
                    end;
                end;
                if not v62 then
                    v64 = true;
                end;
            end;
        end;
        v62 = false;
        if l_analytics_0 then
            l_analytics_0.outfitClicked(l_outfitInfo_0.outfitId, l_outfitInfo_0.outfitType, l_outfitInfo_0.isEditable);
        end;
        local v68 = l_outfitInfo_0.outfitType == v15.OutfitTypes.DynamicHead;
        if v68 then
            for v69, _ in v15.DynamicHeadAssetTypes do
                if not l_outfitInfo_0.assets[v69] then
                    l_outfitInfo_0.assets[v69] = {};
                end;
            end;
            l_outfitInfo_0.assets[v15.AssetTypeIdStrings.Head] = {};
            l_outfitInfo_0.assets[v15.AssetTypeIdStrings.Face] = {};
        end;
        local v71 = if v18() then l_outfitInfo_0.outfitType == v15.OutfitTypes.Shoes else nil;
        local v72 = if v18() then l_outfitInfo_0.inventoryType == v15.OutfitTypes.Animations else nil;
        if (v68 or v18() and v71 or v18() and v72) and l_isSelected_0 then
            v61:dispatch(v6(l_outfitInfo_0.assets));
            return false;
        else
            local v73 = if l_FFlagAXCustomizeMakeupSupport_0 then l_outfitInfo_0.outfitType == v15.OutfitTypes.Makeup else nil;
            if l_FFlagAXCustomizeMakeupSupport_0 and v73 then
                for _, v75 in {
                    v15.AssetTypeIdStrings.EyebrowAccessory, 
                    v15.AssetTypeIdStrings.EyelashAccessory, 
                    v15.AssetTypeIdStrings.FaceMakeup, 
                    v15.AssetTypeIdStrings.EyeMakeup, 
                    v15.AssetTypeIdStrings.LipMakeup
                } do
                    if not l_outfitInfo_0.assets[v75] then
                        l_outfitInfo_0.assets[v75] = {};
                    end;
                end;
            end;
            if l_FFlagAXCustomizeMakeupSupport_0 then
                local v76 = {};
                for _, v78 in {
                    v15.AssetTypeIdStrings.FaceMakeup, 
                    v15.AssetTypeIdStrings.EyeMakeup, 
                    v15.AssetTypeIdStrings.LipMakeup
                } do
                    if l_outfitInfo_0.assets[v78] then
                        for v79, v80 in l_outfitInfo_0.assets[v78] do
                            table.insert(v76, {
                                itemId = v79, 
                                assetTypeId = v78, 
                                metadata = v80
                            });
                        end;
                    end;
                end;
                table.sort(v76, function(v81, v82) --[[ Line: 230 ]]
                    local v83 = false;
                    if v81.metadata.order ~= nil then
                        v83 = true;
                        if v82.metadata.order ~= nil then
                            v83 = v81.metadata.order < v82.metadata.order;
                        end;
                    end;
                    return v83;
                end);
                for v84, v85 in v76 do
                    l_outfitInfo_0.assets[v85.assetTypeId][v85.itemId].order = v84 - 1;
                end;
            end;
            local v86 = nil;
            if l_FFlagAXLogFacialAnimationOnHeadChange_0 and l_FFlagHeadRefinementFacialAnimationToggle_0 then
                local v87 = v61:getState();
                v86 = v87.AvatarExperience and v87.AvatarExperience.AvatarEditor and v87.AvatarExperience.AvatarEditor.Character and v87.AvatarExperience.AvatarEditor.Character.EquippedAssets;
            end;
            v61:dispatch(v11());
            if l_tryOnBundleInfo_0 then
                local v88 = {};
                for v89, v90 in l_outfitInfo_0.assets do
                    local v91 = {};
                    for v92, v93 in v90 do
                        if v93.order and l_tryOnBundleInfo_0[v92] and l_tryOnBundleInfo_0[v92].order then
                            v93.order = l_tryOnBundleInfo_0[v92].order;
                        end;
                        v91[v92] = v93;
                    end;
                    v88[v89] = v91;
                end;
                local l_v64_0 = v64;
                if l_blockFullReset_0 then
                    l_v64_0 = false;
                end;
                v61:dispatch(v5(v12.removeEmoteAnimationAsset(v88), l_v64_0));
            else
                v61:dispatch(v5(v12.removeEmoteAnimationAsset(l_outfitInfo_0.assets), v64));
            end;
            if l_FFlagAXLogFacialAnimationOnHeadChange_0 and l_FFlagHeadRefinementFacialAnimationToggle_0 and v86 then
                local l_EquippedAssets_0 = v61:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
                v52(v86, l_EquippedAssets_0);
            end;
            if not l_fromOutfitPurchase_0 then
                v61:dispatch(v10());
                v14.closeFiltersAndItemDetails(l_navigation_0);
            end;
            local l_DefaultBodyColorRanges_0 = v61:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
            if v64 then
                if not v12.isPresetOutfit(l_outfitInfo_0) then
                    v61:dispatch(v9(l_outfitInfo_0.bodyColor3s, l_DefaultBodyColorRanges_0));
                end;
                v61:dispatch(v8(l_outfitInfo_0.scales));
                v61:dispatch(v7(l_outfitInfo_0.avatarType));
            end;
            return true;
        end;
    end;
end;