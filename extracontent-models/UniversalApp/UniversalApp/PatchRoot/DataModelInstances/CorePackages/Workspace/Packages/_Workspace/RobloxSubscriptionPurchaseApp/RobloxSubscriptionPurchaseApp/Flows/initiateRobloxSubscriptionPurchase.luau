local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Actions.initiateRobloxSubscriptionPurchaseInternal);
local v2 = require(l_script_FirstAncestor_0.Flows.RobloxSubscriptionOverlayController);
local v3 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v4 = require(l_script_FirstAncestor_0.Enums.SurfaceContext);
local v5 = require(l_script_FirstAncestor_0.Enums.SurfaceName);
local _ = require(l_script_FirstAncestor_0.types);
return function(v7, v8, v9, v10, v11, v12) --[[ Line: 16 ]] --[[ Name: initiateRobloxSubscriptionPurchase ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v1 (copy), v2 (copy)
    local v13 = v3.get();
    if v8 and v8.onFlowComplete then
        if v8.onFlowComplete then
            v13.setOnFlowComplete(v8.onFlowComplete);
        end;
        if v8.onBackButtonActivated then
            v13.setOnBackButtonActivated(v8.onBackButtonActivated);
        end;
    end;
    if v7 then
        v13.setPurchaseUIOptions(v7);
    end;
    if v12 then
        v13.setPurchaseFlowOptions(v12);
    end;
    local v14 = {};
    if v9 ~= nil then
        v14.universeId = v9;
    end;
    local v15 = {
        context = v11 or v4.Unspecified, 
        surfaceName = v10 or v5.Unspecified, 
        metadata = v14
    };
    v13.setEntryContext(v15);
    v1(v15);
    return v2.render();
end;