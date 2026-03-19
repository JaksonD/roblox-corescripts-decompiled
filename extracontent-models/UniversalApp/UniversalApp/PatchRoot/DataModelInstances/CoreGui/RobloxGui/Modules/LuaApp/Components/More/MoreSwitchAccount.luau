local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v11 = v1.PureComponent:extend("MoreSwitchAccount");
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v17 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSwitcher);
local v18 = require(l_Modules_0.LuaApp.EventStreamConstants);
local l_GetFFlagUIBloxUseFoundationButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton;
v11.validateProps = v7.strictInterface({
    buttonHeight = v7.integer, 
    buttonMaxWidth = v7.integer, 
    item = v7.table, 
    layoutOrder = v7.optional(v7.integer), 
    position = v7.optional(v7.UDim2), 
    navigateDown = v7.callback, 
    navigateBack = v7.callback, 
    guiService = v7.union(v7.Instance, v7.table), 
    networkImpl = v7.callback, 
    willActivate = v7.optional(v7.callback), 
    authAnalytics = v7.table, 
    showAccountSwitcher = v7.callback, 
    appPolicy = v7.optional(v7.table), 
    omniRecommendationsRequest = v7.optional(v7.callback), 
    enableFoundationDesign = v7.optional(v7.boolean), 
    enableSignedOutAccounts = v7.optional(v7.boolean)
});
v11.init = function(v20) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy)
    local l_item_0 = v20.props.item;
    v20.navigateDown = function() --[[ Line: 49 ]]
        -- upvalues: v20 (copy), l_item_0 (copy)
        v20.props.navigateDown({
            name = l_item_0.context.page
        });
    end;
    v20.mounted = false;
    v20.state = {
        isButtonDisabled = false
    };
    v20.onActivated = function() --[[ Line: 61 ]]
        -- upvalues: v20 (copy), v18 (ref)
        if v20.state.isButtonDisabled then
            return;
        else
            v20:setState({
                isButtonDisabled = true
            });
            v20.props.authAnalytics.reportAuthButtonClick(v18.Context.MorePage, v18.Button.SwitchAccounts);
            v20.props.showAccountSwitcher(v20.props.networkImpl, v20.props.authAnalytics, v20.props.appPolicy, v20.props.omniRecommendationsRequest, v20.props.enableFoundationDesign, v20.props.enableSignedOutAccounts);
            if v20.props.willActivate then
                v20.props.willActivate();
            end;
            task.delay(0.25, function() --[[ Line: 83 ]]
                -- upvalues: v20 (ref)
                if v20.mounted then
                    v20:setState({
                        isButtonDisabled = false
                    });
                end;
            end);
            return;
        end;
    end;
end;
v11.didMount = function(v22) --[[ Line: 93 ]] --[[ Name: didMount ]]
    v22.mounted = true;
end;
v11.willUnmount = function(v23) --[[ Line: 97 ]] --[[ Name: willUnmount ]]
    v23.mounted = false;
end;
v11.render = function(v24) --[[ Line: 101 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v1 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_GetFFlagUIBloxUseFoundationButton_0 (copy)
    local l_buttonHeight_0 = v24.props.buttonHeight;
    local l_buttonMaxWidth_0 = v24.props.buttonMaxWidth;
    local l_layoutOrder_0 = v24.props.layoutOrder;
    local l_position_0 = v24.props.position;
    return v8({
        switchAccountText = "Authentication.AccountSwitch.Heading.SwitchAccount", 
        addAccountText = "Authentication.AccountSwitch.Action.AddAccount", 
        maxAccountsReachedText = "Authentication.AccountSwitch.Label.AccountLimitReached.2"
    })(function(v29) --[[ Line: 111 ]]
        -- upvalues: v1 (ref), l_position_0 (copy), l_layoutOrder_0 (copy), l_buttonHeight_0 (copy), l_buttonMaxWidth_0 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), v24 (copy), l_GetFFlagUIBloxUseFoundationButton_0 (ref)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = l_position_0, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, l_buttonHeight_0)
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SwitchAccountButtonFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                UISizeConstraint = v1.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(l_buttonMaxWidth_0, l_buttonHeight_0)
                }), 
                SwitchAccountButton = v1.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    isDisabled = false, 
                    isLoading = false, 
                    onActivated = v24.onActivated, 
                    size = UDim2.new(1, 0, l_GetFFlagUIBloxUseFoundationButton_0() and 0 or 1, if l_GetFFlagUIBloxUseFoundationButton_0() then l_buttonHeight_0 else 0), 
                    text = v29.switchAccountText
                })
            })
        });
    end);
end;
v11 = v2.connect(function(_, _) --[[ Line: 147 ]]
    return {};
end, function(v32) --[[ Line: 149 ]]
    -- upvalues: v5 (copy), v6 (copy), v17 (copy), v18 (copy)
    return {
        navigateDown = function(v33) --[[ Line: 151 ]] --[[ Name: navigateDown ]]
            -- upvalues: v32 (copy), v5 (ref)
            v32(v5(v33));
        end, 
        navigateBack = function() --[[ Line: 154 ]] --[[ Name: navigateBack ]]
            -- upvalues: v32 (copy), v6 (ref)
            v32(v6());
        end, 
        showAccountSwitcher = function(v34, v35, v36, v37, v38, v39) --[[ Line: 157 ]] --[[ Name: showAccountSwitcher ]]
            -- upvalues: v32 (copy), v17 (ref), v18 (ref)
            v32(v17(true, v34, v18.Origin.MoreMenu, v35, v36, v37, v38, v39));
        end
    };
end)(v11);
v11 = l_RoactAppPolicy_0.connect(function(v40, _) --[[ Line: 181 ]]
    return {
        appPolicy = v40
    };
end)(v11);
return l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    networkImpl = v16, 
    authAnalytics = v13
})(v11);