local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabState");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v1.Rodux;
local l_llama_0 = v1.llama;
return l_Rodux_0.createReducer({}, {
    SetUserMembershipType = function(v4, v5) --[[ Line: 7 ]] --[[ Name: SetUserMembershipType ]]
        -- upvalues: l_llama_0 (copy)
        return l_llama_0.Dictionary.set(v4, v5.userId, v5.membershipType ~= Enum.MembershipType.None);
    end
});