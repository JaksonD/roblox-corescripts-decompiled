local l_script_FirstAncestor_0 = script:FindFirstAncestor("NetworkingVirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Http);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return (v2.GET(script.Name, function(v3, v4) --[[ Line: 6 ]]
        -- upvalues: v1 (ref)
        return v3(v1.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(v4):path("rsvps"):path("counters");
    end));
end;