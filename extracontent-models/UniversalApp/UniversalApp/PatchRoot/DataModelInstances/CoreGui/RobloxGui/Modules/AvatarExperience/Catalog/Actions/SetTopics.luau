local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator("Catalog-" .. script.Name, function(v1, v2, v3, v4) --[[ Line: 27 ]] --[[ Name: SetTopics ]]
    return {
        selectedTopics = v1, 
        initialItems = v2, 
        searchKeyword = v3, 
        newTopics = v4
    };
end);