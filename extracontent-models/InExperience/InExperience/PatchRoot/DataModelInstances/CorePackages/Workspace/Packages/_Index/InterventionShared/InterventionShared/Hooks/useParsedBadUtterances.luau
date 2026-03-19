local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v3 = require(l_Parent_0.Cryo);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = require(l_Parent_0.RobloxAppLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.Utils.Types);
return function(v8) --[[ Line: 40 ]] --[[ Name: useParsedBadUtterances ]]
    -- upvalues: l_LocalPlayer_0 (copy), v5 (copy), l_useLocalization_0 (copy), v3 (copy)
    local v9 = {};
    local v10 = {};
    for _, v12 in v8 do
        local l_utteranceText_0 = v12.utteranceText;
        table.insert(v9, if l_LocalPlayer_0 then v5:Format("Feature.InExperienceIntervention.Label.Player", {
            username = l_LocalPlayer_0.Name, 
            evidence = l_utteranceText_0
        }) else l_utteranceText_0);
        v10[v12.labelTranslationKey] = "Feature.NotApproved." .. v12.labelTranslationKey;
    end;
    local v14 = l_useLocalization_0(v10);
    local v15 = {};
    for v16, _ in v10 do
        local v18 = v14[v16];
        if v18 and v18 ~= "" then
            v15[v18] = true;
        end;
    end;
    return {
        textItems = v3.List.reverse(v9), 
        abuseTypes = v3.Dictionary.keys(v15)
    };
end;