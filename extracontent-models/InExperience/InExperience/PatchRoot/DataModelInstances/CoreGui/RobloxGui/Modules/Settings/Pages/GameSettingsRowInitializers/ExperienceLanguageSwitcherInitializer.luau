local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v8 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v9 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v10 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_game_EngineFeature_0 = game:GetEngineFeature("UgcLocaleFromGameJoinEnabled");
return function(v12, v13, v14) --[[ Line: 23 ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v8 (copy), v10 (copy), v9 (copy), l_game_EngineFeature_0 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy)
    local v15 = 1;
    local v16 = 1;
    local v17 = false;
    local v18 = nil;
    local v19 = l_Players_0.LocalPlayer.LocaleId:gsub("-", "_");
    local v20 = nil;
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {};
    local v25 = {
        sq = "sq_al", 
        ar = "ar_001", 
        bn = "bn_bd", 
        nb = "nb_no", 
        bs = "bs_ba", 
        bg = "bg_bg", 
        my = "my_mm", 
        ["zh-hans"] = "zh_cn", 
        ["zh-hant"] = "zh_tw", 
        hr = "hr_hr", 
        cs = "cs_cz", 
        da = "da_dk", 
        nl = "nl_nl", 
        en = "en_us", 
        et = "et_ee", 
        fil = "fil_ph", 
        fi = "fi_fi", 
        fr = "fr_fr", 
        ka = "ka_ge", 
        de = "de_de", 
        el = "el_gr", 
        hi = "hi_in", 
        hu = "hu_hu", 
        id = "id_id", 
        it = "it_it", 
        ja = "ja_jp", 
        kk = "kk_kz", 
        km = "km_kh", 
        ko = "ko_kr", 
        lv = "lv_lv", 
        lt = "lt_lt", 
        ms = "ms_my", 
        pl = "pl_pl", 
        pt = "pt_br", 
        ro = "ro_ro", 
        ru = "ru_ru", 
        sr = "sr_rs", 
        si = "si_lk", 
        sk = "sk_sk", 
        sl = "sl_sl", 
        es = "es_es", 
        sv = "sv_se", 
        th = "th_th", 
        tr = "tr_tr", 
        uk = "uk_ua", 
        vi = "vi_vn"
    };
    local v26 = {};
    local v27 = {};
    local v28 = l_Url_0.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"));
    local v29 = l_HttpService_0:RequestInternal({
        Url = v28, 
        Method = "GET"
    });
    local v30 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId);
    local v31 = l_HttpService_0:RequestInternal({
        Url = v30, 
        Method = "GET"
    });
    local v32 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId);
    local v33 = l_HttpService_0:RequestInternal({
        Url = v32, 
        Method = "GET"
    });
    local v34 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
    local v35 = l_HttpService_0:RequestInternal({
        Url = v34, 
        Method = "GET"
    });
    local function _(v36, v37) --[[ Line: 135 ]] --[[ Name: tryGetErrorMessage ]]
        local v38 = nil;
        if not v36 or not v37 or not v37.StatusCode then
            return "Connection error";
        elseif v37.StatusCode == 401 then
            return "Unauthorized";
        else
            if v37.StatusCode < 200 or v37.StatusCode >= 400 then
                v38 = v37.StatusCode;
            end;
            return v38;
        end;
    end;
    local function v46() --[[ Line: 148 ]] --[[ Name: createSessionDormantLanguageSwitcherRow ]]
        -- upvalues: v12 (copy), v8 (ref), v10 (ref), v13 (copy)
        local l_v12_0 = v12;
        local l_v12_1 = v12;
        local l_v12_2 = v12;
        local v43, v44, v45 = v8:AddNewRow(v12, v10:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
            v10:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
        }, 1);
        l_v12_0.LanguageSelectorFrame = v43;
        l_v12_1.LanguageSelectorLabel = v44;
        l_v12_2.LanguageSelectorMode = v45;
        v12.LanguageSelectorMode:SetInteractable(false);
        v12.LanguageSelectorFrame.LayoutOrder = v13.LanguageSelectorFrame;
    end;
    local function v79(v47, v48) --[[ Line: 164 ]] --[[ Name: userExperienceLanguageSettingsCallback ]]
        -- upvalues: v9 (ref), v46 (copy), v22 (copy), v20 (ref), v18 (ref), v27 (copy), v23 (copy), v21 (copy), v15 (ref), v16 (ref), v12 (copy), v8 (ref), v10 (ref), v13 (copy), l_game_EngineFeature_0 (ref), l_LocalPlayer_0 (ref), v14 (copy), l_Url_0 (ref), l_HttpService_0 (ref), v17 (ref), l_RunService_0 (ref)
        if not v47 then
            if v48 == nil then
                v48 = "Execution path did not set earliest error to non-nil value.";
            end;
            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v48);
            v46();
            return;
        else
            local v49 = false;
            for _, v51 in v22 do
                if v51 == v20 then
                    v49 = true;
                end;
                if v51 ~= v18 then
                    table.insert(v27, v23[v51].localeName);
                end;
            end;
            table.sort(v27);
            local v52 = true;
            if v18 == nil or v23[v18].localeName == nil then
                v52 = false;
            end;
            if not v52 then
                v46();
                return;
            else
                table.insert(v27, 1, v23[v18].localeName .. " (Original)");
                if v49 == true then
                    for v53, v54 in v27 do
                        if v53 ~= 1 and v21[v54] == v20 then
                            v15 = v53;
                            v16 = v53;
                        end;
                    end;
                end;
                local l_v12_3 = v12;
                local l_v12_4 = v12;
                local l_v12_5 = v12;
                local v58, v59, v60 = v8:AddNewRow(v12, v10:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v27, v15);
                l_v12_3.LanguageSelectorFrame = v58;
                l_v12_4.LanguageSelectorLabel = v59;
                l_v12_5.LanguageSelectorMode = v60;
                v12.LanguageSelectorFrame.LayoutOrder = v13.LanguageSelectorFrame;
                if not l_game_EngineFeature_0 then
                    if v15 == 1 then
                        l_LocalPlayer_0:SetExperienceSettingsLocaleId(v18);
                    else
                        l_v12_3 = v21[v27[v15]];
                        l_LocalPlayer_0:SetExperienceSettingsLocaleId(l_v12_3);
                    end;
                end;
                v12.LanguageSelectorMode.CurrentLocale = v12.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text;
                l_v12_3 = function(v61) --[[ Line: 252 ]] --[[ Name: toggleTranslation ]]
                    -- upvalues: v12 (ref), v23 (ref), v18 (ref), v21 (ref), v27 (ref), v14 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v16 (ref), l_LocalPlayer_0 (ref), v9 (ref), v17 (ref), l_RunService_0 (ref)
                    v12.LanguageSelectorMode:SetInteractable(false);
                    local v62 = nil;
                    v62 = if v61 == 1 and v23[v18] ~= nil then v23[v18].localeId else v23[v21[v27[v61]]].localeId;
                    local l_CurrentLocale_0 = v12.LanguageSelectorMode.CurrentLocale;
                    local v64 = v27[v61];
                    if l_CurrentLocale_0 ~= v64 then
                        v12.LanguageSelectorMode.CurrentLocale = v64;
                        v14("experience_locale", l_CurrentLocale_0, v64);
                    end;
                    local v65 = {
                        settingValue = {
                            settingType = "SupportedLocale", 
                            settingTargetId = v62
                        }
                    };
                    local v66 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
                    local v67 = l_HttpService_0:RequestInternal({
                        Url = v66, 
                        Method = "POST", 
                        Headers = {
                            ["Content-Type"] = "application/json"
                        }, 
                        Body = l_HttpService_0:JSONEncode(v65)
                    });
                    local function v71(v68, v69) --[[ Line: 301 ]] --[[ Name: userExperienceLanguageSettingsUpdateCallback ]]
                        -- upvalues: v16 (ref), v61 (copy), l_LocalPlayer_0 (ref), v18 (ref), v21 (ref), v27 (ref), v9 (ref), v17 (ref), v12 (ref)
                        if v68 then
                            v16 = v61;
                            if v61 == 1 then
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v18);
                            else
                                local v70 = v21[v27[v61]];
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v70);
                            end;
                        else
                            v9:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. v69);
                            v17 = true;
                            v12.LanguageSelectorMode:SetSelectionIndex(v16);
                        end;
                        v12.LanguageSelectorMode:SetInteractable(true);
                    end;
                    if l_RunService_0:IsStudio() then
                        v16 = v61;
                        if v61 == 1 then
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v18);
                        else
                            local v72 = v21[v27[v61]];
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v72);
                        end;
                        v12.LanguageSelectorMode:SetInteractable(true);
                        return;
                    elseif v17 then
                        v17 = false;
                        v16 = v61;
                        if v61 == 1 then
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v18);
                        else
                            local v73 = v21[v27[v61]];
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v73);
                        end;
                        v12.LanguageSelectorMode:SetInteractable(true);
                        return;
                    elseif v62 == nil then
                        v9:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. nil);
                        v17 = true;
                        v12.LanguageSelectorMode:SetSelectionIndex(v16);
                        v12.LanguageSelectorMode:SetInteractable(true);
                        return;
                    else
                        v67:Start(function(v74, v75) --[[ Line: 345 ]]
                            -- upvalues: v9 (ref), v66 (copy), v71 (copy)
                            local v76 = false;
                            local v77 = nil;
                            local v78 = nil;
                            if not v74 or not v75 or not v75.StatusCode then
                                v78 = "Connection error";
                            elseif v75.StatusCode == 401 then
                                v78 = "Unauthorized";
                            elseif v75.StatusCode < 200 or v75.StatusCode >= 400 then
                                v78 = v75.StatusCode;
                            end;
                            v77 = v78;
                            if v77 ~= nil then
                                v77 = "User Experience Language Settings Update Request: " .. v77;
                                v9:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v66 .. " with error message: " .. v77);
                            else
                                v9:info("User Experience Language Settings Update Request: " .. "Succeeded with code - " .. v75.StatusCode);
                                v76 = true;
                            end;
                            v71(v76, v77);
                        end);
                        return;
                    end;
                end;
                v12.LanguageSelectorMode.IndexChanged:connect(l_v12_3);
                return;
            end;
        end;
    end;
    local function _(v80, v81) --[[ Line: 374 ]] --[[ Name: experienceSourceLanguageCallback ]]
        -- upvalues: v35 (copy), l_HttpService_0 (ref), v20 (ref), v19 (copy), v18 (ref), v26 (copy), v24 (copy), v9 (ref), v34 (copy), v79 (copy), v46 (copy)
        if v80 then
            v35:Start(function(v82, v83) --[[ Line: 376 ]]
                -- upvalues: l_HttpService_0 (ref), v20 (ref), v19 (ref), v18 (ref), v26 (ref), v24 (ref), v9 (ref), v34 (ref), v79 (ref)
                local v84 = false;
                local v85 = nil;
                local v86 = nil;
                if not v82 or not v83 or not v83.StatusCode then
                    v86 = "Connection error";
                elseif v83.StatusCode == 401 then
                    v86 = "Unauthorized";
                elseif v83.StatusCode < 200 or v83.StatusCode >= 400 then
                    v86 = v83.StatusCode;
                end;
                v85 = v86;
                if v85 ~= nil then
                    v85 = "User Experience Language Setting Get Request: " .. v85;
                else
                    local v87;
                    v86, v87 = pcall(function() --[[ Line: 385 ]]
                        -- upvalues: l_HttpService_0 (ref), v83 (copy), v20 (ref), v19 (ref), v18 (ref), v26 (ref), v24 (ref)
                        local l_userUniverseLocalizationSettingValue_0 = l_HttpService_0:JSONDecode(v83.Body).userUniverseLocalizationSettingValue;
                        if l_userUniverseLocalizationSettingValue_0 == nil then
                            v20 = v19;
                            return;
                        else
                            local l_settingTargetId_0 = l_userUniverseLocalizationSettingValue_0.settingTargetId;
                            local l_settingType_0 = l_userUniverseLocalizationSettingValue_0.settingType;
                            if l_settingTargetId_0 == nil then
                                v20 = v19;
                            end;
                            if l_settingType_0 == "SourceOrTranslation" then
                                if l_settingTargetId_0 == 1 then
                                    v20 = v18;
                                    return;
                                else
                                    v20 = v19;
                                    return;
                                end;
                            elseif l_settingType_0 == "LanguageFamily" then
                                if v26[l_settingTargetId_0] == nil then
                                    v20 = v19;
                                    return;
                                else
                                    v20 = v24[v26[l_settingTargetId_0]];
                                    return;
                                end;
                            else
                                if l_settingType_0 == "SupportedLocale" then
                                    if v24[l_settingTargetId_0] == nil then
                                        v20 = v19;
                                        return;
                                    else
                                        v20 = v24[l_settingTargetId_0];
                                    end;
                                end;
                                return;
                            end;
                        end;
                    end);
                    v84 = v86;
                    v85 = v87;
                end;
                if not v84 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v34 .. " with error message: " .. v85);
                end;
                v79(v84, v85);
            end);
            return;
        else
            local l_v81_0 = v81;
            if l_v81_0 == nil then
                l_v81_0 = "Execution path did not set earliest error to non-nil value.";
            end;
            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v81_0);
            v46();
            return;
        end;
    end;
    local function _(v93, v94) --[[ Line: 451 ]] --[[ Name: experienceSupportedLanguagesCallback ]]
        -- upvalues: v31 (copy), l_HttpService_0 (ref), v18 (ref), v25 (copy), v9 (ref), v30 (copy), v35 (copy), v20 (ref), v19 (copy), v26 (copy), v24 (copy), v34 (copy), v79 (copy), v46 (copy)
        if v93 then
            v31:Start(function(v95, v96) --[[ Line: 453 ]]
                -- upvalues: l_HttpService_0 (ref), v18 (ref), v25 (ref), v9 (ref), v30 (ref), v94 (ref), v93 (copy), v35 (ref), v20 (ref), v19 (ref), v26 (ref), v24 (ref), v34 (ref), v79 (ref), v46 (ref)
                local v97 = false;
                local v98 = nil;
                local v99 = nil;
                if not v95 or not v96 or not v96.StatusCode then
                    v99 = "Connection error";
                elseif v96.StatusCode == 401 then
                    v99 = "Unauthorized";
                elseif v96.StatusCode < 200 or v96.StatusCode >= 400 then
                    v99 = v96.StatusCode;
                end;
                v98 = v99;
                if v98 ~= nil then
                    v98 = "Experience Source Language Request: " .. v98;
                else
                    local v100;
                    v99, v100 = pcall(function() --[[ Line: 462 ]]
                        -- upvalues: l_HttpService_0 (ref), v96 (copy), v18 (ref), v25 (ref)
                        v18 = v25[l_HttpService_0:JSONDecode(v96.Body).languageCode];
                    end);
                    v97 = v99;
                    v98 = v100;
                end;
                if not v97 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v30 .. " with error message: " .. v98);
                end;
                if v94 == nil then
                    v94 = v98;
                end;
                v99 = v97 and v93;
                local l_v94_0 = v94;
                if v99 then
                    v35:Start(function(v102, v103) --[[ Line: 376 ]]
                        -- upvalues: l_HttpService_0 (ref), v20 (ref), v19 (ref), v18 (ref), v26 (ref), v24 (ref), v9 (ref), v34 (ref), v79 (ref)
                        local v104 = false;
                        local v105 = nil;
                        local v106 = nil;
                        if not v102 or not v103 or not v103.StatusCode then
                            v106 = "Connection error";
                        elseif v103.StatusCode == 401 then
                            v106 = "Unauthorized";
                        elseif v103.StatusCode < 200 or v103.StatusCode >= 400 then
                            v106 = v103.StatusCode;
                        end;
                        v105 = v106;
                        if v105 ~= nil then
                            v105 = "User Experience Language Setting Get Request: " .. v105;
                        else
                            local v107;
                            v106, v107 = pcall(function() --[[ Line: 385 ]]
                                -- upvalues: l_HttpService_0 (ref), v103 (copy), v20 (ref), v19 (ref), v18 (ref), v26 (ref), v24 (ref)
                                local l_userUniverseLocalizationSettingValue_1 = l_HttpService_0:JSONDecode(v103.Body).userUniverseLocalizationSettingValue;
                                if l_userUniverseLocalizationSettingValue_1 == nil then
                                    v20 = v19;
                                    return;
                                else
                                    local l_settingTargetId_1 = l_userUniverseLocalizationSettingValue_1.settingTargetId;
                                    local l_settingType_1 = l_userUniverseLocalizationSettingValue_1.settingType;
                                    if l_settingTargetId_1 == nil then
                                        v20 = v19;
                                    end;
                                    if l_settingType_1 == "SourceOrTranslation" then
                                        if l_settingTargetId_1 == 1 then
                                            v20 = v18;
                                            return;
                                        else
                                            v20 = v19;
                                            return;
                                        end;
                                    elseif l_settingType_1 == "LanguageFamily" then
                                        if v26[l_settingTargetId_1] == nil then
                                            v20 = v19;
                                            return;
                                        else
                                            v20 = v24[v26[l_settingTargetId_1]];
                                            return;
                                        end;
                                    else
                                        if l_settingType_1 == "SupportedLocale" then
                                            if v24[l_settingTargetId_1] == nil then
                                                v20 = v19;
                                                return;
                                            else
                                                v20 = v24[l_settingTargetId_1];
                                            end;
                                        end;
                                        return;
                                    end;
                                end;
                            end);
                            v104 = v106;
                            v105 = v107;
                        end;
                        if not v104 then
                            v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v34 .. " with error message: " .. v105);
                        end;
                        v79(v104, v105);
                    end);
                    return;
                else
                    local l_l_v94_0_0 = l_v94_0;
                    if l_l_v94_0_0 == nil then
                        l_l_v94_0_0 = "Execution path did not set earliest error to non-nil value.";
                    end;
                    v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v94_0_0);
                    v46();
                    return;
                end;
            end);
        else
            local l_v94_1 = v94;
            if l_v94_1 == nil then
                l_v94_1 = "Execution path did not set earliest error to non-nil value.";
            end;
            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v94_1);
            v46();
        end;
    end;
    local _ = function(v114, v115) --[[ Line: 493 ]] --[[ Name: localeInformationCallback ]]
        -- upvalues: v33 (copy), l_HttpService_0 (ref), v23 (copy), v22 (copy), v9 (ref), v32 (copy), v31 (copy), v18 (ref), v25 (copy), v30 (copy), v35 (copy), v20 (ref), v19 (copy), v26 (copy), v24 (copy), v34 (copy), v79 (copy), v46 (copy)
        if v114 then
            v33:Start(function(v116, v117) --[[ Line: 495 ]]
                -- upvalues: l_HttpService_0 (ref), v23 (ref), v22 (ref), v9 (ref), v32 (ref), v115 (ref), v114 (copy), v31 (ref), v18 (ref), v25 (ref), v30 (ref), v35 (ref), v20 (ref), v19 (ref), v26 (ref), v24 (ref), v34 (ref), v79 (ref), v46 (ref)
                local v118 = false;
                local v119 = nil;
                local v120 = nil;
                if not v116 or not v117 or not v117.StatusCode then
                    v120 = "Connection error";
                elseif v117.StatusCode == 401 then
                    v120 = "Unauthorized";
                elseif v117.StatusCode < 200 or v117.StatusCode >= 400 then
                    v120 = v117.StatusCode;
                end;
                v119 = v120;
                if v119 ~= nil then
                    v119 = "Experience Supported Language Language Request: " .. v119;
                else
                    local v121;
                    v120, v121 = pcall(function() --[[ Line: 503 ]]
                        -- upvalues: l_HttpService_0 (ref), v117 (copy), v23 (ref), v22 (ref)
                        local v122 = l_HttpService_0:JSONDecode(v117.Body);
                        local v123 = {};
                        for v124, v125 in pairs(v122.data) do
                            v123[v124] = v125.languageCode;
                        end;
                        for _, v127 in v123 do
                            for v128, v129 in v23 do
                                if v129.languageCode == v127 then
                                    table.insert(v22, v128);
                                end;
                            end;
                        end;
                    end);
                    v118 = v120;
                    v119 = v121;
                end;
                if not v118 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v32 .. " with error message: " .. v119);
                end;
                if v115 == nil then
                    v115 = v119;
                end;
                v120 = v118 and v114;
                local l_v115_0 = v115;
                if v120 then
                    v31:Start(function(v131, v132) --[[ Line: 453 ]]
                        -- upvalues: l_HttpService_0 (ref), v18 (ref), v25 (ref), v9 (ref), v30 (ref), l_v115_0 (ref), v120 (copy), v35 (ref), v20 (ref), v19 (ref), v26 (ref), v24 (ref), v34 (ref), v79 (ref), v46 (ref)
                        local v133 = false;
                        local v134 = nil;
                        local v135 = nil;
                        if not v131 or not v132 or not v132.StatusCode then
                            v135 = "Connection error";
                        elseif v132.StatusCode == 401 then
                            v135 = "Unauthorized";
                        elseif v132.StatusCode < 200 or v132.StatusCode >= 400 then
                            v135 = v132.StatusCode;
                        end;
                        v134 = v135;
                        if v134 ~= nil then
                            v134 = "Experience Source Language Request: " .. v134;
                        else
                            local v136;
                            v135, v136 = pcall(function() --[[ Line: 462 ]]
                                -- upvalues: l_HttpService_0 (ref), v132 (copy), v18 (ref), v25 (ref)
                                v18 = v25[l_HttpService_0:JSONDecode(v132.Body).languageCode];
                            end);
                            v133 = v135;
                            v134 = v136;
                        end;
                        if not v133 then
                            v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v30 .. " with error message: " .. v134);
                        end;
                        if l_v115_0 == nil then
                            l_v115_0 = v134;
                        end;
                        v135 = v133 and v120;
                        local l_l_v115_0_0 = l_v115_0;
                        if v135 then
                            v35:Start(function(v138, v139) --[[ Line: 376 ]]
                                -- upvalues: l_HttpService_0 (ref), v20 (ref), v19 (ref), v18 (ref), v26 (ref), v24 (ref), v9 (ref), v34 (ref), v79 (ref)
                                local v140 = false;
                                local v141 = nil;
                                local v142 = nil;
                                if not v138 or not v139 or not v139.StatusCode then
                                    v142 = "Connection error";
                                elseif v139.StatusCode == 401 then
                                    v142 = "Unauthorized";
                                elseif v139.StatusCode < 200 or v139.StatusCode >= 400 then
                                    v142 = v139.StatusCode;
                                end;
                                v141 = v142;
                                if v141 ~= nil then
                                    v141 = "User Experience Language Setting Get Request: " .. v141;
                                else
                                    local v143;
                                    v142, v143 = pcall(function() --[[ Line: 385 ]]
                                        -- upvalues: l_HttpService_0 (ref), v139 (copy), v20 (ref), v19 (ref), v18 (ref), v26 (ref), v24 (ref)
                                        local l_userUniverseLocalizationSettingValue_2 = l_HttpService_0:JSONDecode(v139.Body).userUniverseLocalizationSettingValue;
                                        if l_userUniverseLocalizationSettingValue_2 == nil then
                                            v20 = v19;
                                            return;
                                        else
                                            local l_settingTargetId_2 = l_userUniverseLocalizationSettingValue_2.settingTargetId;
                                            local l_settingType_2 = l_userUniverseLocalizationSettingValue_2.settingType;
                                            if l_settingTargetId_2 == nil then
                                                v20 = v19;
                                            end;
                                            if l_settingType_2 == "SourceOrTranslation" then
                                                if l_settingTargetId_2 == 1 then
                                                    v20 = v18;
                                                    return;
                                                else
                                                    v20 = v19;
                                                    return;
                                                end;
                                            elseif l_settingType_2 == "LanguageFamily" then
                                                if v26[l_settingTargetId_2] == nil then
                                                    v20 = v19;
                                                    return;
                                                else
                                                    v20 = v24[v26[l_settingTargetId_2]];
                                                    return;
                                                end;
                                            else
                                                if l_settingType_2 == "SupportedLocale" then
                                                    if v24[l_settingTargetId_2] == nil then
                                                        v20 = v19;
                                                        return;
                                                    else
                                                        v20 = v24[l_settingTargetId_2];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end;
                                    end);
                                    v140 = v142;
                                    v141 = v143;
                                end;
                                if not v140 then
                                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v34 .. " with error message: " .. v141);
                                end;
                                v79(v140, v141);
                            end);
                            return;
                        else
                            local l_l_l_v115_0_0_0 = l_l_v115_0_0;
                            if l_l_l_v115_0_0_0 == nil then
                                l_l_l_v115_0_0_0 = "Execution path did not set earliest error to non-nil value.";
                            end;
                            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_v115_0_0_0);
                            v46();
                            return;
                        end;
                    end);
                else
                    local l_l_v115_0_1 = l_v115_0;
                    if l_l_v115_0_1 == nil then
                        l_l_v115_0_1 = "Execution path did not set earliest error to non-nil value.";
                    end;
                    v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v115_0_1);
                    v46();
                end;
            end);
        else
            local l_v115_1 = v115;
            if l_v115_1 == nil then
                l_v115_1 = "Execution path did not set earliest error to non-nil value.";
            end;
            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v115_1);
            v46();
            --[[ close >= 2 ]]
        end;
    end;
    v29:Start(function(v151, v152) --[[ Line: 542 ]]
        -- upvalues: l_HttpService_0 (ref), v25 (copy), v26 (copy), v23 (copy), v24 (copy), v21 (copy), v9 (ref), v28 (copy), v33 (copy), v22 (copy), v32 (copy), v31 (copy), v18 (ref), v30 (copy), v35 (copy), v20 (ref), v19 (copy), v34 (copy), v79 (copy), v46 (copy)
        local v153 = false;
        local v154 = nil;
        local v155 = nil;
        if not v151 or not v152 or not v152.StatusCode then
            v155 = "Connection error";
        elseif v152.StatusCode == 401 then
            v155 = "Unauthorized";
        elseif v152.StatusCode < 200 or v152.StatusCode >= 400 then
            v155 = v152.StatusCode;
        end;
        v154 = v155;
        if v154 ~= nil then
            v154 = "Locale Information Request: " .. v154;
        else
            local v156;
            v155, v156 = pcall(function() --[[ Line: 551 ]]
                -- upvalues: l_HttpService_0 (ref), v152 (copy), v25 (ref), v26 (ref), v23 (ref), v24 (ref), v21 (ref)
                local v157 = l_HttpService_0:JSONDecode(v152.Body);
                for _, v159 in pairs(v157.data) do
                    local l_languageCode_0 = v159.locale.language.languageCode;
                    local l_id_0 = v159.locale.language.id;
                    local l_name_0 = v159.locale.language.name;
                    local l_locale_0 = v159.locale.locale;
                    local l_id_1 = v159.locale.id;
                    local l_name_1 = v159.locale.name;
                    if v25[l_languageCode_0] == l_locale_0 then
                        v26[l_id_0] = l_id_1;
                    end;
                    v23[l_locale_0] = {
                        localeName = l_name_1, 
                        localeId = l_id_1, 
                        languageName = l_name_0, 
                        languageId = l_id_0, 
                        languageCode = l_languageCode_0
                    };
                    v24[l_id_1] = l_locale_0;
                    v21[l_name_1] = l_locale_0;
                end;
            end);
            v153 = v155;
            v154 = v156;
        end;
        if not v153 then
            v9:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v28 .. " with error message: " .. v154);
        end;
        v155 = v153;
        local l_v154_0 = v154;
        if v155 then
            v33:Start(function(v167, v168) --[[ Line: 495 ]]
                -- upvalues: l_HttpService_0 (ref), v23 (ref), v22 (ref), v9 (ref), v32 (ref), l_v154_0 (ref), v155 (copy), v31 (ref), v18 (ref), v25 (ref), v30 (ref), v35 (ref), v20 (ref), v19 (ref), v26 (ref), v24 (ref), v34 (ref), v79 (ref), v46 (ref)
                local v169 = false;
                local v170 = nil;
                local v171 = nil;
                if not v167 or not v168 or not v168.StatusCode then
                    v171 = "Connection error";
                elseif v168.StatusCode == 401 then
                    v171 = "Unauthorized";
                elseif v168.StatusCode < 200 or v168.StatusCode >= 400 then
                    v171 = v168.StatusCode;
                end;
                v170 = v171;
                if v170 ~= nil then
                    v170 = "Experience Supported Language Language Request: " .. v170;
                else
                    local v172;
                    v171, v172 = pcall(function() --[[ Line: 503 ]]
                        -- upvalues: l_HttpService_0 (ref), v168 (copy), v23 (ref), v22 (ref)
                        local v173 = l_HttpService_0:JSONDecode(v168.Body);
                        local v174 = {};
                        for v175, v176 in pairs(v173.data) do
                            v174[v175] = v176.languageCode;
                        end;
                        for _, v178 in v174 do
                            for v179, v180 in v23 do
                                if v180.languageCode == v178 then
                                    table.insert(v22, v179);
                                end;
                            end;
                        end;
                    end);
                    v169 = v171;
                    v170 = v172;
                end;
                if not v169 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v32 .. " with error message: " .. v170);
                end;
                if l_v154_0 == nil then
                    l_v154_0 = v170;
                end;
                v171 = v169 and v155;
                local l_l_v154_0_0 = l_v154_0;
                if v171 then
                    v31:Start(function(v182, v183) --[[ Line: 453 ]]
                        -- upvalues: l_HttpService_0 (ref), v18 (ref), v25 (ref), v9 (ref), v30 (ref), l_l_v154_0_0 (ref), v171 (copy), v35 (ref), v20 (ref), v19 (ref), v26 (ref), v24 (ref), v34 (ref), v79 (ref), v46 (ref)
                        local v184 = false;
                        local v185 = nil;
                        local v186 = nil;
                        if not v182 or not v183 or not v183.StatusCode then
                            v186 = "Connection error";
                        elseif v183.StatusCode == 401 then
                            v186 = "Unauthorized";
                        elseif v183.StatusCode < 200 or v183.StatusCode >= 400 then
                            v186 = v183.StatusCode;
                        end;
                        v185 = v186;
                        if v185 ~= nil then
                            v185 = "Experience Source Language Request: " .. v185;
                        else
                            local v187;
                            v186, v187 = pcall(function() --[[ Line: 462 ]]
                                -- upvalues: l_HttpService_0 (ref), v183 (copy), v18 (ref), v25 (ref)
                                v18 = v25[l_HttpService_0:JSONDecode(v183.Body).languageCode];
                            end);
                            v184 = v186;
                            v185 = v187;
                        end;
                        if not v184 then
                            v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v30 .. " with error message: " .. v185);
                        end;
                        if l_l_v154_0_0 == nil then
                            l_l_v154_0_0 = v185;
                        end;
                        v186 = v184 and v171;
                        local l_l_l_v154_0_0_0 = l_l_v154_0_0;
                        if v186 then
                            v35:Start(function(v189, v190) --[[ Line: 376 ]]
                                -- upvalues: l_HttpService_0 (ref), v20 (ref), v19 (ref), v18 (ref), v26 (ref), v24 (ref), v9 (ref), v34 (ref), v79 (ref)
                                local v191 = false;
                                local v192 = nil;
                                local v193 = nil;
                                if not v189 or not v190 or not v190.StatusCode then
                                    v193 = "Connection error";
                                elseif v190.StatusCode == 401 then
                                    v193 = "Unauthorized";
                                elseif v190.StatusCode < 200 or v190.StatusCode >= 400 then
                                    v193 = v190.StatusCode;
                                end;
                                v192 = v193;
                                if v192 ~= nil then
                                    v192 = "User Experience Language Setting Get Request: " .. v192;
                                else
                                    local v194;
                                    v193, v194 = pcall(function() --[[ Line: 385 ]]
                                        -- upvalues: l_HttpService_0 (ref), v190 (copy), v20 (ref), v19 (ref), v18 (ref), v26 (ref), v24 (ref)
                                        local l_userUniverseLocalizationSettingValue_3 = l_HttpService_0:JSONDecode(v190.Body).userUniverseLocalizationSettingValue;
                                        if l_userUniverseLocalizationSettingValue_3 == nil then
                                            v20 = v19;
                                            return;
                                        else
                                            local l_settingTargetId_3 = l_userUniverseLocalizationSettingValue_3.settingTargetId;
                                            local l_settingType_3 = l_userUniverseLocalizationSettingValue_3.settingType;
                                            if l_settingTargetId_3 == nil then
                                                v20 = v19;
                                            end;
                                            if l_settingType_3 == "SourceOrTranslation" then
                                                if l_settingTargetId_3 == 1 then
                                                    v20 = v18;
                                                    return;
                                                else
                                                    v20 = v19;
                                                    return;
                                                end;
                                            elseif l_settingType_3 == "LanguageFamily" then
                                                if v26[l_settingTargetId_3] == nil then
                                                    v20 = v19;
                                                    return;
                                                else
                                                    v20 = v24[v26[l_settingTargetId_3]];
                                                    return;
                                                end;
                                            else
                                                if l_settingType_3 == "SupportedLocale" then
                                                    if v24[l_settingTargetId_3] == nil then
                                                        v20 = v19;
                                                        return;
                                                    else
                                                        v20 = v24[l_settingTargetId_3];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end;
                                    end);
                                    v191 = v193;
                                    v192 = v194;
                                end;
                                if not v191 then
                                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v34 .. " with error message: " .. v192);
                                end;
                                v79(v191, v192);
                            end);
                            return;
                        else
                            local l_l_l_l_v154_0_0_0_0 = l_l_l_v154_0_0_0;
                            if l_l_l_l_v154_0_0_0_0 == nil then
                                l_l_l_l_v154_0_0_0_0 = "Execution path did not set earliest error to non-nil value.";
                            end;
                            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_l_v154_0_0_0_0);
                            v46();
                            return;
                        end;
                    end);
                else
                    local l_l_l_v154_0_0_1 = l_l_v154_0_0;
                    if l_l_l_v154_0_0_1 == nil then
                        l_l_l_v154_0_0_1 = "Execution path did not set earliest error to non-nil value.";
                    end;
                    v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_v154_0_0_1);
                    v46();
                end;
            end);
        else
            local l_l_v154_0_1 = l_v154_0;
            if l_l_v154_0_1 == nil then
                l_l_v154_0_1 = "Execution path did not set earliest error to non-nil value.";
            end;
            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v154_0_1);
            v46();
            --[[ close >= 6 ]]
        end;
    end);
end;