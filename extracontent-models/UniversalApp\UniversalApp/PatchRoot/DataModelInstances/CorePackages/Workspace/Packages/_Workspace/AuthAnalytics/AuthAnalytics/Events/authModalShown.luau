local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SharedFlags);
local v3 = require(l_Parent_0.Utils.checkAndSendEvent);
local l_FFlagEnableAuthAnalyticsOriginParam_0 = v2.FFlagEnableAuthAnalyticsOriginParam;
return function(v5, v6, v7, v8) --[[ Line: 8 ]]
    -- upvalues: l_FFlagEnableAuthAnalyticsOriginParam_0 (copy), v3 (copy)
    local v9 = {};
    if v6 then
        v9.state = v6;
    end;
    if v7 then
        v9.field = v7;
    end;
    if l_FFlagEnableAuthAnalyticsOriginParam_0 and v8 then
        v9.origin = v8;
    end;
    v3(v5, "authModalShown", v9);
end;