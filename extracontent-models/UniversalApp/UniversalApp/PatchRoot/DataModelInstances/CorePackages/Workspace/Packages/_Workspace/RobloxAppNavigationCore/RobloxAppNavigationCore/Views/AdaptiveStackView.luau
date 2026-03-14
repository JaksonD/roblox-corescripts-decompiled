local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local v1 = require(l_Parent_0.React);
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_TenFootUiStackView_0 = require(l_Parent_0.TenFootUiShell).Views.TenFootUiStackView;
local _ = require(l_Parent_0.Navigation);
local v6 = require(script.Parent.AppStackView);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
return function(v8) --[[ Line: 15 ]] --[[ Name: AdaptiveStackView ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_UiMode_0 (copy), v1 (copy), l_TenFootUiStackView_0 (copy), v6 (copy)
    local v9 = l_useUiModeInfo_0();
    if not l_FFlagEnableLeftNavOnConsole_0 and v9.uiMode == l_UiMode_0.TenFoot then
        return v1.createElement(l_TenFootUiStackView_0, v8);
    else
        return v1.createElement(v6, v8);
    end;
end;