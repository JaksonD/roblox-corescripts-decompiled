local l_Parent_0 = script.Parent.Parent.Parent;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_HttpService_0 = game:GetService("HttpService");
local function _(v3) --[[ Line: 9 ]] --[[ Name: attachPackageName ]]
    if not v3 then
        v3 = {};
    end;
    v3.packageName = "IAPExperience";
    return v3;
end;
return {
    debug = function(v5) --[[ Line: 17 ]] --[[ Name: debug ]]
        -- upvalues: l_Logger_0 (copy), l_HttpService_0 (copy)
        local l_l_Logger_0_0 = l_Logger_0;
        local l_l_HttpService_0_0 = l_HttpService_0;
        local v8 = v5 or {};
        v8.packageName = "IAPExperience";
        l_l_Logger_0_0:debug(l_l_HttpService_0_0:JSONEncode(v8));
    end, 
    info = function(v9) --[[ Line: 20 ]] --[[ Name: info ]]
        -- upvalues: l_Logger_0 (copy), l_HttpService_0 (copy)
        local l_l_Logger_0_1 = l_Logger_0;
        local l_l_HttpService_0_1 = l_HttpService_0;
        local v12 = v9 or {};
        v12.packageName = "IAPExperience";
        l_l_Logger_0_1:info(l_l_HttpService_0_1:JSONEncode(v12));
    end, 
    warn = function(v13) --[[ Line: 23 ]] --[[ Name: warn ]]
        -- upvalues: l_Logger_0 (copy), l_HttpService_0 (copy)
        local l_l_Logger_0_2 = l_Logger_0;
        local l_l_HttpService_0_2 = l_HttpService_0;
        local v16 = v13 or {};
        v16.packageName = "IAPExperience";
        l_l_Logger_0_2:warn(l_l_HttpService_0_2:JSONEncode(v16));
    end, 
    error = function(v17) --[[ Line: 26 ]] --[[ Name: error ]]
        -- upvalues: l_Logger_0 (copy), l_HttpService_0 (copy)
        local l_l_Logger_0_3 = l_Logger_0;
        local l_l_HttpService_0_3 = l_HttpService_0;
        local v20 = v17 or {};
        v20.packageName = "IAPExperience";
        l_l_Logger_0_3:error(l_l_HttpService_0_3:JSONEncode(v20));
    end
};