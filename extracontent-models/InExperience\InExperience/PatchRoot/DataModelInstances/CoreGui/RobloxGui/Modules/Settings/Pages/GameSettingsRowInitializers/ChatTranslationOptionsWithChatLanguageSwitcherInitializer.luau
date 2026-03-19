local l_TextChatService_0 = game:GetService("TextChatService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
local l_GameSettings_0 = UserSettings().GameSettings;
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v9 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v10 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v11 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v12 = game:DefineFastFlag("FixChatLanguageSwitcherLabel", false);
local v13 = require(l_RobloxGui_0.Modules.Flags.GetFStringChatTranslationEnabledLocales);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceSettingsSaved");
local v15 = v11:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable");
return function(v16, v17, v18) --[[ Line: 29 ]]
    -- upvalues: l_Url_0 (copy), l_Players_0 (copy), l_HttpService_0 (copy), v10 (copy), v12 (copy), v9 (copy), v11 (copy), v15 (copy), l_GameSettings_0 (copy), l_LocalPlayer_0 (copy), l_TextChatService_0 (copy), l_game_EngineFeature_0 (copy), v13 (copy)
    local v19 = {
        [1] = "en_us"
    };
    local v20 = {
        en_us = 1
    };
    local v21 = {
        "English"
    };
    local v22 = l_Url_0.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"));
    local v23 = l_HttpService_0:RequestInternal({
        Url = v22, 
        Method = "GET"
    });
    local function v75(v24, v25) --[[ Line: 53 ]] --[[ Name: localeCodeToLanguageCodeMappingCallback ]]
        -- upvalues: v10 (ref), v12 (ref), v16 (copy), v9 (ref), v11 (ref), v15 (ref), v17 (copy), l_GameSettings_0 (ref), v19 (copy), l_LocalPlayer_0 (ref), l_TextChatService_0 (ref), v21 (copy), v18 (copy), l_game_EngineFeature_0 (ref)
        if not v24 then
            if v25 == nil then
                v25 = "Locales call did not set error message to non-nil value";
            end;
            v10:warning("GameSettings chat language selector initialization failed to get all required information; defaulting to unavailable for the remainder of this session. Error message: " .. v25);
            if v12 then
                local l_v16_0 = v16;
                local l_v16_1 = v16;
                local l_v16_2 = v16;
                local v29, v30, v31 = v9:AddNewRow(v16, v11:FormatByKey("Feature.SettingsHub.Chat.ChatLanguageSelectionLabel"), "DropDown", {
                    v15
                }, 1);
                l_v16_0.ChatLanguageSelectorFrame = v29;
                l_v16_1.ChatLanguageSelectorLabel = v30;
                l_v16_2.ChatLanguageSelectorMode = v31;
            else
                local l_v16_3 = v16;
                local l_v16_4 = v16;
                local l_v16_5 = v16;
                local v35, v36, v37 = v9:AddNewRow(v16, "Chat Language", "DropDown", {
                    v15
                }, 1);
                l_v16_3.ChatLanguageSelectorFrame = v35;
                l_v16_4.ChatLanguageSelectorLabel = v36;
                l_v16_5.ChatLanguageSelectorMode = v37;
            end;
            v16.ChatLanguageSelectorFrame.LayoutOrder = v17.ChatLanguageSelectorFrame;
        end;
        local v38 = nil;
        local l_ChatTranslationLocale_0 = l_GameSettings_0.ChatTranslationLocale;
        if l_ChatTranslationLocale_0 ~= "" then
            for v40, v41 in v19 do
                if v41 == l_ChatTranslationLocale_0 then
                    v38 = v40;
                end;
            end;
        end;
        if l_ChatTranslationLocale_0 == "" or v38 == nil then
            for v42, v43 in v19 do
                if v43 == l_LocalPlayer_0.LocaleId:gsub("-", "_") then
                    v38 = v42;
                    l_TextChatService_0.ChatTranslationEnabled = true;
                end;
            end;
        end;
        if v38 == nil then
            l_TextChatService_0.ChatTranslationEnabled = false;
            v38 = 1;
        else
            l_GameSettings_0.ChatTranslationLocale = v19[v38];
        end;
        l_LocalPlayer_0:SetChatTranslationSettingsLocaleId(v19[v38]);
        local v44 = v19[v38];
        if v12 then
            local l_v16_6 = v16;
            local l_v16_7 = v16;
            local l_v16_8 = v16;
            local v48, v49, v50 = v9:AddNewRow(v16, "Chat Translation Language", "DropDown", v21, v38);
            l_v16_6.ChatLanguageSelectorFrame = v48;
            l_v16_7.ChatLanguageSelectorLabel = v49;
            l_v16_8.ChatLanguageSelectorMode = v50;
        else
            local l_v16_9 = v16;
            local l_v16_10 = v16;
            local l_v16_11 = v16;
            local v54, v55, v56 = v9:AddNewRow(v16, "Chat Language", "DropDown", v21, v38);
            l_v16_9.ChatLanguageSelectorFrame = v54;
            l_v16_10.ChatLanguageSelectorLabel = v55;
            l_v16_11.ChatLanguageSelectorMode = v56;
        end;
        v16.ChatLanguageSelectorFrame.LayoutOrder = v17.ChatLanguageSelectorFrame;
        local function v60(v57) --[[ Line: 134 ]] --[[ Name: onChatSelectionIndexUpdated ]]
            -- upvalues: l_GameSettings_0 (ref), v19 (ref), l_LocalPlayer_0 (ref), v44 (ref), v18 (ref)
            local l_ChatTranslationLocale_1 = l_GameSettings_0.ChatTranslationLocale;
            local v59 = v19[v57];
            l_GameSettings_0.ChatTranslationLocale = v59;
            l_LocalPlayer_0:SetChatTranslationSettingsLocaleId(v59);
            v44 = v59;
            v18("chat_translation_locale", l_ChatTranslationLocale_1, v59);
        end;
        v16.ChatLanguageSelectorMode.IndexChanged:connect(v60);
        local v61 = l_TextChatService_0.ChatTranslationToggleEnabled and 1 or 2;
        local l_v16_12 = v16;
        local l_v16_13 = v16;
        local l_v16_14 = v16;
        local v65, v66, v67 = v9:AddNewRow(v16, v11:FormatByKey("Feature.SettingsHub.Chat.TranslationToggleSetting"), "Selector", {
            "On", 
            "Off"
        }, v61);
        l_v16_12.ChatTranslationToggleFrame = v65;
        l_v16_13.ChatTranslationToggleLabel = v66;
        l_v16_14.ChatTranslationToggleEnabler = v67;
        v16.ChatTranslationToggleFrame.LayoutOrder = v17.ChatTranslationToggleFrame;
        v16.ChatTranslationToggleEnabler.IndexChanged:connect(function(v68) --[[ Line: 161 ]]
            -- upvalues: l_TextChatService_0 (ref), l_game_EngineFeature_0 (ref), l_GameSettings_0 (ref), v18 (ref), v44 (ref)
            local v69 = v68 == 1;
            local l_ChatTranslationToggleEnabled_0 = l_TextChatService_0.ChatTranslationToggleEnabled;
            if v69 ~= l_ChatTranslationToggleEnabled_0 then
                if l_game_EngineFeature_0 then
                    l_GameSettings_0.ChatTranslationToggleEnabled = v69;
                else
                    l_TextChatService_0.ChatTranslationToggleEnabled = v69;
                end;
                v18("chat_translation_toggle", l_ChatTranslationToggleEnabled_0, v69, {
                    locale_id = v44
                });
            end;
        end);
        l_v16_12 = l_TextChatService_0.ChatTranslationEnabled and 1 or 2;
        if l_v16_12 == 2 then
            v16.ChatLanguageSelectorFrame.Visible = false;
            v16.ChatTranslationToggleFrame.Visible = false;
        end;
        l_v16_13 = v16;
        l_v16_14 = v16;
        v65 = v16;
        local v71;
        v66, v67, v71 = v9:AddNewRow(v16, v11:FormatByKey("Feature.SettingsHub.Chat.TranslationSetting"), "Selector", {
            "On", 
            "Off"
        }, l_v16_12);
        l_v16_13.ChatTranslationFrame = v66;
        l_v16_14.ChatTranslationLabel = v67;
        v65.ChatTranslationEnabler = v71;
        v16.ChatTranslationFrame.LayoutOrder = v17.ChatTranslationFrame;
        v16.ChatTranslationEnabler.IndexChanged:connect(function(v72) --[[ Line: 198 ]]
            -- upvalues: l_TextChatService_0 (ref), l_game_EngineFeature_0 (ref), l_GameSettings_0 (ref), v18 (ref), l_LocalPlayer_0 (ref), v16 (ref)
            local v73 = v72 == 1;
            local l_ChatTranslationEnabled_0 = l_TextChatService_0.ChatTranslationEnabled;
            if l_game_EngineFeature_0 then
                l_GameSettings_0.ChatTranslationEnabled = v73;
            else
                l_TextChatService_0.ChatTranslationEnabled = v73;
            end;
            v18("chat_translation", l_ChatTranslationEnabled_0, v73, {
                locale_id = l_LocalPlayer_0.LocaleId
            });
            if v72 == 1 then
                v16.ChatLanguageSelectorFrame.Visible = true;
                v16.ChatTranslationToggleFrame.Visible = true;
                return;
            else
                v16.ChatLanguageSelectorFrame.Visible = false;
                v16.ChatTranslationToggleFrame.Visible = false;
                return;
            end;
        end);
    end;
    v23:Start(function(v76, v77) --[[ Line: 223 ]]
        -- upvalues: l_HttpService_0 (ref), v13 (ref), v21 (copy), v19 (copy), v20 (copy), v10 (ref), v22 (copy), v75 (copy)
        local v78 = false;
        local v79 = nil;
        if not v76 then
            v79 = "Locale Code to Language Code Mapping Request: Connection error";
        elseif v77.StatusCode == 401 then
            v79 = "Locale Code to Language Code Mapping Request: Unauthorized";
        elseif v77.StatusCode < 200 or v77.StatusCode >= 400 then
            v79 = "Locale Code to Language Code Mapping Request Status code: " .. v77.StatusCode;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 234 ]]
                -- upvalues: l_HttpService_0 (ref), v77 (copy), v13 (ref), v21 (ref), v19 (ref), v20 (ref)
                local v80 = false;
                local v81 = l_HttpService_0:JSONDecode(v77.Body);
                local v82 = v13():gmatch("([^,]+)");
                local v83 = {};
                for v84 in v82 do
                    table.insert(v83, v84);
                end;
                local _ = function(v85) --[[ Line: 244 ]] --[[ Name: shouldAddLocaleAsChatTranslationOption ]]
                    -- upvalues: v83 (copy)
                    for _, v87 in v83 do
                        if v87 == v85 then
                            return true;
                        end;
                    end;
                    return false;
                end;
                local v89 = 2;
                for _, v91 in pairs(v81.data) do
                    local l_locale_0 = v91.locale.locale;
                    local l_name_0 = v91.locale.language.name;
                    if l_locale_0 == "en_us" then
                        v21[1] = l_name_0;
                    else
                        local v94;
                        for _, v96 in v83 do
                            if v96 == l_locale_0 then
                                v94 = true;
                                v80 = true;
                            end;
                            if v80 then
                                break;
                            end;
                        end;
                        if not v80 then
                            v94 = false;
                        end;
                        v80 = false;
                        if v94 then
                            table.insert(v21, l_name_0);
                            v19[v89] = l_locale_0;
                            v20[l_locale_0] = v89;
                            v89 = v89 + 1;
                        end;
                    end;
                end;
            end);
            v78 = l_status_0;
            v79 = l_result_0;
        end;
        if not v78 then
            v10:warning("GameSettings chat language selector initialization: Failed to get response from Localization API for " .. v22 .. " with error message: " .. v79);
        end;
        v75(v78, v79);
    end);
end;