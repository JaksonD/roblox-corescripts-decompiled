local l_Parent_0 = script:FindFirstAncestor("GameProductInfoRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 11 ]]
    return {
        gamesProductInfo = v1
    };
end);