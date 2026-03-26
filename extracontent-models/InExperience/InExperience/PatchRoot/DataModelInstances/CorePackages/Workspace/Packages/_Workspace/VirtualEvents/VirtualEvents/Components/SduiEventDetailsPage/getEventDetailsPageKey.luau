local l_Parent_0 = script:FindFirstAncestor("VirtualEvents").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
return function(v2) --[[ Line: 6 ]] --[[ Name: getEventDetailsPageKey ]]
    -- upvalues: l_AppPage_0 (copy)
    if v2 == nil then
        return l_AppPage_0.EventDetails .. "-Unknown";
    else
        return l_AppPage_0.EventDetails .. "-" .. v2;
    end;
end;