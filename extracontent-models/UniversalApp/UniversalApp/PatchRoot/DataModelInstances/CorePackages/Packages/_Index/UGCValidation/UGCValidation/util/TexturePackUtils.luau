local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local l_util_0 = l_Parent_0.util;
local v3 = require(l_util_0.ParseContentIds);
local l_flags_0 = l_Parent_0.flags;
local v5 = require(l_flags_0.getFFlagUGCValidateEmptySurfaceAppearance);
local v6 = {};
local function v15(v7, v8) --[[ Line: 17 ]] --[[ Name: findSurfaceAppearances ]]
    -- upvalues: l_UGCValidationService_0 (copy), v3 (copy), v5 (copy)
    local v9 = {};
    local v10 = {};
    local l_v7_Descendants_0 = v7:GetDescendants();
    table.insert(l_v7_Descendants_0, v7);
    for _, v13 in l_v7_Descendants_0 do
        if v13:IsA("SurfaceAppearance") then
            local l_l_UGCValidationService_0_PropertyValue_0 = l_UGCValidationService_0:GetPropertyValue(v13, "TexturePack");
            if if l_l_UGCValidationService_0_PropertyValue_0 then v3.tryGetAssetIdFromContentId(l_l_UGCValidationService_0_PropertyValue_0) else nil then
                table.insert(v9, v13);
            elseif v5() then
                if v13.ColorMap and v13.ColorMap ~= "" or v13.MetalnessMap and v13.MetalnessMap ~= "" or v13.NormalMap and v13.NormalMap ~= "" or v13.RoughnessMap and v13.RoughnessMap ~= "" or v13.EmissiveMaskContent and v13.EmissiveMaskContent.SourceType == Enum.ContentSourceType.Uri and v13.EmissiveMaskContent.Uri and v13.EmissiveMaskContent.Uri ~= "" or not v8 then
                    table.insert(v10, v13);
                end;
            else
                table.insert(v10, v13);
            end;
        end;
    end;
    return v9, v10;
end;
v6.findSurfaceAppearancesMissingTexturePacks = function(v16, v17) --[[ Line: 60 ]] --[[ Name: findSurfaceAppearancesMissingTexturePacks ]]
    -- upvalues: v15 (copy)
    local _, v19 = v15(v16, v17);
    return v19;
end;
v6.findSurfaceAppearancesWithTexturePacks = function(v20) --[[ Line: 68 ]] --[[ Name: findSurfaceAppearancesWithTexturePacks ]]
    -- upvalues: v15 (copy)
    return (v15(v20, false));
end;
return v6;