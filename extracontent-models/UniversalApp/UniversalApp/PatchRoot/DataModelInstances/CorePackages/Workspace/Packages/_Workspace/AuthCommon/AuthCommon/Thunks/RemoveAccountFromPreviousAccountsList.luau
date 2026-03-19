local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v3 = v1.getPreviousAccountsList();
    if v3[v2] ~= nil then
        v3[v2] = nil;
        v1.setPreviousAccountsList(v3);
        v1.flush();
    end;
end;