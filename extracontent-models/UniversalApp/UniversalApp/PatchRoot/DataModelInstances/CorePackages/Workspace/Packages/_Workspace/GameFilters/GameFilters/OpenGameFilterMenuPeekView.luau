local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
return function(v3, v4, v5, v6) --[[ Line: 7 ]] --[[ Name: OpenGameFilterMenuPeekView ]]
    -- upvalues: l_AppPage_0 (copy), l_NavigateDown_0 (copy)
    return function(v7) --[[ Line: 8 ]]
        -- upvalues: l_AppPage_0 (ref), v3 (copy), v4 (copy), v5 (copy), v6 (copy), l_NavigateDown_0 (ref)
        local v8 = {
            name = l_AppPage_0.GameFilterMenuPeekView, 
            extraProps = {
                filter = v3, 
                onFilterApplied = v4, 
                onFilterMenuClosed = v5, 
                sendFilterClick = v6
            }
        };
        v7:dispatch(l_NavigateDown_0(v8));
    end;
end;