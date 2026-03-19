local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_script_FirstAncestor_0.Utils.getMutualFriendsText);
return function(v4) --[[ Line: 12 ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy)
    local v5 = l_useLocalization_0({
        singularMutualConnection = "Feature.Friends.Label.MutualConnection", 
        mutualConnections = {
            "Feature.Friends.Label.MutualConnections"; 
            numConnections = v4
        }
    });
    return v3({
        mutualFriendsCount = v4, 
        localized = v5
    });
end;