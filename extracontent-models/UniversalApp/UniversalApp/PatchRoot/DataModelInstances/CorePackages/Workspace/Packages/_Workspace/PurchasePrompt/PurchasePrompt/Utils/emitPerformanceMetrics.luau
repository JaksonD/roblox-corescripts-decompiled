local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.PurchasePromptLite);
local l_Enums_0 = require(l_Parent_0.PurchasePromptLite).Enums;
local _ = require(l_script_FirstAncestor_0.types);
local l_getTTIEventName_0 = v2.getTTIEventName;
local l_IntervalPerformanceTracker_0 = require(l_Parent_0.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_TimeToInteractiveTracker_0 = require(l_Parent_0.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v8 = require(l_script_FirstAncestor_0.Misc.Constants);
local v9 = game:DefineFastInt("ProductPurchaseContainerFPSDuration", 2);
local l_FIntTTIUnifiedPurchaseSamplingRate_0 = require(l_Parent_0.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate;
local v11 = {
    [l_Enums_0.ProductPurchaseSurface.Catalog] = true, 
    [l_Enums_0.ProductPurchaseSurface.EDP] = true
};
emitPerformanceMetrics = function(v12, v13) --[[ Line: 22 ]] --[[ Name: emitPerformanceMetrics ]]
    -- upvalues: v11 (copy)
    if v13 ~= nil and v11[v13] then
        emitFPSMetrics(v12, v13);
        emitTTIMetrics(v13);
    end;
end;
emitFPSMetrics = function(v14, v15) --[[ Line: 30 ]] --[[ Name: emitFPSMetrics ]]
    -- upvalues: l_IntervalPerformanceTracker_0 (copy), v8 (copy), v9 (copy)
    l_IntervalPerformanceTracker_0:startTracking(v8.PerformanceMetrics.Prefix.UnifiedPurchaseModal .. "_" .. v14 .. "_" .. v15, v9, nil, true, true);
    l_IntervalPerformanceTracker_0:startTracking(v8.PerformanceMetrics.Prefix.PurchaseModal .. "_" .. v14 .. "_" .. v15, v9, nil, true, true);
end;
emitTTIMetrics = function(v16) --[[ Line: 51 ]] --[[ Name: emitTTIMetrics ]]
    -- upvalues: l_getTTIEventName_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_FIntTTIUnifiedPurchaseSamplingRate_0 (copy)
    local v17 = l_getTTIEventName_0(v16);
    l_TimeToInteractiveTracker_0.trackEnd(v17, {
        samplingRateOverride = l_FIntTTIUnifiedPurchaseSamplingRate_0
    });
end;
return emitPerformanceMetrics;