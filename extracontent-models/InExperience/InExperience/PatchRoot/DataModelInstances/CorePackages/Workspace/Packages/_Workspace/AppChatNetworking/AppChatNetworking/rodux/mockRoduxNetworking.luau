local v0 = require(script.Parent.RoduxNetworking);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v2 = v0.getNetworkImpl();
    v0.setNetworkImpl(v1);
    return function() --[[ Line: 7 ]]
        -- upvalues: v0 (ref), v2 (copy)
        v0.setNetworkImpl(v2);
    end;
end;