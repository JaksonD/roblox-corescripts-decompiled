local l_Parent_0 = script:FindFirstAncestor("AppTabBarRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    return {
        isVisible = v1
    };
end);