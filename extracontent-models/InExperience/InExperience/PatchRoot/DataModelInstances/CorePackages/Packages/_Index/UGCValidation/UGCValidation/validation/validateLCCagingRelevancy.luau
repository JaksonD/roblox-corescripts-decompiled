local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFIntUGCLCCagingRelevancyMinimum);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationHyperlinksInCageQuality);
return function(v7, v8, v9, v10, v11, v12) --[[ Line: 12 ]] --[[ Name: validateLCCagingRelevancy ]]
    -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v2 (copy), v5 (copy), v6 (copy)
    local v13, v14, v15 = v4(function() --[[ Line: 20 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
        return l_UGCValidationService_0:GetEditableCagingRelevancyMetrics(v7.editableMesh, v8.editableMesh, v9.editableMesh, v10, v11);
    end, v12);
    if not v13 then
        v2.reportFailure(v2.ErrorType.validateCagingRelevancy_FailedToExecute, nil, v12);
        return false, {
            string.format("Failed to execute cage relevancy detection for '%s'. Make sure the cage mesh exists and try again.", v9.fullName)
        };
    elseif v15 == 0 then
        return true;
    else
        local v16 = math.floor(100 * v14 / v15);
        if v16 < v5() then
            v2.reportFailure(v2.ErrorType.validateCagingRelevancy_IrrelevantCaging, nil, v12);
            local v17 = "Validation detected %d%% of the outer cage edits do not cover the accessory. Make sure you are moving the outer cage only where needed.";
            if v6() then
                v17 = v17 .. "[Read more](https://create.roblox.com/docs/art/validation-errors#cageRelevancy)";
            end;
            return false, {
                string.format(v17, 100 - v16)
            };
        else
            return true;
        end;
    end;
end;