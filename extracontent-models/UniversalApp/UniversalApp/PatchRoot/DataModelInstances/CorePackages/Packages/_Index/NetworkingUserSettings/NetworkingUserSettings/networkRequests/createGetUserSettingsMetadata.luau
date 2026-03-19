local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.API_URL);
local _ = require(l_Parent_0.Types.networkRequestsTypes);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return v3.roduxNetworking.GET(script, function(v4) --[[ Line: 8 ]]
        -- upvalues: v1 (ref)
        return v4(v1):path("user-settings-api"):path("v1"):path("user-settings"):path("metadata");
    end);
end;