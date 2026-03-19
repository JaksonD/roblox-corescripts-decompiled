local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local function _() --[[ Line: 14 ]] --[[ Name: getEpochMs ]]
    return (math.floor(os.time() * 1000));
end;
return function(v6, v7) --[[ Line: 34 ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v8 = string.format("%suser-heartbeats-api/action-report", v4.APIS_URL);
    local v9 = l_HttpService_0:JSONEncode({
        actionInfo = v7, 
        clientSideTimestampEpochMs = math.floor(os.time() * 1000), 
        sessionInfo = {
            sessionId = l_RbxAnalyticsService_0:GetSessionId()
        }
    });
    v9 = string.gsub(v9, "\"loginActionInfo\":%[%]", "\"loginActionInfo\":{}");
    return v6(v8, "POST", {
        postBody = string.gsub(v9, "\"logoutActionInfo\":%[%]", "\"logoutActionInfo\":{}")
    });
end;