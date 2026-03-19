local l_Parent_0 = script:FindFirstAncestor("NotApprovedPageState").Parent;
local v1 = require(l_Parent_0.ArgCheck);
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v2) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    v1.isType(v2, "boolean", "SetModerationStatus action expects `moderationStatus` to be a boolean");
    return {
        userModerated = v2
    };
end);