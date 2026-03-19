local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v7 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v7.Core.Style.useTextSizeOffset;
local l_CoPlayFooter_0 = v7.App.Tile.ExperienceTileMetadata.CoPlayFooter;
local v11 = require(l_Parent_0.UserProfiles);
local l_useUserProfilesFetch_0 = v11.Hooks.useUserProfilesFetch;
local v13 = require(l_script_FirstAncestor_0.sortFriendsByPresenceAndRecencyFactory);
local l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix;
local function v18(v15) --[[ Line: 37 ]] --[[ Name: getUserIdsForFacePile ]]
    local v16 = {};
    for v17 = 1, #v15 do
        v16[v17] = v15[v17].userId;
    end;
    return v16;
end;
local function v22(v19, v20) --[[ Line: 46 ]] --[[ Name: getDisplayName ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.join(l_Array_0.map(v19, function(v21) --[[ Line: 48 ]]
        return v21.displayName;
    end), v20);
end;
local function v28(v23) --[[ Line: 55 ]] --[[ Name: useFetchSortedDisplayNames ]]
    -- upvalues: l_useUserProfilesFetch_0 (copy), v11 (copy), v13 (copy)
    local v24 = {};
    local v25 = l_useUserProfilesFetch_0({
        userIds = v23, 
        query = v11.Queries.userProfilesCombinedNameByUserIds, 
        skip = not v23 or #v23 == 0
    });
    if v25 and v25.data and v23 then
        for _, v27 in v23 do
            table.insert(v24, {
                userId = v27, 
                displayName = v11.Selectors.getCombinedNameFromId(v25.data, v27)
            });
        end;
    end;
    table.sort(v24, v13("displayName"));
    return v24;
end;
return {
    GridTileFriendFooter = function(v29) --[[ Line: 77 ]] --[[ Name: GridTileFriendFooter ]]
        -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useLocalization_0 (copy), l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 (copy), v28 (copy), v2 (copy), l_CoPlayFooter_0 (copy), l_Array_0 (copy), l_Colors_0 (copy)
        local v30 = if v29.useLargerFont then l_useStyle_0().Font.Body else l_useStyle_0().Font.CaptionHeader;
        local l_Global_0 = l_useDesignTokens_0().Global;
        local v32 = l_useTextSizeOffset_0();
        local v33 = l_useLocalization_0({
            friendsSeparator = "Feature.GameDetails.Label.FriendsSeparator"
        });
        local l_Space_50_0 = l_Global_0.Space_50;
        if not v29.showOnlineBorder then
            l_Space_50_0 = l_Space_50_0 - 3;
        end;
        if l_FFlagLuaAppMigrateGameTileActiveFriendsHydrationFix_0 then
            local v35 = v28(v29.friendUserIds or {});
            local l_createElement_0 = v2.createElement;
            local v37 = "TextButton";
            local v38 = {
                Size = UDim2.new(1, 0, 0, l_Global_0.Space_250 + v32), 
                BackgroundTransparency = 1, 
                Text = "", 
                AutoButtonColor = false, 
                [v2.Event.Activated] = v29.onFriendFooterActivated, 
                Selectable = false
            };
            local v39 = {};
            local l_createElement_1 = v2.createElement;
            local l_l_CoPlayFooter_0_0 = l_CoPlayFooter_0;
            local v42 = {};
            local v43 = {};
            for v44 = 1, #v35 do
                v43[v44] = v35[v44].userId;
            end;
            v42.users = v43;
            v43 = v33.friendsSeparator;
            v42.labelText = l_Array_0.join(l_Array_0.map(v35, function(v45) --[[ Line: 48 ]]
                return v45.displayName;
            end), v43);
            v42.showEmphasisBorder = v29.showOnlineBorder;
            v42.faceGroupCount = 2;
            v42.styleProps = {
                faceWidth = l_Global_0.Size_250, 
                faceHeight = l_Global_0.Size_250, 
                faceGroupGap = -l_Global_0.Space_75, 
                containerGap = l_Space_50_0, 
                badgeBorderWidth = 3, 
                badgeHeight = l_Global_0.Size_250, 
                fontStyle = v30, 
                badgeSpacingLeading = l_Global_0.Space_50, 
                badgeSpacingTrailing = l_Global_0.Space_50, 
                badgeBackgroundColor = {
                    Color = l_Colors_0.Smoke, 
                    Transparency = 0
                }, 
                badgeContentColor = {
                    Color = l_Colors_0.White, 
                    Transparency = 0
                }
            };
            v39.OnlineFriends = l_createElement_1(l_l_CoPlayFooter_0_0, v42);
            return (l_createElement_0(v37, v38, v39));
        else
            local l_createElement_2 = v2.createElement;
            local v47 = "Frame";
            local v48 = {
                Size = UDim2.new(1, 0, 0, l_Global_0.Space_250 + v32), 
                BackgroundTransparency = 1
            };
            local v49 = {};
            local l_createElement_3 = v2.createElement;
            local l_l_CoPlayFooter_0_1 = l_CoPlayFooter_0;
            local v52 = {};
            local v53 = v29.friends or {};
            local v54 = {};
            for v55 = 1, #v53 do
                v54[v55] = v53[v55].userId;
            end;
            v52.users = v54;
            v53 = v29.friends or {};
            v54 = v33.friendsSeparator;
            v52.labelText = l_Array_0.join(l_Array_0.map(v53, function(v56) --[[ Line: 48 ]]
                return v56.displayName;
            end), v54);
            v52.showEmphasisBorder = v29.showOnlineBorder;
            v52.faceGroupCount = 2;
            v52.styleProps = {
                faceWidth = l_Global_0.Size_250, 
                faceHeight = l_Global_0.Size_250, 
                faceGroupGap = -l_Global_0.Space_75, 
                containerGap = l_Space_50_0, 
                badgeBorderWidth = 3, 
                badgeHeight = l_Global_0.Size_250, 
                fontStyle = v30, 
                badgeSpacingLeading = l_Global_0.Space_50, 
                badgeSpacingTrailing = l_Global_0.Space_50, 
                badgeBackgroundColor = {
                    Color = l_Colors_0.Smoke, 
                    Transparency = 0
                }, 
                badgeContentColor = {
                    Color = l_Colors_0.White, 
                    Transparency = 0
                }
            };
            v49.OnlineFriends = l_createElement_3(l_l_CoPlayFooter_0_1, v52);
            return l_createElement_2(v47, v48, v49);
        end;
    end, 
    getUserIdsForFacePile = v18, 
    getDisplayName = v22
};