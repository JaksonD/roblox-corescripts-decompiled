local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 14 ]]
    return {
        lastToggledLookType = v1.lastToggledLookType
    };
end);