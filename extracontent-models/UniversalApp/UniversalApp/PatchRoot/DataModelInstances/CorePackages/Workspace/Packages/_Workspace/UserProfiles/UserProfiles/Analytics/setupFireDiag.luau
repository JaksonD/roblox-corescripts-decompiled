local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SocialLuaAnalytics);
local l_fireDiagCounter_0 = v2.Analytics.FireEvent.fireDiagCounter;
local l_fireDiag_0 = v2.Analytics.FireEvent.fireDiag;
local v5 = require(l_Parent_0.Flags.FFlagUserProfilesLogErrorCodes);
local v6 = require(script.Parent.DiagCountersList);
local _ = require(script.Parent.EventNames);
return function(v8) --[[ Line: 14 ]]
    -- upvalues: v5 (copy), l_fireDiag_0 (copy), v6 (copy), l_fireDiagCounter_0 (copy)
    if v5 then
        local v9 = l_fireDiag_0({
            diagImpl = v8.analytics.Diag, 
            eventList = v6
        });
        return function(v10, v11) --[[ Line: 23 ]]
            -- upvalues: v6 (ref), v9 (copy)
            if v6[v10] then
                return v9(v10, v11);
            else
                return v10;
            end;
        end;
    else
        local v12 = l_fireDiagCounter_0({
            diagImpl = v8.analytics.Diag, 
            eventList = v6
        });
        return function(v13) --[[ Line: 36 ]]
            -- upvalues: v6 (ref), v12 (copy)
            if v6[v13] then
                return v12(v13);
            else
                return v13;
            end;
        end;
    end;
end;