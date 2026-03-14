local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_useAdditionalAuditContent_0 = require(l_script_FirstAncestor_0.Stores.AuditContentContext.AuditContentContext).useAdditionalAuditContent;
local v2 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAuditSystem);
return function(v3) --[[ Line: 21 ]] --[[ Name: RegisterAdditionalAuditContent ]]
    -- upvalues: v2 (copy), l_useAdditionalAuditContent_0 (copy)
    if not v2() then
        return nil;
    else
        l_useAdditionalAuditContent_0(v3.contentKey, v3.value);
        return nil;
    end;
end;