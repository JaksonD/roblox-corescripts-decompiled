local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_Modules_0.LuaApp.Thunks.FetchTheme);
local v10 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v14 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v15 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_ThemeContext_0 = require(l_CorePackages_0.Workspace.Packages.Style).ThemeContext;
local v17 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature).GetSystemThemeEnabled();
local v18 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v19 = {
    ThemeUpdate = "ThemeUpdate"
};
local v20 = v6.Component:extend("ThemeUpdater");
v20.init = function(v21) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), l_NotificationService_0 (copy), v18 (copy), l_MemStorageService_0 (copy), v14 (copy), v10 (copy), v9 (copy), l_Players_0 (copy), v19 (copy)
    local l_RobloxEventReceiver_0 = v21.props.RobloxEventReceiver;
    local l_networking_0 = v21.props.networking;
    v21.changeTheme = function(v24) --[[ Line: 36 ]]
        -- upvalues: v17 (ref), v21 (copy), l_NotificationService_0 (ref), v18 (ref)
        if v17 then
            return;
        else
            if v21.props.themeOverride then
                v24 = v21.props.themeOverride;
            end;
            l_NotificationService_0.SelectedTheme = v24;
            v21.props.themeContext.setTheme(v24);
            v18:updateSharedAttributes({
                AppTheme = v24
            });
            return;
        end;
    end;
    v21.updateTheme = function() --[[ Line: 54 ]]
        -- upvalues: l_MemStorageService_0 (ref), v14 (ref), v21 (copy), v10 (ref), v9 (ref), l_networking_0 (copy), l_Players_0 (ref)
        local function v26(v25) --[[ Line: 55 ]] --[[ Name: cacheAndChangeTheme ]]
            -- upvalues: l_MemStorageService_0 (ref), v14 (ref), v21 (ref), v10 (ref)
            l_MemStorageService_0:Fire(v14.ThemeUpdate, v25);
            v21.changeTheme(v25);
            v10.setAuthenticatedTheme(v25);
            v10.flush();
        end;
        if v21.props.themeOverride then
            return v26(v21.props.themeOverride);
        else
            return v9(l_networking_0, l_Players_0.LocalPlayer.UserId):andThen(function(v27) --[[ Line: 67 ]]
                -- upvalues: l_MemStorageService_0 (ref), v14 (ref), v21 (ref), v10 (ref)
                l_MemStorageService_0:Fire(v14.ThemeUpdate, v27);
                v21.changeTheme(v27);
                v10.setAuthenticatedTheme(v27);
                v10.flush();
            end);
        end;
    end;
    v21.tokens = {
        l_RobloxEventReceiver_0:observeEvent("UserThemeTypeChangeNotification", function(v28, v29) --[[ Line: 73 ]]
            -- upvalues: v19 (ref), v21 (copy)
            if (v28.Type or v29) == v19.ThemeUpdate then
                v21.updateTheme();
            end;
        end), 
        l_MemStorageService_0:Bind(v14.ThemeUpdate, function(v30) --[[ Line: 79 ]]
            -- upvalues: v21 (copy)
            v21.changeTheme(v30);
        end)
    };
end;
v20.render = function(_) --[[ Line: 85 ]] --[[ Name: render ]]

end;
v20.willUnmount = function(v32) --[[ Line: 87 ]] --[[ Name: willUnmount ]]
    for _, v34 in pairs(v32.tokens) do
        v34:disconnect();
    end;
end;
return l_RoactServices_0.connect({
    networking = v12, 
    guiService = l_AppGuiService_0
})(function(v35) --[[ Line: 93 ]]
    -- upvalues: v15 (copy), v7 (copy), l_ThemeContext_0 (copy), v6 (copy), v20 (copy), v8 (copy)
    local v36 = nil;
    v36 = v15(function(v37) --[[ Line: 96 ]]
        return v37.getForceTheme();
    end);
    local v38 = v7.useContext(l_ThemeContext_0);
    return v6.createElement(v20, v8.Dictionary.join(v35, {
        themeOverride = v36, 
        themeContext = v38
    }));
end);