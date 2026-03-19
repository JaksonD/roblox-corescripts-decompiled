local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.Common.Constants);
local l_React_0 = v1.React;
local v4 = require(l_Parent_0.Analytics.DiscoverabilityModalAnalyticsContext);
local v5 = require(l_Parent_0.Analytics.setupFireAnalyticsEvents);
local v6 = require(l_Parent_0.Analytics.AnalyticsService);
local l_useSelector_0 = v1.Hooks.useSelector;
return function(v8) --[[ Line: 11 ]] --[[ Name: Container ]]
    -- upvalues: l_useSelector_0 (copy), l_React_0 (copy), v4 (copy), v5 (copy), v6 (copy), v2 (copy)
    return function(v9) --[[ Line: 12 ]]
        -- upvalues: l_useSelector_0 (ref), l_React_0 (ref), v4 (ref), v5 (ref), v6 (ref), v2 (ref), v8 (copy)
        local v11 = l_useSelector_0(function(v10) --[[ Line: 13 ]]
            return v10.LocalUserId;
        end);
        return l_React_0.createElement(v4.Provider, {
            value = {
                fireAnalyticsEvent = v5({
                    analytics = v6, 
                    defaultAnalyticsInfo = {
                        uid = v11, 
                        entry = if v9.navigation then v9.navigation.getParam(v2.ENTRY_POINT) else v9.entryPoint
                    }
                })
            }
        }, {
            l_React_0.createElement(v8, v9)
        });
    end;
end;