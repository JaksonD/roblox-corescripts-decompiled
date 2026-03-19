local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagLuaAppPostAppInteractiveLoader_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppPostAppInteractiveLoader;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_useDisableAutoFocus_0 = v4.useDisableAutoFocus;
local l_useGlobalFocusHandler_0 = v4.useGlobalFocusHandler;
local l_useGlobalDefaultSelectionCursor_0 = v4.useGlobalDefaultSelectionCursor;
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useUiModeInfo_0 = v8.useUiModeInfo;
local l_ReactProfiler_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Profiling.ReactProfiler;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
game:DefineFastFlag("LuaAppInlineRequireAppConfigurer", false);
if not game:GetFastFlag("LuaAppInlineRequireAppConfigurer") then
    local _ = require(l_Modules_0.LuaApp.TenFootUI.TenFootUiDependencies);
    local _ = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup);
    local _ = require(l_Modules_0.LuaApp.Components.CentralOverlay);
    local _ = require(l_Modules_0.LuaApp.Constants);
    local _ = require(l_Modules_0.LuaApp.Components.ToastV2);
    local _ = require(l_Modules_0.LuaApp.Components.AppContainer);
end;
return function(v20) --[[ Line: 40 ]] --[[ Name: AppConfigurer ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useDisableAutoFocus_0 (copy), l_useGlobalFocusHandler_0 (copy), l_useGlobalDefaultSelectionCursor_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_Modules_0 (copy), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), l_CorePackages_0 (copy), v3 (copy), l_ReactProfiler_0 (copy)
    local v21 = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_useDisableAutoFocus_0();
    l_useGlobalFocusHandler_0(v21);
    l_useGlobalDefaultSelectionCursor_0();
    local v22 = l_useUiModeInfo_0();
    v22 = v20.uiModeInfo or v22;
    if v22.uiMode == l_UiMode_0.TenFoot and not l_FFlagEnableLeftNavOnConsole_0 then
        local v23 = require(l_Modules_0.LuaApp.TenFootUI.TenFootUiDependencies);
        local v24 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup);
        local v25 = require(l_Modules_0.LuaApp.Components.CentralOverlay);
        local v26 = require(l_Modules_0.LuaApp.Constants);
        local v27 = require(l_Modules_0.LuaApp.Components.ToastV2);
        local l_TenFootUiContainer_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiShell).TenFootUiContainer;
        settings().Rendering.EnableFRM = true;
        settings().Rendering.AutoFRMLevel = settings().Rendering:GetMaxQualityLevel();
        return v3.createElement(l_ReactProfiler_0, {
            id = "AppConfigurer"
        }, v3.createElement(l_TenFootUiContainer_0, {
            store = v20.store, 
            dependencies = v23, 
            toast = v3.createElement(v27, {
                displayOrder = v26.DisplayOrder.Toast
            }), 
            centralOverlay = v3.createElement(v25, {
                includeStatusBar = false, 
                displayOrder = v26.DisplayOrder.CentralOverlay
            })
        }), if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v3.createElement(v24, {
            store = v20.store, 
            shouldManageBackground = true
        }));
    else
        if l_FFlagEnableLeftNavOnConsole_0 and v22.uiMode == l_UiMode_0.TenFoot then
            settings().Rendering.EnableFRM = true;
            settings().Rendering.AutoFRMLevel = settings().Rendering:GetMaxQualityLevel();
        end;
        local v29 = require(l_Modules_0.LuaApp.Components.AppContainer);
        return v3.createElement(l_ReactProfiler_0, {
            id = "AppConfigurer"
        }, {
            AppContainer = v3.createElement(v29, {
                store = v20.store
            })
        });
    end;
end;