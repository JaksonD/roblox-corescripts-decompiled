local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
return function(v2, v3) --[[ Line: 8 ]] --[[ Name: navigateWithPlatformAccount ]]
    -- upvalues: l_AppPage_0 (copy)
    if v2 then
        v3(l_AppPage_0.SingleSignOnContainer);
        return;
    else
        v3(l_AppPage_0.Startup);
        return;
    end;
end;