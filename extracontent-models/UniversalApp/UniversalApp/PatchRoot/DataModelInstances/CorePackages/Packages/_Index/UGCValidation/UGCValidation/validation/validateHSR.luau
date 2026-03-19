local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.util.FailureReasonsAccumulator);
local _ = require(l_Parent_0.util.Types);
return function(v4, v5) --[[ Line: 8 ]] --[[ Name: validateHSR ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v6 = tick();
    if v5.bypassFlags and v5.bypassFlags.skipValidateHSR then
        return true;
    else
        local l_v4_Descendants_0 = v4:GetDescendants();
        table.insert(l_v4_Descendants_0, v4);
        local v8 = v2.new();
        for _, v10 in l_v4_Descendants_0 do
            if v10:IsA("BaseWrap") and not v10:IsHSRReady() then
                v1.reportFailure(v1.ErrorType.validateHSR_HSRDataNotReady, nil, v5);
                v8:updateReasons(false, {
                    (("Missing HSR data for %*. Please, try again."):format((v10:GetFullName())))
                });
            end;
        end;
        v1.recordScriptTime(script.Name, v6, v5);
        return v8:getFinalResults();
    end;
end;