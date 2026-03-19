local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Utils.shouldShowOSAForConversation);
local v2 = require(l_script_FirstAncestor_0.Utils.shouldShowU13ChatOptInForConversation);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1(v3) or v2(v3);
end;