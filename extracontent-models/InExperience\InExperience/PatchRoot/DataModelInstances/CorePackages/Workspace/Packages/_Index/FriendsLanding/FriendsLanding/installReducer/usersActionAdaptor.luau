local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_RoduxUsers_0 = v1.RoduxUsers;
local function v5(v4) --[[ Line: 7 ]] --[[ Name: userUpdatedFromUser ]]
    -- upvalues: l_RoduxUsers_0 (copy)
    return l_RoduxUsers_0.Actions.UserUpdated({
        id = v4.id, 
        username = v4.name, 
        displayName = v4.displayName, 
        hasVerifiedBadge = v4.hasVerifiedBadge
    });
end;
return {
    AddUser = function(v6) --[[ Line: 17 ]] --[[ Name: AddUser ]]
        -- upvalues: v5 (copy)
        return {
            v5(v6.user)
        };
    end, 
    AddUsers = function(v7) --[[ Line: 21 ]] --[[ Name: AddUsers ]]
        -- upvalues: l_llama_0 (copy), v5 (copy)
        return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v7.users, v5));
    end
};