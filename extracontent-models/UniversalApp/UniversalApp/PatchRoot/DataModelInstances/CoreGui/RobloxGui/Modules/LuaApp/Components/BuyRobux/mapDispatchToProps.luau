local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v2 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPProducts);
local v3 = require(l_Modules_0.LuaApp.Actions.ClearNativePurchaseResult);
local v4 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPPurchaseWarning);
local v5 = require(l_Modules_0.LuaApp.Thunks.FetchNativeIAPProducts);
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiPostAckPurchaseWarning);
local v7 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenNativePurchase);
local v8 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v9 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v10 = require(l_Modules_0.LuaApp.Thunks.ApiPostCheckUserPurchaseSettings);
return function(v11) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), v4 (copy), v6 (copy), v9 (copy), v7 (copy), v1 (copy), v8 (copy), v10 (copy)
    return {
        dispatchClearNativePurchaseResult = function() --[[ Line: 17 ]] --[[ Name: dispatchClearNativePurchaseResult ]]
            -- upvalues: v11 (copy), v3 (ref)
            v11(v3());
        end, 
        dispatchFetchIAPProducts = function(v12) --[[ Line: 20 ]] --[[ Name: dispatchFetchIAPProducts ]]
            -- upvalues: v11 (copy), v2 (ref)
            v11(v2.Fetch(v12));
        end, 
        dispatchFetchNativeIAPProducts = function() --[[ Line: 23 ]] --[[ Name: dispatchFetchNativeIAPProducts ]]
            -- upvalues: v11 (copy), v5 (ref)
            v11(v5.Fetch());
        end, 
        dispatchFetchIAPPurchaseWarning = function(v13, v14, v15, v16) --[[ Line: 26 ]] --[[ Name: dispatchFetchIAPPurchaseWarning ]]
            -- upvalues: v11 (copy), v4 (ref)
            return v11(v4.Fetch(v13, v14, v15, v16));
        end, 
        dispatchPostAckPurchaseWarning = function(v17, v18) --[[ Line: 34 ]] --[[ Name: dispatchPostAckPurchaseWarning ]]
            -- upvalues: v11 (copy), v6 (ref)
            return v11(v6.Post(v17, v18));
        end, 
        dispatchFetchUserBalance = function(v19, v20) --[[ Line: 37 ]] --[[ Name: dispatchFetchUserBalance ]]
            -- upvalues: v11 (copy), v9 (ref)
            v11(v9(v19, v20, true));
        end, 
        promptRobux = function(v21, v22, v23) --[[ Line: 40 ]] --[[ Name: promptRobux ]]
            -- upvalues: v11 (copy), v7 (ref)
            v11(v7(v21, v22, v23));
        end, 
        dispatchNavigateBack = function() --[[ Line: 43 ]] --[[ Name: dispatchNavigateBack ]]
            -- upvalues: v11 (copy), v1 (ref)
            v11(v1());
        end, 
        dispatchCentralOverlay = function(v24, v25) --[[ Line: 46 ]] --[[ Name: dispatchCentralOverlay ]]
            -- upvalues: v11 (copy), v8 (ref)
            return v11(v8(v24, v25));
        end, 
        dispatchCheckUserPurchaseSettings = function(v26) --[[ Line: 49 ]] --[[ Name: dispatchCheckUserPurchaseSettings ]]
            -- upvalues: v11 (copy), v10 (ref)
            return v11(v10.Post(v26));
        end
    };
end;