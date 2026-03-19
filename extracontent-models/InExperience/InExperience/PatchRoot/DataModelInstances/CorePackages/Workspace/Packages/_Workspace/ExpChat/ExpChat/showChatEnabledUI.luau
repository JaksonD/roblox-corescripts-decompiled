local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.isUserChatEnabled);
return function(v2) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    return v1(v2) or v2 == "NoOne";
end;