local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Rodux);
return function(v2) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    local l_networkingAccountInformation_0 = v2.networkingAccountInformation;
    return v1.createReducer(false, {
        [l_networkingAccountInformation_0.GetPhoneInformation.Succeeded.name] = function(_, v5) --[[ Line: 11 ]]
            return v5.responseBody and v5.responseBody.isVerified;
        end
    });
end;