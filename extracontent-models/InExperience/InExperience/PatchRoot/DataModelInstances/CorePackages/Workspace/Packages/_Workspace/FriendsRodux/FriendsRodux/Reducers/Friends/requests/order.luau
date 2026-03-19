local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.roduxFriendsTypes);
local v4 = {};
return function(v5) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v4 (copy)
    local l_friendsNetworking_0 = v5.friendsNetworking;
    return v2.createReducer(v4, {
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v7, v8) --[[ Line: 15 ]]
            local v9 = v7 or {};
            local v10 = v9.count or 0;
            local v11 = v9.requestsById or {};
            local l_data_0 = v8.responseBody.data;
            local l_nextPageCursor_0 = v8.responseBody.nextPageCursor;
            if l_nextPageCursor_0 == v9.lastCursor and l_nextPageCursor_0 ~= nil then
                return v9;
            else
                local _ = v10;
                for v15, v16 in ipairs(l_data_0) do
                    local v17 = v10 + v15;
                    if not v11[tostring(v16.id)] then
                        v11[tostring(v16.id)] = v17;
                    end;
                end;
                return {
                    count = v10 + #l_data_0, 
                    lastCursor = l_nextPageCursor_0, 
                    requestsById = v11
                };
            end;
        end
    });
end;