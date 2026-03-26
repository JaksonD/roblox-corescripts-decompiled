local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v6 = require(l_Parent_0.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_PlayerContext_0 = v6.App.Indicator.PlayerContext;
local v9 = require(l_Parent_0.UserProfiles);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local function v13(v11, v12) --[[ Line: 31 ]] --[[ Name: truncateSomeNames ]]
    if v12.shouldTruncateLongNames and #v11 >= 13 then
        return string.format("%s%s", string.sub(v11, 1, 12), "\226\128\166");
    else
        return v11;
    end;
end;
local function v19(v14, v15) --[[ Line: 38 ]] --[[ Name: getNamesListText ]]
    -- upvalues: v3 (copy), v13 (copy)
    local v16 = {};
    for v17 = 1, math.min(#v14, 3) do
        table.insert(v16, v14[v17]);
    end;
    return table.concat(v3.List.map(v16, function(v18) --[[ Line: 46 ]]
        -- upvalues: v13 (ref), v15 (copy)
        return v13(v18, v15);
    end), ", ");
end;
local function _(v20, v21, v22) --[[ Line: 53 ]] --[[ Name: getOthersText ]]
    local l_oneMutualFriendText_0 = v22.oneMutualFriendText;
    local l_pluralMutualFriendsText_0 = v22.pluralMutualFriendsText;
    local l_oneOtherMutualFriendText_0 = v22.oneOtherMutualFriendText;
    local l_pluralOtherMutualFriendsText_0 = v22.pluralOtherMutualFriendsText;
    if v20 == 1 then
        return l_oneMutualFriendText_0;
    elseif v20 <= 3 then
        return l_pluralMutualFriendsText_0;
    else
        local v27 = v20 - v21;
        return (("+ %* %*"):format(v27, if v27 == 1 then l_oneOtherMutualFriendText_0 else l_pluralOtherMutualFriendsText_0));
    end;
end;
local function _(v29, v30, v31, v32) --[[ Line: 76 ]] --[[ Name: getText ]]
    -- upvalues: v19 (copy)
    local v33 = v19(v30, v31);
    local v34 = math.min(#v30, 3);
    local l_oneMutualFriendText_1 = v32.oneMutualFriendText;
    local l_pluralMutualFriendsText_1 = v32.pluralMutualFriendsText;
    local l_oneOtherMutualFriendText_1 = v32.oneOtherMutualFriendText;
    local l_pluralOtherMutualFriendsText_1 = v32.pluralOtherMutualFriendsText;
    local v39;
    if v29 == 1 then
        v39 = l_oneMutualFriendText_1;
    elseif v29 <= 3 then
        v39 = l_pluralMutualFriendsText_1;
    else
        local v40 = v29 - v34;
        v39 = ("+ %* %*"):format(v40, if v40 == 1 then l_oneOtherMutualFriendText_1 else l_pluralOtherMutualFriendsText_1);
    end;
    return (("%* %*"):format(v33, v39));
end;
return function(v42) --[[ Line: 85 ]] --[[ Name: contextualPresence ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v5 (copy), v3 (copy), v9 (copy), v19 (copy), v2 (copy), l_PlayerContext_0 (copy), l_Images_0 (copy)
    local v43 = l_useLocalization_0({
        oneMutualFriendText = if l_FFlagConnectionsToFriendsRename_0 then v5.OneMutualFriend else v5.OneMutualConnection, 
        pluralMutualFriendsText = if l_FFlagConnectionsToFriendsRename_0 then v5.PluralMutualFriends else v5.PluralMutualConnections, 
        oneOtherMutualFriendText = if l_FFlagConnectionsToFriendsRename_0 then v5.OneOtherMutualFriend else v5.OneOtherMutualConnection, 
        pluralOtherMutualFriendsText = if l_FFlagConnectionsToFriendsRename_0 then v5.PluralOtherMutualFriends else v5.PluralOtherMutualConnections
    });
    local l_mutualFriendsCount_0 = v42.mutualFriendsCount;
    local v46 = v3.List.map(v42.mutualFriends, function(v45) --[[ Line: 103 ]]
        return (tostring(v45));
    end);
    local v47 = v9.Hooks.useUserProfilesFetch({
        userIds = v46, 
        query = v9.Queries.userProfilesCombinedNameByUserIds
    });
    local v48 = {};
    local v49 = "";
    local v50 = #v42.mutualFriends;
    if v47.data then
        for v51, v52 in ipairs(v46) do
            local v53 = v9.Selectors.getCombinedNameFromId(v47.data, v52);
            v49 = v49 .. v53;
            if v51 ~= v50 then
                v49 = v49 .. ", ";
            end;
            v48[v51] = v53;
        end;
    end;
    local v54 = {
        shouldTruncateLongNames = l_mutualFriendsCount_0 > 1
    };
    local v55 = v19(v48, v54);
    local v56 = math.min(#v48, 3);
    local l_oneMutualFriendText_2 = v43.oneMutualFriendText;
    local l_pluralMutualFriendsText_2 = v43.pluralMutualFriendsText;
    local l_oneOtherMutualFriendText_2 = v43.oneOtherMutualFriendText;
    local l_pluralOtherMutualFriendsText_2 = v43.pluralOtherMutualFriendsText;
    local v61;
    if l_mutualFriendsCount_0 == 1 then
        v61 = l_oneMutualFriendText_2;
    elseif l_mutualFriendsCount_0 <= 3 then
        v61 = l_pluralMutualFriendsText_2;
    else
        local v62 = l_mutualFriendsCount_0 - v56;
        v61 = ("+ %* %*"):format(v62, if v62 == 1 then l_oneOtherMutualFriendText_2 else l_pluralOtherMutualFriendsText_2);
    end;
    local v63 = ("%* %*"):format(v55, v61);
    return v2.createElement(l_PlayerContext_0, {
        icon = l_Images_0["icons/status/player/friend"], 
        text = v63, 
        textHeight = 30
    });
end;