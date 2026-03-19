local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFIntUGCLCCagingRelevancyMinimum);
return function(v6, v7, v8, v9, v10, v11) --[[ Line: 11 ]] --[[ Name: validateLCCagingRelevancy ]]
    -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v2 (copy), v5 (copy)
    local v12, v13, v14 = v4(function() --[[ Line: 19 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy)
        return l_UGCValidationService_0:GetEditableCagingRelevancyMetrics(v6.editableMesh, v7.editableMesh, v8.editableMesh, v9, v10);
    end, v11);
    if not v12 then
        v2.reportFailure(v2.ErrorType.validateCagingRelevancy_FailedToExecute, nil, v11);
        return false, {
            string.format("Failed to execute cage relevancy detection for '%s'. Make sure the cage mesh exists and try again.", v8.fullName)
        };
    elseif v14 == 0 then
        return true;
    else
        local v15 = math.floor(100 * v13 / v14);
        if v15 < v5() then
            v2.reportFailure(v2.ErrorType.validateCagingRelevancy_IrrelevantCaging, nil, v11);
            local v16 = "Validation detected %d%% of the outer cage edits do not cover the accessory. Make sure you are moving the outer cage only where needed." .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageRelevancy)";
            return false, {
                string.format(v16, 100 - v15)
            };
        else
            return true;
        end;
    end;
end;