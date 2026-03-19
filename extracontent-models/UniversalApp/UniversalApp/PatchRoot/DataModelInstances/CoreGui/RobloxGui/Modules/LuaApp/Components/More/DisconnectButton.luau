local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v9 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForConfirmSignOut);
local v10 = require(l_Modules_0.LuaApp.Themes.DeprecatedDarkTheme);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_ConsoleDisconnect_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Thunks.ConsoleDisconnect;
local v15 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
return function() --[[ Line: 31 ]] --[[ Name: DisconnectButton ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v7 (copy), v5 (copy), l_AppGuiService_0 (copy), v1 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v9 (copy), l_ConsoleDisconnect_0 (copy), v15 (copy), v10 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local l_DisconnectTextFont_0 = l_useDesignTokens_0().LuaApps.More.DisconnectTextFont;
    local v19 = l_useDispatch_0();
    local v20 = l_useLocalization_0({
        logout = "Application.Logout.Action.Logout"
    });
    local v21 = v7(v5);
    local v22 = v7(l_AppGuiService_0);
    local v23 = v1.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref), v19 (copy), v9 (ref), l_ConsoleDisconnect_0 (ref), v21 (copy), v22 (copy), v15 (ref), v10 (ref)
        pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LogoutButtonClickedConfig, 1);
        end);
        v19(v9(function() --[[ Line: 46 ]]
            -- upvalues: v19 (ref), l_ConsoleDisconnect_0 (ref), v21 (ref), v22 (ref), v15 (ref)
            v19(l_ConsoleDisconnect_0(v21, v22, v15));
        end, v10));
    end, {
        v19, 
        v21, 
        v22
    });
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        DisconnectButton = v1.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            size = UDim2.new(1, 0, 1, 0), 
            text = v20.logout, 
            fontStyle = l_DisconnectTextFont_0, 
            onActivated = v23
        })
    });
end;