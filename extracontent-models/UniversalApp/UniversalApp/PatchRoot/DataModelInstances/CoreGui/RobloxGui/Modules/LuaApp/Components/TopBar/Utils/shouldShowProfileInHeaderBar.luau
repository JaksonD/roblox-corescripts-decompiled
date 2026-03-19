local l_CorePackages_0 = game:GetService("CorePackages");
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
return function(v3, v4, v5, v6) --[[ Line: 10 ]]
    -- upvalues: l_AppPage_0 (copy), l_FormFactor_0 (copy)
    local v7 = false;
    if v3 == l_AppPage_0.Home then
        v7 = false;
        if v4 ~= l_AppPage_0.GamesList then
            v7 = false;
            if v5 == l_FormFactor_0.COMPACT then
                v7 = not v6;
            end;
        end;
    end;
    return v7;
end;