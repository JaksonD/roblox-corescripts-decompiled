local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
return function() --[[ Line: 9 ]] --[[ Name: useHasRobloxSubscription ]]
    -- upvalues: l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useSelector_0 (copy)
    if not l_FFlagEnableBlackbirdCheckDev_0 then
        return false;
    else
        return l_useSelector_0(function(v3) --[[ Line: 13 ]]
            local v4 = v3.Users[v3.LocalUserId];
            return v4 and v4.hasRobloxSubscription == true or false;
        end);
    end;
end;