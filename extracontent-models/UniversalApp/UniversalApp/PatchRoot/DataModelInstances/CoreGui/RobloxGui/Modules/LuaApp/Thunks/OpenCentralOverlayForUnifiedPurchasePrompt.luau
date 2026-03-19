local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v3 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local _ = require(l_CorePackages_0.Workspace.Packages.PurchasePrompt);
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_getTTIEventName_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).getTTIEventName;
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: l_getTTIEventName_0 (copy), l_TimeToInteractiveTracker_0 (copy), v3 (copy), v2 (copy)
    if v8 and v7 and v7.purchaseAnalyticsMetadata and v7.purchaseAnalyticsMetadata.surface then
        local v9 = l_getTTIEventName_0(v7.purchaseAnalyticsMetadata.surface);
        l_TimeToInteractiveTracker_0.trackStart(v9);
        l_TimeToInteractiveTracker_0.updateMetadata(v9, {
            page = v7.purchaseAnalyticsMetadata.surface, 
            category = "unified_purchase_modal"
        });
    end;
    return function(v10) --[[ Line: 22 ]]
        -- upvalues: v3 (ref), v2 (ref), v7 (copy)
        v10:dispatch(v3(v2.UnifiedProductPurchaseModal, v7));
    end;
end;