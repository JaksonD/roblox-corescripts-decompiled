local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v3 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v4 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v5 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v6 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v7 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v8 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v9 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.PromptConstants);
local v10 = require(l_CorePackages_0.Packages.Roact);
local v11 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v12 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v13 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_CorePackages_0.Packages.UIBlox);
local v16 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v17 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v15.App.Button.Enum.ButtonType;
local v19 = {
    action = "Feature.AccountSecurityPrompt.Action.SetUpEmail2SV", 
    description = "Feature.AccountSecurityPrompt.Description.Email2SVUpsellMessageBody", 
    header = "Feature.AccountSecurityPrompt.Header.Email2SVUpsell", 
    settingsTitle = "CommonUI.Features.Label.Settings"
};
local v20 = v10.PureComponent:extend(script.Name);
v20.init = function(v21) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v8 (copy)
    v21:setState({
        requestError = nil, 
        requestInFlight = false
    });
    v21.continueToSecuritySettingsPage = function(v22) --[[ Line: 41 ]]
        -- upvalues: v21 (copy), v9 (ref), v8 (ref)
        return function() --[[ Line: 42 ]]
            -- upvalues: v21 (ref), v9 (ref), v22 (copy), v8 (ref)
            v21:setState({
                requestInFlight = true
            });
            v21.props.openWebView(v9.getWebViewUrlEmailHighlight(), v22.settingsTitle);
            v21.props.closeOverlay();
            v21.props.updatePromptAssignment(v21.props.networking, v21.props.promptType, v8.DismissPrompt);
        end;
    end;
    v21.closeCallback = function() --[[ Line: 57 ]]
        -- upvalues: v21 (copy), v8 (ref)
        v21.props.updatePromptAssignment(v21.props.networking, v21.props.promptType, v8.DismissPrompt);
    end;
end;
v20.render = function(v23) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v19 (copy), v10 (copy), v4 (copy), v3 (copy), v5 (copy), v6 (copy), l_ButtonType_0 (copy)
    local l_requestInFlight_0 = v23.state.requestInFlight;
    return v17(v19)(function(v25) --[[ Line: 69 ]]
        -- upvalues: v10 (ref), v4 (ref), v23 (copy), v3 (ref), v5 (ref), v6 (ref), l_requestInFlight_0 (copy), l_ButtonType_0 (ref)
        return v10.createElement(v4, {
            title = v25.header, 
            closeCallback = v23.closeCallback, 
            makeBodyFragment = function(v26) --[[ Line: 73 ]] --[[ Name: makeBodyFragment ]]
                -- upvalues: v10 (ref), v3 (ref), v5 (ref), v25 (copy)
                return v10.createFragment({
                    Lock = v10.createElement(v3, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v10.createElement(v5, {
                        layoutOrder = 2, 
                        contentWidth = v26, 
                        text = v25.description
                    })
                });
            end, 
            buttonConfig = v6({
                {
                    isDisabled = l_requestInFlight_0, 
                    isLoading = l_requestInFlight_0, 
                    onActivated = v23.continueToSecuritySettingsPage(v25), 
                    text = v25.action, 
                    type = l_ButtonType_0.PrimarySystem
                }
            })
        });
    end);
end;
v20 = v13.connect(function(v27, _) --[[ Line: 98 ]]
    return {
        metadata = v27.AccountSecurityPrompt.metadata
    };
end, function(v29) --[[ Line: 102 ]]
    -- upvalues: v2 (copy), v7 (copy), v16 (copy)
    return {
        closeOverlay = function() --[[ Line: 104 ]] --[[ Name: closeOverlay ]]
            -- upvalues: v29 (copy), v2 (ref)
            return v29(v2());
        end, 
        openWebView = function(v30, v31) --[[ Line: 107 ]] --[[ Name: openWebView ]]
            -- upvalues: v29 (copy), v7 (ref)
            v29(v7(v30, v31));
        end, 
        updatePromptAssignment = function(v32, v33, v34) --[[ Line: 110 ]] --[[ Name: updatePromptAssignment ]]
            -- upvalues: v29 (copy), v16 (ref)
            return v29(v16(v32, v33, v34));
        end
    };
end)(v20);
return (l_RoactServices_0.connect({
    analytics = v11, 
    networking = v12
})(v20));