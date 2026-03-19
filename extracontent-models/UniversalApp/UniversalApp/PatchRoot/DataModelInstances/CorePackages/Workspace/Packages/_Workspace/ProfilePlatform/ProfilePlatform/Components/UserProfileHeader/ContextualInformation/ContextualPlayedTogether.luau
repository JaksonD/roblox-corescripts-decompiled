local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_PlayerContext_0 = require(l_Parent_0.UIBlox).App.Indicator.PlayerContext;
return function(v6) --[[ Line: 16 ]] --[[ Name: ContextualPlayedTogether ]]
    -- upvalues: l_useLocalization_0 (copy), v4 (copy), v2 (copy), l_PlayerContext_0 (copy)
    local l_experienceName_0 = v6.experienceName;
    local v8 = l_useLocalization_0({
        playedTogetherText = if l_experienceName_0 ~= "" then {
            v4.PlayedTogetherInGameDescription; 
            experience_name = l_experienceName_0
        } else v4.PlayedTogether
    });
    return v2.createElement(l_PlayerContext_0, {
        text = v8.playedTogetherText
    });
end;