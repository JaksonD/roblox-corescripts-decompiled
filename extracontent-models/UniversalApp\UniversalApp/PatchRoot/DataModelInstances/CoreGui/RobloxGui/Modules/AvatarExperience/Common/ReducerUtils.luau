local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return {
    filterTryOns = function(v6, v7) --[[ Line: 34 ]] --[[ Name: filterTryOns ]]
        -- upvalues: v3 (copy)
        local v8 = {};
        local v9 = nil;
        for v10, v11 in v6 do
            local v12 = v3.AssetTypeToAssetCategory[v7.itemSubType];
            local v13 = not v12 or v3.AssetTypeToAssetCategory[v11.itemSubType] ~= v12;
            if v11.itemSubType ~= v7.itemSubType and v13 then
                v8[v10] = v11;
            else
                v9 = v11;
            end;
        end;
        return v8, v9;
    end, 
    convertDefaultBodyColorRanges = function(v14) --[[ Line: 55 ]]
        local v15 = {};
        for _, v17 in v14 do
            table.insert(v15, {
                rangeId = v17[1]:ToHex(), 
                range = v17
            });
        end;
        return v15;
    end, 
    generateTryOnItemIdKey = function(v18, v19, v20) --[[ Line: 71 ]]
        -- upvalues: v3 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
        if v20 ~= nil and (v20 == v3.LookType.Avatar or l_FFlagAXCatalogMakeupSupport_0 and v20 == v3.LookType.Makeup) then
            return tostring(v18) .. "-" .. v19;
        else
            return v18;
        end;
    end, 
    generateRecommendedItemsKey = function(v21, v22) --[[ Line: 91 ]]
        local v23 = v21 or "";
        return (v22 or "") .. "-" .. v23;
    end
};