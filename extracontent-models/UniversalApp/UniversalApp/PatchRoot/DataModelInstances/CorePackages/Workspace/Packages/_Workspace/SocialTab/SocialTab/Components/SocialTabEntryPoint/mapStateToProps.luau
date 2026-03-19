local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
return function(v2, _) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return {
        retrievalStatus = v1.rodux.GetMetadata.getStatus(v2)
    };
end;