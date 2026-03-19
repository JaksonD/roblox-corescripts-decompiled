local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_UpdateUsers_0 = require(l_Parent_0.UserLib).Thunks.UpdateUsers;
local function v8(v3) --[[ Line: 6 ]]
    -- upvalues: l_UserModel_0 (copy)
    local v4 = {};
    for v5, v6 in pairs(v3) do
        v6.isFriend = true;
        v6.friendRank = v5;
        local v7 = l_UserModel_0.fromDataTable(v6);
        v4[v7.id] = v7;
    end;
    return v4;
end;
return function(v9, v10) --[[ Line: 18 ]]
    -- upvalues: v8 (copy), l_UpdateUsers_0 (copy)
    return function(v11) --[[ Line: 19 ]]
        -- upvalues: v8 (ref), v9 (copy), v10 (copy), l_UpdateUsers_0 (ref)
        local v12 = v8(v9);
        if v10 and v10.mockedActions and v10.mockedActions.UpdateUsers then
            v10.mockedActions.UpdateUsers(v12);
            return;
        else
            v11:dispatch(l_UpdateUsers_0(v12));
            return;
        end;
    end;
end;