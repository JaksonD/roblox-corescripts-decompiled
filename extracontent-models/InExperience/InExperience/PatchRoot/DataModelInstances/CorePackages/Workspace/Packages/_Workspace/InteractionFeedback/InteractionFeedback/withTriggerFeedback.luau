local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.useTriggerFeedback);
return function(v4) --[[ Line: 8 ]] --[[ Name: withTriggerFeedback ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v3 (ref), v1 (ref), v2 (ref), v4 (copy)
        local v6 = v3();
        local v7 = v1.Dictionary.join(v5, {
            triggerFeedback = v6
        });
        return v2.createElement(v4, v7);
    end;
end;