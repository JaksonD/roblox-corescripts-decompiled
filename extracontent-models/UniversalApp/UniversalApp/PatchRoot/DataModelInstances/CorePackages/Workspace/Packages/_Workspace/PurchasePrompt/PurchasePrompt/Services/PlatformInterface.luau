local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_script_FirstAncestor_0.Utils.Base64);
local v5 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local v6 = require(l_script_FirstAncestor_0.Misc.Constants);
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local v10 = nil;
pcall(function() --[[ Line: 15 ]]
    -- upvalues: v10 (ref)
    v10 = game:GetService("PlatformService");
end);
local l_GetFStringVNGWebshopUrl_0 = require(l_Parent_0.SharedFlags).GetFStringVNGWebshopUrl;
local l_UrlBuilder_0 = require(l_Parent_0.PurchasePromptDeps).UrlBuilder.UrlBuilder;
local v13 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "/m.", "/www.");
local v14 = {};
local function v19(v15, v16) --[[ Line: 32 ]] --[[ Name: addContextToUrl ]]
    for v17, v18 in v16 do
        if v18 then
            if v15:find("?") then
                v15 = v15 .. ("&%s=%s"):format(v17, v18);
            else
                v15 = v15 .. ("?%s=%s"):format(v17, v18);
            end;
        end;
    end;
    return v15;
end;
v14.new = function() --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: l_MarketplaceService_0 (copy), v13 (copy), l_GuiService_0 (copy), v19 (copy), v5 (copy), v4 (copy), l_UrlBuilder_0 (copy), l_HttpService_0 (copy), v6 (copy), l_BrowserService_0 (copy), v10 (ref), l_GetFStringVNGWebshopUrl_0 (copy)
    local v20 = {};
    setmetatable(v20, {
        __tostring = function() --[[ Line: 49 ]] --[[ Name: __tostring ]]
            return "Service(PlatformInterface)";
        end
    });
    v20.signalMockPurchasePremium = function() --[[ Line: 54 ]] --[[ Name: signalMockPurchasePremium ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        l_MarketplaceService_0:SignalMockPurchasePremium();
    end;
    v20.startPremiumUpsell = function(v21) --[[ Line: 58 ]] --[[ Name: startPremiumUpsell ]]
        -- upvalues: v13 (ref), l_GuiService_0 (ref)
        local v22 = ("%supgrades/paymentmethods?ap=%d"):format(v13, v21);
        l_GuiService_0:OpenBrowserWindow(v22);
    end;
    v20.startPremiumUpsellWithContext = function(v23, v24) --[[ Line: 64 ]] --[[ Name: startPremiumUpsellWithContext ]]
        -- upvalues: v13 (ref), v19 (ref), l_GuiService_0 (ref)
        local v25 = ("%supgrades/paymentmethods?ap=%d"):format(v13, v24);
        v25 = v19(v25, v23);
        l_GuiService_0:OpenBrowserWindow(v25);
    end;
    v20.startRobuxUpsellWebByFlow = function(v26, v27) --[[ Line: 70 ]] --[[ Name: startRobuxUpsellWebByFlow ]]
        -- upvalues: v5 (ref), l_GuiService_0 (ref), v13 (ref)
        if v26 == v5.RobuxUpsellV2 or v26 == v5.LargeRobuxUpsell then
            l_GuiService_0:OpenBrowserWindow(("%supgrades/paymentmethods?ap=%s"):format(v13, v27));
            return;
        else
            l_GuiService_0:OpenBrowserWindow(("%sUpgrades/Robux.aspx?product_id=%s"):format(v13, v27));
            return;
        end;
    end;
    v20.startRobuxUpsellWebByFlowWithContext = function(v28, v29, v30) --[[ Line: 78 ]] --[[ Name: startRobuxUpsellWebByFlowWithContext ]]
        -- upvalues: v5 (ref), v13 (ref), v19 (ref), l_GuiService_0 (ref)
        local v31 = true;
        if v29 ~= v5.RobuxUpsellV2 then
            v31 = v29 == v5.LargeRobuxUpsell;
        end;
        local v32 = if v31 then ("%supgrades/paymentmethods?ap=%s"):format(v13, v30) else ("%sUpgrades/Robux.aspx?product_id=%s"):format(v13, v30);
        v32 = v19(v32, v28);
        l_GuiService_0:OpenBrowserWindow(v32);
    end;
    v20.openSecuritySettings = function(v33) --[[ Line: 89 ]] --[[ Name: openSecuritySettings ]]
        -- upvalues: v4 (ref), v13 (ref), l_GuiService_0 (ref)
        if v33 then
            local v34 = v4.Encode(v33);
            local v35 = ("%smy/account?challenge=%s#!/security"):format(v13, v34);
            l_GuiService_0:OpenBrowserWindow(v35);
            return;
        else
            local v36 = ("%smy/account#!/security"):format(v13);
            l_GuiService_0:OpenBrowserWindow(v36);
            return;
        end;
    end;
    v20.openTermsOfUse = function() --[[ Line: 103 ]] --[[ Name: openTermsOfUse ]]
        -- upvalues: l_UrlBuilder_0 (ref), l_GuiService_0 (ref)
        local v37 = l_UrlBuilder_0.static.about.terms();
        l_GuiService_0:OpenBrowserWindow(v37);
    end;
    v20.openTermsOfUseDMCCA = function() --[[ Line: 109 ]] --[[ Name: openTermsOfUseDMCCA ]]
        -- upvalues: l_HttpService_0 (ref), v6 (ref), l_BrowserService_0 (ref)
        local v38 = l_HttpService_0:JSONEncode({
            command = "open", 
            url = v6.TermsOfUse.DMCCAUrl
        });
        l_BrowserService_0:SendCommand(v38);
    end;
    v20.openRobuxStore = function() --[[ Line: 117 ]] --[[ Name: openRobuxStore ]]
        -- upvalues: l_GuiService_0 (ref), v13 (ref)
        l_GuiService_0:OpenBrowserWindow(("%sUpgrades/Robux.aspx"):format(v13));
    end;
    v20.openRobuxStoreWithContext = function(v39, v40) --[[ Line: 121 ]] --[[ Name: openRobuxStoreWithContext ]]
        -- upvalues: v13 (ref), v19 (ref), l_GuiService_0 (ref)
        local v41 = ("%sUpgrades/Robux.aspx"):format(v13);
        if v40 then
            v41 = v41 .. ("?product_id=%s"):format(v40);
        end;
        v41 = v19(v41, v39);
        l_GuiService_0:OpenBrowserWindow(v41);
    end;
    v20.openPaymentsPageWithContext = function(v42, v43) --[[ Line: 130 ]] --[[ Name: openPaymentsPageWithContext ]]
        -- upvalues: v13 (ref), v19 (ref), l_GuiService_0 (ref)
        local v44 = ("%supgrades/paymentmethods?ap=%s"):format(v13, v43);
        v44 = v19(v44, v42);
        l_GuiService_0:OpenBrowserWindow(v44);
    end;
    v20.promptNativePurchaseWithLocalPlayer = function(v45) --[[ Line: 136 ]] --[[ Name: promptNativePurchaseWithLocalPlayer ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0:PromptNativePurchaseWithLocalPlayer(v45);
    end;
    v20.promptNativePurchase = function(v46, v47) --[[ Line: 140 ]] --[[ Name: promptNativePurchase ]]
        -- upvalues: l_MarketplaceService_0 (ref)
        return l_MarketplaceService_0:PromptNativePurchase(v46, v47);
    end;
    v20.beginPlatformStorePurchase = function(v48) --[[ Line: 144 ]] --[[ Name: beginPlatformStorePurchase ]]
        -- upvalues: v10 (ref)
        return v10:BeginPlatformStorePurchase(v48);
    end;
    v20.openVngStore = function(v49) --[[ Line: 148 ]] --[[ Name: openVngStore ]]
        -- upvalues: l_GetFStringVNGWebshopUrl_0 (ref), l_GuiService_0 (ref)
        if not v49 or v49 == "" then
            v49 = l_GetFStringVNGWebshopUrl_0();
        end;
        l_GuiService_0:OpenBrowserWindow(v49);
    end;
    return v20;
end;
return v14;