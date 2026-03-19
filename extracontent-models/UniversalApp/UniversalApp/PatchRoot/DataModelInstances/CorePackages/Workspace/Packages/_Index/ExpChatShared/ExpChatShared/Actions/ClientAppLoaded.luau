local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 13 ]]
    return {
        team = v1.team, 
        isChatCoreGuiEnabled = v1.isChatCoreGuiEnabled == nil or v1.isChatCoreGuiEnabled, 
        isTouchEnabled = v1.isTouchEnabled, 
        isGamepadEnabled = v1.isGamepadEnabled
    };
end);