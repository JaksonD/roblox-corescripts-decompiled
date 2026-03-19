local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local v1 = require(l_script_FirstAncestor_0.createSduiApiStore);
local v2 = nil;
return function() --[[ Line: 9 ]] --[[ Name: getSduiApiStore ]]
    -- upvalues: v2 (ref), v1 (copy)
    if v2 == nil then
        v2 = v1();
    end;
    return v2;
end;