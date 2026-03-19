local l_Parent_0 = script:FindFirstAncestor("DiscoveryRouting").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: l_AppPage_0 (copy), l_NavigateDown_0 (copy)
    return function(v5) --[[ Line: 7 ]]
        -- upvalues: l_AppPage_0 (ref), v3 (copy), v4 (copy), l_NavigateDown_0 (ref)
        local v6 = {
            name = l_AppPage_0.SongList, 
            detail = v3, 
            extraProps = {
                pageContext = v4
            }
        };
        v5:dispatch(l_NavigateDown_0(v6));
    end;
end;