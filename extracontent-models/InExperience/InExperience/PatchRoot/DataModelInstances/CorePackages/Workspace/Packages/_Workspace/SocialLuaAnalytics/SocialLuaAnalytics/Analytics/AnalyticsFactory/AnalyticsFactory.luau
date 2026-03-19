local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.Analytics.FireEvent.createFireEvent);
local _ = require(script.Parent.Parent.Types);
return function(v5) --[[ Line: 34 ]] --[[ Name: AnalyticsFactory ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v6 = v5.infoForAllEvents or {};
    local function v8(v7) --[[ Line: 37 ]]
        -- upvalues: v6 (ref), v2 (ref)
        v6 = v2.Dictionary.join(v6, v7);
        return v6;
    end;
    local function v9() --[[ Line: 42 ]]
        -- upvalues: v6 (ref)
        return v6;
    end;
    return {
        fireAnalyticsEvent = v3({
            EventStream = v5.eventLists.EventStream, 
            Diag = v5.eventLists.Diag, 
            Telemetry = v5.eventLists.Telemetry
        })({
            analytics = {
                EventStream = v5.analyticsImpl.EventStream, 
                Diag = v5.analyticsImpl.Diag, 
                Telemetry = v5.analyticsImpl.Telemetry
            }, 
            getInfoForAllEvents = v9, 
            loggerImpl = v5.loggerImpl
        }), 
        updateInfoForAllEvents = v8, 
        getInfoForAllEvents = v9
    };
end;