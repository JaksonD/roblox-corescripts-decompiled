local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
return function(v7) --[[ Line: 17 ]] --[[ Name: useEntitySelectionHandler ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v6 (copy)
    local v8 = l_useDispatch_0();
    return (v2.useCallback(function(v9, v10) --[[ Line: 22 ]]
        -- upvalues: v7 (copy), v8 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v6 (ref)
        if v7 then
            v7(v9, v10);
            return;
        else
            v8(l_NavigateDown_0({
                name = l_AppPage_0.ProfilePlatform, 
                detail = v9, 
                extraProps = {
                    profileType = if v10 == v6.EntityType.Contact then v6.EntityType.Contact else v6.EntityType.User
                }
            }));
            return;
        end;
    end, {
        v7, 
        v8
    }));
end;