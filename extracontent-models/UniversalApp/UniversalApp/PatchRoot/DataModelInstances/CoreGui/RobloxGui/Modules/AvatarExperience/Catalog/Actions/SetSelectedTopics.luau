local l_CorePackages_0 = game:GetService("CorePackages");
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator("Catalog-" .. script.Name, function(v1) --[[ Line: 15 ]] --[[ Name: SetSelectedTopics ]]
    return {
        selectedTopics = v1
    };
end);