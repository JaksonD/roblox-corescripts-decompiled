local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local l_FFlagAXEditorSubcategoryFilters_0 = v5.FFlagAXEditorSubcategoryFilters;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local function v31(v16, v17, v18, v19, v20, v21, v22, v23, _) --[[ Line: 40 ]] --[[ Name: isWearingAssetOrOutfit ]]
    -- upvalues: v6 (copy), v7 (copy), v11 (copy)
    local l_selectedSlot_0 = v23.selectedSlot;
    local v26 = v23.slotInfo[l_selectedSlot_0];
    local v27 = v17.RenderOutfitItemTiles == true;
    if v17.PageType == v6.PageType.Emotes then
        if v26 then
            return v26.assetId == v16;
        else
            return false;
        end;
    elseif not v18 then
        return false;
    elseif v27 and v22[v16] then
        local v28 = v22[v16];
        return v7.isWearingOutfitNoState(v28, v21, v19, v18, v20, v11() and true or nil);
    else
        for _, v30 in v18 do
            if v30[v16] then
                return true;
            end;
        end;
        return false;
    end;
end;
local v55 = l_memoize_0(function(v32, v33, v34, v35, v36, v37, v38, v39, v40, v41) --[[ Line: 91 ]]
    -- upvalues: v8 (copy), v3 (copy), v31 (copy), v12 (copy)
    local v42 = {};
    local v43 = false;
    if not v32 then
        return v42, v43;
    else
        local v44 = v34[v32];
        if v32 == v8.EditableCharacterKey or v32 == v8.PurchasedCharacterKey then
            v44 = v34[v8.PurchasedCharacterKey] or {};
            v44 = v3.List.join(v44, v34[v8.EditableCharacterKey] or {});
        end;
        if not v44 then
            return v42, v43;
        else
            for _, v46 in v44 do
                local v47 = v31(v46, v33, v35, v36, v37, v38, v39, v40, v41);
                v42[v46] = v47;
                if v47 then
                    v43 = v47;
                end;
            end;
            if v12() and v35 or not v12() and v33.Sort then
                local v48 = v33.AssetTypeIdStrings or {};
                for _, v50 in v48 do
                    for v51, v52 in v35 do
                        for v53, _ in v52 do
                            if v50 == v51 then
                                v42[v53] = true;
                                v43 = true;
                            end;
                        end;
                    end;
                end;
            end;
            return v42, v43;
        end;
    end;
end);
return function(v56, v57) --[[ Line: 177 ]] --[[ Name: selectOwnedItemIdToIsWearing ]]
    -- upvalues: v9 (copy), l_FFlagAXEditorSubcategoryFilters_0 (copy), v55 (copy)
    local v58 = v9.getAvatarEditorCategoryInfoFromState(v56);
    local v59 = if l_FFlagAXEditorSubcategoryFilters_0 then v9.getAvatarEditorSubcategoryFilterFromState(v56) else nil;
    local v60 = l_FFlagAXEditorSubcategoryFilters_0 and v59 or v58;
    return v55(v57, if l_FFlagAXEditorSubcategoryFilters_0 then v60 else v58, v56.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype, v56.AvatarExperience.AvatarEditor.Character.EquippedAssets, v56.AvatarExperience.AvatarEditor.Character.BodyColor3s, v56.AvatarExperience.AvatarEditor.Character.AvatarScales, v56.AvatarExperience.AvatarEditor.Character.AvatarType, v56.AvatarExperience.AvatarEditor.OutfitInfos, v56.AvatarExperience.AvatarEditor.EquippedEmotes, v56.AvatarExperience.AvatarEditor.Character.OutfitOrAsset);
end;