local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
return function() --[[ Line: 8 ]] --[[ Name: useLandingPageNavigationBindings ]]
    -- upvalues: v1 (copy), v2 (copy), l_FocusNavigationEventNameEnum_0 (copy)
    local v5 = v1.useCallback(function(v4) --[[ Line: 9 ]]
        v4:cancel();
    end, {});
    return (v2.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v5));
end;