local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_withStyle_0 = v4.Core.Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.openExternalBrowser);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v12 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v13 = require(l_Modules_0.LuaApp.AppPage);
local v14 = v2.Component:extend(script.Name);
v14.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v14.init = function(v15) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), v12 (copy), v13 (copy)
    v15.supportFormActivated = function(v16) --[[ Line: 35 ]]
        -- upvalues: v15 (copy), v10 (ref), v12 (ref), v13 (ref)
        if v15.props.useExternalBrowserForDisclaimerLinks then
            v10(v15.props.linking, v12.static.about.support());
            return;
        else
            v15.props.navigateDown({
                name = v13.GenericWebPage, 
                detail = v12.static.about.support(), 
                extraProps = {
                    title = v16.support
                }
            });
            return;
        end;
    end;
end;
v14.render = function(v17) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_withStyle_0 (copy)
    return v8({
        title = "CommonUI.UserAgreements.Popup.TransferCurrency.Title", 
        message = "CommonUI.UserAgreements.Popup.TransferCurrency.Message", 
        button = "CommonUI.UserAgreements.Popup.ContactCustomerSupport", 
        support = "Feature.Moderation.Link.SupportForm"
    })(function(v18) --[[ Line: 57 ]]
        -- upvalues: l_withStyle_0 (ref), v17 (copy)
        return l_withStyle_0(function(v19) --[[ Line: 58 ]]
            -- upvalues: v17 (ref), v18 (copy)
            return v17:renderWithProviders(v18, v19);
        end);
    end);
end;
v14.renderWithProviders = function(v20, v21, _) --[[ Line: 64 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_props_0 = v20.props;
    return v2.createElement(l_InteractiveAlert_0, {
        anchorPoint = l_props_0.anchorPoint, 
        position = l_props_0.position, 
        screenSize = l_props_0.screenSize, 
        title = v21.title, 
        bodyText = v21.message, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function() --[[ Line: 78 ]] --[[ Name: onActivated ]]
                            -- upvalues: v20 (copy), v21 (copy), l_props_0 (copy)
                            v20.supportFormActivated(v21);
                            l_props_0.doneActivated();
                        end, 
                        text = v21.button
                    }
                }
            }
        }
    });
end;
v14 = l_RoactAppPolicy_0.connect(function(v24) --[[ Line: 90 ]]
    return {
        useExternalBrowserForDisclaimerLinks = v24.shouldUseExternalBrowserForDisclaimerLinks()
    };
end)(v14);
return (v3.connect(nil, function(v25) --[[ Line: 96 ]]
    -- upvalues: v9 (copy)
    return {
        navigateDown = function(v26) --[[ Line: 98 ]] --[[ Name: navigateDown ]]
            -- upvalues: v25 (copy), v9 (ref)
            v25(v9(v26));
        end
    };
end)(v14));