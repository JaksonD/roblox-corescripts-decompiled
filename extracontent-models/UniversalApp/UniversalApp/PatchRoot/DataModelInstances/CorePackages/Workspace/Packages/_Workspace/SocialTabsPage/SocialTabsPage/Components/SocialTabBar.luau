local l_Parent_0 = script:FindFirstAncestor("SocialTabsPage").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Tabs_0 = v2.Tabs;
local l_FillBehavior_0 = v2.Enums.FillBehavior;
local l_InputSize_0 = v2.Enums.InputSize;
local l_View_0 = v2.View;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
return function(v8) --[[ Line: 19 ]] --[[ Name: SocialTabBar ]]
    -- upvalues: l_useNavigation_0 (copy), v1 (copy), l_View_0 (copy), l_Tabs_0 (copy), l_InputSize_0 (copy), l_FillBehavior_0 (copy)
    local v9 = l_useNavigation_0();
    local l_routeName_0 = v9.state.routes[v9.state.index].routeName;
    local v11, v12 = v1.useState(l_routeName_0);
    local v14 = v1.useCallback(function(v13) --[[ Line: 24 ]]
        -- upvalues: v12 (copy), v9 (copy)
        v12(v13);
        v9.navigate(v13);
    end, {
        v9
    });
    v1.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v12 (copy), l_routeName_0 (copy)
        v12(function(v15) --[[ Line: 30 ]]
            -- upvalues: l_routeName_0 (ref)
            if v15 ~= l_routeName_0 then
                return l_routeName_0;
            else
                return v15;
            end;
        end);
    end, {
        l_routeName_0
    });
    return v1.createElement(l_View_0, {
        tag = "size-full-0 auto-y bg-surface-0", 
        LayoutOrder = v8.layoutOrder
    }, {
        SocialTabs = v1.createElement(l_Tabs_0, {
            activeTabId = v11, 
            size = l_InputSize_0.Medium, 
            fillBehavior = l_FillBehavior_0.Fill, 
            onActivated = v14, 
            tabs = v8.tabs
        })
    });
end;