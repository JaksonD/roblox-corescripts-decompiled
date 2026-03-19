local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local _ = require(l_Modules_0.AvatarExperience.AvatarEditor.Reducers.Character);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXSimplifyOutfitEquipCheck);
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local function v19(v9, v10, v11) --[[ Line: 24 ]] --[[ Name: getIdOfOutfitBeingWorn ]]
    -- upvalues: v4 (copy), v7 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy)
    local l_AvatarType_0 = v11.AvatarType;
    local l_BodyColor3s_0 = v11.BodyColor3s;
    local l_EquippedAssets_0 = v11.EquippedAssets;
    local l_AvatarScales_0 = v11.AvatarScales;
    for _, v17 in v9 do
        local v18 = v10[tostring(v17)];
        if v18 and v4.isWearingOutfitNoState(v18, l_AvatarType_0, l_BodyColor3s_0, l_EquippedAssets_0, l_AvatarScales_0, not not v7() or l_FFlagAXCustomizeMakeupSupport_0 and true or nil, not not v7() or l_FFlagAXCustomizeMakeupSupport_0 and true or nil) then
            return v17;
        end;
    end;
    return nil;
end;
local v24 = l_memoize_0(function(v20, v21, v22, v23) --[[ Line: 58 ]]
    -- upvalues: v19 (copy)
    return v19(v21, v23, v22) or v19(v20, v23, v22);
end);
return function(v25) --[[ Line: 69 ]] --[[ Name: GetDuplicateOutfit ]]
    -- upvalues: v3 (copy), v24 (copy)
    local l_OwnedItemIdsBySubtype_0 = v25.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
    local v27 = l_OwnedItemIdsBySubtype_0[v3.PurchasedCharacterKey] or {};
    local v28 = l_OwnedItemIdsBySubtype_0[v3.EditableCharacterKey] or {};
    local l_Character_0 = v25.AvatarExperience.AvatarEditor.Character;
    local l_OutfitInfos_0 = v25.AvatarExperience.AvatarEditor.OutfitInfos;
    return v24(v27, v28, l_Character_0, l_OutfitInfos_0);
end;