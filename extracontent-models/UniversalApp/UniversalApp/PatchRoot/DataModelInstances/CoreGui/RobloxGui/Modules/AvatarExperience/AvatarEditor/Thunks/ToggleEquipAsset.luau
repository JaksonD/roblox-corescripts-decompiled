local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.tutils);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v10 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v11 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearCurrentSort);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate);
local v13 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.ToggleTryOn);
local v18 = v4.FFlagAXMISEnableMultiShopping and game:DefineFastFlag("AXMISRemoveSingleItemPurchaseFromTryOn", false);
local l_FFlagAXCustomizeMakeupSupport_0 = v4.FFlagAXCustomizeMakeupSupport;
local l_MaxHats_0 = v9.MaxHats;
local v21 = {
    toastMessage = "Feature.Avatar.Message.HatLimitTooltip", 
    isLocalized = false, 
    toastType = v13.InformationMessage
};
local v22 = {
    toastMessage = "Feature.Avatar.EmoteAlreadyAssigned", 
    isLocalized = false, 
    toastType = v13.InformationMessage
};
return function(v23, v24, v25, v26, v27, v28, v29) --[[ Line: 55 ]]
    -- upvalues: v2 (copy), v7 (copy), v14 (copy), v18 (copy), v17 (copy), v8 (copy), v10 (copy), v22 (copy), v3 (copy), l_MaxHats_0 (copy), v21 (copy), v11 (copy), v12 (copy), v16 (copy), v6 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    return function(v30) --[[ Line: 64 ]]
        -- upvalues: v26 (copy), v2 (ref), v7 (ref), v25 (copy), v14 (ref), v18 (ref), v17 (ref), v8 (ref), v23 (copy), v24 (copy), v10 (ref), v22 (ref), v3 (ref), l_MaxHats_0 (ref), v21 (ref), v11 (ref), v12 (ref), v16 (ref), v6 (ref), l_FFlagAXCustomizeMakeupSupport_0 (ref), v29 (copy), v27 (copy), v28 (copy)
        local l_EquippedAssets_0 = v30:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
        if not l_EquippedAssets_0 then
            return false;
        elseif v30:getState().AvatarExperience.LayeredClothingSort.CharacterUpdatesLocked then
            return false;
        else
            if not v26 then
                local l_TryOnItems_0 = v30:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
                if not v2.isEmpty(l_TryOnItems_0) then
                    v30:dispatch(v7());
                    if v25 then
                        v14.closeFiltersAndItemDetails(v25);
                    end;
                end;
            elseif v18 then
                v30:dispatch(v17(v8.ItemType.Asset, v23, v24, false));
                if v25 then
                    v14.closeFiltersAndItemDetails(v25);
                end;
            end;
            if v23 == v8.AssetTypeIdStrings.EmoteAnimation then
                local l_EquippedEmotes_0 = v30:getState().AvatarExperience.AvatarEditor.EquippedEmotes;
                local v34 = l_EquippedEmotes_0.slotInfo[l_EquippedEmotes_0.selectedSlot];
                if not (v34 and v34.assetId == v24) then
                    for _, v36 in l_EquippedEmotes_0.slotInfo do
                        if v36.assetId == v24 then
                            v30:dispatch(v10(v22));
                            return false;
                        end;
                    end;
                end;
            end;
            local v37 = l_EquippedAssets_0[v8.AssetTypeIdStrings.Hat];
            local v38 = 0;
            if v37 then
                v38 = v3.fieldCount(v37);
            end;
            if v23 == v8.AssetTypeIdStrings.Hat and v37 and l_MaxHats_0 <= v38 then
                v37 = v37 or {};
                local v39 = false;
                if v37[v24] then
                    v39 = true;
                end;
                if not v39 then
                    v30:dispatch(v10(v21));
                    return false;
                end;
            end;
            if #v30:getState().AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList ~= 0 then
                v30:dispatch(v11());
            end;
            if v8.LayeredAssetTypes[v23] ~= nil then
                v30:dispatch(v12());
            end;
            local v40 = v16.isDynamicHeadEquipped(l_EquippedAssets_0);
            if v23 == v8.AssetTypeIdStrings.Face and v40 then
                for v41, _ in v8.DynamicHeadAssetTypes do
                    for _, v44 in (v16.getEquippedAssetIdsForType(l_EquippedAssets_0, v41)) do
                        v30:dispatch(v6(v41, v44));
                    end;
                end;
            end;
            if l_FFlagAXCustomizeMakeupSupport_0 and v29 then
                for _, v46 in v29 do
                    if l_EquippedAssets_0[v46] then
                        for v47, v48 in l_EquippedAssets_0[v46] do
                            if v48.order == v27 then
                                v30:dispatch(v6(v46, v47));
                            end;
                        end;
                    end;
                end;
            end;
            v30:dispatch(v6(v23, v24, v27, v28));
            return true;
        end;
    end;
end;