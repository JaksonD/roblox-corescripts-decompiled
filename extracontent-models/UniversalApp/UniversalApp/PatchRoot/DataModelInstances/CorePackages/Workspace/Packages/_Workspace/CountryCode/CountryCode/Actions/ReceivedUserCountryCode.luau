local l_Parent_0 = script:FindFirstAncestor("CountryCode").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 6 ]]
    return {
        countryCode = v1
    };
end);