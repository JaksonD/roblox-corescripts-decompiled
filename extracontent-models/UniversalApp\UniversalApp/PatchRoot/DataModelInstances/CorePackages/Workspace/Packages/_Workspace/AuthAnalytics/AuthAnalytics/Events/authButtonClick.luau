local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SharedFlags);
local v3 = require(l_Parent_0.Utils.checkAndSendEvent);
local v4 = game:DefineFastFlag("FixAuthButtonClickAnalyticsAltAttemptParam", false);
local l_FFlagEnableAuthAnalyticsOriginParam_0 = v2.FFlagEnableAuthAnalyticsOriginParam;
return function(v6, v7, v8, v9, v10, v11) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), l_FFlagEnableAuthAnalyticsOriginParam_0 (copy), v3 (copy)
    local v12 = {};
    if v7 then
        v12.btn = v7;
    end;
    if v8 then
        v12.state = v8;
    end;
    if v9 then
        v12.url = v9;
    end;
    if v10 ~= nil and v4 then
        v12.is_alt_attempt = v10;
    end;
    if l_FFlagEnableAuthAnalyticsOriginParam_0 and v11 then
        v12.origin = v11;
    end;
    v3(v6, "authButtonClick", v12);
end;