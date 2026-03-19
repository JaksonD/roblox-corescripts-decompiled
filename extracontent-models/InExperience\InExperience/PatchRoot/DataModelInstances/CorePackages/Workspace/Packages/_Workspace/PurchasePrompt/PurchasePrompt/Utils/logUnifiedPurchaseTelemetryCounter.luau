local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LoggingProtocol);
local _ = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
local v4 = require(l_script_FirstAncestor_0.Utils.AppContext);
local l_ProductPurchaseSurface_0 = require(l_Parent_0.PurchasePromptLite).Enums.ProductPurchaseSurface;
local v6 = require(l_script_FirstAncestor_0.types);
logUnifiedPurchaseTelemetryCounter = function(v7, v8, v9) --[[ Line: 9 ]] --[[ Name: logUnifiedPurchaseTelemetryCounter ]]
    -- upvalues: v2 (copy), v4 (copy), l_ProductPurchaseSurface_0 (copy), v6 (copy)
    v2.default:logRobloxTelemetryCounter(v7, 1, {
        appContext = v4.get(), 
        surface = v8 or l_ProductPurchaseSurface_0.Unknown, 
        productType = v9 or v6.ProductTypeEnum.Unknown
    });
end;
return logUnifiedPurchaseTelemetryCounter;