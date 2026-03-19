local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_FriendsNetworking_0 = v1.FriendsNetworking;
local l_llama_0 = v1.llama;
return l_Rodux_0.createReducer({}, {
    [l_FriendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(_, v6) --[[ Line: 11 ]]
        -- upvalues: l_llama_0 (copy)
        local l_data_0 = v6.responseBody.data;
        return l_llama_0.Dictionary.map(l_data_0, function(v8) --[[ Line: 13 ]]
            return v8.isDeleted, (tostring(v8.id));
        end);
    end
});