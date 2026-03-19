local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
return l_makeActionCreator_0(script.Name, function(v3, v4, v5, v6) --[[ Line: 8 ]]
    -- upvalues: l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy)
    return {
        topicId = v3, 
        sortIndex = v4, 
        itemsPerRow = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v5 else nil, 
        entries = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v6 else nil
    };
end);