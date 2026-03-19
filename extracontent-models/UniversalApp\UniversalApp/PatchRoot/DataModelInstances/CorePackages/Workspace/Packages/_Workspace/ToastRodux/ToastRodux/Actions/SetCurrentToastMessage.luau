local l_Parent_0 = script:FindFirstAncestor("ToastRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "table", "SetCurrentToastMessage action expects toastMessage to be a table");
    return {
        toastMessage = v1
    };
end);