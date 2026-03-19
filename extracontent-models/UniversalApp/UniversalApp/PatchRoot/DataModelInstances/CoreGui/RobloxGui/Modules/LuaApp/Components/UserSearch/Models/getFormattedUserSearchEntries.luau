local v0 = require(script.Parent.UserSearchEntry);
return function(v1) --[[ Line: 3 ]] --[[ Name: getFormattedUserSearchEntries ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    if not v1 then
        return {};
    else
        for _, v4 in v1 do
            v0.fromOmniJsonData(v4):match(function(v5) --[[ Line: 13 ]]
                -- upvalues: v2 (copy)
                table.insert(v2, v5);
            end):matchError(function(v6) --[[ Line: 16 ]]
                warn("Failure in parsing UserSearchEntry: " .. v6);
            end);
        end;
        return v2;
    end;
end;