local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabsPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_StateLayerAffordance_0 = v3.Enums.StateLayerAffordance;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v9 = require(l_script_FirstAncestor_0.Components.SocialTabsHeader);
local v10 = require(l_script_FirstAncestor_0.Components.SocialTabBar);
local v11 = require(l_script_FirstAncestor_0.Contexts.SocialTabsContext);
local v12 = require(l_script_FirstAncestor_0.Hooks.useLocalizedTabs);
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v14) --[[ Line: 21 ]] --[[ Name: SocialTabsPageComponent ]]
    -- upvalues: v2 (copy), v12 (copy), l_useTokens_0 (copy), l_useNavigation_0 (copy), l_View_0 (copy), v9 (copy), v10 (copy), l_StateLayerAffordance_0 (copy), v11 (copy), l_FullscreenPageWithSafeArea_0 (copy)
    local l_renderNavigator_0 = v14.renderNavigator;
    local l_renderHeader_0 = v14.renderHeader;
    local l_tabConfig_0 = v14.tabConfig;
    local l_profileId_0 = v14.profileId;
    local l_title_0 = v14.title;
    local l_initialTabId_0 = v14.initialTabId;
    local l_pageWidth_0 = v14.pageWidth;
    local v22 = v2.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: l_profileId_0 (copy)
        return {
            profileId = l_profileId_0
        };
    end, {
        l_profileId_0
    });
    local v23 = v12(l_tabConfig_0);
    local v24 = l_useTokens_0();
    local v25 = l_useNavigation_0();
    local v26 = v2.useRef(false);
    local v27 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v25 (copy)
        v25.goBack();
    end, {
        v25
    });
    v2.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: v26 (copy), l_initialTabId_0 (copy), l_tabConfig_0 (copy), v25 (copy)
        if v26.current then
            return;
        elseif not l_initialTabId_0 or #l_tabConfig_0 == 0 then
            return;
        else
            local v28 = false;
            for _, v30 in l_tabConfig_0 do
                if v30.id == l_initialTabId_0 then
                    v28 = true;
                    break;
                end;
            end;
            local v31 = if v28 then l_initialTabId_0 else l_tabConfig_0[1].id;
            if v25.state.routes[v25.state.index].routeName ~= v31 then
                v25.navigate(v31);
            end;
            v26.current = true;
            return;
        end;
    end, {
        l_initialTabId_0, 
        l_tabConfig_0, 
        v25
    });
    local v32 = v2.createElement(l_View_0, {
        tag = "col size-full"
    }, {
        HeaderSection = v2.createElement(l_View_0, {
            tag = "col size-full-0 auto-y bg-surface-0", 
            LayoutOrder = 1
        }, {
            Header = if l_renderHeader_0 then l_renderHeader_0() else v2.createElement(v9, {
                title = l_title_0, 
                layoutOrder = 1
            }), 
            TabBar = v2.createElement(v10, {
                layoutOrder = 2, 
                tabs = v23
            })
        }), 
        TabContent = v2.createElement(l_View_0, {
            tag = "fill size-full-0", 
            LayoutOrder = 2
        }, {
            Navigator = l_renderNavigator_0()
        })
    });
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    if l_pageWidth_0 ~= nil then
        local v36 = {
            affordance = l_StateLayerAffordance_0.None
        };
        v33 = v24.Color.Surface.Surface_0.Color3;
        v34 = 1;
        v35 = {
            ScrimClickHandler = v2.createElement(l_View_0, {
                tag = "size-full", 
                stateLayer = v36, 
                onActivated = v27
            }, {
                Panel = v2.createElement(l_View_0, {
                    tag = "col position-top-right anchor-top-right padding-top-xxlarge bg-surface-0", 
                    Size = UDim2.new(0, l_pageWidth_0, 1, 0), 
                    stateLayer = v36, 
                    onActivated = function() --[[ Line: 117 ]] --[[ Name: onActivated ]]

                    end
                }, {
                    Content = v32
                })
            })
        };
    else
        v33 = v24.Color.Surface.Surface_0.Color3;
        v34 = v24.Color.Surface.Surface_0.Transparency;
        v35 = {
            SocialTabsPageContent = v32
        };
    end;
    return v2.createElement(v11.Provider, {
        value = v22
    }, {
        Page = v2.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = true, 
            BackgroundColor3 = v33, 
            BackgroundTransparency = v34
        }, v35)
    });
end;