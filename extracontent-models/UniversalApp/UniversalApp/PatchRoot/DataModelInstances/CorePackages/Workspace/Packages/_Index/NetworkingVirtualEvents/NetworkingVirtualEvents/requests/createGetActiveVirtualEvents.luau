local l_script_FirstAncestor_0 = script:FindFirstAncestor("NetworkingVirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Http);
return function(v2) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    return (v2.GET(script.Name, function(v3, v4) --[[ Line: 13 ]]
        -- upvalues: v1 (ref)
        local v5 = v3(v1.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):path("active");
        if v4 then
            v5 = v5:queryArgs(v4);
        end;
        return v5;
    end));
end;