local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
return function() --[[ Line: 6 ]]
    -- upvalues: l_AppPage_0 (copy)
    return {
        {
            [l_AppPage_0.TransferRobuxFlow] = {
                getScreen = function() --[[ Line: 10 ]] --[[ Name: getScreen ]]
                    return require(script.Parent.CurrencyTransferUniversalAppWrapper);
                end, 
                navigationOptions = {
                    overlayEnabled = true, 
                    transparent = true, 
                    absorbInput = true, 
                    overlayTransparency = 0.5, 
                    renderUnderlyingPage = true, 
                    disableBackButton = true
                }
            }
        }
    };
end;