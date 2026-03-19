local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
return require(l_Parent_0.Rodux).makeActionCreator("SetGameDetailsPeekViewState", function(v1) --[[ Line: 5 ]]
    return {
        viewState = v1
    };
end);