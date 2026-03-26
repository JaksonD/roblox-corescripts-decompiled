local v0 = game:DefineFastFlag("DevConsoleFixTimestampDST", false);
local function _(v1) --[[ Line: 4 ]] --[[ Name: numberWithZero ]]
    return (v1 < 10 and "0" or "") .. v1;
end;
return function(v3) --[[ Line: 8 ]] --[[ Name: convertTimeStamp ]]
    -- upvalues: v0 (copy)
    local v4 = nil;
    local v5 = nil;
    local v6 = nil;
    if v0 then
        local v7 = os.date("*t", v3);
        v4 = v7.hour;
        v5 = v7.min;
        v6 = v7.sec;
    else
        local v8 = math.floor(v3 - os.time() + tick()) % 86400;
        v4 = math.floor(v8 / 3600);
        v8 = v8 - v4 * 3600;
        v5 = math.floor(v8 / 60);
        v6 = v8 - v5 * 60;
    end;
    local l_v4_0 = v4;
    local v10 = (l_v4_0 < 10 and "0" or "") .. l_v4_0;
    local l_v5_0 = v5;
    l_v4_0 = (l_v5_0 < 10 and "0" or "") .. l_v5_0;
    local l_v6_0 = v6;
    l_v5_0 = (l_v6_0 < 10 and "0" or "") .. l_v6_0;
    return string.format("%s:%s:%s", v10, l_v4_0, l_v5_0);
end;