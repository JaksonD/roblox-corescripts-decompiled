local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v3 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v4 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v5 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v6 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToSecuritySettings);
local v8 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_CorePackages_0.Packages.UIBlox);
local v15 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v16 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v14.App.Button.Enum.ButtonType;
local v18 = {
    action = "Feature.AccountSecurityPrompt.Action.SetUpAuthenticatorAccountRestoresPolicyUpsell", 
    description = "Feature.AccountSecurityPrompt.Description.AccountRestoresPolicyUpsellMessageBody", 
    header = "Feature.AccountSecurityPrompt.Header.AccountRestoresPolicyUpsell", 
    settingsTitle = "CommonUI.Features.Label.Settings"
};
local v19 = v9.PureComponent:extend(script.Name);
v19.init = function(v20) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v20:setState({
        requestInFlight = false
    });
    v20.continueToAuthenticatorAppScreen = function(_) --[[ Line: 39 ]]
        -- upvalues: v20 (copy), v8 (ref)
        return function() --[[ Line: 40 ]]
            -- upvalues: v20 (ref), v8 (ref)
            v20:setState({
                requestInFlight = true
            });
            v20.props.navigateToSecuritySettings();
            v20.props.closeOverlay();
            v20.props.updatePromptAssignment(v20.props.networking, v20.props.promptType, v8.DismissPrompt);
        end;
    end;
    v20.closeCallback = function() --[[ Line: 57 ]]
        -- upvalues: v20 (copy), v8 (ref)
        v20.props.updatePromptAssignment(v20.props.networking, v20.props.promptType, v8.DismissPrompt);
    end;
end;
v19.render = function(v22) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v18 (copy), v9 (copy), v4 (copy), v3 (copy), v5 (copy), v6 (copy), l_ButtonType_0 (copy)
    local l_requestInFlight_0 = v22.state.requestInFlight;
    return v16(v18)(function(v24) --[[ Line: 69 ]]
        -- upvalues: v9 (ref), v4 (ref), v22 (copy), v3 (ref), v5 (ref), v6 (ref), l_requestInFlight_0 (copy), l_ButtonType_0 (ref)
        return v9.createElement(v4, {
            title = v24.header, 
            closeCallback = v22.closeCallback, 
            makeBodyFragment = function(v25) --[[ Line: 73 ]] --[[ Name: makeBodyFragment ]]
                -- upvalues: v9 (ref), v3 (ref), v5 (ref), v24 (copy)
                return v9.createFragment({
                    Lock = v9.createElement(v3, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v9.createElement(v5, {
                        layoutOrder = 2, 
                        contentWidth = v25, 
                        text = v24.description:gsub("{linkStartSettings}", ""):gsub("{linkEndSettings}", "")
                    })
                });
            end, 
            buttonConfig = v6({
                {
                    isDisabled = l_requestInFlight_0, 
                    isLoading = l_requestInFlight_0, 
                    onActivated = v22.continueToAuthenticatorAppScreen(v24), 
                    text = v24.action, 
                    type = l_ButtonType_0.PrimarySystem
                }
            })
        });
    end);
end;
v19 = v12.connect(function(_, _) --[[ Line: 98 ]]
    return {};
end, function(v28) --[[ Line: 100 ]]
    -- upvalues: v2 (copy), v7 (copy), v15 (copy)
    return {
        closeOverlay = function() --[[ Line: 102 ]] --[[ Name: closeOverlay ]]
            -- upvalues: v28 (copy), v2 (ref)
            return v28(v2());
        end, 
        navigateToSecuritySettings = function() --[[ Line: 105 ]] --[[ Name: navigateToSecuritySettings ]]
            -- upvalues: v28 (copy), v7 (ref)
            v28(v7());
        end, 
        updatePromptAssignment = function(v29, v30, v31) --[[ Line: 108 ]] --[[ Name: updatePromptAssignment ]]
            -- upvalues: v28 (copy), v15 (ref)
            return v28(v15(v29, v30, v31));
        end
    };
end)(v19);
return (l_RoactServices_0.connect({
    analytics = v10, 
    networking = v11
})(v19));