local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local function _() --[[ Line: 14 ]] --[[ Name: getEpochMs ]]
    return (math.floor(os.time() * 1000));
end;
return function(v6, v7, v8) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), l_RbxAnalyticsService_0 (copy)
    return v6(string.format("%suser-heartbeats-api/pulse", v4.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            clientSideTimestampEpochMs = math.floor(os.time() * 1000), 
            locationInfo = {
                universalAppLocationInfo = {
                    activeState = v7, 
                    pageName = v8
                }
            }, 
            sessionInfo = {
                sessionId = l_RbxAnalyticsService_0:GetSessionId()
            }
        })
    });
end;