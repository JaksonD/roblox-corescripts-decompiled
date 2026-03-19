local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v9 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v11 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v12 = require(l_Modules_0.LuaApp.Http.Requests.StartVngVerificationForm);
local v13 = require(l_Modules_0.LuaApp.Http.Requests.ValidateVngVerificationFormStatus);
local v14 = require(l_Modules_0.LuaApp.Components.Vng.VngComplianceLoadingPopup);
local v15 = v3.PureComponent:extend("VngContactInfoFormWebviewPopup");
local l_LoadingSpinner_0 = require(l_CorePackages_0.Packages.UIBlox).App.Loading.LoadingSpinner;
local v17 = require(l_Modules_0.LuaApp.Thunks.CloseVngContactInfoFormWebviewPopup);
local l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow;
v15.didMount = function(v19) --[[ Line: 26 ]] --[[ Name: didMount ]]
    -- upvalues: v12 (copy)
    local l_networking_0 = v19.props.networking;
    local l_guiService_0 = v19.props.guiService;
    local l_logout_0 = v19.props.logout;
    local l_exit_0 = v19.props.exit;
    v12(l_networking_0):andThen(function(v24) --[[ Line: 32 ]]
        -- upvalues: l_exit_0 (copy), v19 (copy), l_networking_0 (copy), l_logout_0 (copy), l_guiService_0 (copy)
        local l_formUrl_0 = v24.responseBody.formUrl;
        if not l_formUrl_0 then
            l_exit_0();
            return;
        else
            v19.props.openWebView(l_formUrl_0, "", l_networking_0, l_logout_0, l_guiService_0, l_exit_0);
            return;
        end;
    end, function(_) --[[ Line: 39 ]]
        -- upvalues: l_logout_0 (copy), l_networking_0 (copy), l_guiService_0 (copy)
        l_logout_0(l_networking_0, l_guiService_0);
    end);
end;
windowClosedCallback = function(v27, v28, v29, v30) --[[ Line: 44 ]] --[[ Name: windowClosedCallback ]]
    -- upvalues: v13 (copy), v11 (copy)
    v13(v29):andThen(function(v31) --[[ Line: 45 ]]
        -- upvalues: v27 (copy), v29 (copy), v28 (copy), v11 (ref), v30 (copy)
        if v31.responseBody.completed == false then
            v27(v29, v28);
            return;
        else
            v28:BroadcastNotification("", v11.RESTART_LUA_APP);
            v30();
            return;
        end;
    end, function() --[[ Line: 52 ]]
        -- upvalues: v27 (copy), v29 (copy), v28 (copy)
        v27(v29, v28);
    end);
end;
v15.render = function(v32) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 (copy), v3 (copy), v14 (copy), l_LoadingSpinner_0 (copy)
    if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
        return v3.createElement(v14, {});
    else
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v32.props.screenSize.Y), 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        }, {
            Layout = v3.createElement(l_LoadingSpinner_0, {
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.new(0.5, 0, 0.5, 0)
            })
        });
    end;
end;
v15 = v4.connect(function(v33) --[[ Line: 74 ]]
    return {
        screenSize = v33.ScreenSize
    };
end, function(v34) --[[ Line: 78 ]]
    -- upvalues: v8 (copy), v9 (copy), v6 (copy), v7 (copy), v17 (copy)
    return {
        logout = function(v35, v36) --[[ Line: 80 ]] --[[ Name: logout ]]
            -- upvalues: v34 (copy), v8 (ref), v9 (ref)
            v34(v8(v35, v36, v9.PartnerFormNotComplete));
        end, 
        openWebView = function(v37, v38, v39, v40, v41, v42) --[[ Line: 83 ]] --[[ Name: openWebView ]]
            -- upvalues: v34 (copy), v6 (ref), v7 (ref)
            v34(v6({
                name = v7.GenericWebPage, 
                detail = v37, 
                extraProps = {
                    title = v38, 
                    onClose = function() --[[ Line: 89 ]] --[[ Name: onClose ]]
                        -- upvalues: v40 (copy), v41 (copy), v39 (copy), v42 (copy)
                        windowClosedCallback(v40, v41, v39, v42);
                    end
                }
            }));
        end, 
        exit = function() --[[ Line: 95 ]] --[[ Name: exit ]]
            -- upvalues: v34 (copy), v17 (ref)
            v34(v17());
        end
    };
end)(v15);
return (l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    networking = v5
})(v15));