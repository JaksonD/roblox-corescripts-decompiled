local l_StarterGui_0 = game:GetService("StarterGui");
local l_Parent_0 = script:FindFirstAncestor("InExperienceTopBar").Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
return function() --[[ Line: 12 ]]
    -- upvalues: l_createSignal_0 (copy), l_StarterGui_0 (copy)
    local v3, v4 = l_createSignal_0(true);
    l_StarterGui_0:RegisterSetCore("TopbarEnabled", function(v5) --[[ Line: 15 ]]
        -- upvalues: v4 (copy)
        if type(v5) == "boolean" then
            v4(v5);
            return;
        else
            error("SetCore TopbarEnabled argument must be a boolean", 2);
            return;
        end;
    end);
    l_StarterGui_0:RegisterGetCore("TopbarEnabled", function() --[[ Line: 23 ]]
        -- upvalues: v3 (copy)
        return v3(false);
    end);
    return {
        getTopBarCoreGuiEnabled = v3
    };
end;