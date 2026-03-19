local _ = require(script.Parent.ProfilerDataFormatV2);
local v26 = {
    getDurations = function(v1, v2) --[[ Line: 11 ]] --[[ Name: getDurations ]]
        if v2 > 0 then
            local v3 = v1.Nodes[v2];
            assert(v3 ~= nil);
            return v3.TotalDuration, v3.Duration;
        else
            local v4 = 0;
            for _, v6 in v1.Categories do
                v4 = v4 + v1.Nodes[v6.NodeId].TotalDuration;
            end;
            return v4, 0;
        end;
    end, 
    getName = function(_, v8) --[[ Line: 31 ]] --[[ Name: getName ]]
        return v8 and v8.Name;
    end, 
    getSourceName = function(_, v10) --[[ Line: 35 ]] --[[ Name: getSourceName ]]
        return v10 and v10.Source;
    end, 
    getLine = function(_, v12) --[[ Line: 39 ]] --[[ Name: getLine ]]
        return v12 and v12.Line;
    end, 
    getNativeFlag = function(_, v14) --[[ Line: 43 ]] --[[ Name: getNativeFlag ]]
        return v14 and v14.IsNative or false;
    end, 
    getPluginFlag = function(_, v16) --[[ Line: 47 ]] --[[ Name: getPluginFlag ]]
        return v16 and v16.IsPlugin or false;
    end, 
    standardizeChildren = function(_, v18) --[[ Line: 51 ]] --[[ Name: standardizeChildren ]]
        return v18 and v18.Children;
    end, 
    formatSessionLength = function(v19) --[[ Line: 55 ]] --[[ Name: formatSessionLength ]]
        if v19 then
            local v20 = v19 / 3600000;
            local v21 = v19 / 60000 % 60;
            local v22 = v19 / 1000 % 60;
            local v23 = v19 % 1000;
            return string.format("%02i:%02i:%02i.%04i", v20, v21, v22, v23);
        else
            return nil;
        end;
    end, 
    formatTimer = function(v24) --[[ Line: 68 ]] --[[ Name: formatTimer ]]
        if v24 ~= nil then
            if v24 == 0 then
                return "";
            elseif v24 >= 60 then
                return string.format("%dm", v24 / 60);
            else
                return string.format("%ds", v24);
            end;
        else
            return "";
        end;
    end, 
    formatFrequency = function(v25) --[[ Line: 82 ]] --[[ Name: formatFrequency ]]
        if v25 < 1000 then
            return tostring(v25) .. " Hz";
        else
            return tostring(v25 / 1000) .. " KHz";
        end;
    end
};
v26.getSourceLocationString = function(v27, v28, v29) --[[ Line: 92 ]] --[[ Name: getSourceLocationString ]]
    -- upvalues: v26 (copy)
    local v30 = v26.getSourceName(v27, v28);
    local v31 = if not v30 or #v30 == 0 then v29 else v30;
    local l_v31_0 = v31;
    local v33 = v26.getLine(v27, v28);
    if v33 and v33 >= 1 then
        l_v31_0 = string.format("%s:%s", v31, (tostring(v33)));
    end;
    return l_v31_0;
end;
return v26;