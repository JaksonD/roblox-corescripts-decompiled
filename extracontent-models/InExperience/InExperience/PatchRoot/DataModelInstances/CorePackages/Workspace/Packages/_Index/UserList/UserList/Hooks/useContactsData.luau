local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Context.ContactsContext);
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v5) --[[ Line: 16 ]] --[[ Name: useContactsData ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v6 = v2.useContext(v3).contacts[v5];
    return v2.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v6 (copy)
        if v6 == nil then
            return nil;
        else
            return {
                isLoading = v6.isLoading or false, 
                name = v6.name or "", 
                avatarThumbnailUrl = v6.avatarThumbnailUrl or ""
            };
        end;
    end, {
        v5, 
        v6
    });
end;