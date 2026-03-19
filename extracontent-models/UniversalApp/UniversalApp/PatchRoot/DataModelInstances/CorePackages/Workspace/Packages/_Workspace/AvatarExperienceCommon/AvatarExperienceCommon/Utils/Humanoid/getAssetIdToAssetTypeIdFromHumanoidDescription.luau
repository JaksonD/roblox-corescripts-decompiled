local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local v1 = require(l_script_FirstAncestor_0.Constants);
return function(v2) --[[ Line: 5 ]] --[[ Name: getAssetIdToAssetTypeIdFromHumanoidDescription ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    for v4, v5 in v1.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP do
        if v1.ASSET_TYPE_TO_ACCESSORY_TYPE[tostring(v4)] == nil then
            local v6 = v2[v5];
            if typeof(v6) == "number" and v6 > 0 then
                v3[tostring(v6)] = tostring(v4);
            elseif typeof(v6) == "string" and v6 ~= "" then
                for v7 in v6:gmatch("([%d]+),?") do
                    v3[v7] = tostring(v4);
                end;
            end;
        end;
    end;
    for _, v9 in (v2:GetAccessories(true)) do
        local l_AccessoryType_0 = v9.AccessoryType;
        v3[tostring(v9.AssetId)] = v1.ACCESSORY_TYPE_TO_ASSET_TYPE[l_AccessoryType_0];
    end;
    return v3;
end;