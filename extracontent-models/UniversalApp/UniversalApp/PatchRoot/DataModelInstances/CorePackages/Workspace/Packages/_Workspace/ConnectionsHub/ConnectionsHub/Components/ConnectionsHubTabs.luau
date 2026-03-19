local l_script_FirstAncestor_0 = script:FindFirstAncestor("ConnectionsHub");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_Tabs_0 = v3.Tabs;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_InputSize_0 = v3.Enums.InputSize;
local v8 = require(l_script_FirstAncestor_0.Analytics);
local l_useCoHubAnalytics_0 = v8.useCoHubAnalytics;
local l_EventNames_0 = v8.EventNames;
local v11 = game:DefineFastFlag("CoHubAnalyticsSetup", false);
return function(v12) --[[ Line: 23 ]]
    -- upvalues: l_useNavigation_0 (copy), v2 (copy), v11 (copy), l_useCoHubAnalytics_0 (copy), l_EventNames_0 (copy), v3 (copy), l_Tabs_0 (copy), l_InputSize_0 (copy), l_FillBehavior_0 (copy)
    local v13 = l_useNavigation_0();
    local l_routeName_0 = v13.state.routes[v13.state.index].routeName;
    local v15, v16 = v2.useState(l_routeName_0);
    local v17 = if v11 then l_useCoHubAnalytics_0().fireAnalyticsEvent else nil;
    local v19 = v2.useCallback(function(v18) --[[ Line: 30 ]]
        -- upvalues: v11 (ref), v17 (copy), l_EventNames_0 (ref), v15 (copy), v16 (copy), v13 (copy)
        if v11 then
            v17(l_EventNames_0.CoHubTabClicked, {
                subpage = v15, 
                btn = v18
            });
        end;
        v16(v18);
        v13.navigate(v18);
    end, {
        v13, 
        v16
    });
    v2.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: l_routeName_0 (copy), v15 (copy), v16 (copy)
        if l_routeName_0 ~= v15 then
            v16(l_routeName_0);
        end;
    end, {
        l_routeName_0
    });
    return v2.createElement(v3.View, {
        tag = "size-full-1200 bg-surface-0", 
        LayoutOrder = v12.layoutOrder
    }, {
        ConnectionsTabs = v2.createElement(l_Tabs_0, {
            activeTabId = v15, 
            size = l_InputSize_0.Medium, 
            fillBehavior = l_FillBehavior_0.Fill, 
            onActivated = v19, 
            tabs = v12.tabs
        })
    });
end;