local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_NavigationEvents_0 = require(l_CorePackages_0.Packages.RoactNavigation).NavigationEvents;
local v3 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
return function(v4) --[[ Line: 21 ]] --[[ Name: OnFocusLayerExposureLogger ]]
    -- upvalues: v1 (copy), l_NavigationEvents_0 (copy), v3 (copy)
    return v1.createElement(l_NavigationEvents_0, {
        onDidFocus = function() --[[ Line: 23 ]] --[[ Name: onDidFocus ]]
            -- upvalues: v4 (copy), v3 (ref)
            for _, v6 in v4.ixpLayers do
                if v6 ~= nil then
                    v3.logLayerExposure(v6);
                end;
            end;
        end
    });
end;