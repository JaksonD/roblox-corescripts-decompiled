local l_Parent_0 = script:FindFirstAncestor("Responsive").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.Parent.HardwareSafeAreaInsets);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3, v4 = v1.useState(v2.deviceInsets());
    v1.useLayoutEffect(function() --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v4 (copy), v3 (copy)
        local v5 = v2:connect(v4);
        if v2.diffInsets(v3, v2.deviceInsets()) then
            v4(v2.deviceInsets);
        end;
        return function() --[[ Line: 13 ]]
            -- upvalues: v5 (copy)
            v5:disconnect();
        end;
    end, {});
    return v3;
end;