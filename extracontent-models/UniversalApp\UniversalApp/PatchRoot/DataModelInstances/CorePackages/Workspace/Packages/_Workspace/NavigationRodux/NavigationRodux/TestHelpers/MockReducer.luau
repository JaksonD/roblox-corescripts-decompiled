local l_Parent_0 = script:FindFirstAncestor("NavigationRodux").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2, v3) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or {
        Navigation = {
            lockNavigationActions = nil
        }
    };
    if v3.type == "ApplySetNavigationLocked" then
        if v2.Navigation.lockNavigationActions == v3.locked then
            return v2;
        else
            return {
                Navigation = v1.Dictionary.join(v2.Navigation, {
                    lockNavigationActions = v3.locked or false
                })
            };
        end;
    else
        return v2;
    end;
end;