local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Dash);
local _ = require(script.Parent.Parent.Types);
local v3 = require(script.Parent.getEventInfo);
local v4 = require(script.Parent.optionallyLog);
local v5 = require(script.Parent.reportCounter);
local function v7(v6) --[[ Line: 12 ]]
    return "Fired diagCounter: " .. v6.name .. ", count: " .. (v6.count and tostring(v6.count) or "1");
end;
return function(v8) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v7 (copy), v5 (copy)
    return function(v9) --[[ Line: 24 ]]
        -- upvalues: v1 (ref), v3 (ref), v8 (copy), v4 (ref), v7 (ref), v5 (ref)
        return v1.pipe(v3(v8.eventList), v4(v8.loggerImpl, v7), v5(v8.diagImpl))(v9);
    end;
end;