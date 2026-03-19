local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Models.User);
local v3 = require(l_script_FirstAncestor_0.Actions.AddUsers);
local l_SetFriendCount_0 = require(l_Parent_0.LegacyFriendsRodux).Actions.SetFriendCount;
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v3 (copy), l_SetFriendCount_0 (copy)
    return function(v6) --[[ Line: 10 ]]
        -- upvalues: v5 (copy), v2 (ref), v3 (ref), l_SetFriendCount_0 (ref)
        local v7 = 0;
        local v8 = {};
        for _, v10 in pairs(v5) do
            local v11 = false;
            local l_id_0 = v10.id;
            local l_isFriend_0 = v10.isFriend;
            local v14 = 0;
            assert(typeof(l_isFriend_0) == "boolean", "Expected isFriend to be a string");
            local v15 = v6:getState().Users[l_id_0];
            if v15 then
                if not v2.compare(v15, v10) then
                    v11 = true;
                    if v15.isFriend ~= l_isFriend_0 then
                        v14 = l_isFriend_0 and 1 or -1;
                    end;
                end;
            else
                v11 = true;
                v14 = l_isFriend_0 and 1 or 0;
            end;
            if v11 then
                v7 = v7 + v14;
                v8[l_id_0] = v10;
            end;
        end;
        if next(v8) then
            v6:dispatch(v3(v8));
        end;
        if v7 ~= 0 then
            local l_FriendCount_0 = v6:getState().FriendCount;
            v6:dispatch(l_SetFriendCount_0(l_FriendCount_0 + v7));
        end;
    end;
end;