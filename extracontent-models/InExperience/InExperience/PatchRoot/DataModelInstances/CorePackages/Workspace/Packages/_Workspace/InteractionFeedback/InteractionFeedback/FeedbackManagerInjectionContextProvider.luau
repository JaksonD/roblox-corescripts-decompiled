local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local l_FeedbackManagerInjectionContext_0 = require(l_Parent_0.UIBlox).Core.Control.FeedbackManagerInjectionContext;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.useTriggerFeedback);
return function(v4) --[[ Line: 7 ]] --[[ Name: FeedbackManagerInjectionContextProvider ]]
    -- upvalues: v3 (copy), v2 (copy), l_FeedbackManagerInjectionContext_0 (copy)
    local v5 = v3();
    return v2.createElement(l_FeedbackManagerInjectionContext_0.Provider, {
        value = v5
    }, v4.children);
end;