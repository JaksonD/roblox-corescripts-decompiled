local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v5 = {};
return function(v6) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy)
    local l_friendsNetworking_0 = v6.friendsNetworking;
    return v2.createReducer(v5, {
        [l_friendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v8, v9) --[[ Line: 16 ]]
            -- upvalues: v3 (ref)
            if not v9.queryArgs or not v9.queryArgs.userSort then
                return v8;
            else
                local v10 = tostring(v9.namedIds.users);
                local v11 = v9.responseBody.data or {};
                local v14 = v3.Dictionary.map(v11, function(v12, v13) --[[ Line: 24 ]]
                    return v13, (tostring(v12.id));
                end);
                return v3.Dictionary.join(v8, {
                    [v10] = v14
                });
            end;
        end
    });
end;