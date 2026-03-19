local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.ReactUtils);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Unibar.UnibarMenu);
local v5 = require(l_script_FirstAncestor_0.Unibar.UnibarStyle);
local v6 = require(l_script_FirstAncestor_0.Unibar.Tooltips.TooltipProvider);
local v7 = require(l_script_FirstAncestor_0.Parent.Flags.FFlagEnableUnibarTooltipQueue)();
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
return function(v11) --[[ Line: 17 ]] --[[ Name: UnibarMenuWrapper ]]
    -- upvalues: v3 (copy), v2 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), v7 (copy), v6 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v5 (copy), v4 (copy)
    return v3.createElement(v2.ContextStack, {
        providers = {
            v3.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0
                }
            }), 
            if v7 then v3.createElement(v6) else nil, 
            if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then v3.createElement(v5.Provider) else nil
        }
    }, {
        UnibarMenu = v3.createElement(v4, v11)
    });
end;