local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetNetworking");
local v1 = require(l_script_FirstAncestor_0.ASSETS_API_URL);
return function(v2) --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetAssetDetails"
    }, function(v3, v4) --[[ Line: 12 ]]
        -- upvalues: v1 (ref)
        return v3(v1):path("v1"):path("assets"):path(v4);
    end);
end;