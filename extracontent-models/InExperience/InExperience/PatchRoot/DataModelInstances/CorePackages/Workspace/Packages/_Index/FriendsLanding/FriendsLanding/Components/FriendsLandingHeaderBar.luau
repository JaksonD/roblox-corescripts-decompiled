local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_withLocalization_0 = v1.withLocalization;
local l_Actions_0 = v1.RoactNavigation.Actions;
local v5 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v6 = require(script.FriendsLandingHeaderBarPresentational);
local l_AppHeaderBar_0 = v1.AppHeaderBar;
local v8 = require(l_script_FirstAncestor_0.Navigator.getActiveChildNavigationOptionsSafely);
local l_FFlagEnableLeftNavOnConsole_0 = v1.FFlagEnableLeftNavOnConsole;
local l_GuiService_0 = v1.GuiService;
local v11 = l_Roact_0.PureComponent:extend("FriendsLandingHeaderBar");
v11.init = function(v12) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: l_AppHeaderBar_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_GuiService_0 (copy), l_Actions_0 (copy)
    v12.renderLeft = function(v13, _, _) --[[ Line: 19 ]]
        -- upvalues: l_AppHeaderBar_0 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref), l_GuiService_0 (ref), l_Actions_0 (ref)
        local l_makeBackButton_0 = l_AppHeaderBar_0.makeBackButton;
        if l_FFlagEnableLeftNavOnConsole_0 and l_GuiService_0:IsTenFootInterface() then
            return nil;
        else
            return l_makeBackButton_0(function() --[[ Line: 25 ]]
                -- upvalues: v13 (copy), l_Actions_0 (ref)
                v13.dispatch(l_Actions_0.back());
            end);
        end;
    end;
end;
v11.render = function(v17) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v8 (copy), l_withLocalization_0 (copy), l_Roact_0 (copy), v6 (copy)
    return v5.with(function(v18) --[[ Line: 34 ]]
        -- upvalues: v17 (copy), v8 (ref), l_withLocalization_0 (ref), l_Roact_0 (ref), v6 (ref)
        local l_navigation_0 = v17.props.navigation;
        local v20 = v8(l_navigation_0);
        local l_headerText_0 = v20.headerText;
        return l_withLocalization_0({
            titleText = l_headerText_0.raw
        })(function(v22) --[[ Line: 40 ]]
            -- upvalues: v18 (copy), l_Roact_0 (ref), v6 (ref), v20 (copy), v17 (ref), l_navigation_0 (copy)
            local l_titleText_0 = v22.titleText;
            if v18.addFriendsPageSearchbarEnabled then
                return l_Roact_0.createElement(v6, {
                    title = l_titleText_0, 
                    renderLeft = v20.renderLeft or v17.renderLeft(l_navigation_0), 
                    renderCenter = v20.renderCenter, 
                    renderRight = v20.renderRight, 
                    isSecondary = v20.useSecondaryHeader
                });
            else
                return l_Roact_0.createElement(v6, {
                    title = l_titleText_0, 
                    renderLeft = v20.renderLeft or v17.renderLeft(l_navigation_0), 
                    renderCenter = v20.renderCenter, 
                    renderRight = v20.renderRight
                });
            end;
        end);
    end);
end;
return v11;