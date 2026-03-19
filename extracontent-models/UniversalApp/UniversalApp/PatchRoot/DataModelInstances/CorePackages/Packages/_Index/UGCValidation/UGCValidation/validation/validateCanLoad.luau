local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: validateCanLoad ]]
    -- upvalues: l_UGCValidationService_0 (copy), v2 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v4 (copy)
        return l_UGCValidationService_0:CanLoadAsset(v4);
    end);
    if not l_status_0 or not l_result_0 then
        v2.reportFailure(v2.ErrorType.validateCanLoad, nil, v5);
        return false, {
            "Asset could not be loaded"
        };
    else
        return true;
    end;
end;