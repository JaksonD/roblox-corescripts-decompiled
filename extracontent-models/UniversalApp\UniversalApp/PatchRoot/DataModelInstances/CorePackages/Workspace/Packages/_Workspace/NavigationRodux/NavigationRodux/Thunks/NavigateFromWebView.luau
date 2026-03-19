local l_script_FirstAncestor_0 = script:FindFirstAncestor("NavigationRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.RoactNavigation);
local v5 = require(l_script_FirstAncestor_0.Thunks.SetNavigationLocked);
local v6 = require(l_script_FirstAncestor_0.Thunks.RNAdapterThunk);
return function(v7, v8) --[[ Line: 20 ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy), v4 (copy), v2 (copy)
    v3.isType(v7, "table", "page");
    v3.isTypeOrNil(v8, "boolean", "bypassNavigationLock");
    return v6.new("NavigateFromWebView", function(v9, v10) --[[ Line: 24 ]]
        -- upvalues: v8 (copy), v5 (ref), v4 (ref), v7 (copy), v2 (ref)
        if v9:getState().Navigation.lockNavigationActions and not v8 then
            return;
        else
            v9:dispatch(v5(true));
            v10(v4.StackActions.replace({
                routeName = v7.name, 
                key = v7.key, 
                params = v2.Dictionary.join(v7, {
                    name = v2.None, 
                    rnKey = v2.None
                })
            }));
            return;
        end;
    end);
end;