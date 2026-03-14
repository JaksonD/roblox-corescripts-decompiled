local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v2 = require(l_script_FirstAncestor_0.Analytics.MetricsConstants);
return {
    reportTwoStepVerificationChallengeIDIsNil = function() --[[ Line: 7 ]] --[[ Name: reportTwoStepVerificationChallengeIDIsNil ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy)
        l_TelemetryService_0:LogCounter(v2.TwoStepVerificationChallengeIDIsNilConfig);
    end
};