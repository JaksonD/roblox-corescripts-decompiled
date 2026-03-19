local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local l_RoactRodux_0 = require(l_Parent_0.PurchasePromptDeps).RoactRodux;
return function(v2, v3) --[[ Line: 12 ]] --[[ Name: connectToStore ]]
    -- upvalues: l_RoactRodux_0 (copy)
    return function(v4) --[[ Line: 13 ]]
        -- upvalues: l_RoactRodux_0 (ref), v2 (copy), v3 (copy)
        local v5 = l_RoactRodux_0.UNSTABLE_connect2(v2, v3)(v4);
        v5.getUnconnected = function() --[[ Line: 16 ]] --[[ Name: getUnconnected ]]
            -- upvalues: v4 (copy)
            return v4;
        end;
        return v5;
    end;
end;