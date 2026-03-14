local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Signals);
local function v2(...) --[[ Line: 5 ]] --[[ Name: defaultFilter ]]
    return select(1, ...);
end;
return function(v3, v4, v5) --[[ Line: 9 ]] --[[ Name: createRBXEventSignal ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6, v7 = v1.createSignal(v4);
    local v8 = if v5 ~= nil then v5 else v2;
    return v6, (v3:Connect(function(...) --[[ Line: 18 ]]
        -- upvalues: v7 (copy), v8 (copy)
        v7(v8(...));
    end));
end;