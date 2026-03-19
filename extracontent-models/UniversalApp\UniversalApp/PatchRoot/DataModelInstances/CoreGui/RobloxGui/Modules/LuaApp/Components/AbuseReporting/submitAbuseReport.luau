local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.HttpRequest);
local v3 = require(l_CorePackages_0.Packages.RoduxNetworking);
local v4 = require(l_Modules_0.LuaApp.Components.AbuseReporting.constructAbuseReportTags);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
return function(v7, v8, v9, v10) --[[ Line: 9 ]] --[[ Name: submitAbuseReport ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local v11 = v2.config({
        requestFunction = v2.requestFunctions.HttpRbxApi, 
        maxWaitTime = 3, 
        maxRetryCount = game:DefineFastInt("SubmitAbuseReportHttpRetryCount", 2)
    });
    local v12 = v3.config({
        keyPath = "AbuseReporting", 
        networkImpl = v11
    });
    local v13 = {
        safetyEvent = {
            tags = v4(v7, v9, v10)
        }
    };
    return v12.POST("SubmitAbuseReport", function(v14, _) --[[ Line: 31 ]]
        -- upvalues: v8 (copy), v13 (copy)
        return v14(v8):body(v13);
    end).API();
end;