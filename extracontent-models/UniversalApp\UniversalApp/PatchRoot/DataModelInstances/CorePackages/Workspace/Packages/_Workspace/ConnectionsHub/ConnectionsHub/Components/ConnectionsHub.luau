local l_script_FirstAncestor_0 = script:FindFirstAncestor("ConnectionsHub");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v6 = require(l_script_FirstAncestor_0.Components.ConnectionsHubHeader);
local v7 = require(l_script_FirstAncestor_0.Components.ConnectionsHubTabs);
local v8 = require(l_script_FirstAncestor_0.Hooks.useMakeTabs);
return function(v9) --[[ Line: 18 ]]
    -- upvalues: v8 (copy), l_useTokens_0 (copy), v2 (copy), l_FullscreenPageWithSafeArea_0 (copy), v3 (copy), v6 (copy), v7 (copy)
    local l_renderNavigator_0 = v9.renderNavigator;
    local v11 = v8(v9.tabConfig);
    local v12 = l_useTokens_0();
    return v2.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v12.Color.Surface.Surface_0.Color3, 
        BackgroundTransparency = v12.Color.Surface.Surface_0.Transparency
    }, {
        ConnectionsHubPage = v2.createElement(v3.View, {
            tag = "size-full-full col"
        }, {
            ConnectionsHub = v2.createElement(v3.View, {
                tag = "size-full-0 auto-y gap-small col bg-surface-0", 
                LayoutOrder = 1
            }, {
                Header = v2.createElement(v3.View, {
                    tag = "size-full-0 auto-y bg-surface-0 align-x-center", 
                    layoutOrder = 1
                }, {
                    CoHubHeader = v2.createElement(v6)
                }), 
                CoHubTabs = v2.createElement(v7, {
                    layoutOrder = 2, 
                    tabs = v11
                })
            }), 
            ConnectionsHubSwitchNavigatorView = v2.createElement(v3.View, {
                tag = "size-full-0 auto-y fill", 
                LayoutOrder = 2
            }, {
                ConnectionsHubSwitchNavigator = l_renderNavigator_0()
            })
        })
    });
end;