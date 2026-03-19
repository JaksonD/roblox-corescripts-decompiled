local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_NavigationEvents_0 = require(l_CorePackages_0.Packages.RoactNavigation).NavigationEvents;
local v3 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
return function(v4) --[[ Line: 21 ]] --[[ Name: OnFocusExposureLogger ]]
    -- upvalues: v3 (copy), v1 (copy), l_NavigationEvents_0 (copy)
    local v5 = v3.useLogExposureOnce(v4.ixpTest);
    if not v4.ixpTest.isEnabled() then
        return nil;
    else
        return v1.createElement(l_NavigationEvents_0, {
            onDidFocus = v5
        });
    end;
end;