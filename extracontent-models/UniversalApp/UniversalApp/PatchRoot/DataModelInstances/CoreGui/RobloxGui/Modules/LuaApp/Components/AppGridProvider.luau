local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_ResponsiveLayoutProvider_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Layout.Responsive.ResponsiveLayoutProvider;
local v8 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v9 = require(l_Modules_0.LuaApp.Common.makeGridSettingsConfig);
return function(v10) --[[ Line: 21 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v8 (copy), l_useSelector_0 (copy), v2 (copy), v9 (copy), l_dependencyArray_0 (copy), l_ResponsiveLayoutProvider_0 (copy)
    local v11 = l_useDesignTokens_0();
    local v13 = v8(function(v12) --[[ Line: 27 ]]
        return v12.useGridPageLayout();
    end);
    local v15 = l_useSelector_0(function(v14) --[[ Line: 31 ]]
        if v14.ScreenSize then
            return v14.ScreenSize.X;
        else
            return nil;
        end;
    end);
    local v16 = v2.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: v13 (copy), v10 (copy), v9 (ref), v11 (copy)
        if not v13 then
            return {};
        else
            return v10.config or v9(v11);
        end;
    end, l_dependencyArray_0(v10.config, v13, v11));
    return v2.createElement(l_ResponsiveLayoutProvider_0, {
        width = v15, 
        config = v16
    }, v10.children);
end;