local l_Parent_0 = script:FindFirstAncestor("SocialContextToasts").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 5 ]]
    return {
        isConfirmationModalOpen = v1, 
        closeCallback = v2
    };
end);