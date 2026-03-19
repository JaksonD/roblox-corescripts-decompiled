local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local v3 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v3.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v3.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_createLazyComponent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.createLazyComponent;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
return function() --[[ Line: 12 ]]
    -- upvalues: l_AppPage_0 (copy), l_createLazyComponent_0 (copy), l_Modules_0 (copy), l_GlobalNavDisplayOption_0 (copy), l_ScreenKind_0 (copy)
    return {
        {
            [l_AppPage_0.More] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 16 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.More.MorePage);
                end), 
                navigationOptions = {
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }, 
        {
            [l_AppPage_0.Settings] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 26 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.More.AccountSettings.MoreSettingsPageSelector);
                end), 
                navigationOptions = {
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }, 
        {
            [l_AppPage_0.AdjustScreen] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 36 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.Shell.Components.Overscan10ft.Overscan);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.About] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 47 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.More.AboutPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly
                }
            }
        }
    };
end;