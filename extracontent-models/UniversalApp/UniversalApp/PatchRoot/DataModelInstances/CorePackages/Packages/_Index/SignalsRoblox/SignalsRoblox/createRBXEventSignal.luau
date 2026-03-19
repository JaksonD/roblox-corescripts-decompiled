local l_Parent_0 = script.Parent.Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
local function v2(...) --[[ Line: 10 ]] --[[ Name: defaultFilter ]]
    return select(1, ...);
end;
return function(v3, v4, v5) --[[ Line: 14 ]] --[[ Name: createRBXEventSignal ]]
    -- upvalues: l_createSignal_0 (copy), v2 (copy)
    local v6, v7 = l_createSignal_0(v4);
    local v8 = if v5 ~= nil then v5 else v2;
    return v6, (v3:Connect(function(...) --[[ Line: 23 ]]
        -- upvalues: v7 (copy), v8 (copy)
        v7(v8(...));
    end));
end;