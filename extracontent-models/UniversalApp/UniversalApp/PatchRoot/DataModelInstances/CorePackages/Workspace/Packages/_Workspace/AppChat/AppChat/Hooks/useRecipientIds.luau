local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_useSelector_0 (copy)
    local v4 = l_useSelector_0(function(v3) --[[ Line: 7 ]]
        return (tonumber(v3.LocalUserId));
    end);
    local v5 = v2 and v2.participants or {};
    local v6 = {};
    for _, v8 in v5 do
        local v9 = tonumber(v8);
        if v9 and v9 ~= v4 then
            table.insert(v6, v9);
        end;
    end;
    return v6;
end;