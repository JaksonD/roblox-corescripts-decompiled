local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Actions.SetUserMembershipType);
return function(v4, v5) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), l_Players_0 (copy)
    return function(v6) --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v4 (copy), v3 (ref), l_Players_0 (ref)
        local v7 = v6:getState();
        if v5 then
            local l_Subscriptions_0 = v7.IAPProducts.Subscriptions;
            for _, v10 in pairs(l_Subscriptions_0) do
                if v10.mobileProductId == v4 then
                    v6:dispatch(v3(tostring(l_Players_0.LocalPlayer.UserId), Enum.MembershipType.Premium));
                    return;
                end;
            end;
        end;
    end;
end;