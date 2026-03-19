local l_script_FirstAncestor_0 = script:FindFirstAncestor("NetworkingVirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Http);
local _ = require(l_script_FirstAncestor_0.types);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return (v3.POST(script.Name, function(v4, v5, v6) --[[ Line: 9 ]]
        -- upvalues: v1 (ref)
        return (v4(v1.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(v5):path("rsvps"):body({
            rsvpStatus = v6
        }));
    end));
end;