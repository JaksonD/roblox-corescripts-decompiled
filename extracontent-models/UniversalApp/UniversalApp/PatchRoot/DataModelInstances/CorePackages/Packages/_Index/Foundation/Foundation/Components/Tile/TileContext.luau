local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
return require(l_Parent_0.React).createContext({
    fillDirection = Enum.FillDirection.Vertical, 
    isContained = false, 
    testId = ""
});