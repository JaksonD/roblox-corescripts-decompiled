local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 11 ]]
    return {
        countryCodeList = v1
    };
end);