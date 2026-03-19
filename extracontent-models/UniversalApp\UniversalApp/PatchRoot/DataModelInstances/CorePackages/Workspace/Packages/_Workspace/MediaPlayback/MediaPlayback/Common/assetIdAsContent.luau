return function(v0) --[[ Line: 1 ]] --[[ Name: assetIdAsContent ]]
    if typeof(v0) == "string" and v0:find("^.+://") then
        return v0;
    else
        return (("rbxassetid://%*"):format(v0));
    end;
end;