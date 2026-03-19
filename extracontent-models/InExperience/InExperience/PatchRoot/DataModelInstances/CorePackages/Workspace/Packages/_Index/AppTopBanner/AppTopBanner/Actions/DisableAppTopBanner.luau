local l_Parent_0 = script:FindFirstAncestor("AppTopBanner").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    return {
        isDisabled = v1
    };
end);