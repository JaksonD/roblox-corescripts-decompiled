local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
return l_makeActionCreator_0(script.Name, function(v3, v4, v5, v6, v7, v8) --[[ Line: 8 ]]
    -- upvalues: l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy)
    return {
        topicId = v3, 
        sortIndex = v4, 
        numberOfTiles = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then nil else v5, 
        numberOfRows = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v6 else nil, 
        itemsPerRow = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v7 else nil, 
        entries = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v8 else nil
    };
end);