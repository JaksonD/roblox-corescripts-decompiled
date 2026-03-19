local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialReducerAdaptors");
local l_llama_0 = require(l_script_FirstAncestor_0.dependencies).llama;
return function(v2) --[[ Line: 16 ]]
    -- upvalues: l_llama_0 (copy)
    local function v4(v3) --[[ Line: 17 ]] --[[ Name: userUpdatedFromUser ]]
        -- upvalues: v2 (copy)
        return v2.Actions.UserUpdated({
            id = v3.id, 
            username = v3.name, 
            displayName = v3.displayName, 
            hasVerifiedBadge = v3.hasVerifiedBadge, 
            created = v3.created
        });
    end;
    return {
        AddUser = function(v5) --[[ Line: 28 ]] --[[ Name: AddUser ]]
            -- upvalues: v4 (copy)
            return {
                v4(v5.user)
            };
        end, 
        AddUsers = function(v6) --[[ Line: 32 ]] --[[ Name: AddUsers ]]
            -- upvalues: l_llama_0 (ref), v4 (copy)
            return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v6.users, v4));
        end
    };
end;