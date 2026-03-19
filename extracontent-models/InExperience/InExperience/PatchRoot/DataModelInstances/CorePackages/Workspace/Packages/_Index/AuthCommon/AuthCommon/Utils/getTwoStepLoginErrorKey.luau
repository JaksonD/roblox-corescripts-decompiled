local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Enums.TwoStepErrorCodes);
return function(v2) --[[ Line: 9 ]] --[[ Name: getTwoStepLoginErrorKey ]]
    -- upvalues: v1 (copy)
    if v2 == v1.IllegalChildAccountLinking then
        return "Authentication.Login.LinkIllegalChildAccountLinking";
    else
        return "Authentication.Login.Response.SomethingWentWrong";
    end;
end;