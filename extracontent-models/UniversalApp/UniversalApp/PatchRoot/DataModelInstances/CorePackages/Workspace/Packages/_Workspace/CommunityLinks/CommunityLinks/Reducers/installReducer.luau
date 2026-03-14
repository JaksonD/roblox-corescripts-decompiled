local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Parent.ExperienceCommunityLinks);
return function() --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.combineReducers({
        ExperienceCommunityLinks = v2
    });
end;