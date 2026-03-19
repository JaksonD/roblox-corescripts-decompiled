local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Models.Conversation);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    if not v2 then
        return false;
    else
        local v3 = false;
        if v2.conversationType == v1.Type.MULTI_USER_CONVERSATION then
            v3 = v2.osaAcknowledgementStatus == v1.OsaAcknowledgementStatus.Unacknowledged;
        end;
        return v3;
    end;
end;