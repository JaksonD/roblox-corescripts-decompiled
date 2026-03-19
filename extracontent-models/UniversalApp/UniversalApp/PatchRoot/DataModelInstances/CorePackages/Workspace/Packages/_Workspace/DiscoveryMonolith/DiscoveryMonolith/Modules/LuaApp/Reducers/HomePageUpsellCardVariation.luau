local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation);
local l_FFlagEnableAEGIS1HomePageBanner_0 = require(l_Parent_0.SocialUpsell).Flags.FFlagEnableAEGIS1HomePageBanner;
return function(v5, v6) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy)
    v5 = v5 or {
        upsellCardType = "", 
        titleTextOverride = "", 
        bodyTextOverride = "", 
        upsellCardV2Config = nil
    };
    if v6.type == v3.name then
        if l_FFlagEnableAEGIS1HomePageBanner_0 then
            return {
                upsellCardType = v6.upsellCardType, 
                titleTextOverride = v6.titleTextOverride, 
                bodyTextOverride = v6.bodyTextOverride, 
                upsellCardV2Config = v6.upsellCardV2Config
            };
        else
            v5 = {
                upsellCardType = v6.upsellCardType, 
                titleTextOverride = v6.titleTextOverride, 
                bodyTextOverride = v6.bodyTextOverride
            };
        end;
    end;
    return v5;
end;