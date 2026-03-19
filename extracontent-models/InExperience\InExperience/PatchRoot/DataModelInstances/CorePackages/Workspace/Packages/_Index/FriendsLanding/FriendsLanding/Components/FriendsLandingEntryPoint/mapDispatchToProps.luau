local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Promise_0 = v1.Promise;
local l_t_0 = v1.t;
local l_FriendsNetworking_0 = v1.FriendsNetworking;
local v5 = l_t_0.strictInterface({
    localUserId = l_t_0.string, 
    inactiveFriendsNetworkRequestStatus = l_t_0.string, 
    onResolve = l_t_0.union(l_t_0.callback, l_t_0.table), 
    onError = l_t_0.union(l_t_0.callback, l_t_0.table)
});
return function(v6) --[[ Line: 16 ]]
    -- upvalues: v5 (copy), l_FriendsNetworking_0 (copy), l_Promise_0 (copy)
    return {
        refreshPageData = function(v7) --[[ Line: 18 ]] --[[ Name: refreshPageData ]]
            -- upvalues: v5 (ref), v6 (copy), l_FriendsNetworking_0 (ref), l_Promise_0 (ref)
            assert(v5(v7));
            local v8 = {};
            table.insert(v8, v6(l_FriendsNetworking_0.GetFriendRequestsCount.API()));
            return l_Promise_0.all(v8):andThen(v7.onResolve):catch(v7.onError);
        end, 
        getFriendRequestsCount = function() --[[ Line: 26 ]] --[[ Name: getFriendRequestsCount ]]
            -- upvalues: v6 (copy), l_FriendsNetworking_0 (ref)
            return v6(l_FriendsNetworking_0.GetFriendRequestsCount.API());
        end
    };
end;