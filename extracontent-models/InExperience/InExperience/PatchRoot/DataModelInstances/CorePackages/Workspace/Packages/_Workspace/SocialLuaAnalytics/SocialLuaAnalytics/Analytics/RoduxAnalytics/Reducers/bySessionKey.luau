local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_Dash_0 = v1.Dash;
local l_Parent_1 = script.Parent.Parent;
local _ = require(l_Parent_1.AnalyticsTypes);
local v6 = require(l_Parent_1.Actions.SessionIdUpdated);
local v7 = {};
return function(_) --[[ Line: 12 ]]
    -- upvalues: l_Rodux_0 (copy), v7 (copy), v6 (copy), l_Dash_0 (copy)
    return l_Rodux_0.createReducer(v7, {
        [v6.name] = function(v9, v10) --[[ Line: 14 ]]
            -- upvalues: l_Dash_0 (ref), v7 (ref)
            local l_sessionKey_0 = v10.payload.sessionKey;
            local l_sessionId_0 = v10.payload.sessionId;
            return l_Dash_0.join(v9 or v7, {
                [l_sessionKey_0] = l_sessionId_0
            });
        end
    });
end;