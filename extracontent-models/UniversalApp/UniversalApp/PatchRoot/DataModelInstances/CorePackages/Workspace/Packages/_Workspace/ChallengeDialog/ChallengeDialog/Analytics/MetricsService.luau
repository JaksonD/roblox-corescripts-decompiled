local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Analytics).Analytics.new(l_RbxAnalyticsService_0);
local v4 = game:DefineFastString("LoginInfoOverflowedCounter", "LoginInfoOverflowed");
return {
    loginInfoOverflowed = function() --[[ Line: 14 ]]
        -- upvalues: v3 (copy), v4 (copy)
        v3.Diag:reportCounter(v4, 1);
    end
};