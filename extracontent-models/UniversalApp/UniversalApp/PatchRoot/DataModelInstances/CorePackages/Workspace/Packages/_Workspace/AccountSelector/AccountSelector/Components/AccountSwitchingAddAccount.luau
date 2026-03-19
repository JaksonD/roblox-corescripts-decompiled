local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_RoactRodux_0 = v1.RoactRodux;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_Foundation_0 = v1.Foundation;
local l_Sheet_0 = l_Foundation_0.Sheet;
local l_View_0 = l_Foundation_0.View;
local l_Text_0 = l_Foundation_0.Text;
local l_ButtonVariant_0 = l_Foundation_0.Enums.ButtonVariant;
local l_AppPage_0 = v1.RobloxAppEnums.AppPage;
local l_NavigateDown_0 = v1.NavigationRodux.Thunks.NavigateDown;
local l_RoactAppExperiment_0 = v1.RoactAppExperiment;
local l_FFlagEnableLuaLoginRevamp_0 = v1.SharedFlags.FFlagEnableLuaLoginRevamp;
local l_FStringLuaLoginRevampIxpLayer_0 = v1.SharedFlags.FStringLuaLoginRevampIxpLayer;
local l_GetFFlagEnableMultiPageSignup_0 = v1.SharedFlags.GetFFlagEnableMultiPageSignup;
local l_AppBtidLayers_0 = v1.ExperimentLayers.AppBtidLayers;
local v17 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v18 = require(l_Parent_0.Analytics.EventConstants);
local function v28(v19) --[[ Line: 35 ]] --[[ Name: AccountSwitchingAddAccount ]]
    -- upvalues: l_useLocalization_0 (copy), l_React_0 (copy), v17 (copy), v18 (copy), l_FFlagEnableLuaLoginRevamp_0 (copy), l_RoactAppExperiment_0 (copy), l_FStringLuaLoginRevampIxpLayer_0 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), l_Sheet_0 (copy), l_Text_0 (copy), l_View_0 (copy), l_Foundation_0 (copy), l_ButtonVariant_0 (copy)
    local v20 = l_useLocalization_0({
        titleText = "Authentication.AccountSwitch.Action.AddAnAccount", 
        loginText = "Authentication.AccountSwitch.Action.SignInToExistingAccount", 
        createText = "Authentication.AccountPicker.Button.CreateAccount"
    });
    local v21, v22 = l_React_0.useState(true);
    local v23 = {
        showLoginRevamp = false
    };
    l_React_0.useEffect(function() --[[ Line: 45 ]]
        -- upvalues: v19 (copy), v17 (ref), v18 (ref)
        if v19.origin then
            v17.sendModalShownEvent(v18.ctx.accountSwitcherAddAccount, v19.origin);
        end;
    end, {});
    if l_FFlagEnableLuaLoginRevamp_0 then
        v23 = l_RoactAppExperiment_0.useBrowserTrackerExperiment({
            l_FStringLuaLoginRevampIxpLayer_0
        }, function(v24) --[[ Line: 54 ]]
            -- upvalues: l_FStringLuaLoginRevampIxpLayer_0 (ref)
            return {
                showLoginRevamp = (v24[l_FStringLuaLoginRevampIxpLayer_0] or {}).showLoginRevamp
            };
        end);
    end;
    local function v25() --[[ Line: 64 ]]
        -- upvalues: v22 (copy), v19 (copy)
        v22(false);
        if v19.onClose then
            v19.onClose(true);
        end;
    end;
    local function v26() --[[ Line: 71 ]]
        -- upvalues: v19 (copy), v17 (ref), v18 (ref), v22 (copy), l_FFlagEnableLuaLoginRevamp_0 (ref), v23 (ref)
        if v19.origin then
            v17.sendButtonClickEvent(v18.ctx.accountSwitcherAddAccount, v19.origin, v18.btn.login);
        end;
        v22(false);
        if v19.onClose then
            v19.onClose();
        end;
        if l_FFlagEnableLuaLoginRevamp_0 and v23.showLoginRevamp then
            if v19.navigateToLoginV2 then
                v19.navigateToLoginV2();
                return;
            end;
        elseif v19.navigateToLogin then
            v19.navigateToLogin();
        end;
    end;
    local function v27() --[[ Line: 94 ]]
        -- upvalues: v19 (copy), v17 (ref), v18 (ref), v22 (copy), l_GetFFlagEnableMultiPageSignup_0 (ref)
        if v19.origin then
            v17.sendButtonClickEvent(v18.ctx.accountSwitcherAddAccount, v19.origin, v18.btn.signup);
        end;
        v22(false);
        if v19.onClose then
            v19.onClose();
        end;
        if l_GetFFlagEnableMultiPageSignup_0() and v19.shouldEnableMultiPageSignup then
            if v19.navigateToMultiPageSignUp then
                v19.navigateToMultiPageSignUp();
                return;
            end;
        elseif v19.navigateToSignUp then
            v19.navigateToSignUp();
        end;
    end;
    return l_React_0.createElement(l_React_0.Fragment, nil, {
        AddAccountSheet = l_React_0.createElement(l_Sheet_0.Root, {
            onClose = v25, 
            preferCenterSheet = true, 
            isOpen = v21
        }, {
            Header = l_React_0.createElement(l_Sheet_0.Header, nil, {
                Title = l_React_0.createElement(l_Text_0, {
                    Text = v20.titleText, 
                    tag = "auto-xy text-heading-small content-emphasis"
                })
            }), 
            StandardButtons = l_React_0.createElement(l_Sheet_0.Content, {
                tag = "col auto-y gap-small"
            }, {
                ActionList = l_React_0.createElement(l_View_0, {
                    tag = "col auto-y gap-small size-full-0 padding-bottom-medium"
                }, {
                    LoginButton = l_React_0.createElement(l_Foundation_0.Button, {
                        text = v20.loginText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v26, 
                        tag = "col size-full-0", 
                        width = UDim.new(1, 0)
                    }), 
                    SignUpButton = l_React_0.createElement(l_Foundation_0.Button, {
                        text = v20.createText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v27, 
                        tag = "col size-full-0", 
                        width = UDim.new(1, 0)
                    })
                })
            })
        })
    });
end;
if l_GetFFlagEnableMultiPageSignup_0() then
    v28 = l_RoactAppExperiment_0.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.SignupLayer
    }, function(v29, _) --[[ Line: 158 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        return {
            shouldEnableMultiPageSignup = (v29[l_AppBtidLayers_0.SignupLayer] or {}).shouldEnableMultiPageSignup
        };
    end)(v28);
end;
v28 = l_RoactRodux_0.connect(nil, function(v31) --[[ Line: 168 ]]
    -- upvalues: l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    return {
        navigateToLogin = function() --[[ Line: 170 ]] --[[ Name: navigateToLogin ]]
            -- upvalues: v31 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v31(l_NavigateDown_0({
                name = l_AppPage_0.Login
            }));
        end, 
        navigateToLoginV2 = function() --[[ Line: 174 ]] --[[ Name: navigateToLoginV2 ]]
            -- upvalues: v31 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v31(l_NavigateDown_0({
                name = l_AppPage_0.LoginV2
            }));
        end, 
        navigateToSignUp = function() --[[ Line: 178 ]] --[[ Name: navigateToSignUp ]]
            -- upvalues: v31 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v31(l_NavigateDown_0({
                name = l_AppPage_0.SinglePageSignUp
            }));
        end, 
        navigateToMultiPageSignUp = function() --[[ Line: 182 ]] --[[ Name: navigateToMultiPageSignUp ]]
            -- upvalues: v31 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v31(l_NavigateDown_0({
                name = l_AppPage_0.MultiPageSignup, 
                extraProps = {
                    enforceResetState = true
                }
            }));
        end
    };
end)(v28);
return l_React_0.memo(v28);