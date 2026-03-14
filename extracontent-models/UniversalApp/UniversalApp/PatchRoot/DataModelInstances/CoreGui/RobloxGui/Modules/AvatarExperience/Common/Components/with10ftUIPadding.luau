local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.Packages.React);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
return function(v7) --[[ Line: 14 ]] --[[ Name: with10ftUIPadding ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v4 (copy), v3 (copy)
    return function(v8) --[[ Line: 15 ]]
        -- upvalues: l_useDesignTokens_0 (ref), l_useUiModeInfo_0 (ref), l_UiMode_0 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref), v4 (ref), v7 (copy), v3 (ref)
        local v15 = l_useDesignTokens_0(function(v9) --[[ Line: 16 ]]
            -- upvalues: l_useUiModeInfo_0 (ref), l_UiMode_0 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref)
            local v10 = false;
            if l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot then
                v10 = not l_FFlagEnableLeftNavOnConsole_0;
            end;
            local v11 = if v10 then v9.Global.Space_500 else 0;
            local v12 = if v10 then v9.Global.Space_800 else 0;
            local v13 = if v10 then -(v11 + v9.Global.Space_500) else 0;
            local v14 = if v10 then -2 * v12 else 0;
            return {
                topPadding = v11, 
                leftPadding = v12, 
                bottomPadding = v13, 
                rightPadding = v14
            };
        end);
        return v4.createElement(v7, v3.join(v8, {
            designTokens = v15
        }));
    end;
end;