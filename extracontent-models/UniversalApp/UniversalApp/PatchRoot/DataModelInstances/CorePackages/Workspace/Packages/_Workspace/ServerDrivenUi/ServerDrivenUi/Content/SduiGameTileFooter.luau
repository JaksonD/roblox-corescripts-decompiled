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
local l_FFlagSduiClientBinding_0 = require(l_Parent_0.SharedFlags).FFlagSduiClientBinding;
return v2.memo(function(v12) --[[ Line: 36 ]] --[[ Name: SduiGameTileFooter ]]
    -- upvalues: l_FFlagSduiClientBinding_0 (copy), v9 (copy), l_FFlagLuaAppFixInlineSignalsReactPattern_0 (copy), v2 (copy), v3 (copy), v8 (copy), v7 (copy), l_Images_0 (copy), l_abbreviateCount_0 (copy)
    local v13 = nil;
    local v14 = nil;
    v14 = if l_FFlagSduiClientBinding_0 then v9.getInGameFriendsByGame else v12.sduiContext.dataStore.social.getInGameFriendsByGame;
    if l_FFlagLuaAppFixInlineSignalsReactPattern_0 then
        local v18 = v2.useCallback(function(v15) --[[ Line: 46 ]]
            -- upvalues: v14 (ref), v12 (copy)
            local v16 = v14(v15)[v12.universeId];
            if v16 then
                for _ in v16 do
                    return true;
                end;
            end;
            return false;
        end, {
            v14, 
            v12.universeId
        });
        v13 = v3.useSignalState(v18);
    else
        v13 = v3.useSignalState(function(v19) --[[ Line: 58 ]]
            -- upvalues: v14 (ref), v12 (copy)
            local v20 = v14(v19)[v12.universeId];
            if v20 then
                for _ in v20 do
                    return true;
                end;
            end;
            return false;
        end);
    end;
    if (v12.isSelected or v12.isHovered) and v12.ageRatingText and v12.ageRatingText ~= "" then
        return v2.createElement(v8, {
            leftText = v12.ageRatingText, 
            analyticsContext = v12.analyticsContext, 
            testId = "--sdui-game-tile-footer-age-rating"
        });
    elseif v13 then
        return v2.createElement(v7, {
            placeId = v12.placeId, 
            universeId = v12.universeId, 
            sduiContext = v12.sduiContext, 
            analyticsContext = v12.analyticsContext, 
            testId = "--sdui-game-tile-footer-active-friends", 
            hideBorder = true
        });
    elseif v12.ratingText and v12.ratingText ~= "" then
        local l_sduiContext_0 = v12.sduiContext;
        local l_ratingText_0 = v12.ratingText;
        local v24 = if v12.ratingText then l_Images_0["icons/status/games/rating_small"] else nil;
        local v25 = nil;
        local v26 = nil;
        if v12.playerCount ~= nil then
            v26 = v12.playerCount == -1 and "--" or l_abbreviateCount_0(v12.playerCount, l_sduiContext_0.dependencies.localization:GetLocale());
            v25 = l_Images_0["icons/status/games/people-playing_small"];
        end;
        return v2.createElement(v8, {
            sduiContext = v12.sduiContext, 
            leftText = l_ratingText_0, 
            leftIcon = v24, 
            rightText = v26, 
            rightIcon = v25, 
            testId = "--sdui-game-tile-footer-rating"
        });
    else
        return v12.footerComponent;
    end;
end);