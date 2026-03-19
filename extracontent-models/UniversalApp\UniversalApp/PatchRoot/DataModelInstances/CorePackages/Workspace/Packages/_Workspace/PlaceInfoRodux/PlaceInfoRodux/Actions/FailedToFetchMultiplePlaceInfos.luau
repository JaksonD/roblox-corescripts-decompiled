local l_Parent_0 = script:FindFirstAncestor("PlaceInfoRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 6 ]]
    return {
        placeIds = v1
    };
end);