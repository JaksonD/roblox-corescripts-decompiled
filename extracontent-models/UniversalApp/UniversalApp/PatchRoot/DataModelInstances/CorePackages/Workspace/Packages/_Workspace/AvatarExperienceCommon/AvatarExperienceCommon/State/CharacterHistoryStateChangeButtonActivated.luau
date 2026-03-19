local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 24 ]]
    return {
        type = script.Name, 
        isUndo = v1.isUndo, 
        equipped = v1.equipped, 
        tryOn = v1.tryOn
    };
end);