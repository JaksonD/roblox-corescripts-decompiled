local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContentSharingRodux");
local v1 = require(l_script_FirstAncestor_0.Reducers.ContentSharing.getPostsByUserId);
local v2 = {
    byUserId = {}
};
return function(v3) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v1(v3);
    return function(v5, v6) --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v4 (copy)
        local v7 = v5 or v2;
        return v4(v7, v6);
    end;
end;