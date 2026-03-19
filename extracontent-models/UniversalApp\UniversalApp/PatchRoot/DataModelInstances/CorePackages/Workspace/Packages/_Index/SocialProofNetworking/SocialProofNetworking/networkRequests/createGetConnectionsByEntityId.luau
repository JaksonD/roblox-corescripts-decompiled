local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialProofNetworking");
local v1 = require(l_script_FirstAncestor_0.SOCIAL_PROOF_URL);
local _ = require(l_script_FirstAncestor_0.types);
return function(v3) --[[ Line: 17 ]]
    -- upvalues: v1 (copy)
    return v3.roduxNetworking.POST({
        Name = "GetConnectionsByEntityId"
    }, function(v4, v5) --[[ Line: 22 ]]
        -- upvalues: v1 (ref)
        return (v4(v1):path("social-proof-api"):path("v1"):path("social-proof"):path("entity"):path("connections"):body({
            entityId = v5.entityId, 
            entityType = v5.entityType, 
            connectionType = v5.connectionType, 
            cursor = v5.cursor
        }));
    end);
end;