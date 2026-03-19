local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
return function() --[[ Line: 11 ]]
    -- upvalues: l_AppPage_0 (copy)
    return {
        {
            [l_AppPage_0.Groups] = {
                getScreen = function() --[[ Line: 15 ]] --[[ Name: getScreen ]]
                    return require(script.Parent.GroupsUniversalAppWrapper);
                end, 
                navigationOptions = {
                    disableBackButton = false
                }
            }
        }
    };
end;