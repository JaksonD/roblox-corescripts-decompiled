local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local l_FocusRoot_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusRoot;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local l_DeviceType_0 = v4.DeviceType;
OverscanWrapper = function(v7) --[[ Line: 15 ]] --[[ Name: OverscanWrapper ]]
    -- upvalues: l_DeviceType_0 (copy), v3 (copy), l_CoreScriptsRootProvider_0 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    return function(v8) --[[ Line: 16 ]]
        -- upvalues: l_DeviceType_0 (ref), v3 (ref), l_CoreScriptsRootProvider_0 (ref), l_FocusRoot_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v7 (copy)
        local v9 = {
            deviceType = l_DeviceType_0.Console
        };
        return v3.createElement(l_CoreScriptsRootProvider_0, {
            styleOverride = v9
        }, {
            FocusNavigationCoreScriptsWrapper = v3.createElement(l_FocusRoot_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
                isIsolated = true, 
                isAutoFocusRoot = true
            }, {
                Overscan = v3.createElement(v7, v8)
            })
        });
    end;
end;
return OverscanWrapper;