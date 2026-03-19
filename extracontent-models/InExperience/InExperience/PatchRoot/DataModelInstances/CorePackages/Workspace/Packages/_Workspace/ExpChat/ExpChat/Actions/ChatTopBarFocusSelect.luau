local l_Parent_0 = script.Parent;
return require(l_Parent_0.ActionCreator)(script.Name, function(v1, v2) --[[ Line: 4 ]]
    return {
        onSelectionLost = v1, 
        keybinds = v2
    };
end);