local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayWithRewardComponent");
local v2 = require(l_script_FirstAncestor_0.PlayWithRewardTelemetry);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Promise);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v7 = require(l_Parent_0.t);
local v8 = require(l_Parent_0.PlayWithRewardState);
local l_PlayWithRewardAdData_0 = v8.PlayWithRewardAdData;
local l_SetPlayWithRewardState_0 = v8.SetPlayWithRewardState;
local v11 = v7.interface({
    AdAvailabilityResult = v7.userdata, 
    ProductId = v7.optional(v7.string), 
    ProductName = v7.optional(v7.string), 
    ProductImageAssetId = v7.optional(v7.string), 
    ExperimentVariantData = v7.optional(v7.string)
});
local function _(v12) --[[ Line: 24 ]] --[[ Name: getDurationSinceStartFetchMs ]]
    return (os.clock() - v12) * 1000;
end;
local _ = function(v14, v15, _) --[[ Line: 28 ]] --[[ Name: fetchAd ]]
    local l_v14_AdAvailabilityNowForUniverseAsync_0 = v14:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(v15), true);
    if l_v14_AdAvailabilityNowForUniverseAsync_0 then
        return l_v14_AdAvailabilityNowForUniverseAsync_0;
    else
        return nil;
    end;
end;
local function v32(v19, v20, _, v22) --[[ Line: 39 ]] --[[ Name: fetchPlayWithRewardStateAsync ]]
    -- upvalues: l_Logger_0 (copy), v2 (copy), v11 (copy), l_mutedError_0 (copy), l_PlayWithRewardAdData_0 (copy)
    if not v19 then
        l_Logger_0:warning((("AdService is not available. Cannot fetch Play with Reward data for universe ID %*."):format(v20)));
        return nil;
    else
        local v23 = os.clock();
        v2.logPlayWithRewardAdRequested(v22, v20);
        local v24 = v19:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(v20), true) or nil;
        if v24 == nil then
            l_Logger_0:warning((("Could not fetch Play with Reward ad for universe ID %*."):format(v20)));
            v2.logPlayWithRewardAdReceived(v22, v20, false, nil, (os.clock() - v23) * 1000);
            return nil;
        else
            local v25, v26 = v11(v24);
            if not v25 then
                l_mutedError_0((("PlayWithRewardAdData invalid: %*"):format((tostring(v26)))));
                v2.logPlayWithRewardAdReceived(v22, v20, false, nil, (os.clock() - v23) * 1000);
                return nil;
            else
                local l_AdAvailabilityResult_0 = v24.AdAvailabilityResult;
                local l_ProductId_0 = v24.ProductId;
                local l_ProductName_0 = v24.ProductName;
                local l_ProductImageAssetId_0 = v24.ProductImageAssetId;
                local l_ExperimentVariantData_0 = v24.ExperimentVariantData;
                v2.logPlayWithRewardAdReceived(v22, v20, true, tostring(l_AdAvailabilityResult_0), (os.clock() - v23) * 1000);
                return l_PlayWithRewardAdData_0.new(l_AdAvailabilityResult_0, l_ProductId_0, l_ProductName_0, l_ProductImageAssetId_0, l_ExperimentVariantData_0);
            end;
        end;
    end;
end;
return function(v33, v34, v35) --[[ Line: 101 ]] --[[ Name: FetchPlayWithRewardState ]]
    -- upvalues: l_HttpService_0 (copy), v4 (copy), v32 (copy), l_SetPlayWithRewardState_0 (copy), l_Logger_0 (copy)
    return function(v36) --[[ Line: 102 ]]
        -- upvalues: l_HttpService_0 (ref), v4 (ref), v32 (ref), v33 (copy), v34 (copy), v35 (copy), l_SetPlayWithRewardState_0 (ref), l_Logger_0 (ref)
        local v37 = l_HttpService_0:GenerateGUID(false);
        return v4.new(function(v38, v39) --[[ Line: 105 ]]
            -- upvalues: v32 (ref), v33 (ref), v34 (ref), v35 (ref), v37 (copy), v36 (copy), l_SetPlayWithRewardState_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 106 ]]
                -- upvalues: v32 (ref), v33 (ref), v34 (ref), v35 (ref), v37 (ref)
                return v32(v33, v34, v35, v37);
            end);
            if l_status_0 and l_result_0 then
                v36:dispatch(l_SetPlayWithRewardState_0(v37, v34, l_result_0));
                v38();
                return;
            else
                v36:dispatch(l_SetPlayWithRewardState_0(v37, v34, nil));
                v39(l_result_0);
                return;
            end;
        end):catch(function(v42) --[[ Line: 116 ]]
            -- upvalues: l_Logger_0 (ref), v34 (ref)
            l_Logger_0:warning((("Promise for fetching Play With Reward data rejected for universe ID %*: %*"):format(v34, (tostring(v42)))));
        end);
    end;
end;