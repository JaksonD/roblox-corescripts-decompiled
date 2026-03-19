local l_status_0, l_result_0 = pcall(function() --[[ Line: 1 ]]
    return game:GetService("StudioService");
end);
local v2 = if l_status_0 then l_result_0 else nil;
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
return function() --[[ Line: 10 ]] --[[ Name: getRestrictedUserTable ]]
    -- upvalues: v2 (copy)
    if v2 then
        return {
            {
                creatorType = "User", 
                id = v2:GetUserId()
            }
        };
    else
        return {};
    end;
end;