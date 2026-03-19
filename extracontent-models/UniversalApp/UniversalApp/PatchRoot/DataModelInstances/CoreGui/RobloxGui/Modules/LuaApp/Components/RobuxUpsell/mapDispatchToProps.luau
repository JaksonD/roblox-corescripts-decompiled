local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Actions.ClearNativePurchaseResult);
local v4 = require(l_Modules_0.LuaApp.Thunks.Economy.ApiFetchRobuxProduct);
local v5 = require(l_Modules_0.LuaApp.Thunks.Economy.ApiFetchRobuxProductWithItemInfo);
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPPurchaseWarning);
local v7 = require(l_Modules_0.LuaApp.Thunks.ApiPostAckPurchaseWarning);
local v8 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenNativePurchase);
local v9 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v10 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToSecuritySettings);
local v11 = require(l_Modules_0.LuaApp.Thunks.Challenge.RenderChallenge);
local v12 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v13 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v14 = require(l_Modules_0.LuaApp.Thunks.ApiPostCheckUserPurchaseSettings);
local v15 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage);
local l_GetFStringVNGTosUrl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringVNGTosUrl;
local l_GetFFlagOpenVngTosForVngRobuxUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagOpenVngTosForVngRobuxUpsell;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
return function(v19) --[[ Line: 27 ]]
    -- upvalues: v5 (copy), v4 (copy), v6 (copy), v7 (copy), v13 (copy), v3 (copy), v8 (copy), l_GetFFlagOpenVngTosForVngRobuxUpsell_0 (copy), l_getAppFeaturePolicies_0 (copy), v9 (copy), v2 (copy), l_GetFStringVNGTosUrl_0 (copy), v12 (copy), v10 (copy), v15 (copy), v11 (copy), v14 (copy)
    return {
        dispatchFetchRobuxProduct = function(v20, v21, v22, v23, v24, v25) --[[ Line: 29 ]] --[[ Name: dispatchFetchRobuxProduct ]]
            -- upvalues: v19 (copy), v5 (ref), v4 (ref)
            if v25 ~= nil and v23 ~= nil and v24 ~= nil then
                return v19(v5(v20, v21, v22, v23, v24, v25));
            else
                return v19(v4(v20, v21, v22));
            end;
        end, 
        dispatchFetchIAPPurchaseWarning = function(v26, v27, v28, v29) --[[ Line: 52 ]] --[[ Name: dispatchFetchIAPPurchaseWarning ]]
            -- upvalues: v19 (copy), v6 (ref)
            return v19(v6.Fetch(v26, v27, v28, v29));
        end, 
        dispatchPostAckPurchaseWarning = function(v30, v31) --[[ Line: 60 ]] --[[ Name: dispatchPostAckPurchaseWarning ]]
            -- upvalues: v19 (copy), v7 (ref)
            return v19(v7.Post(v30, v31));
        end, 
        dispatchCentralOverlay = function(v32, v33) --[[ Line: 63 ]] --[[ Name: dispatchCentralOverlay ]]
            -- upvalues: v19 (copy), v13 (ref)
            return v19(v13(v32, v33));
        end, 
        endPurchase = function() --[[ Line: 66 ]] --[[ Name: endPurchase ]]
            -- upvalues: v19 (copy), v3 (ref)
            v19(v3());
        end, 
        promptRobux = function(v34, v35, v36, v37) --[[ Line: 69 ]] --[[ Name: promptRobux ]]
            -- upvalues: v19 (copy), v8 (ref)
            v19(v8(v34, v35, v36, v37));
        end, 
        openTermsOfUse = function() --[[ Line: 72 ]] --[[ Name: openTermsOfUse ]]
            -- upvalues: l_GetFFlagOpenVngTosForVngRobuxUpsell_0 (ref), l_getAppFeaturePolicies_0 (ref), v19 (copy), v9 (ref), v2 (ref), l_GetFStringVNGTosUrl_0 (ref), v12 (ref)
            local v38 = l_GetFFlagOpenVngTosForVngRobuxUpsell_0() and l_getAppFeaturePolicies_0().getShowVNGTosForRobuxUpsell();
            v19(v9({
                name = v2.GenericWebPage, 
                detail = if v38 then l_GetFStringVNGTosUrl_0() else v12.static.about.terms(), 
                extraProps = {
                    title = ""
                }
            }));
        end, 
        openSecuritySettings = function() --[[ Line: 83 ]] --[[ Name: openSecuritySettings ]]
            -- upvalues: v19 (copy), v10 (ref)
            v19(v10());
        end, 
        openBuyRobux = function(v39) --[[ Line: 86 ]] --[[ Name: openBuyRobux ]]
            -- upvalues: v19 (copy), v15 (ref)
            return v19(v15(nil, v39));
        end, 
        renderChallenge = function(v40, v41) --[[ Line: 89 ]] --[[ Name: renderChallenge ]]
            -- upvalues: v19 (copy), v11 (ref)
            return v19(v11(v40, v41));
        end, 
        dispatchCheckUserPurchaseSettings = function(v42) --[[ Line: 92 ]] --[[ Name: dispatchCheckUserPurchaseSettings ]]
            -- upvalues: v19 (copy), v14 (ref)
            return v19(v14.Post(v42));
        end, 
        openSettingsPage = function() --[[ Line: 95 ]] --[[ Name: openSettingsPage ]]
            -- upvalues: v19 (copy), v9 (ref), v2 (ref), v12 (ref)
            return v19(v9({
                name = v2.SettingsSubPage, 
                detail = v12.static.settings.billing(), 
                extraProps = {
                    titleKey = "Feature.AccountSettings.Heading.Tab.Spending"
                }
            }));
        end
    };
end;