game:DefineFastFlag("InGameLargerRobuxUpsellIXP", false);
game:DefineFastFlag("InGameLargerRobuxUpsellIXPRolledOut", false);
game:DefineFastFlag("InGameLargerRobuxUpsellEnabled", false);
game:DefineFastString("InGameLargerRobuxUpsellIXPLayerParam", "isInExperiment");
local function v0() --[[ Line: 16 ]] --[[ Name: isEnabledForAll ]]
    return game:GetFastFlag("InGameLargerRobuxUpsellEnabled");
end;
local function _() --[[ Line: 20 ]] --[[ Name: isRolledOut ]]
    return game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXPRolledOut");
end;
return {
    isEnabled = function() --[[ Line: 24 ]] --[[ Name: isEnabled ]]
        return game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXP");
    end, 
    isEnabledForAll = v0, 
    isUserEnrolled = function(v2) --[[ Line: 28 ]] --[[ Name: isUserEnrolled ]]
        if game:GetFastFlag("InGameLargerRobuxUpsellEnabled") then
            return true;
        elseif not (game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXP")) then
            return false;
        else
            v2 = v2 or {};
            local l_game_FastString_0 = game:GetFastString("InGameLargerRobuxUpsellIXPLayerParam");
            if v2[l_game_FastString_0] == nil then
                return game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXPRolledOut");
            else
                return v2[l_game_FastString_0];
            end;
        end;
    end
};