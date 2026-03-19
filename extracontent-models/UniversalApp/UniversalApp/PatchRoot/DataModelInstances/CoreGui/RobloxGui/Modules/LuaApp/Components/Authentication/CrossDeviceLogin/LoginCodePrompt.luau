local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v7 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v8 = require(l_Modules_0.LuaApp.Thunks.Authentication.CrossDeviceLogin);
local v9 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v10 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v13 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodeStatus);
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v15 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v16 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v17 = require(l_Modules_0.LuaApp.Http.Requests.GetIXPLayerParameters);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagCrossDeviceInstructionExperiment);
local v19 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local l_GetFFlagDisableCDLQrCodeForMaquettes_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDisableCDLQrCodeForMaquettes;
local l_GetFFlagEnableShortLinkCodeForVRCDL_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableShortLinkCodeForVRCDL;
local v22 = v2.PureComponent:extend("LoginCodePrompt");
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v24 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodeComponent);
local v25 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.ShortLinkLoginCodeComponent);
local v26 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.LoginCodeOverlay);
v22.init = function(v27) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v19 (copy), v16 (copy)
    v27:setState({
        Status = v13.Created, 
        DeviceCode = "", 
        AccountPictureUrl = "", 
        DisplayName = "", 
        AltTitle = nil, 
        AltInstruction = nil, 
        AltMobileInstruction = nil, 
        AltDesktopInstruction = nil
    });
    v27.fetchCode = function(v28) --[[ Line: 68 ]]
        -- upvalues: v27 (copy), v19 (ref), v16 (ref)
        v27.props.fetchCode(v28):andThen(function(v29) --[[ Line: 69 ]]
            -- upvalues: v27 (ref), v19 (ref), v16 (ref)
            if v27.isMounted then
                if v19() and v29.QrCodePath then
                    local v30 = v16.fromString("apis:auth-token-service" .. v29.QrCodePath);
                    v27:setState({
                        DeviceCode = v29.DeviceCode, 
                        QrCodeUrl = v30()
                    });
                else
                    v27:setState({
                        DeviceCode = v29.DeviceCode
                    });
                end;
                v27.pollLoginStatus(49, v29.DeviceCode, v29.PrivateKey);
            end;
        end, function(v31) --[[ Line: 84 ]]
            -- upvalues: v27 (ref)
            v27.closeWithError(v31);
        end);
    end;
    local function _(v32, v33, v34) --[[ Line: 89 ]] --[[ Name: retryPoll ]]
        -- upvalues: v27 (copy)
        spawn(function() --[[ Line: 90 ]]
            -- upvalues: v27 (ref), v32 (copy), v33 (copy), v34 (copy)
            wait(6);
            if v27.isMounted then
                if v32 > 0 then
                    v27.pollLoginStatus(v32 - 1, v33, v34);
                    return;
                else
                    v27.codeExpired();
                end;
            end;
        end);
    end;
    v27.pollLoginStatus = function(v36, v37, v38) --[[ Line: 102 ]]
        -- upvalues: v27 (copy), v13 (ref)
        v27.props.getLoginStatus(v27.props.networking, v37, v38):andThen(function(v39) --[[ Line: 103 ]]
            -- upvalues: v27 (ref), v13 (ref), v37 (copy), v38 (copy), v36 (copy)
            if v27.isMounted then
                if v39.Status == v13.Validated then
                    v27.props.closeCentralOverlay();
                    if v27.props.loginCallback then
                        v27.props.loginCallback(v37, v38);
                        return;
                    end;
                elseif v39.Status == v13.Expired or v39.Status == v13.Cancelled then
                    v27.codeExpired();
                    return;
                else
                    if v27.state.DisplayName == "" and v39.AccountName ~= "" then
                        v27.props.authAnalytics.reportScreenLoaded("confirmPrompt");
                    end;
                    v27:setState({
                        Status = v39.Status, 
                        DisplayName = v39.AccountName, 
                        AccountPictureUrl = v39.AccountPictureUrl
                    });
                    local l_v36_0 = v36;
                    local l_v37_0 = v37;
                    local l_v38_0 = v38;
                    spawn(function() --[[ Line: 90 ]]
                        -- upvalues: v27 (ref), l_v36_0 (copy), l_v37_0 (copy), l_v38_0 (copy)
                        wait(6);
                        if v27.isMounted then
                            if l_v36_0 > 0 then
                                v27.pollLoginStatus(l_v36_0 - 1, l_v37_0, l_v38_0);
                                return;
                            else
                                v27.codeExpired();
                            end;
                        end;
                    end);
                end;
            end;
        end, function(v43) --[[ Line: 125 ]]
            -- upvalues: v27 (ref)
            if v43.Body == "\"CodeInvalid\"" then
                v27.codeExpired();
                return;
            else
                v27.closeWithError(v43);
                return;
            end;
        end);
    end;
    v27.codeExpired = function() --[[ Line: 134 ]]
        -- upvalues: v27 (copy), v13 (ref)
        if v27.isMounted then
            v27:setState({
                Status = v13.Created, 
                DeviceCode = "", 
                AccountPictureUrl = "", 
                DisplayName = ""
            });
            v27.fetchCode(v27.props.networking);
        end;
    end;
    v27.closeButtonPressed = function() --[[ Line: 146 ]]
        -- upvalues: v27 (copy)
        if v27.state.DeviceCode ~= "" then
            v27.props.cancelLoginCode(v27.props.networking, v27.state.DeviceCode);
        end;
        v27.props.closeCentralOverlay();
    end;
    v27.closeWithError = function(v44) --[[ Line: 153 ]]
        -- upvalues: v27 (copy)
        if v44 and v44.Body == "\"InvalidLocation\"" then
            v27.props.setLocationErrorToast();
        else
            v27.props.setNetworkingErrorToast();
        end;
        v27.closeButtonPressed();
    end;
end;
v22.didMount = function(v45) --[[ Line: 163 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy), v18 (copy), v17 (copy)
    v45.isMounted = true;
    v45.props.authAnalytics.reportScreenLoaded(v7.Context.CrossDeviceKey);
    v45.fetchCode(v45.props.networking);
    if v18() then
        v17(v45.props.networking, "PlayerApp.CrossDeviceLogin.DisplayCode", {
            "alt_title", 
            "alt_instruction", 
            "alt_mobile_instruction", 
            "alt_desktop_instruction"
        }):andThen(function(v46) --[[ Line: 174 ]]
            -- upvalues: v45 (copy)
            local v47 = v46 and v46.responseBody;
            local v48 = false;
            if type(v47) == "table" then
                v48 = next(v47) and v45.isMounted;
            end;
            if v48 then
                v45:setState({
                    AltTitle = v47.alt_title ~= "" and v47.alt_title or nil, 
                    AltInstruction = v47.alt_instruction ~= "" and v47.alt_instruction or nil, 
                    AltMobileInstruction = v47.alt_mobile_instruction ~= "" and v47.alt_mobile_instruction or nil, 
                    AltDesktopInstruction = v47.alt_desktop_instruction ~= "" and v47.alt_desktop_instruction or nil
                });
            end;
        end);
    end;
end;
v22.willUnmount = function(v49) --[[ Line: 192 ]] --[[ Name: willUnmount ]]
    v49.isMounted = false;
end;
v22.render = function(v50) --[[ Line: 196 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_GetFFlagEnableShortLinkCodeForVRCDL_0 (copy), l_IsVRAppBuild_0 (copy), v2 (copy), v25 (copy), v24 (copy), v26 (copy)
    local v51 = v50.props.isDualLayout or v50.state.DisplayName == "";
    local v52 = v50.props.isDualLayout and v50.state.DisplayName ~= "";
    return l_withStyle_0(function(_) --[[ Line: 199 ]]
        -- upvalues: l_GetFFlagEnableShortLinkCodeForVRCDL_0 (ref), l_IsVRAppBuild_0 (ref), v2 (ref), v25 (ref), v50 (copy), v24 (ref), v51 (copy), v52 (copy), v26 (ref)
        local v54 = if l_GetFFlagEnableShortLinkCodeForVRCDL_0() and l_IsVRAppBuild_0() then v2.createElement(v25, {
            DeviceCode = v50.state.DeviceCode, 
            ShortLink = "roblox.com/quest"
        }) else v2.createElement(v24, {
            Status = v50.state.Status, 
            DeviceCode = v50.state.DeviceCode, 
            AccountPictureUrl = v50.state.AccountPictureUrl, 
            DisplayName = v50.state.DisplayName, 
            QrCodeUrl = v50.state.QrCodeUrl, 
            showCodeView = v51, 
            showConfirmLoginText = v52, 
            AltTitle = v50.state.AltTitle, 
            AltInstruction = v50.state.AltInstruction, 
            AltMobileInstruction = v50.state.AltMobileInstruction, 
            AltDesktopInstruction = v50.state.AltDesktopInstruction, 
            disableCdlQrCodeForMaquettes = v50.props.disableCdlQrCodeForMaquettes, 
            hideDeviceCode = v50.props.hideDeviceCode, 
            showLockIcon = v50.props.showLockIcon, 
            isDualLayout = v50.props.isDualLayout, 
            isCrossApp = v50.props.isCrossApp
        });
        if v50.props.isOverlay then
            return v2.createElement(v26, {
                loginCode = v54, 
                screenSize = v50.props.screenSize, 
                onCloseClicked = v50.closeButtonPressed
            }, {
                ViewContainer = v54
            });
        else
            return v54;
        end;
    end);
end;
v22 = l_RoactServices_0.connect({
    networking = v5, 
    authAnalytics = v6
})(v22);
v22 = v3.connect(function(v55, _) --[[ Line: 246 ]]
    return {
        screenSize = v55.ScreenSize
    };
end, function(v57) --[[ Line: 250 ]]
    -- upvalues: v10 (copy), v8 (copy), v9 (copy), v14 (copy), v15 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 252 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v57 (copy), v10 (ref)
            return v57(v10());
        end, 
        fetchCode = function(v58) --[[ Line: 255 ]] --[[ Name: fetchCode ]]
            -- upvalues: v57 (copy), v8 (ref)
            return v57(v8.FetchDeviceCode(v58));
        end, 
        getLoginStatus = function(v59, v60, v61) --[[ Line: 258 ]] --[[ Name: getLoginStatus ]]
            -- upvalues: v57 (copy), v8 (ref)
            return v57(v8.GetLoginStatus(v59, v60, v61));
        end, 
        cancelLoginCode = function(v62, v63) --[[ Line: 261 ]] --[[ Name: cancelLoginCode ]]
            -- upvalues: v57 (copy), v8 (ref)
            return v57(v8.CancelLoginCode(v62, v63));
        end, 
        setNetworkingErrorToast = function(_) --[[ Line: 264 ]] --[[ Name: setNetworkingErrorToast ]]
            -- upvalues: v57 (copy), v9 (ref)
            v57(v9({
                HttpError = Enum.HttpError.OK
            }));
        end, 
        setLocationErrorToast = function(_) --[[ Line: 267 ]] --[[ Name: setLocationErrorToast ]]
            -- upvalues: v57 (copy), v14 (ref), v15 (ref)
            v57(v14({
                toastType = v15.NetworkingError, 
                toastMessage = "Authentication.CrossDevice.Label.NotAvailableOnNetwork"
            }));
        end
    };
end)(v22);
if l_GetFFlagDisableCDLQrCodeForMaquettes_0() then
    v22 = l_RoactAppPolicy_0.connect(function(v66, _) --[[ Line: 277 ]]
        return {
            disableCdlQrCodeForMaquettes = v66.getDisableCDLQrCodeForMaquettes() or false
        };
    end)(v22);
end;
return v22;