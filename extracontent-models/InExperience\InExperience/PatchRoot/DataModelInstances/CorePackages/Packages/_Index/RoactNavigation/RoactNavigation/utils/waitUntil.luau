local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Dev.ReactRoblox);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v3 = v3 or 1;
    local v4 = 0;
    while v4 < v3 and not v2() do
        v1.act(function() --[[ Line: 10 ]]
            -- upvalues: v4 (ref)
            v4 = v4 + task.wait();
        end);
    end;
end;