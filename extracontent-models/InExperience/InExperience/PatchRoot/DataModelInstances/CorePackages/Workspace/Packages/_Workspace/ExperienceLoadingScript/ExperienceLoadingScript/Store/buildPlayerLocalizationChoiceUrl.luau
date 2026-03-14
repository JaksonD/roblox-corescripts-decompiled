local l_Parent_0 = script:FindFirstAncestor("ExperienceLoadingScript").Parent;
local l_Url_0 = require(l_Parent_0.CoreScriptsCommon).Url;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v3) --[[ Line: 8 ]] --[[ Name: buildPlayerLocalizationChoiceUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy)
    return l_UrlBuilder_0.new({
        base = l_Url_0.GAME_INTERNATIONALIZATION_URL, 
        path = "v1/user-localization-settings/player-choice/{universeId}"
    })({
        universeId = v3
    });
end;