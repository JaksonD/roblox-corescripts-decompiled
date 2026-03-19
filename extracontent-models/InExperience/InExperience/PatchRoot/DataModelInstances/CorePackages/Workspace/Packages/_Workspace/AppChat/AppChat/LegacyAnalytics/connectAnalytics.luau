local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(script.Parent.AnalyticsContext);
return require(l_script_FirstAncestor_0.SocialLibraries).Context.getConnect(v1);