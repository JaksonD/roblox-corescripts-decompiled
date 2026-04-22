local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayWithRewardComponent");
local v2 = require(l_script_FirstAncestor_0.PlayWithRewardTelemetry);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Promise);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v7 = require(l_Parent_0.t);
local l_IXPServiceWrapper_0 = require(l_Parent_0.IXPServiceWrapper).IXPServiceWrapper;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v10 = require(l_Parent_0.PlayWithRewardState);
local l_PlayWithRewardAdData_0 = v10.PlayWithRewardAdData;
local l_SetPlayWithRewardState_0 = v10.SetPlayWithRewardState;
local v13 = game:DefineFastString("LuaAppPlayWithRewardBetaUniverses", "");
local v14 = game:DefineFastString("LuaAppPlayWithRewardBetaIxpVariantKey", "Variant");
local v15 = game:DefineFastString("LuaAppPlayWithRewardBetaIxpTreatmentValue", "Treatment");
local function v19(v16, v17) --[[ Line: 25 ]] --[[ Name: isUniverseIdInPlayWithRewardBetaAllowList ]]
    local v18 = v16:gsub("^%s+", ""):gsub("%s+$", "");
    if v18 == "" or v17 == "" or v17:find(",", 1, true) ~= nil then
        return false;
    else
        return ("," .. v18 .. ","):find("," .. v17 .. ",", 1, true) ~= nil;
    end;
end;
local v20 = v7.interface({
    AdAvailabilityResult = v7.userdata, 
    ProductId = v7.optional(v7.string), 
    ProductName = v7.optional(v7.string), 
    ProductImageAssetId = v7.optional(v7.string), 
    ExperimentVariantData = v7.optional(v7.string)
});
local function _(v21) --[[ Line: 44 ]] --[[ Name: getDurationSinceStartFetchMs ]]
    return (os.clock() - v21) * 1000;
end;
local _ = function(v23, v24, _) --[[ Line: 48 ]] --[[ Name: fetchAd ]]
    local l_v23_AdAvailabilityNowForUniverseAsync_0 = v23:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(v24), true);
    if l_v23_AdAvailabilityNowForUniverseAsync_0 then
        return l_v23_AdAvailabilityNowForUniverseAsync_0;
    else
        return nil;
    end;
end;
local function v41(v28, v29, _, v31) --[[ Line: 59 ]] --[[ Name: fetchPlayWithRewardStateAsync ]]
    -- upvalues: l_Logger_0 (copy), v2 (copy), v20 (copy), l_mutedError_0 (copy), l_PlayWithRewardAdData_0 (copy)
    if not v28 then
        l_Logger_0:warning((("AdService is not available. Cannot fetch Play with Reward data for universe ID %*."):format(v29)));
        return nil;
    else
        local v32 = os.clock();
        v2.logPlayWithRewardAdRequested(v31, v29);
        local v33 = v28:GetAdAvailabilityNowForUniverseAsync(Enum.AdFormat.RewardedVideo, tonumber(v29), true) or nil;
        if v33 == nil then
            l_Logger_0:warning((("Could not fetch Play with Reward ad for universe ID %*."):format(v29)));
            v2.logPlayWithRewardAdReceived(v31, v29, false, nil, (os.clock() - v32) * 1000);
            return nil;
        else
            local v34, v35 = v20(v33);
            if not v34 then
                l_mutedError_0((("PlayWithRewardAdData invalid: %*"):format((tostring(v35)))));
                v2.logPlayWithRewardAdReceived(v31, v29, false, nil, (os.clock() - v32) * 1000);
                return nil;
            else
                local l_AdAvailabilityResult_0 = v33.AdAvailabilityResult;
                local l_ProductId_0 = v33.ProductId;
                local l_ProductName_0 = v33.ProductName;
                local l_ProductImageAssetId_0 = v33.ProductImageAssetId;
                local l_ExperimentVariantData_0 = v33.ExperimentVariantData;
                v2.logPlayWithRewardAdReceived(v31, v29, true, tostring(l_AdAvailabilityResult_0), (os.clock() - v32) * 1000);
                return l_PlayWithRewardAdData_0.new(l_AdAvailabilityResult_0, l_ProductId_0, l_ProductName_0, l_ProductImageAssetId_0, l_ExperimentVariantData_0);
            end;
        end;
    end;
end;
return function(v42, v43, v44) --[[ Line: 121 ]] --[[ Name: FetchPlayWithRewardState ]]
    -- upvalues: v19 (copy), v13 (copy), v4 (copy), l_HttpService_0 (copy), l_IXPServiceWrapper_0 (copy), l_AppUserLayers_0 (copy), v14 (copy), v15 (copy), l_SetPlayWithRewardState_0 (copy), v41 (copy), l_Logger_0 (copy)
    return function(v45) --[[ Line: 122 ]]
        -- upvalues: v19 (ref), v13 (ref), v43 (copy), v4 (ref), l_HttpService_0 (ref), l_IXPServiceWrapper_0 (ref), l_AppUserLayers_0 (ref), v14 (ref), v15 (ref), l_SetPlayWithRewardState_0 (ref), v41 (ref), v42 (copy), v44 (copy), l_Logger_0 (ref)
        if not v19(v13, v43) then
            return v4.resolve();
        else
            local v46 = l_HttpService_0:GenerateGUID(false);
            local l_l_IXPServiceWrapper_0_LayerData_0 = l_IXPServiceWrapper_0:GetLayerData(l_AppUserLayers_0.AdsPlayWithRewardBetaLayer);
            if if l_l_IXPServiceWrapper_0_LayerData_0 and l_l_IXPServiceWrapper_0_LayerData_0[v14] then l_l_IXPServiceWrapper_0_LayerData_0[v14] == v15 else false then
                v45:dispatch(l_SetPlayWithRewardState_0(v46, v43, true, nil));
            end;
            return v4.new(function(v48, v49) --[[ Line: 136 ]]
                -- upvalues: v41 (ref), v42 (ref), v43 (ref), v44 (ref), v46 (copy), v45 (copy), l_SetPlayWithRewardState_0 (ref)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 137 ]]
                    -- upvalues: v41 (ref), v42 (ref), v43 (ref), v44 (ref), v46 (ref)
                    return v41(v42, v43, v44, v46);
                end);
                if l_status_0 and l_result_0 then
                    v45:dispatch(l_SetPlayWithRewardState_0(v46, v43, false, l_result_0));
                    v48();
                    return;
                else
                    v45:dispatch(l_SetPlayWithRewardState_0(v46, v43, false, nil));
                    v49(l_result_0);
                    return;
                end;
            end):catch(function(v52) --[[ Line: 147 ]]
                -- upvalues: l_Logger_0 (ref), v43 (ref)
                l_Logger_0:warning((("Promise for fetching Play With Reward data rejected for universe ID %*: %*"):format(v43, (tostring(v52)))));
            end);
        end;
    end;
end;