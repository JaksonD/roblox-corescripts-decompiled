local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v3 = require(l_script_FirstAncestor_0.Enums.ContactMethodType);
local v4 = require(l_script_FirstAncestor_0.Enums.IdentifierType);
local v5 = require(l_Parent_0.AuthCommon);
local l_isStringEmail_0 = v5.Utils.isStringEmail;
local l_isStringPhone_0 = v5.Utils.isStringPhone;
getIdentifierType = function(v8, v9) --[[ Line: 12 ]] --[[ Name: getIdentifierType ]]
    -- upvalues: l_isStringPhone_0 (copy), v4 (copy), l_isStringEmail_0 (copy)
    if v9 or l_isStringPhone_0(v8) then
        return v4.Phone;
    elseif l_isStringEmail_0(v8) then
        return v4.Email;
    else
        return v4.Username;
    end;
end;
identifierTypeToContactMethodType = function(v10) --[[ Line: 23 ]] --[[ Name: identifierTypeToContactMethodType ]]
    -- upvalues: v4 (copy), v3 (copy)
    if v10 == v4.Phone then
        return v3.Phone;
    else
        return v3.Email;
    end;
end;
return {
    getIdentifierType = getIdentifierType, 
    identifierTypeToContactMethodType = identifierTypeToContactMethodType, 
    formatIdentifier = function(v11, v12, v13) --[[ Line: 33 ]]
        -- upvalues: v4 (copy)
        if v12 ~= v4.Phone then
            return v11;
        elseif not v13 or not v13.prefix or v13.prefix == "" then
            return v11;
        else
            return "+" .. v13.prefix .. v11;
        end;
    end
};