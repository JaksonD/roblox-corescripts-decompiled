local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 14 ]]
    return {
        collectibleItemData = v1.collectibleItemData
    };
end);