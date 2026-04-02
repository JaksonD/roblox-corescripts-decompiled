local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v5 = require(l_Parent_0.Cryo);
local l_RoduxAnalytics_0 = require(l_Parent_0.AddFriendsState).RoduxAnalytics;
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_getSessionIdByKey_0 = l_RoduxAnalytics_0.Selectors.getSessionIdByKey;
local v9 = require(script.Parent.AnalyticsSetup);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v11) --[[ Line: 17 ]]
    -- upvalues: l_useSelector_0 (copy), l_getSessionIdByKey_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), v2 (copy), v9 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v5 (copy)
    local v13 = l_useSelector_0(function(v12) --[[ Line: 18 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        return l_getSessionIdByKey_0(v12)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    end);
    local v14 = v2.useMemo(function() --[[ Line: 23 ]]
        -- upvalues: v9 (ref), v13 (copy)
        return v9({
            infoForAllEvents = {
                recommendationSessionId = v13
            }
        }).fireAnalyticsEvent;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v13
    } else l_dependencyArray_0(v13));
    return v2.useCallback(function(v15, v16) --[[ Line: 35 ]]
        -- upvalues: v14 (copy), v5 (ref), v11 (copy)
        return v14(v15, v5.Dictionary.join(v16 or {}, v11 or {}));
    end, {
        v11
    });
end;