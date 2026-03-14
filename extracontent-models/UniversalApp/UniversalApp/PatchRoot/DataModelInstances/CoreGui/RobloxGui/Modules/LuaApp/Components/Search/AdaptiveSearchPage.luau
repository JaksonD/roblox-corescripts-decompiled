local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Components.Search.SearchPage);
local v6 = require(l_Modules_0.LuaApp.Components.Search.TenFootUi.TenFootUiSearch);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
return function(v8) --[[ Line: 13 ]] --[[ Name: AdaptiveSearchPage ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v1 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v6 (copy), v5 (copy)
    local v9 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    return v1.createElement(if not v9 or l_FFlagEnableLeftNavOnConsole_0 then v5 else v6, v8);
end;