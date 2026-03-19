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
local function v12(v10, v11) --[[ Line: 29 ]] --[[ Name: truncateSomeNames ]]
    if v11.shouldTruncateLongNames and #v10 >= 13 then
        return string.format("%s%s", string.sub(v10, 1, 12), "\226\128\166");
    else
        return v10;
    end;
end;
local function v18(v13, v14) --[[ Line: 36 ]] --[[ Name: getNamesListText ]]
    -- upvalues: v3 (copy), v12 (copy)
    local v15 = {};
    for v16 = 1, math.min(#v13, 3) do
        table.insert(v15, v13[v16]);
    end;
    return table.concat(v3.List.map(v15, function(v17) --[[ Line: 44 ]]
        -- upvalues: v12 (ref), v14 (copy)
        return v12(v17, v14);
    end), ", ");
end;
local function _(v19, v20, v21) --[[ Line: 51 ]] --[[ Name: getOthersText ]]
    local l_oneMutualFriendText_0 = v21.oneMutualFriendText;
    local l_pluralMutualFriendsText_0 = v21.pluralMutualFriendsText;
    local l_oneOtherMutualFriendText_0 = v21.oneOtherMutualFriendText;
    local l_pluralOtherMutualFriendsText_0 = v21.pluralOtherMutualFriendsText;
    if v19 == 1 then
        return l_oneMutualFriendText_0;
    elseif v19 <= 3 then
        return l_pluralMutualFriendsText_0;
    else
        local v26 = v19 - v20;
        return (("+ %* %*"):format(v26, if v26 == 1 then l_oneOtherMutualFriendText_0 else l_pluralOtherMutualFriendsText_0));
    end;
end;
local function _(v28, v29, v30, v31) --[[ Line: 74 ]] --[[ Name: getText ]]
    -- upvalues: v18 (copy)
    local v32 = v18(v29, v30);
    local v33 = math.min(#v29, 3);
    local l_oneMutualFriendText_1 = v31.oneMutualFriendText;
    local l_pluralMutualFriendsText_1 = v31.pluralMutualFriendsText;
    local l_oneOtherMutualFriendText_1 = v31.oneOtherMutualFriendText;
    local l_pluralOtherMutualFriendsText_1 = v31.pluralOtherMutualFriendsText;
    local v38;
    if v28 == 1 then
        v38 = l_oneMutualFriendText_1;
    elseif v28 <= 3 then
        v38 = l_pluralMutualFriendsText_1;
    else
        local v39 = v28 - v33;
        v38 = ("+ %* %*"):format(v39, if v39 == 1 then l_oneOtherMutualFriendText_1 else l_pluralOtherMutualFriendsText_1);
    end;
    return (("%* %*"):format(v32, v38));
end;
return function(v41) --[[ Line: 83 ]] --[[ Name: contextualPresence ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), v3 (copy), v9 (copy), v18 (copy), v2 (copy), l_PlayerContext_0 (copy), l_Images_0 (copy)
    local v42 = l_useLocalization_0({
        oneMutualFriendText = v5.OneMutualConnection, 
        pluralMutualFriendsText = v5.PluralMutualConnections, 
        oneOtherMutualFriendText = v5.OneOtherMutualConnection, 
        pluralOtherMutualFriendsText = v5.PluralOtherMutualConnections
    });
    local l_mutualFriendsCount_0 = v41.mutualFriendsCount;
    local v45 = v3.List.map(v41.mutualFriends, function(v44) --[[ Line: 93 ]]
        return (tostring(v44));
    end);
    local v46 = v9.Hooks.useUserProfilesFetch({
        userIds = v45, 
        query = v9.Queries.userProfilesCombinedNameByUserIds
    });
    local v47 = {};
    local v48 = "";
    local v49 = #v41.mutualFriends;
    if v46.data then
        for v50, v51 in ipairs(v45) do
            local v52 = v9.Selectors.getCombinedNameFromId(v46.data, v51);
            v48 = v48 .. v52;
            if v50 ~= v49 then
                v48 = v48 .. ", ";
            end;
            v47[v50] = v52;
        end;
    end;
    local v53 = {
        shouldTruncateLongNames = l_mutualFriendsCount_0 > 1
    };
    local v54 = v18(v47, v53);
    local v55 = math.min(#v47, 3);
    local l_oneMutualFriendText_2 = v42.oneMutualFriendText;
    local l_pluralMutualFriendsText_2 = v42.pluralMutualFriendsText;
    local l_oneOtherMutualFriendText_2 = v42.oneOtherMutualFriendText;
    local l_pluralOtherMutualFriendsText_2 = v42.pluralOtherMutualFriendsText;
    local v60;
    if l_mutualFriendsCount_0 == 1 then
        v60 = l_oneMutualFriendText_2;
    elseif l_mutualFriendsCount_0 <= 3 then
        v60 = l_pluralMutualFriendsText_2;
    else
        local v61 = l_mutualFriendsCount_0 - v55;
        v60 = ("+ %* %*"):format(v61, if v61 == 1 then l_oneOtherMutualFriendText_2 else l_pluralOtherMutualFriendsText_2);
    end;
    local v62 = ("%* %*"):format(v54, v60);
    return v2.createElement(l_PlayerContext_0, {
        icon = l_Images_0["icons/status/player/friend"], 
        text = v62, 
        textHeight = 30
    });
end;