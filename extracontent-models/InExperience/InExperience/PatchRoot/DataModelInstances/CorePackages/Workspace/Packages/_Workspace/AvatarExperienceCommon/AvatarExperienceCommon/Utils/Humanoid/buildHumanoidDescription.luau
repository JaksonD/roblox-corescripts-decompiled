local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_script_FirstAncestor_0.Utils.Humanoid.createHumanoidDescriptionAccessoryInfo);
local v5 = require(l_script_FirstAncestor_0.Utils.Humanoid.setMakeupDescriptions);
local v6 = require(l_script_FirstAncestor_0.Utils.isMakeupAssetType);
local l_FFlagAXMakeupEquipping_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMakeupEquipping;
local function v19(v8, v9) --[[ Line: 24 ]] --[[ Name: applyCurrentAssets ]]
    -- upvalues: v3 (copy), v4 (copy), l_FFlagAXMakeupEquipping_0 (copy), v6 (copy), l_mutedError_0 (copy), v5 (copy)
    if v9 then
        local v10 = {};
        for v11, v12 in v9 do
            local v13 = {};
            local v14 = v3.ASSET_TYPE_TO_ACCESSORY_TYPE[v11];
            for v15, v16 in v12 do
                if v14 then
                    table.insert(v10, v4(v11, v15, v16));
                else
                    table.insert(v13, v15);
                end;
            end;
            if v14 == nil and #v13 > 0 then
                local v17 = v3.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[v11];
                local v18 = table.concat(v13, ",");
                if v17 then
                    v8[v17] = v18;
                elseif v11 ~= v3.ASSET_TYPE_NAME_TO_ID_STRING.Gear and (not l_FFlagAXMakeupEquipping_0 or not v6(v11)) then
                    l_mutedError_0(string.format("assetTypeId: %s not recognized as member of humanoidDescription", (tostring(v11))));
                end;
            end;
        end;
        v8:SetAccessories(v10, true);
        if l_FFlagAXMakeupEquipping_0 then
            v5(v8, v9);
        end;
    end;
end;
local function _(v20, v21) --[[ Line: 66 ]] --[[ Name: applyAvatarScales ]]
    -- upvalues: v3 (copy)
    if v21 then
        for v22, v23 in v21 do
            v20[v3.HUMANOID_DESCRIPTION_SCALE_TO_NAME[v22]] = v23;
        end;
    end;
end;
local function _(v25, v26) --[[ Line: 76 ]] --[[ Name: applyBodyColor3s ]]
    -- upvalues: v3 (copy)
    if v26 then
        for v27, v28 in v26 do
            v25[v3.BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION[v27]] = v28;
        end;
    end;
end;
local function v36(v30, v31) --[[ Line: 87 ]] --[[ Name: applyEmotes ]]
    if v31 then
        local v32 = {};
        local v33 = {};
        for _, v35 in v31 do
            v32[tostring(v35.assetId)] = {
                (tonumber(v35.assetId))
            };
            table.insert(v33, {
                Slot = v35.position, 
                Name = tostring(v35.assetId)
            });
        end;
        v30:SetEmotes(v32);
        v30:SetEquippedEmotes(v33);
    end;
end;
return function(v37) --[[ Line: 108 ]] --[[ Name: buildHumanoidDescription ]]
    -- upvalues: v19 (copy), v3 (copy), v36 (copy)
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    v19(l_HumanoidDescription_0, v37.currentAssets);
    local l_avatarScales_0 = v37.avatarScales;
    if l_avatarScales_0 then
        for v40, v41 in l_avatarScales_0 do
            l_HumanoidDescription_0[v3.HUMANOID_DESCRIPTION_SCALE_TO_NAME[v40]] = v41;
        end;
    end;
    l_avatarScales_0 = v37.bodyColor3s;
    if l_avatarScales_0 then
        for v42, v43 in l_avatarScales_0 do
            l_HumanoidDescription_0[v3.BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION[v42]] = v43;
        end;
    end;
    v36(l_HumanoidDescription_0, v37.emotesSlotInfo);
    return l_HumanoidDescription_0;
end;