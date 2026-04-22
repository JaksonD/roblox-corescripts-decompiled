local l_Modules_0 = script:FindFirstAncestor("DiscoveryMonolith").Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or {
        upsellCardType = "", 
        titleTextOverride = "", 
        bodyTextOverride = "", 
        upsellCardV2Config = nil
    };
    if v3.type == v1.name then
        v2 = {
            upsellCardType = v3.upsellCardType, 
            titleTextOverride = v3.titleTextOverride, 
            bodyTextOverride = v3.bodyTextOverride, 
            upsellCardV2Config = v3.upsellCardV2Config
        };
    end;
    return v2;
end;