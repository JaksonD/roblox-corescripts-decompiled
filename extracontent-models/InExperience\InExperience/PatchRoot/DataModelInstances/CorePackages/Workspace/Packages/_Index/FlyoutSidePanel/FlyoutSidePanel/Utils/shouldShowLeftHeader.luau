local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v2 = require(l_Parent_0.NavigationRodux);
local l_FFlagAppIaHomeSubTab_0 = require(l_Parent_0.SharedFlags).FFlagAppIaHomeSubTab;
return function(v4, v5, v6) --[[ Line: 13 ]]
    -- upvalues: l_AppPage_0 (copy), l_FFlagAppIaHomeSubTab_0 (copy), v2 (copy)
    local v7 = true;
    if v4 ~= l_AppPage_0.Home then
        v7 = true;
        if v4 ~= l_AppPage_0.Games then
            v7 = l_FFlagAppIaHomeSubTab_0 and v4 == v2.Constants.HomeContainerName;
        end;
    end;
    local v8 = true;
    if v5 ~= l_AppPage_0.Home then
        v8 = v5 == l_AppPage_0.Games;
    end;
    if not v7 and not v8 then
        return false;
    elseif not (v7 and v5 == v4) then
        return true;
    else
        local v9 = v7 and v5 == l_AppPage_0.GameDetail;
        return (not not v8 or v9) and not v6;
    end;
end;