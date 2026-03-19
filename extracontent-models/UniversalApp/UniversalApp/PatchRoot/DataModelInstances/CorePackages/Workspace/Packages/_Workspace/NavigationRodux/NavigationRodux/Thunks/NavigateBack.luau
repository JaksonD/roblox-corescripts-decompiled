local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Thunks.SetNavigationLocked);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_script_FirstAncestor_0.Thunks.RNAdapterThunk);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v5 (copy), v2 (copy), v4 (copy)
    v3.isTypeOrNil(v6, "boolean", "bypassNavigationLock");
    return v5.new("NavigateBack", function(v7, v8) --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v2 (ref), v4 (ref)
        if v7:getState().Navigation.lockNavigationActions and not v6 then
            return;
        else
            v7:dispatch(v2(true));
            v8(v4.Actions.back());
            return;
        end;
    end);
end;