local l_HttpService_0 = game:GetService("HttpService");
local l_Roact_0 = require(script.Parent.Parent.Parent.dependencies).Roact;
local v2 = require(script.Parent.mockProviders);
return function(v3, v4) --[[ Line: 17 ]]
    -- upvalues: l_HttpService_0 (copy), v2 (copy), l_Roact_0 (copy)
    v4 = v4 or {};
    local l_parent_0 = v4.parent;
    if l_parent_0 == nil then
        l_parent_0 = Instance.new("Frame");
        l_parent_0.Name = l_HttpService_0:GenerateGUID(false);
    end;
    local v6 = v2(v3, v4);
    local v7 = l_Roact_0.mount(v6, l_parent_0);
    return l_parent_0, function() --[[ Line: 28 ]]
        -- upvalues: l_Roact_0 (ref), v7 (copy), l_parent_0 (ref)
        l_Roact_0.unmount(v7);
        l_parent_0:Destroy();
    end;
end;