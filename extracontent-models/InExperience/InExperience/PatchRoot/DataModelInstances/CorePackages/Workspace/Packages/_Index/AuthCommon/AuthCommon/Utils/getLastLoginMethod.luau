local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
return function(v2) --[[ Line: 5 ]] --[[ Name: getLastLoginMethod ]]
    -- upvalues: v1 (copy)
    for _, v4 in (v1.getPreviousAccountsList()) do
        if v4.userIdentifier == v2 then
            return v4.loginMethod;
        end;
    end;
    return nil;
end;