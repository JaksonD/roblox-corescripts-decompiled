local l_Parent_0 = script:FindFirstAncestor("RoduxFriends").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = {};
return function(v3) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_friendsNetworking_0 = v3.friendsNetworking;
    return v1.createReducer(v2, {
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v5, v6) --[[ Line: 13 ]]
            local v7 = v5 or {};
            local v8 = v7.count or 0;
            local v9 = v7.requestsById or {};
            local l_data_0 = v6.responseBody.data;
            local l_nextPageCursor_0 = v6.responseBody.nextPageCursor;
            if l_nextPageCursor_0 == v7.lastCursor and l_nextPageCursor_0 ~= nil then
                return v7;
            else
                local _ = v8;
                for v13, v14 in ipairs(l_data_0) do
                    local v15 = v8 + v13;
                    if not v9[tostring(v14.id)] then
                        v9[tostring(v14.id)] = v15;
                    end;
                end;
                return {
                    count = v8 + #l_data_0, 
                    lastCursor = l_nextPageCursor_0, 
                    requestsById = v9
                };
            end;
        end
    });
end;