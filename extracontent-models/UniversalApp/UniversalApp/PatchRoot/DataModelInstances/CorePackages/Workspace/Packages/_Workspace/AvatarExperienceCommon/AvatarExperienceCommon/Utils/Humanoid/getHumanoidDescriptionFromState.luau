local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_ASSET_TYPE_NAME_TO_ID_STRING_0 = require(l_script_FirstAncestor_0.Constants).ASSET_TYPE_NAME_TO_ID_STRING;
local l_ASSET_TYPE_TO_ACCESSORY_TYPE_0 = require(l_script_FirstAncestor_0.Constants).ASSET_TYPE_TO_ACCESSORY_TYPE;
local l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0 = require(l_script_FirstAncestor_0.Constants).ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP;
local l_HUMANOID_DESCRIPTION_SCALE_TO_NAME_0 = require(l_script_FirstAncestor_0.Constants).HUMANOID_DESCRIPTION_SCALE_TO_NAME;
local v7 = require(script.Parent.setHumanoidDescriptionColorsFromBodyColor3s);
local v8 = require(script.Parent.createHumanoidDescriptionAccessoryInfo);
local v9 = require(script.Parent.setMakeupDescriptions);
local v10 = require(l_script_FirstAncestor_0.Utils.isMakeupAssetType);
local l_FFlagAXMakeupEquipping_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMakeupEquipping;
return function(v12) --[[ Line: 18 ]]
    -- upvalues: l_ASSET_TYPE_TO_ACCESSORY_TYPE_0 (copy), v8 (copy), l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0 (copy), l_ASSET_TYPE_NAME_TO_ID_STRING_0 (copy), l_FFlagAXMakeupEquipping_0 (copy), v10 (copy), l_mutedError_0 (copy), v9 (copy), l_HUMANOID_DESCRIPTION_SCALE_TO_NAME_0 (copy), v7 (copy)
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    local l_EquippedAssets_0 = v12.AvatarEditor.Character.EquippedAssets;
    local l_AvatarScales_0 = v12.AvatarEditor.Character.AvatarScales;
    if l_EquippedAssets_0 then
        local v16 = {};
        for v17, v18 in l_EquippedAssets_0 do
            local v19 = {};
            local v20 = l_ASSET_TYPE_TO_ACCESSORY_TYPE_0[v17];
            for v21, v22 in v18 do
                if v20 then
                    table.insert(v16, v8(v17, v21, v22));
                else
                    table.insert(v19, v21);
                end;
            end;
            if v20 == nil and #v19 > 0 then
                local v23 = l_ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP_0[v17];
                local v24 = table.concat(v19, ",");
                if v23 then
                    l_HumanoidDescription_0[v23] = v24;
                elseif v17 ~= l_ASSET_TYPE_NAME_TO_ID_STRING_0.Gear and (not l_FFlagAXMakeupEquipping_0 or not v10(v17)) then
                    l_mutedError_0(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(v17))));
                end;
            end;
        end;
        l_HumanoidDescription_0:SetAccessories(v16, true);
        if l_FFlagAXMakeupEquipping_0 then
            v9(l_HumanoidDescription_0, l_EquippedAssets_0);
        end;
    end;
    if l_AvatarScales_0 then
        for v25, v26 in l_AvatarScales_0 do
            l_HumanoidDescription_0[l_HUMANOID_DESCRIPTION_SCALE_TO_NAME_0[v25]] = v26;
        end;
    end;
    v7(l_HumanoidDescription_0, v12.AvatarEditor.Character.BodyColor3s);
    local v27 = {};
    local v28 = {};
    for _, v30 in v12.AvatarEditor.EquippedEmotes.slotInfo do
        v27[tostring(v30.assetId)] = {
            (tonumber(v30.assetId))
        };
        table.insert(v28, {
            Slot = v30.position, 
            Name = tostring(v30.assetId)
        });
    end;
    l_HumanoidDescription_0:SetEmotes(v27);
    l_HumanoidDescription_0:SetEquippedEmotes(v28);
    return l_HumanoidDescription_0;
end;