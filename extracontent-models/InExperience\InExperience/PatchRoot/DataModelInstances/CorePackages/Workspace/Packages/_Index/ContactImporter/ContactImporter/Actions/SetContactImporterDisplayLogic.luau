local l_Parent_0 = script.Parent.Parent;
return require(l_Parent_0.dependencies).Rodux.makeActionCreator(script.Name, function(v1) --[[ Line: 14 ]]
    assert(type(v1) == "table", string.format("SetContactImporterDisplayLogic action expects params to be a table, was %s", (type(v1))));
    return v1;
end);