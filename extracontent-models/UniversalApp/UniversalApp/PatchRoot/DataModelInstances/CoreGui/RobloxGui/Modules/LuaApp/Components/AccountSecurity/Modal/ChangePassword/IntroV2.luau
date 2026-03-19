local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.AccountPinError);
local v7 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.GetAccountPinState);
local v8 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Helpers.GetDaysRemainingToForceResetString);
local v9 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v10 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v11 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v12 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v13 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalErrorText);
local v14 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v15 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v16 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout);
local v20 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v22 = {
    [v15.ChangePasswordSuspectedCompromise] = v2.Dictionary.join({
        action = "Feature.AccountSecurityPrompt.Action.ContinueChangePassword", 
        descriptionEnd = "Feature.AccountSecurityPrompt.Description.ChangeYourPassword", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.UnusualActivity", 
        header = "Feature.AccountSecurityPrompt.Header.ChangeYourPassword"
    }, v6.localizationKeys), 
    [v15.ChangePasswordBreachedCredential] = v2.Dictionary.join({
        action = "Feature.AccountSecurityPrompt.Action.ContinueChangePassword", 
        descriptionEnd = "Feature.AccountSecurityPrompt.Description.NoChangeForceReset", 
        descriptionEndSingular = "Feature.AccountSecurityPrompt.Description.NoChangeForceResetSingular", 
        descriptionStart = "Feature.AccountSecurityPrompt.Description.ChangeYourPassword", 
        header = "Feature.AccountSecurityPrompt.Header.ChangeYourPassword"
    }, v6.localizationKeys)
};
local v23 = v3.PureComponent:extend("ChangePassword" .. script.Name);
v23.init = function(v24) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), v6 (copy)
    v24:setState({
        requestError = nil, 
        requestInFlight = false
    });
    v24.continueToChangePassword = function(v25) --[[ Line: 56 ]]
        -- upvalues: v24 (copy), v14 (ref), v6 (ref)
        return function() --[[ Line: 57 ]]
            -- upvalues: v24 (ref), v14 (ref), v6 (ref), v25 (copy)
            v24:setState({
                requestInFlight = true
            });
            v24.props.getAccountPinState(v24.props.networking):andThen(function(v26) --[[ Line: 65 ]]
                -- upvalues: v24 (ref), v14 (ref)
                local v27 = false;
                if v26.unlockedUntil ~= nil then
                    v27 = v26.unlockedUntil > 0;
                end;
                if v27 or not v26.isEnabled then
                    if v26.unlockedUntil ~= nil then
                        local v28 = math.floor(v26.unlockedUntil * 1000);
                        local v29 = DateTime.now().UnixTimestampMillis + v28;
                        v24.props.updateAccountPinUnlockTimeout(DateTime.fromUnixTimestampMillis(v29));
                    else
                        v24.props.updateAccountPinUnlockTimeout(nil);
                    end;
                    if not v24.isMounted then
                        return;
                    else
                        v24.props.navigateToModalState(v14.ChangePasswordForm);
                        return;
                    end;
                elseif not v24.isMounted then
                    return;
                else
                    v24.props.navigateToModalState(v14.AccountPinForm);
                    return;
                end;
            end):catch(function(v30) --[[ Line: 93 ]]
                -- upvalues: v24 (ref), v6 (ref), v25 (ref)
                if not v24.isMounted then
                    return;
                else
                    v24:setState({
                        requestError = v6.toString(v25, v30), 
                        requestInFlight = false
                    });
                    return;
                end;
            end);
        end;
    end;
end;
v23.didMount = function(v31) --[[ Line: 107 ]] --[[ Name: didMount ]]
    v31.isMounted = true;
end;
v23.willUnmount = function(v32) --[[ Line: 111 ]] --[[ Name: willUnmount ]]
    v32.isMounted = false;
end;
v23.render = function(v33) --[[ Line: 115 ]] --[[ Name: render ]]
    -- upvalues: v22 (copy), v15 (copy), v20 (copy), v8 (copy), v3 (copy), v10 (copy), v9 (copy), v11 (copy), v13 (copy), v12 (copy), l_ButtonType_0 (copy)
    local l_promptType_0 = v33.props.promptType;
    local l_metadata_0 = v33.props.metadata;
    local l_requestError_0 = v33.state.requestError;
    local l_requestInFlight_0 = v33.state.requestInFlight;
    local v38 = v22[l_promptType_0] or v22[v15.ChangePasswordSuspectedCompromise];
    return v20(v38)(function(v39) --[[ Line: 124 ]]
        -- upvalues: l_promptType_0 (copy), v15 (ref), v8 (ref), l_metadata_0 (copy), v3 (ref), v10 (ref), v9 (ref), v11 (ref), l_requestError_0 (copy), v13 (ref), v12 (ref), l_requestInFlight_0 (copy), v33 (copy), l_ButtonType_0 (ref)
        local l_descriptionEnd_0 = v39.descriptionEnd;
        if l_promptType_0 == v15.ChangePasswordBreachedCredential then
            l_descriptionEnd_0 = v8(v39.descriptionEndSingular, v39.descriptionEnd, l_metadata_0.forceResetTimestamp);
        end;
        local v41 = v39.descriptionStart .. " " .. l_descriptionEnd_0;
        return v3.createElement(v10, {
            title = v39.header, 
            makeBodyFragment = function(v42) --[[ Line: 138 ]] --[[ Name: makeBodyFragment ]]
                -- upvalues: v3 (ref), v9 (ref), v11 (ref), v41 (copy), l_requestError_0 (ref), v13 (ref)
                return v3.createFragment({
                    Lock = v3.createElement(v9, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v3.createElement(v11, {
                        layoutOrder = 2, 
                        contentWidth = v42, 
                        richText = true, 
                        text = v41
                    }), 
                    ModalErrorText = l_requestError_0 and v3.createElement(v13, {
                        layoutOrder = 3, 
                        contentWidth = v42, 
                        errorText = l_requestError_0
                    })
                });
            end, 
            buttonConfig = v12({
                {
                    isDisabled = l_requestInFlight_0, 
                    isLoading = l_requestInFlight_0, 
                    onActivated = v33.continueToChangePassword(v39), 
                    text = v39.action, 
                    type = l_ButtonType_0.PrimarySystem
                }
            })
        });
    end);
end;
v23 = v4.connect(function(v43, _) --[[ Line: 169 ]]
    return {
        promptType = v43.AccountSecurityPrompt.promptType, 
        metadata = v43.AccountSecurityPrompt.metadata
    };
end, function(v45) --[[ Line: 174 ]]
    -- upvalues: v7 (copy), v19 (copy)
    return {
        getAccountPinState = function(v46) --[[ Line: 176 ]] --[[ Name: getAccountPinState ]]
            -- upvalues: v45 (copy), v7 (ref)
            return v45(v7(v46));
        end, 
        updateAccountPinUnlockTimeout = function(v47) --[[ Line: 179 ]] --[[ Name: updateAccountPinUnlockTimeout ]]
            -- upvalues: v45 (copy), v19 (ref)
            return v45(v19(v47));
        end
    };
end)(v23);
return (l_RoactServices_0.connect({
    analytics = v16, 
    networking = v17
})(v23));