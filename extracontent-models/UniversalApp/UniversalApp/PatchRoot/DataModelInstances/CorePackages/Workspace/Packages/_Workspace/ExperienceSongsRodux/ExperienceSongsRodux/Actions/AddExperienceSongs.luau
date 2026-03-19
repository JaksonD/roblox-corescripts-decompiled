local l_Parent_0 = script:FindFirstAncestor("ExperienceSongsRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 6 ]]
    return {
        experienceSongs = v1
    };
end);