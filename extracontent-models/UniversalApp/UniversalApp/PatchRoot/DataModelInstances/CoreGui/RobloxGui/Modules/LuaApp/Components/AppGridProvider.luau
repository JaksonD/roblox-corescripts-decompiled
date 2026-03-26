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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v11) --[[ Line: 24 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v8 (copy), l_useSelector_0 (copy), v2 (copy), v9 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_ResponsiveLayoutProvider_0 (copy)
    local v12 = l_useDesignTokens_0();
    local v14 = v8(function(v13) --[[ Line: 30 ]]
        return v13.useGridPageLayout();
    end);
    local v16 = l_useSelector_0(function(v15) --[[ Line: 34 ]]
        if v15.ScreenSize then
            return v15.ScreenSize.X;
        else
            return nil;
        end;
    end);
    local v17 = v2.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v14 (copy), v11 (copy), v9 (ref), v12 (copy)
        if not v14 then
            return {};
        else
            return v11.config or v9(v12);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v11.config, 
        v14, 
        v12
    } else l_dependencyArray_0(v11.config, v14, v12));
    return v2.createElement(l_ResponsiveLayoutProvider_0, {
        width = v16, 
        config = v17
    }, v11.children);
end;