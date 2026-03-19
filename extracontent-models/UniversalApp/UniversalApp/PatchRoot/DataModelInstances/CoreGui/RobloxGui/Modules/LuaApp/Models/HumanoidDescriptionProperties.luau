local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.tutils);
local v4 = require(l_Modules_0.LuaApp.mutedError);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AssetTypeIdStringToHumanoidDescriptionProp_0 = v5.AssetTypeIdStringToHumanoidDescriptionProp;
local l_HumanoidDescriptionScaleToName_0 = v5.HumanoidDescriptionScaleToName;
local l_BodyPartForSkinColoringIdToHumanoidDescription_0 = v5.BodyPartForSkinColoringIdToHumanoidDescription;
local v9 = {};
local v10 = v2.interface({
    id = v2.number, 
    assets = v2.table, 
    bodyColor3s = v2.table, 
    scale = v2.table
});
v9.new = function() --[[ Line: 29 ]] --[[ Name: new ]]
    return {};
end;
v9.fromOutfitDetailsWebApi = function(v11) --[[ Line: 36 ]] --[[ Name: fromOutfitDetailsWebApi ]]
    -- upvalues: v9 (copy), v10 (copy), v4 (copy), v3 (copy), l_AssetTypeIdStringToHumanoidDescriptionProp_0 (copy), v2 (copy), l_BodyPartForSkinColoringIdToHumanoidDescription_0 (copy), l_HumanoidDescriptionScaleToName_0 (copy)
    local v12 = v9.new();
    if not v10(v11) then
        v4(string.format("the responseBody of Avatar endpoint, /v3/outfits/{outfitId}/details, did not have expected sets of data: %s", v3.toString(v11)));
    end;
    local l_id_0 = v11.id;
    local v14 = v11.assets or {};
    local v15 = v11.scale or {};
    for _, v17 in pairs(v14) do
        local v18 = v17.assetType and v17.assetType.id;
        local v19 = tostring(v17.id);
        local v20 = l_AssetTypeIdStringToHumanoidDescriptionProp_0[tostring(v18)];
        if v2.string(v20) then
            v12[v20] = v19;
        else
            v4(string.format("Avatar's /%s/outfits/%s/details returned an assetTypeId that was not recognized: %s", "v3", l_id_0, v3.toString(v17)));
        end;
    end;
    local v21 = v11.bodyColor3s or {};
    for v22, v23 in pairs(v21) do
        local v24 = l_BodyPartForSkinColoringIdToHumanoidDescription_0[tostring(v22)];
        if v2.string(v24) then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 76 ]]
                -- upvalues: v23 (copy)
                return Color3.fromHex(v23);
            end);
            if l_status_0 then
                v12[v24] = l_result_0;
            else
                v4(string.format("Avatar's /v3/outfits/%s/details returned a bodyColor3 with bad hash value: bodyPartForSkinColoringId = %s, bodyColor3AsHex = %s", l_id_0, v22, v23));
            end;
        else
            v4(string.format("Avatar's /v3/outfits/%s/details returned a BodyPartForSkinColoringId that was not recognized: bodyPartForSkinColoringId = %s, bodyColor3AsHex = %s", l_id_0, v22, v23));
        end;
    end;
    for v27, v28 in pairs(v15) do
        local v29 = l_HumanoidDescriptionScaleToName_0[tostring(v27)];
        if v2.string(v29) then
            v12[v29] = v28;
        else
            v4(string.format("Avatar's /%s/outfits/%s/details returned a scaleType that was not recognized: scaleType: %s, scale: %s", "v3", l_id_0, v27, v28));
        end;
    end;
    return v12;
end;
v9.createHumanoidDescription = function(v30) --[[ Line: 125 ]] --[[ Name: createHumanoidDescription ]]
    local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
    for v32, v33 in pairs(v30) do
        l_HumanoidDescription_0[v32] = v33;
    end;
    return l_HumanoidDescription_0;
end;
return v9;