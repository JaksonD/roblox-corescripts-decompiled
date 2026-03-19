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
return function(v10) --[[ Line: 15 ]]
    -- upvalues: l_useSelector_0 (copy), l_getSessionIdByKey_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy), v2 (copy), v9 (copy), l_dependencyArray_0 (copy), v5 (copy)
    local v12 = l_useSelector_0(function(v11) --[[ Line: 16 ]]
        -- upvalues: l_getSessionIdByKey_0 (ref), l_RECOMMENDATION_SESSION_ID_KEY_0 (ref)
        return l_getSessionIdByKey_0(v11)(l_RECOMMENDATION_SESSION_ID_KEY_0);
    end);
    local v13 = v2.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v9 (ref), v12 (copy)
        return v9({
            infoForAllEvents = {
                recommendationSessionId = v12
            }
        }).fireAnalyticsEvent;
    end, l_dependencyArray_0(v12));
    return v2.useCallback(function(v14, v15) --[[ Line: 28 ]]
        -- upvalues: v13 (copy), v5 (ref), v10 (copy)
        return v13(v14, v5.Dictionary.join(v15 or {}, v10 or {}));
    end, {
        v10
    });
end;