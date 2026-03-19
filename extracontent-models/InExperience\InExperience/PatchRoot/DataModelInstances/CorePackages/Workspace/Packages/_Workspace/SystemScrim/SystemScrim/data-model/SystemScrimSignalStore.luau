local l_Parent_0 = script:FindFirstAncestor("SystemScrim").Parent;
local v1 = require(l_Parent_0.Signals);
local function v9() --[[ Line: 17 ]] --[[ Name: createDefaultStates ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.createSignal(false);
    local v4, v5 = v1.createSignal(1);
    local v6, v7 = v1.createSignal(true);
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    return {
        visible = v2, 
        setVisibility = v3, 
        transparency = v4, 
        setTransparency = v5, 
        autoDismiss = v6, 
        setAutoDismiss = v7, 
        backgroundScrimActivated = l_BindableEvent_0
    };
end;
return v1.createComputed(function(_) --[[ Line: 35 ]]
    -- upvalues: v9 (copy)
    return (v9());
end);