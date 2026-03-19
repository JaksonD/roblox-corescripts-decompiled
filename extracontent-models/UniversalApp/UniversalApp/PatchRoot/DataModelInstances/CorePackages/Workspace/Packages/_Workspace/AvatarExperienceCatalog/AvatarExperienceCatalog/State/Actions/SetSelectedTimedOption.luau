local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local _ = require(l_Parent_0.AvatarExperienceCommon);
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v2) --[[ Line: 17 ]]
    return {
        itemId = v2.itemId, 
        selectedTimedOptionIndex = v2.selectedTimedOptionIndex, 
        itemType = v2.itemType
    };
end);