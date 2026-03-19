local l_Parent_0 = script:FindFirstAncestor("RoduxShareLinks").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 9 ]]
    return {
        shareInviteLink = v1
    };
end);