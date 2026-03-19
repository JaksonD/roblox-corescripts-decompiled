local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Selectors.IsDetailsItemPartOfBundleAndOffsale);
local v2 = require(l_Parent_0.UtilityFunctions);
return function(v3) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_assetId_0 = v3.detailsInformation.assetId;
    if not l_assetId_0 then
        return false;
    else
        local v5 = v1(v3);
        if v5 == nil then
            return false;
        else
            local v6 = v3.assets[l_assetId_0];
            if not v6 then
                return false;
            elseif v5 then
                local v7 = v2.getBundleId(v6);
                return v3.favorites.bundles[v7];
            else
                return v3.favorites.assets[l_assetId_0];
            end;
        end;
    end;
end;