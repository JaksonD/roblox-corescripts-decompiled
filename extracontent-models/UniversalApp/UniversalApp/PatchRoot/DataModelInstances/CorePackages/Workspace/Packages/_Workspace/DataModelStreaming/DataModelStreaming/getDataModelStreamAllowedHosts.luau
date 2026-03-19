game:DefineFastFlag("LuaAppEnableDataModelStreamForConsoles", false);
return function() --[[ Line: 3 ]] --[[ Name: getDataModelStreamAllowedHosts ]]
    local v0 = {
        "ws://localhost:5051", 
        "ws://10.0.2.2:5051"
    };
    if game:GetFastFlag("LuaAppEnableDataModelStreamForConsoles") then
        table.insert(v0, "ws://10.110.101.185:5051");
    end;
    return v0;
end;