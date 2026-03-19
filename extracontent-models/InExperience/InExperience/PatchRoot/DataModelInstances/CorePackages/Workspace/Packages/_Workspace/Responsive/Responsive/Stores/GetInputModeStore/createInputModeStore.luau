local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local v3 = require(l_Parent_0.InputMode);
return function() --[[ Line: 14 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v4, v5 = v2.createSignal((v3.last()));
    local v6, v7 = v2.createSignal((v3.preferred()));
    v3.connect(function() --[[ Line: 18 ]]
        -- upvalues: v5 (copy), v3 (ref), v7 (copy)
        v5((v3.last()));
        v7((v3.preferred()));
    end);
    return {
        getLastInputType = v4, 
        getPreferredInputType = v6
    };
end;