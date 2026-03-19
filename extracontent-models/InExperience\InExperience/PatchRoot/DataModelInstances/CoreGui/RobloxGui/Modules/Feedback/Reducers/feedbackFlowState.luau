local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Resources.Constants);
local v5 = require(l_Parent_0.Actions.SetFeedbackFlowState);
local v6 = require(l_Parent_0.Actions.SetFeedbackReason);
return v2.createReducer({
    feedbackFlowState = v4.State.Default, 
    feedbackReason = 0
}, {
    [v5.name] = function(v7, v8) --[[ Line: 21 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v7, {
            feedbackFlowState = v8.feedbackFlowState
        });
    end, 
    [v6.name] = function(v9, v10) --[[ Line: 26 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v9, {
            feedbackReason = v10.feedbackReason
        });
    end
});