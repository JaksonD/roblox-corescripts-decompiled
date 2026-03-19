local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local l_abbreviateCount_0 = require(l_Parent_0.Localization).abbreviateCount;
local l_Images_0 = require(l_Parent_0.FoundationImages).Images;
local _ = require(l_Parent_0.SduiCoreSystem);
local v7 = require(l_script_FirstAncestor_0.Content.SduiGameTileActiveFriendsFooter);
local v8 = require(l_script_FirstAncestor_0.Content.SduiTileFooter);
local v9 = require(l_script_FirstAncestor_0.DataStore.SduiInGameFriendsData);
local l_FFlagLuaAppFixInlineSignalsReactPattern_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixInlineSignalsReactPattern;
return v2.memo(function(v11) --[[ Line: 34 ]] --[[ Name: SduiGameTileFooter ]]
    -- upvalues: v9 (copy), l_FFlagLuaAppFixInlineSignalsReactPattern_0 (copy), v2 (copy), v3 (copy), v8 (copy), v7 (copy), l_Images_0 (copy), l_abbreviateCount_0 (copy)
    local v12 = nil;
    local l_getInGameFriendsByGame_0 = v9.getInGameFriendsByGame;
    if l_FFlagLuaAppFixInlineSignalsReactPattern_0 then
        local v17 = v2.useCallback(function(v14) --[[ Line: 39 ]]
            -- upvalues: l_getInGameFriendsByGame_0 (copy), v11 (copy)
            local v15 = l_getInGameFriendsByGame_0(v14)[v11.universeId];
            if v15 then
                for _ in v15 do
                    return true;
                end;
            end;
            return false;
        end, {
            l_getInGameFriendsByGame_0, 
            v11.universeId
        });
        v12 = v3.useSignalState(v17);
    else
        v12 = v3.useSignalState(function(v18) --[[ Line: 51 ]]
            -- upvalues: l_getInGameFriendsByGame_0 (copy), v11 (copy)
            local v19 = l_getInGameFriendsByGame_0(v18)[v11.universeId];
            if v19 then
                for _ in v19 do
                    return true;
                end;
            end;
            return false;
        end);
    end;
    if (v11.isSelected or v11.isHovered) and v11.ageRatingText and v11.ageRatingText ~= "" then
        return v2.createElement(v8, {
            leftText = v11.ageRatingText, 
            analyticsContext = v11.analyticsContext, 
            testId = "--sdui-game-tile-footer-age-rating"
        });
    elseif v12 then
        return v2.createElement(v7, {
            placeId = v11.placeId, 
            universeId = v11.universeId, 
            sduiContext = v11.sduiContext, 
            analyticsContext = v11.analyticsContext, 
            testId = "--sdui-game-tile-footer-active-friends", 
            hideBorder = true
        });
    elseif v11.ratingText and v11.ratingText ~= "" then
        local l_sduiContext_0 = v11.sduiContext;
        local l_ratingText_0 = v11.ratingText;
        local v23 = if v11.ratingText then l_Images_0["icons/status/games/rating_small"] else nil;
        local v24 = nil;
        local v25 = nil;
        if v11.playerCount ~= nil then
            v25 = v11.playerCount == -1 and "--" or l_abbreviateCount_0(v11.playerCount, l_sduiContext_0.dependencies.localization:GetLocale());
            v24 = l_Images_0["icons/status/games/people-playing_small"];
        end;
        return v2.createElement(v8, {
            sduiContext = v11.sduiContext, 
            leftText = l_ratingText_0, 
            leftIcon = v23, 
            rightText = v25, 
            rightIcon = v24, 
            testId = "--sdui-game-tile-footer-rating"
        });
    else
        return v11.footerComponent;
    end;
end);