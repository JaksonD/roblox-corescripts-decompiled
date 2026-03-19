local l_Parent_0 = script:FindFirstAncestor("IdentityVerification").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Promise);
local v3 = require(script.Parent.Parent.Utils.IDVApiProvider);
local v4 = require(script.Parent.Parent.Common.Enums);
local l_IDVSessionStatusEnum_0 = v4.IDVSessionStatusEnum;
local l_IDVSessionErrorEnum_0 = v4.IDVSessionErrorEnum;
local v7 = require(script.Parent.Parent.Flags.GetFIntIDVPollDelay);
local v8 = require(script.Parent.Parent.Flags.GetFIntIDVMaxRetries);
local v9 = v7();
local v10 = v8();
local function _(v11) --[[ Line: 28 ]] --[[ Name: isFailure ]]
    -- upvalues: l_IDVSessionStatusEnum_0 (copy)
    local v12 = true;
    if v11 ~= l_IDVSessionStatusEnum_0.RequiresManualReview then
        v12 = true;
        if v11 ~= l_IDVSessionStatusEnum_0.RequiresRetry then
            v12 = v11 == l_IDVSessionStatusEnum_0.Expired;
        end;
    end;
    return v12;
end;
return function(v14) --[[ Line: 34 ]] --[[ Name: usePollIDVStatus ]]
    -- upvalues: v10 (copy), v9 (copy), v1 (copy), l_IDVSessionStatusEnum_0 (copy), v3 (copy), l_IDVSessionErrorEnum_0 (copy), v2 (copy)
    local v15 = v14.retries or v10;
    local v16 = v14.delay or v9;
    local l_onStatusUpdate_0 = v14.onStatusUpdate;
    local v18 = nil;
    v18 = v1.useCallback(function(v19, v20, v21, v22) --[[ Line: 41 ]]
        -- upvalues: l_IDVSessionStatusEnum_0 (ref), v3 (ref), l_onStatusUpdate_0 (copy), l_IDVSessionErrorEnum_0 (ref), v16 (copy), v18 (ref)
        if v20 == 0 then
            v22({
                sessionStatus = l_IDVSessionStatusEnum_0.Expired
            });
            return;
        else
            v3.getVerifiedStatus(v19):andThen(function(v23) --[[ Line: 48 ]]
                -- upvalues: l_onStatusUpdate_0 (ref), v20 (copy), l_IDVSessionStatusEnum_0 (ref), l_IDVSessionErrorEnum_0 (ref), v22 (copy), v21 (copy), v16 (ref), v18 (ref), v19 (copy)
                local l_isVerified_0 = v23.isVerified;
                local l_sessionStatus_0 = v23.sessionStatus;
                local l_sessionErrorCode_0 = v23.sessionErrorCode;
                local l_ageEstimationNextStep_0 = v23.ageEstimationNextStep;
                if l_onStatusUpdate_0 then
                    l_onStatusUpdate_0({
                        sessionStatus = l_sessionStatus_0, 
                        retriesLeft = v20
                    });
                end;
                if l_isVerified_0 and l_sessionStatus_0 == l_IDVSessionStatusEnum_0.Stored then
                    if l_sessionErrorCode_0 == l_IDVSessionErrorEnum_0.UnknownError and l_ageEstimationNextStep_0 == nil then
                        return v22({
                            sessionStatus = l_IDVSessionStatusEnum_0.Failure
                        });
                    else
                        return v21();
                    end;
                else
                    local v28 = true;
                    if l_sessionStatus_0 ~= l_IDVSessionStatusEnum_0.RequiresManualReview then
                        v28 = true;
                        if l_sessionStatus_0 ~= l_IDVSessionStatusEnum_0.RequiresRetry then
                            v28 = l_sessionStatus_0 == l_IDVSessionStatusEnum_0.Expired;
                        end;
                    end;
                    if v28 then
                        v22({
                            sessionStatus = l_sessionStatus_0
                        });
                        return;
                    else
                        task.spawn(function() --[[ Line: 68 ]]
                            -- upvalues: v16 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref)
                            task.wait(v16);
                            if v18 then
                                v18(v19, v20 - 1, v21, v22);
                            end;
                        end);
                        return;
                    end;
                end;
            end):catch(function(_) --[[ Line: 76 ]]
                -- upvalues: v22 (copy), l_IDVSessionStatusEnum_0 (ref)
                v22({
                    sessionStatus = l_IDVSessionStatusEnum_0.RequiresRetry
                });
            end);
            return;
        end;
    end, {
        v16, 
        l_onStatusUpdate_0
    });
    return v1.useCallback(function(v30) --[[ Line: 81 ]]
        -- upvalues: v2 (ref), v18 (ref), v15 (copy)
        return v2.new(function(v31, v32) --[[ Line: 82 ]]
            -- upvalues: v18 (ref), v30 (copy), v15 (ref)
            v18(v30, v15, v31, v32);
        end);
    end, {
        v18, 
        v15
    }), (v1.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: v18 (ref)
        v18 = nil;
    end, {}));
end;