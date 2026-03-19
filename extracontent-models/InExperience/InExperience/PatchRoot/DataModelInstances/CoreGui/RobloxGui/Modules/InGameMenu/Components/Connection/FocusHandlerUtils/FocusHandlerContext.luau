local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.InGameMenuDependencies).Roact.createContext({
    currentHandlerId = nil, 
    candidateHandlerId = nil, 
    previousSelections = {}, 
    requestFocusForHandlerId = function() --[[ Line: 9 ]] --[[ Name: requestFocusForHandlerId ]]

    end, 
    forgetLastSelectionForHandlerId = function() --[[ Line: 10 ]] --[[ Name: forgetLastSelectionForHandlerId ]]

    end, 
    blurCurrentFocusHandler = function() --[[ Line: 11 ]] --[[ Name: blurCurrentFocusHandler ]]

    end
});