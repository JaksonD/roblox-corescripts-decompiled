local l_CorePackages_0 = game:GetService("CorePackages");
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local l_UpdateUsers_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.UpdateUsers;
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l_Immutable_0 (copy), l_UpdateUsers_0 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v3 (copy), l_Immutable_0 (ref), l_UpdateUsers_0 (ref)
        local v5 = v4:getState().Users[v3];
        if v5 then
            local v6 = l_Immutable_0.Set(v5, "isFriend", false);
            v4:dispatch(l_UpdateUsers_0({
                v6
            }));
        end;
    end;
end;