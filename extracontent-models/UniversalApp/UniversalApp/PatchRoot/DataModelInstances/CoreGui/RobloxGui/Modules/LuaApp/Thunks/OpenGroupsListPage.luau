local l_CorePackages_0 = game:GetService("CorePackages");
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local v2 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v3 = require(l_CorePackages_0.Packages.t);
local l_AppPage_0 = v2.AppPage;
return function(v5) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    assert(v3.callback(v5) or v3.none(v5), "");
    return l_NavigateDown_0({
        name = l_AppPage_0.Groups, 
        extraProps = {
            onClose = v5
        }
    });
end;