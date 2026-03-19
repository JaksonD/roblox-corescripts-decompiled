local l_Parent_0 = script:FindFirstAncestor("CancelSubscriptionApp").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.CancelUserSubscriptionErrorPrompt);
local v3 = require(script.Parent.useCancelUserSubscriptionErrorPromptProps);
return function() --[[ Line: 8 ]] --[[ Name: CancelUserSubscriptionErrorContainer ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v4 = v3();
    return v1.createElement(v2, v4);
end;