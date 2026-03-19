local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local v1 = require(l_Parent_0.Dash);
local _ = require(script.Parent.Parent.Types);
local v3 = require(script.Parent.getEventInfo);
local v4 = require(script.Parent.optionallyLog);
local v5 = require(script.Parent.reportDiagEvent);
local v6 = require(script.Parent.getFormattedDiagEventInfo);
local function v8(v7) --[[ Line: 13 ]]
    return (("Fired Diag %*: %*, %*"):format(v7.type, v7.name, v7.value));
end;
return function(v9) --[[ Line: 17 ]]
    -- upvalues: v1 (copy), v3 (copy), v6 (copy), v5 (copy), v4 (copy), v8 (copy)
    return function(v10, v11) --[[ Line: 18 ]]
        -- upvalues: v1 (ref), v3 (ref), v9 (copy), v6 (ref), v5 (ref), v4 (ref), v8 (ref)
        return v1.pipe(v3(v9.eventList), v6(), v5(v9.diagImpl), v4(v9.loggerImpl, v8))(v10, v11);
    end;
end;