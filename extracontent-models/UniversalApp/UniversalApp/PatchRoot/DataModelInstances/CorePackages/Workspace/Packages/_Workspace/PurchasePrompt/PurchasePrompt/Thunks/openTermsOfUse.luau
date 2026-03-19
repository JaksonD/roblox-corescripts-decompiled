local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Enums.UpsellFlow);
local v3 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v4 = require(l_Parent_0.Services.ExternalSettings);
local v5 = require(l_Parent_0.Services.PlatformInterface);
local v6 = require(l_Parent_0.Thunk);
local l_AppPage_0 = require(l_Parent_1.RobloxAppEnums).AppPage;
local l_TermsOfUse_0 = require(l_Parent_0.Misc.Constants).TermsOfUse;
local v9 = require(l_Parent_0.Utils.AppContext);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_1.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_getAppFeaturePolicies_0 = require(l_Parent_1.UniversalAppPolicy).getAppFeaturePolicies;
local v12 = {
    v4, 
    v5
};
return function(v13) --[[ Line: 23 ]] --[[ Name: openTermsOfUse ]]
    -- upvalues: v6 (copy), v12 (copy), v4 (copy), v5 (copy), v3 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_getAppFeaturePolicies_0 (copy), v9 (copy), l_AppPage_0 (copy), l_TermsOfUse_0 (copy), v2 (copy)
    return v6.new(script.Name, v12, function(_, v15) --[[ Line: 24 ]]
        -- upvalues: v4 (ref), v5 (ref), v3 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), l_getAppFeaturePolicies_0 (ref), v9 (ref), v13 (copy), l_AppPage_0 (ref), l_TermsOfUse_0 (ref), v2 (ref)
        local v16 = v15[v4];
        local v17 = v15[v5];
        local v18 = v3(v16.getPlatform());
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_getAppFeaturePolicies_0().getShouldUseDMCCALegalDisclosureInApp() then
            if v9.get() == v9.Enum.IN_APP then
                v13.navigate(l_AppPage_0.GenericWebPage, {
                    detail = l_TermsOfUse_0.DMCCAUrl, 
                    extraProps = {
                        title = ""
                    }
                });
                return;
            else
                v17.openTermsOfUseDMCCA();
                return;
            end;
        else
            if v18 == v2.Web then
                v17.openTermsOfUse();
            end;
            return;
        end;
    end);
end;