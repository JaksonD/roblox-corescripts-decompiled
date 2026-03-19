local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendRequestNicknames");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v3 = require(l_script_FirstAncestor_0.Flags.FStringSocialFriendsLayer);
local v4 = require(l_script_FirstAncestor_0.Flags.FStringCanSendNicknames);
local l_FFlagFriendRequestNicknames_0 = require(l_Parent_0.SharedFlags).FFlagFriendRequestNicknames;
local function v7(v6) --[[ Line: 13 ]]
    -- upvalues: l_FFlagFriendRequestNicknames_0 (copy), v3 (copy), v4 (copy)
    if not l_FFlagFriendRequestNicknames_0 then
        return false;
    else
        return (v6[v3] or {})[v4] == "True";
    end;
end;
return {
    FFlagFriendRequestNicknames = l_FFlagFriendRequestNicknames_0, 
    useFriendRequestNicknames = function() --[[ Line: 24 ]] --[[ Name: useFriendRequestNicknames ]]
        -- upvalues: l_FFlagFriendRequestNicknames_0 (copy), l_useUserExperiment_0 (copy), v3 (copy), v7 (copy)
        if not l_FFlagFriendRequestNicknames_0 then
            return false;
        else
            return (l_useUserExperiment_0({
                v3
            }, v7));
        end;
    end
};