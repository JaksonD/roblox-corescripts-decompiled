local l_script_FirstAncestor_0 = script:FindFirstAncestor("CatalogNetworking");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.CATALOG_URL);
return function(v4) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v4.roduxNetworking.POST({
        Name = "GetItemDetails"
    }, function(v5, v6) --[[ Line: 17 ]]
        -- upvalues: v3 (ref), v2 (ref)
        return v5(v3):path("v1"):path("catalog"):path("items"):path("details"):body({
            items = v2.List.map(v6, function(v7) --[[ Line: 19 ]]
                return {
                    itemType = v7.itemType, 
                    id = v7.assetId
                };
            end)
        });
    end);
end;