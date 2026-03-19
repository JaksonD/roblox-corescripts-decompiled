local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local _ = require(l_Parent_0.DiscoveryTypes);
return function(v6, v7, v8, v9, v10, v11) --[[ Line: 13 ]] --[[ Name: useNavigateToSeeAll ]]
    -- upvalues: l_useDispatch_0 (copy), v1 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    local v12 = l_useDispatch_0();
    return (v1.useCallback(function() --[[ Line: 24 ]]
        -- upvalues: v6 (copy), v12 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v10 (copy), v9 (copy), v11 (copy), v7 (copy), v8 (copy)
        if v6 == nil then
            return;
        else
            v12(l_NavigateDown_0({
                name = l_AppPage_0.GamesList, 
                detail = v10, 
                extraProps = {
                    sortPageId = v9, 
                    sortName = v10, 
                    pageContext = v11, 
                    isOmni = v7, 
                    sortIndex = if v7 then v8 else nil
                }
            }));
            return;
        end;
    end, {
        v12, 
        v7, 
        v6, 
        v8, 
        v10, 
        v11, 
        v9
    }));
end;