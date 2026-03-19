local l_Roact_0 = require(script.Parent.Parent.Parent.dependencies).Roact;
local v1 = require(script.Parent.mockProviders);
return function(v2, v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), l_Roact_0 (copy)
    if v3 == nil then
        v3 = Instance.new("Frame");
    end;
    local v4 = v1(v2);
    local v5 = l_Roact_0.mount(v4, v3);
    return v3, function() --[[ Line: 14 ]]
        -- upvalues: l_Roact_0 (ref), v5 (copy), v3 (ref)
        l_Roact_0.unmount(v5);
        v3:Destroy();
    end;
end;