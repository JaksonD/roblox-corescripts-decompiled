local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_llama_0 = v1.llama;
local l_FriendsNetworking_0 = v1.FriendsNetworking;
local v5 = {};
local function v11(v6, v7) --[[ Line: 17 ]]
    -- upvalues: l_llama_0 (copy)
    local v8 = {};
    for _, v10 in ipairs(v7) do
        v8[tostring(v10.id)] = v10.hasVerifiedBadge and true or l_llama_0.None;
    end;
    return l_llama_0.Dictionary.join(v6, v8);
end;
return l_Rodux_0.createReducer(v5, {
    [l_FriendsNetworking_0.GetFriendsFromUserId.Succeeded.name] = function(v12, v13) --[[ Line: 28 ]]
        -- upvalues: v11 (copy)
        return v11(v12, v13.responseBody.data);
    end
});