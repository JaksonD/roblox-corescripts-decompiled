local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_FriendsNetworking_0 = v1.FriendsNetworking;
return l_Rodux_0.createReducer({}, {
    [l_FriendsNetworking_0.GetUserFollowers.Succeeded.name] = function(_, v5) --[[ Line: 10 ]]
        local v6 = {};
        local l_data_0 = v5.responseBody.data;
        for _, v9 in ipairs(l_data_0) do
            v6[tostring(v9.id)] = true;
        end;
        return v6;
    end
});