local l_Parent_0 = script.Parent.Parent.Parent;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_getDeepValue_0 (copy)
    local l_keyPath_0 = v2.keyPath;
    return function(v4) --[[ Line: 8 ]]
        -- upvalues: l_getDeepValue_0 (ref), l_keyPath_0 (copy)
        local v5 = l_getDeepValue_0(v4, l_keyPath_0 .. ".byContactId") or {};
        local v6 = {};
        for v7, v8 in pairs(v5) do
            table.insert(v6, {
                contactId = v7, 
                contactName = v8.contactName, 
                headshotThumbnailUrl = v8.headshotThumbnailUrl, 
                avatarThumbnailUrl = v8.avatarThumbnailUrl
            });
        end;
        table.sort(v6, function(v9, v10) --[[ Line: 20 ]]
            if v9.contactName and v10.contactName and v9.contactName ~= v10.contactName then
                return v9.contactName < v10.contactName;
            else
                return v9.contactId < v10.contactId;
            end;
        end);
        return v6;
    end;
end;