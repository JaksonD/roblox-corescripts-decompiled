local l_script_FirstAncestor_0 = script:FindFirstAncestor("NetworkingVirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Http);
return function(v2) --[[ Line: 11 ]]
    -- upvalues: v1 (copy)
    return (v2.GET(script.Name, function(v3, v4, v5) --[[ Line: 14 ]]
        -- upvalues: v1 (ref)
        local v6 = v3(v1.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(v4):path("rsvps");
        if v5 then
            v6 = v6:queryArgs(v5);
        end;
        return v6;
    end));
end;