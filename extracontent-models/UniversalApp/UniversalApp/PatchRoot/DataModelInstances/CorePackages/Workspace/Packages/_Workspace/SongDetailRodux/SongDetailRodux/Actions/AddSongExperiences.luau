local l_Parent_0 = script:FindFirstAncestor("SongDetailRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 8 ]]
    return {
        songExperiences = v1
    };
end);