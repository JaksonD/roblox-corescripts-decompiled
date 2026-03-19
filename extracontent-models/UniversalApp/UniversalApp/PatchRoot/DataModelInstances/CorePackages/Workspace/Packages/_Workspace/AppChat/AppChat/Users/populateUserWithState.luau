local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_getUserDisplayName_0 = require(l_script_FirstAncestor_0.SocialLibraries).User.getUserDisplayName;
local v4 = require(script.Parent.getThumbnailsForUserIds);
local v5 = require(l_script_FirstAncestor_0.Http.RoduxPresence);
local v6 = require(script.Parent.userPresenceUtils);
return function(v7, v8, v9) --[[ Line: 15 ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy), l_getUserDisplayName_0 (copy), v4 (copy)
    local v10 = v5.Selectors.getUserPresenceByUserId(v7, v8.id);
    local v11 = v6.getUserDisplayPresence(v10, v8.id == v7.LocalUserId);
    return v2.Dictionary.join(v8, {
        isLocalUser = v7.LocalUserId == v8.id, 
        displayName = if v9 then v9.names.combinedName else l_getUserDisplayName_0(v7, v8), 
        presenceText = v11.text, 
        presenceImage = v11.image, 
        thumbnail = v4({
            v8.id
        })[1]
    });
end;