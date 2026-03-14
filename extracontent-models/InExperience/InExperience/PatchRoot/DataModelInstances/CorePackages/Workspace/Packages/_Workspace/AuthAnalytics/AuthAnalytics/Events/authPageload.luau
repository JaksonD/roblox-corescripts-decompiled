local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Logging_0 = require(l_Parent_1.AppCommonLib).Logging;
local v3 = require(l_Parent_1.SharedFlags);
local v4 = require(l_Parent_0.Utils.checkAndSendEvent);
local l_FFlagEnableAuthAnalyticsOriginParam_0 = v3.FFlagEnableAuthAnalyticsOriginParam;
return function(v6, v7, v8, v9) --[[ Line: 9 ]]
    -- upvalues: l_Logging_0 (copy), l_FFlagEnableAuthAnalyticsOriginParam_0 (copy), v4 (copy)
    local v10 = {};
    if v7 then
        if type(v7) ~= "string" then
            l_Logging_0.warn("Failure logging authPageLoad: Expected state to be a string but got " .. type(v7));
            return;
        else
            v10.state = v7;
        end;
    end;
    if v8 ~= nil then
        if type(v8) ~= "boolean" then
            l_Logging_0.warn("Failure logging authPageLoad: Expected isAltAttempt to be a boolean but got " .. type(v8));
            return;
        else
            v10.is_alt_attempt = v8;
        end;
    end;
    if l_FFlagEnableAuthAnalyticsOriginParam_0 and v9 then
        if type(v9) ~= "string" then
            l_Logging_0.warn("Failure logging authPageLoad: Expected origin to be a string but got " .. type(v9));
            return;
        else
            v10.origin = v9;
        end;
    end;
    v4(v6, "authPageload", v10);
end;