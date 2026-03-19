local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.submitAnalytics);
local v3 = require(script.Parent.AnalyticsSubmitContext);
local v4 = require(script.Parent.AnalyticsStateContext);
local v5 = require(script.Parent.AnalyticsDispatchContext);
local v6 = require(script.Parent.AnalyticsReducer);
return function(v7) --[[ Line: 22 ]] --[[ Name: AnalyticsProvider ]]
    -- upvalues: v1 (copy), v6 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    local v8, v9 = v1.useReducer(v6.reducer, v6.initialState);
    local v12 = v1.useCallback(function(v10) --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v8 (copy), v2 (ref)
        local v11 = if v7.onBeforeSubmitAnalytics then v7.onBeforeSubmitAnalytics(v8) else v8;
        if v11 then
            if v7.onSubmitAnalytics then
                v7.onSubmitAnalytics(v11, v10);
                return;
            else
                v2(v11, v10);
            end;
        end;
    end, {
        v8, 
        v7.onBeforeSubmitAnalytics, 
        v7.onSubmitAnalytics
    });
    return v1.createElement(v3.Provider, {
        value = v12
    }, {
        stateProvider = v1.createElement(v4.Provider, {
            value = v8
        }, {
            dispatchProvider = v1.createElement(v5.Provider, {
                value = v9
            }, v7.children)
        })
    });
end;