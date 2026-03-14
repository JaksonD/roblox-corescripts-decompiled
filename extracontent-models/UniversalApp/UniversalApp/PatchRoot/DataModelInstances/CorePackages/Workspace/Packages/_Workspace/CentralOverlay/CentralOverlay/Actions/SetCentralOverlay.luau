local l_Parent_0 = script:FindFirstAncestor("CentralOverlay").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 5 ]]
    return {
        overlayType = v1, 
        arguments = v2, 
        configs = v3
    };
end);