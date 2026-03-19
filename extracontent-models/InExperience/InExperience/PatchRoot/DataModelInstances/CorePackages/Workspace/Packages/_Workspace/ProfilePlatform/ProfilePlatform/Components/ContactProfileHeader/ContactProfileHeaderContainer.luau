local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local v4 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v5 = require(l_script_FirstAncestor_0.Components.ContactProfileHeader.ContactProfileHeader);
return function(v6) --[[ Line: 18 ]] --[[ Name: ContactProfileHeaderContainer ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), v5 (copy)
    local v7 = v4(v3.Components.ContactProfileHeader);
    local l_contactName_0 = v7.contactName;
    local l_avatarThumbnailUrl_0 = v7.avatarThumbnailUrl;
    return v2.createElement(v5, {
        layoutOrder = v6.layoutOrder, 
        contactName = l_contactName_0, 
        avatarThumbnailUrl = l_avatarThumbnailUrl_0
    });
end;