local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.getDeepValue);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local l_keyPath_0 = v2.keyPath;
    return function(v4) --[[ Line: 6 ]]
        -- upvalues: v1 (ref), l_keyPath_0 (copy)
        local v5 = v1(v4, l_keyPath_0 .. ".byContactId") or {};
        local v6 = {};
        for v7, v8 in pairs(v5) do
            table.insert(v6, {
                contactId = v7, 
                contactName = v8.contactName
            });
        end;
        table.sort(v6, function(v9, v10) --[[ Line: 13 ]]
            if v9.contactName and v10.contactName and v9.contactName ~= v10.contactName then
                return v9.contactName < v10.contactName;
            else
                return v9.contactId < v10.contactId;
            end;
        end);
        return v6;
    end;
end;