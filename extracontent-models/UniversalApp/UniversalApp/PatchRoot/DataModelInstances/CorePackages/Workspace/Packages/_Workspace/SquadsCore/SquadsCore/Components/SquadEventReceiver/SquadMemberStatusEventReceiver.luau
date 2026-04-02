local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_Parent_0.Cryo);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoduxSquads);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_UserProfileStore_0 = require(l_Parent_0.UserProfiles).Stores.UserProfileStore;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useCurrentSquadSelector_0 = v5.Hooks.useCurrentSquadSelector;
return function() --[[ Line: 18 ]]
    -- upvalues: l_useCurrentSquadSelector_0 (copy), l_useLocalUserId_0 (copy), v4 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v2 (copy), l_GuiService_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_UserProfileStore_0 (copy)
    local v11 = l_useCurrentSquadSelector_0();
    local v12 = l_useLocalUserId_0();
    local v13 = v4.useRef(nil);
    local v14 = l_useLocalization_0({
        friendJoinedYourPartyText = "Feature.Squads.Label.FriendJoinedYourParty", 
        multiplePeopleJoinedYourPartyText = "Feature.Squads.Label.MultiplePeopleJoinedYourParty", 
        twoFriendsJoinedYourPartyText = "Feature.Squads.Label.TwoFriendsJoinedYourParty"
    });
    local v16 = v4.useCallback(function(v15) --[[ Line: 29 ]]
        return v15.Squad.UserBlocking.isBlockedByMe;
    end, {});
    local v17 = l_useSelector_0(v16);
    v4.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v11 (copy), v13 (copy), v2 (ref), v12 (copy), v17 (copy), l_GuiService_0 (ref), v14 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref), l_UserProfileStore_0 (ref)
        local v18 = if v11 then v11.members else nil;
        if v13.current and v18 then
            local v20 = v2.List.toSet(v2.List.map(v13.current, function(v19) --[[ Line: 39 ]]
                return (tostring(v19.userId));
            end));
            local v21 = {};
            for _, v23 in v18 do
                local v24 = tostring(v23.userId);
                if not v20[v24] and v24 ~= v12 and not v17[v24] then
                    table.insert(v21, v24);
                end;
            end;
            local v25 = #v21;
            if v25 > 0 then
                if v25 > 2 then
                    l_GuiService_0:SendNotification({
                        Title = v14.multiplePeopleJoinedYourPartyText, 
                        Icon = l_getStandardSizeAvatarHeadShotRbxthumb_0(v21[1])
                    });
                else
                    l_UserProfileStore_0.get().fetchNamesByUserIds(v21, function(v26) --[[ Line: 63 ]]
                        -- upvalues: v25 (copy), v14 (ref), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref), v21 (copy), l_GuiService_0 (ref)
                        if #v26.data > 0 and v26.status == "success" then
                            local v27 = if v25 == 1 then v14.friendJoinedYourPartyText:gsub("{(.-)}", {
                                combinedName = v26.data[1].names.getCombinedName(false)
                            }) else v14.twoFriendsJoinedYourPartyText:gsub("{(.-)}", {
                                combinedName1 = v26.data[1].names.getCombinedName(false), 
                                combinedName2 = v26.data[2].names.getCombinedName(false)
                            });
                            local v28 = if v25 == 1 then l_getStandardSizeAvatarHeadShotRbxthumb_0(v21[1]) else l_getStandardSizeAvatarHeadShotRbxthumb_0(v21[1]);
                            l_GuiService_0:SendNotification({
                                Title = v27, 
                                Icon = v28
                            });
                        end;
                    end);
                end;
            end;
        end;
        v13.current = v18;
    end, {
        v11 and v11.members
    });
    return nil;
end;