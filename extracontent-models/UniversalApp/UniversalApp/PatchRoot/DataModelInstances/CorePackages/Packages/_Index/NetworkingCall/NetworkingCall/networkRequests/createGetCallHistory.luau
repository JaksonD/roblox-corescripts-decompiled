local v0 = require(script.Parent.Parent.CALL_URL);
local _ = require(script.Parent.Parent.networkingCallTypes);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return (v2.roduxNetworking.GET({
        Name = "GetCallHistory"
    }, function(v3, v4) --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        return v3(v0):path("call"):path("v1"):path("get-call-history"):queryArgs({
            universeId = if v4 then v4.universeId else nil, 
            limit = if v4 then v4.limit else nil, 
            cursor = if v4 then v4.cursor else nil
        });
    end));
end;