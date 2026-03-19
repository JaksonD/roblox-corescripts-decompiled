local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.IncrementFeedbackSubmissionAttempts);
local v5 = require(l_Parent_0.Actions.ShowHelpModal);
local v6 = require(l_Parent_0.Actions.ShowOnboardingModal);
return v2.createReducer({
    numFeedbackSubmissionAttempts = nil, 
    showHelpModal = false, 
    showOnboardingModal = true
}, {
    [v4.name] = function(v7, v8) --[[ Line: 20 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v7, {
            numFeedbackSubmissionAttempts = v8.numFeedbackSubmissionAttempts
        });
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 25 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v9, {
            showHelpModal = v10.helpModalVisible
        });
    end, 
    [v6.name] = function(v11, v12) --[[ Line: 30 ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v11, {
            showOnboardingModal = v12.onboardingModalVisible
        });
    end
});