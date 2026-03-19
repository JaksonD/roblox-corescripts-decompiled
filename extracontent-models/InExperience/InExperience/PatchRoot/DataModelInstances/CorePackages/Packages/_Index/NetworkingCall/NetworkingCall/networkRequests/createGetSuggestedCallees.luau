local v0 = require(script.Parent.Parent.CALL_URL);
local _ = require(script.Parent.Parent.networkingCallTypes);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return (v2.roduxNetworking.GET({
        Name = "GetSuggestedCallees"
    }, function(v3) --[[ Line: 8 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("call"):path("v1"):path("get-suggested-callees");
    end));
end;