local l_script_FirstAncestor_0 = script:FindFirstAncestor("EdpStoreAnalytics");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.AppCommonLib);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v7 = require(l_script_FirstAncestor_0.Constants);
local l_Signal_0 = v5.Signal;
local l_ScreenSizeImpressionsDetector_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsDetector;
local v10 = game:DefineFastInt("EdpStoreImpressionsDetectorThrottlingHundredthsPercent", 0);
local v11 = game:DefineFastFlag("EnableEdpStoreIxpExposureEnrollment", false);
return function(v12) --[[ Line: 26 ]]
    -- upvalues: v4 (copy), l_Signal_0 (copy), v7 (copy), v10 (copy), l_TelemetryService_0 (copy), v11 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_ScreenSizeImpressionsDetector_0 (copy)
    local v13 = v4.useRef(l_Signal_0.new());
    local v14 = v4.useRef(false);
    v4.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: v12 (copy), v13 (copy)
        if v12.scrollViewPositionChangedSignal.current then
            v12.scrollViewPositionChangedSignal.current:connect(function() --[[ Line: 32 ]]
                -- upvalues: v13 (ref)
                v13.current:fire();
            end);
        end;
    end, {
        v12.scrollViewPositionChangedSignal
    });
    local v19 = v4.useCallback(function(v15) --[[ Line: 38 ]]
        -- upvalues: v14 (copy), v12 (copy), v7 (ref), v10 (ref), l_TelemetryService_0 (ref), v11 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
        if #v15 == 0 or v14.current then
            return;
        elseif v12.parameters == nil then
            return;
        else
            v14.current = true;
            local v16 = v15[1];
            local v17 = {
                eventName = v7.ExperienceStoreEventName, 
                backends = {
                    "EventIngest"
                }, 
                throttlingPercentage = v10, 
                lastUpdated = {
                    25, 
                    10, 
                    23
                }, 
                description = "Event fired from the lua app for every impression on the EDP store or preview"
            };
            local v18 = {
                universeId = tonumber(v12.parameters.universeId), 
                productType = v12.parameters.productType, 
                actionType = v7.StoreEnums.ActionType.Impression, 
                locationType = v12.parameters.locationType, 
                layoutOrder = tonumber(v16)
            };
            l_TelemetryService_0:LogEvent(v17, {
                customFields = v18
            });
            if v11 then
                l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.EconomyDeveloperMonetizationEdpVirtualProductsRanking);
            end;
            return;
        end;
    end, {
        v12.parameters
    });
    return v4.createElement(l_ScreenSizeImpressionsDetector_0, {
        parentRef = v12.parentRef, 
        onRequestImpressionsSignal = v13.current, 
        onImpressionsDetected = v19, 
        impressionsTag = v12.impressionsTag
    });
end;