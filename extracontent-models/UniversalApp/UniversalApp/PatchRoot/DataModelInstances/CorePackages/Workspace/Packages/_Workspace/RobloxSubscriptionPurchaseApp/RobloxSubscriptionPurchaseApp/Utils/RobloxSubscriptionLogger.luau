local l_Parent_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_HttpService_0 = game:GetService("HttpService");
return {
    debug = function(v3) --[[ Line: 8 ]] --[[ Name: debug ]]
        -- upvalues: l_Logger_0 (copy), l_HttpService_0 (copy)
        l_Logger_0:debug(l_HttpService_0:JSONEncode(v3));
    end, 
    info = function(v4) --[[ Line: 11 ]] --[[ Name: info ]]
        -- upvalues: l_Logger_0 (copy), l_HttpService_0 (copy)
        l_Logger_0:info(l_HttpService_0:JSONEncode(v4));
    end, 
    warn = function(v5) --[[ Line: 14 ]] --[[ Name: warn ]]
        -- upvalues: l_Logger_0 (copy), l_HttpService_0 (copy)
        l_Logger_0:warn(l_HttpService_0:JSONEncode(v5));
    end, 
    error = function(v6) --[[ Line: 17 ]] --[[ Name: error ]]
        -- upvalues: l_Logger_0 (copy), l_HttpService_0 (copy)
        l_Logger_0:error(l_HttpService_0:JSONEncode(v6));
    end
};