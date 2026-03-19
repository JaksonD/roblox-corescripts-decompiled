local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
return {
    new = v1.Telemetry.new, 
    contexts = v1.Analytics.Enums.Contexts
};