local l_StarterGui_0 = game:GetService("StarterGui");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.SetRespawnBehavior);
return function(v3) --[[ Line: 8 ]] --[[ Name: registerSetCores ]]
    -- upvalues: l_StarterGui_0 (copy), v2 (copy)
    l_StarterGui_0:RegisterSetCore("ResetButtonCallback", function(v4) --[[ Line: 9 ]]
        -- upvalues: v3 (copy), v2 (ref)
        local v5 = true;
        local v6 = nil;
        if typeof(v4) == "boolean" then
            v5 = v4;
            v6 = nil;
        elseif typeof(v4) == "Instance" and v4:IsA("BindableEvent") then
            v5 = true;
            v6 = v4;
        else
            error("ResetButtonCallback must be set to a BindableEvent or a boolean", 0);
        end;
        v3:dispatch(v2(v5, v6));
    end);
end;