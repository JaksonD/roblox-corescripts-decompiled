local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Images_0 = v5.App.ImageSet.Images;
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagDisableAuthFailureRetry);
game:DefineFastInt("AuthFailureMaxRetryDelay", 300);
local v11 = v2.PureComponent:extend("AccountAuthenticationFailureOverlay");
v11.validateProps = v9.interface({
    onActivated = v9.callback, 
    screenSize = v9.Vector2
});
local function _(v12) --[[ Line: 27 ]] --[[ Name: getDelay ]]
    return (math.min(2 ^ v12, game:GetFastInt("AuthFailureMaxRetryDelay")));
end;
v11.init = function(v14) --[[ Line: 31 ]] --[[ Name: init ]]
    v14.state = {
        countdownStarted = false, 
        secondsRemaining = nil
    };
    v14.timesRetried = 0;
    v14.onRetry = function() --[[ Line: 39 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            countdownStarted = true
        });
    end;
end;
v11.didUpdate = function(v15, _, v17) --[[ Line: 46 ]] --[[ Name: didUpdate ]]
    if v15.state.countdownStarted and not v17.countdownStarted then
        v15:_onRetry();
    end;
end;
v11._onRetry = function(v18) --[[ Line: 52 ]] --[[ Name: _onRetry ]]
    -- upvalues: v2 (copy)
    v18.props.onActivated();
    v18.timesRetried = v18.timesRetried + 1;
    local v19 = tick();
    local v20 = math.min(2 ^ v18.timesRetried, game:GetFastInt("AuthFailureMaxRetryDelay"));
    local function v21() --[[ Line: 59 ]] --[[ Name: countDown ]]
        -- upvalues: v18 (copy), v19 (copy), v20 (copy), v21 (copy), v2 (ref)
        if v18.isMounted then
            local v22 = tick() - v19;
            local v23 = v20 - v22;
            if v23 > 0 then
                v18:setState({
                    secondsRemaining = math.round(v23)
                });
                task.delay(1, v21);
                return;
            else
                v18:setState({
                    countdownStarted = false, 
                    secondsRemaining = v2.None
                });
            end;
        end;
    end;
    v21();
end;
v11.render = function(v24) --[[ Line: 80 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), l_withLocalization_0 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_Images_0 (copy), l_ButtonType_0 (copy)
    local v25 = nil;
    local v26 = nil;
    if v10() then
        v25 = "Authentication.Login.Action.ConnectionError.RetryReady";
        v26 = "Authentication.Login.Label.ConnectionError.RetryDisabled";
    elseif v24.state.countdownStarted then
        v25 = "Authentication.Login.Action.ConnectionError.RetryWait";
        v26 = "Authentication.Login.Label.ConnectionError.RetryWait";
    else
        v25 = "Authentication.Login.Action.ConnectionError.RetryReady";
        v26 = "Authentication.Login.Label.ConnectionError.RetryReady";
    end;
    return l_withLocalization_0({
        titleText = "Authentication.Login.Label.ConnectionError.Title", 
        retryButtonText = v25, 
        bodyText = v26
    })(function(v27) --[[ Line: 96 ]]
        -- upvalues: v2 (ref), l_InteractiveAlert_0 (ref), l_Images_0 (ref), l_ButtonType_0 (ref), v24 (copy), v10 (ref)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v27.titleText, 
            bodyText = v27.bodyText, 
            titleIcon = l_Images_0["icons/status/error_large"], 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isDisabled = v24.state.countdownStarted or v10(), 
                            onActivated = v24.onRetry, 
                            text = string.gsub(v27.retryButtonText, "{.-}", v24.state.secondsRemaining or "")
                        }
                    }
                }
            }, 
            screenSize = v24.props.screenSize
        });
    end);
end;
v11.didMount = function(v28) --[[ Line: 118 ]] --[[ Name: didMount ]]
    v28.isMounted = true;
end;
v11.willUnmount = function(v29) --[[ Line: 122 ]] --[[ Name: willUnmount ]]
    v29.isMounted = false;
end;
return (v3.connect(function(v30, _) --[[ Line: 126 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v30.ScreenSize
    };
end)(v11));