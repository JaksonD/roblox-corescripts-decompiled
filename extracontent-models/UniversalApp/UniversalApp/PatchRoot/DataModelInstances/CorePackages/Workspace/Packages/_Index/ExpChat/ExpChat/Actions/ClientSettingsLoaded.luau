local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 10 ]]
    return {
        value = {
            preferredTransparency = v1.preferredTransparency or 1
        }
    };
end);