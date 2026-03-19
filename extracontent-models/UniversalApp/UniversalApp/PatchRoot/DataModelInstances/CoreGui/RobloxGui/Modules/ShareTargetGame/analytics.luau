local l_script_FirstAncestor_0 = script:FindFirstAncestor("ShareTargetGame");
local l_ShareGameAnalytics_0 = require(l_script_FirstAncestor_0.dependencies).SocialLibraries.Analytics.ShareGameAnalytics;
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: l_ShareGameAnalytics_0 (copy)
    return (l_ShareGameAnalytics_0.new(v2, v3, l_ShareGameAnalytics_0.ButtonName.LuaGameDetails));
end;