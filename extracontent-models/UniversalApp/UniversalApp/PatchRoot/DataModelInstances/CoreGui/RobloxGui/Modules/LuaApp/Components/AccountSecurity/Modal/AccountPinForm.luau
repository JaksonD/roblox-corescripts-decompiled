local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.AccountPinError);
local v7 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v8 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v9 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v10 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v11 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v12 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalTextInput);
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v16 = require(l_Modules_0.LuaApp.Actions.AccountSecurity.UpdateAccountPinUnlockTimeout);
local v17 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UnlockAccountPin);
local v18 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.Validators.True);
local v19 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v21 = v2.Dictionary.join({
    action = "Feature.AccountSecurityPrompt.Action.UnlockAccountPin", 
    description = "Feature.AccountSecurityPrompt.Description.EnterYourAccountPin", 
    header = "Feature.AccountSecurityPrompt.Header.AccountPinRequired", 
    headerExpired = "Feature.AccountSecurityPrompt.Header.AccountPinExpired", 
    label = "Feature.AccountSecurityPrompt.Label.AccountPin"
}, v6.localizationKeys);
local v22 = v3.PureComponent:extend(script.Name);
v22.init = function(v23) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v11 (copy), v6 (copy)
    v23:setState({
        accountPin = "", 
        accountPinError = nil, 
        requestError = nil, 
        requestInFlight = false
    });
    v23.setAccountPin = function(v24) --[[ Line: 48 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            accountPin = v24
        });
    end;
    v23.setAccountPinError = function(v25) --[[ Line: 54 ]]
        -- upvalues: v23 (copy), v3 (ref)
        v23:setState({
            accountPinError = v25 or v3.None
        });
    end;
    v23.clearRequestError = function() --[[ Line: 60 ]]
        -- upvalues: v23 (copy), v3 (ref)
        v23:setState({
            requestError = v3.None
        });
    end;
    v23.unlockAccountPin = function(v26) --[[ Line: 66 ]]
        -- upvalues: v23 (copy), v11 (ref), v6 (ref)
        return function() --[[ Line: 67 ]]
            -- upvalues: v23 (ref), v11 (ref), v6 (ref), v26 (copy)
            v23:setState({
                requestInFlight = true
            });
            v23.props.unlockAccountPin(v23.props.networking, v23.state.accountPin):andThen(function(v27) --[[ Line: 75 ]]
                -- upvalues: v23 (ref), v11 (ref)
                local v28 = math.floor(v27.unlockedUntil * 1000);
                local v29 = DateTime.now().UnixTimestampMillis + v28;
                v23.props.updateAccountPinUnlockTimeout(DateTime.fromUnixTimestampMillis(v29));
                if not v23.isMounted then
                    return;
                else
                    v23.props.navigateToModalState(v11.ChangePasswordForm);
                    return;
                end;
            end):catch(function(v30) --[[ Line: 90 ]]
                -- upvalues: v23 (ref), v6 (ref), v26 (ref)
                if not v23.isMounted then
                    return;
                else
                    v23:setState({
                        requestError = v6.toString(v26, v30), 
                        requestInFlight = false
                    });
                    return;
                end;
            end);
        end;
    end;
end;
v22.didMount = function(v31) --[[ Line: 104 ]] --[[ Name: didMount ]]
    v31.isMounted = true;
end;
v22.willUnmount = function(v32) --[[ Line: 108 ]] --[[ Name: willUnmount ]]
    v32.isMounted = false;
end;
v22.render = function(v33) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), v21 (copy), v11 (copy), v3 (copy), v8 (copy), v7 (copy), v9 (copy), v12 (copy), v18 (copy), v10 (copy), l_ButtonType_0 (copy)
    local l_accountPin_0 = v33.state.accountPin;
    local l_requestError_0 = v33.state.requestError;
    local l_requestInFlight_0 = v33.state.requestInFlight;
    local v37 = l_accountPin_0 ~= "";
    return v19(v21)(function(v38) --[[ Line: 118 ]]
        -- upvalues: v33 (copy), v11 (ref), v3 (ref), v8 (ref), v7 (ref), v9 (ref), v12 (ref), l_requestError_0 (copy), v18 (ref), l_accountPin_0 (copy), v10 (ref), l_requestInFlight_0 (copy), v37 (copy), l_ButtonType_0 (ref)
        local v39 = nil;
        v39 = if v33.props.modalState == v11.AccountPinForm then v38.header else v38.headerExpired;
        return v3.createElement(v8, {
            title = v39, 
            makeBodyFragment = function(v40) --[[ Line: 128 ]] --[[ Name: makeBodyFragment ]]
                -- upvalues: v3 (ref), v7 (ref), v9 (ref), v38 (copy), v12 (ref), l_requestError_0 (ref), v33 (ref), v18 (ref), l_accountPin_0 (ref)
                return v3.createFragment({
                    Lock = v3.createElement(v7, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v3.createElement(v9, {
                        layoutOrder = 2, 
                        contentWidth = v40, 
                        text = v38.description
                    }), 
                    ModalTextInput = v3.createElement(v12, {
                        layoutOrder = 3, 
                        errorText = l_requestError_0, 
                        labelText = v38.label, 
                        onChanged = v33.clearRequestError, 
                        placeholderText = "", 
                        setError = v33.setAccountPinError, 
                        setValue = v33.setAccountPin, 
                        textInputType = Enum.TextInputType.Password, 
                        validate = v18, 
                        value = l_accountPin_0
                    })
                });
            end, 
            buttonConfig = v10({
                {
                    isDisabled = l_requestInFlight_0 or not v37, 
                    isLoading = l_requestInFlight_0, 
                    onActivated = v33.unlockAccountPin(v38), 
                    text = v38.action, 
                    type = l_ButtonType_0.PrimarySystem
                }
            })
        });
    end);
end;
v22 = v4.connect(nil, function(v41) --[[ Line: 165 ]]
    -- upvalues: v16 (copy), v17 (copy)
    return {
        updateAccountPinUnlockTimeout = function(v42) --[[ Line: 167 ]] --[[ Name: updateAccountPinUnlockTimeout ]]
            -- upvalues: v41 (copy), v16 (ref)
            return v41(v16(v42));
        end, 
        unlockAccountPin = function(v43, v44) --[[ Line: 170 ]] --[[ Name: unlockAccountPin ]]
            -- upvalues: v41 (copy), v17 (ref)
            return v41(v17(v43, v44));
        end
    };
end)(v22);
return (l_RoactServices_0.connect({
    analytics = v13, 
    networking = v14
})(v22));