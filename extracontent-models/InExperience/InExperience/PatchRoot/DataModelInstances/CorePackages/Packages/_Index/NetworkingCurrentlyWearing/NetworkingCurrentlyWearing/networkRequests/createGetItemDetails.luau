local l_Parent_0 = script:FindFirstAncestor("NetworkingCurrentlyWearing").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(script.Parent.Parent.CATALOG_URL);
return function(v3) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v3.roduxNetworking.POST({
        Name = "GetItemDetails"
    }, function(v4, v5) --[[ Line: 14 ]]
        -- upvalues: v2 (ref), v1 (ref)
        return v4(v2):path("v1"):path("catalog"):path("items"):path("details"):body({
            items = v1.map(v5, function(v6) --[[ Line: 16 ]]
                return {
                    itemType = "Asset", 
                    id = v6
                };
            end)
        });
    end);
end;