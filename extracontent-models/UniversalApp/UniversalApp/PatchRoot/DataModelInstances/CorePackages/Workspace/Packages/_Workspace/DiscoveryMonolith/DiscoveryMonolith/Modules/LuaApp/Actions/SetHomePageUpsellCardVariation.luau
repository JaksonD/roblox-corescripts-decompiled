local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4) --[[ Line: 14 ]]
    return {
        upsellCardType = v1, 
        titleTextOverride = v2, 
        bodyTextOverride = v3, 
        upsellCardV2Config = v4
    };
end);