game:DefineFastString("DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist", "");
return {
    isWhitelistedUserId = function(v0) --[[ Line: 9 ]] --[[ Name: isWhitelistedUserId ]]
        local l_game_FastString_0 = game:GetFastString("DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist");
        for v2 in string.gmatch(l_game_FastString_0, "[^,]+") do
            if tostring(v0) == v2 then
                return true;
            end;
        end;
        return false;
    end
};