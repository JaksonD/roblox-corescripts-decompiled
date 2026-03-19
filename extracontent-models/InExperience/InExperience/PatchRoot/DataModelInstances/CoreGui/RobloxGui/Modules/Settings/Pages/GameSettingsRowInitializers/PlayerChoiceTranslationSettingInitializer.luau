local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v6 = {
    [1] = "On", 
    [2] = "Off"
};
return function(v7, v8, v9) --[[ Line: 19 ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v4 (copy), v6 (copy)
    local v10 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    local v11 = v10:Format("Translation.PlayerChoiceSettings.GameSettings.PlayerChoiceSettingLabel");
    local v12 = v10:Format("Translation.PlayerChoiceSettings.GameSettings.PlayerChoiceSettingDescription");
    local v13 = l_LocalizationService_0:GetIsLoadingInternalTranslations() and 1 or 2;
    local v14, v15, v16 = v4:AddNewRow(v7, v11, "Selector", v6, v13, nil, v12);
    v7.PlayerChoiceTranslationFrame = v14;
    v7.PlayerChoiceSettingLabel = v15;
    v7.PlayerChoiceSettingMode = v16;
    v7.PlayerChoiceTranslationFrame.LayoutOrder = v8.PlayerChoiceTranslationFrame;
    v7.PlayerChoiceSettingMode.IndexChanged:connect(function(v17) --[[ Line: 38 ]]
        -- upvalues: v13 (copy), l_LocalizationService_0 (ref), v9 (copy)
        local v18 = v17 == 1;
        local v19 = v13 == 1;
        l_LocalizationService_0:IsLoadingInternalTranslationsSettingChanged(v18);
        v9("player_choice_translation", v19, v18);
    end);
    return v7.PlayerChoiceTranslationFrame, v7.PlayerChoiceSettingLabel, v7.PlayerChoiceSettingMode;
end;