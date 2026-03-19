local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v3 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v5 = {};
local function v9(v6) --[[ Line: 17 ]] --[[ Name: useOnNavigateBack ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy), l_FocusNavigationEventNameEnum_0 (copy)
    local v8 = v1.useCallback(v3.onRelease(function(v7) --[[ Line: 19 ]]
        -- upvalues: v6 (copy)
        v7:cancel();
        v6();
    end), {
        v6
    });
    return v2.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v8);
end;
v5.useOnNavigateBack = v9;
v5.OnNavigateBackWrapper = function(v10) --[[ Line: 31 ]] --[[ Name: OnNavigateBackWrapper ]]
    -- upvalues: v9 (copy), v1 (copy)
    local v11 = v9(v10.onNavigateBack);
    return v1.createElement("Frame", {
        ref = v11, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, v10.children);
end;
return v5;