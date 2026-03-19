local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v1 = require(l_script_FirstAncestor_0.Utils.constants);
return function(v2, v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    local v4 = false;
    if v2 == v1.forbiddenStatusCode then
        v4 = false;
        if v3[v1.challengeTypeHeader] ~= nil then
            v4 = false;
            if v3[v1.challengeIdHeader] ~= nil then
                v4 = v3[v1.challengeMetadataHeader] ~= nil;
            end;
        end;
    end;
    return v4;
end;