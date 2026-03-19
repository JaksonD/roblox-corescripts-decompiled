local _ = require(script.Parent.Types);
local v1 = require(script.Parent.getEventInfo);
local v2 = require(script.Parent.optionallyLog);
local v3 = require(script.Parent.Parent.Parent.RoduxTools.compose);
local v4 = require(script.Parent.reportCounter);
local function v6(v5) --[[ Line: 8 ]]
    return "Fired diagCounter: " .. v5.name .. ", count: " .. (v5.count and tostring(v5.count) or "1");
end;
return function(v7) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy), v6 (copy), v1 (copy)
    return function(v8) --[[ Line: 16 ]]
        -- upvalues: v3 (ref), v4 (ref), v7 (copy), v2 (ref), v6 (ref), v1 (ref)
        return v3(v4(v7.diagImpl), v2(v7.loggerImpl, v6), v1(v7.eventList))(v8);
    end;
end;