local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabState");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_RoduxUsers_0 = v1.RoduxUsers;
local function _(v4) --[[ Line: 7 ]] --[[ Name: userUpdatedFromUser ]]
    -- upvalues: l_RoduxUsers_0 (copy)
    return l_RoduxUsers_0.Actions.UserUpdated({
        id = v4.id, 
        username = v4.name, 
        displayName = v4.displayName, 
        hasVerifiedBadge = v4.hasVerifiedBadge
    });
end;
return function(v6, v7) --[[ Line: 16 ]]
    -- upvalues: l_llama_0 (copy), l_RoduxUsers_0 (copy)
    local v14 = l_llama_0.List.reduce(v6.responseBody, function(v8, v9) --[[ Line: 17 ]]
        -- upvalues: l_llama_0 (ref), v7 (copy), l_RoduxUsers_0 (ref)
        return l_llama_0.List.reduce(v9.participants, function(v10, v11) --[[ Line: 18 ]]
            -- upvalues: v7 (ref), l_llama_0 (ref), l_RoduxUsers_0 (ref)
            local v12 = tostring(v11.targetId);
            if not v10[v12] and not v7.byUserId[v12] then
                local v13 = l_llama_0.Dictionary.join(v11, {
                    id = v12
                });
                return l_llama_0.Dictionary.join(v10, {
                    [v12] = l_RoduxUsers_0.Actions.UserUpdated({
                        id = v13.id, 
                        username = v13.name, 
                        displayName = v13.displayName, 
                        hasVerifiedBadge = v13.hasVerifiedBadge
                    })
                });
            else
                return v10;
            end;
        end, v8);
    end, {});
    return l_llama_0.Dictionary.values(v14);
end;