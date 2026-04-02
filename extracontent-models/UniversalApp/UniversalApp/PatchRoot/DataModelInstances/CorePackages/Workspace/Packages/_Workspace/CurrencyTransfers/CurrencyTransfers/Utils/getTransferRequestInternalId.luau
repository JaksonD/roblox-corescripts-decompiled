return function(v0) --[[ Line: 6 ]] --[[ Name: getTransferRequestInternalId ]]
    if v0 == nil or v0 == "" then
        return "";
    elseif #v0 >= 4 and string.lower((string.sub(v0, 1, 4))) == "rxt-" then
        return (string.sub(v0, 5));
    else
        return v0;
    end;
end;