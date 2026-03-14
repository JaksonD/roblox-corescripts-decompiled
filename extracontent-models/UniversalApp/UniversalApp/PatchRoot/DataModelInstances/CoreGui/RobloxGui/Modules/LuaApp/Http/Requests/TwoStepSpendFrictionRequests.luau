local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.Url);
return {
    status = function(v3) --[[ Line: 13 ]]
        -- upvalues: v2 (copy)
        return v3(string.format("%sv2/spend-friction/two-step-verification/status", v2.ECONOMY_URL), "GET");
    end, 
    generate = function(v4) --[[ Line: 19 ]]
        -- upvalues: v2 (copy)
        return v4(string.format("%sv2/spend-friction/two-step-verification/generate", v2.ECONOMY_URL), "POST", {
            postBody = "", 
            maxRetryCount = 0
        });
    end, 
    redeem = function(v5, v6, v7) --[[ Line: 25 ]]
        -- upvalues: v2 (copy), l_HttpService_0 (copy)
        return v5(string.format("%sv2/spend-friction/two-step-verification/redeem", v2.ECONOMY_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                challengeToken = v6, 
                verificationToken = v7
            }), 
            maxRetryCount = 0
        });
    end
};