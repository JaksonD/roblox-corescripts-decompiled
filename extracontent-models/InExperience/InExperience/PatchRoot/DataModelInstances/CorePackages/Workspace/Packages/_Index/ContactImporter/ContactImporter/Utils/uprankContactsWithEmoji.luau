local l_Parent_0 = script:FindFirstAncestor("ContactImporter").Parent;
local v1 = require(l_Parent_0.Cryo);
local function v3(v2) --[[ Line: 5 ]] --[[ Name: isEmoji ]]
    if v2 >= 9728 and v2 <= 9983 or v2 >= 9984 and v2 <= 10175 or v2 >= 127744 and v2 <= 128511 or v2 >= 128512 and v2 <= 128591 or v2 >= 128640 and v2 <= 128767 or v2 >= 128768 and v2 <= 128895 or v2 >= 129280 and v2 <= 129535 or v2 >= 127462 and v2 <= 127487 or v2 >= 127344 and v2 <= 127569 or v2 >= 129536 and v2 <= 129791 then
        return true;
    else
        return false;
    end;
end;
local _ = function(v4) --[[ Line: 33 ]] --[[ Name: getStringHasEmoji ]]
    -- upvalues: v3 (copy)
    for _, v6 in utf8.codes(v4) do
        if v3(v6) then
            return true;
        end;
    end;
    return false;
end;
return function(v8) --[[ Line: 42 ]] --[[ Name: uprankContactsWithEmoji ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.List.sort(v8, function(v9, v10) --[[ Line: 43 ]]
        -- upvalues: v3 (ref)
        local v11 = false;
        local v12 = false;
        if v9.contactName and v10.contactName then
            local l_contactName_0 = v9.contactName;
            local v14;
            for _, v16 in utf8.codes(l_contactName_0) do
                if v3(v16) then
                    v14 = true;
                    v11 = true;
                end;
                if v11 then
                    break;
                end;
            end;
            if not v11 then
                v14 = false;
            end;
            v11 = false;
            local l_contactName_1 = v10.contactName;
            for _, v19 in utf8.codes(l_contactName_1) do
                if v3(v19) then
                    l_contactName_0 = true;
                    v12 = true;
                end;
                if v12 then
                    break;
                end;
            end;
            if not v12 then
                l_contactName_0 = false;
            end;
            v12 = false;
            if v14 ~= l_contactName_0 then
                return v14;
            elseif v9.contactName ~= v10.contactName then
                return string.upper(v9.contactName) < string.upper(v10.contactName);
            end;
        end;
        return (v9.contactId or "") < (v10.contactId or "");
    end);
end;