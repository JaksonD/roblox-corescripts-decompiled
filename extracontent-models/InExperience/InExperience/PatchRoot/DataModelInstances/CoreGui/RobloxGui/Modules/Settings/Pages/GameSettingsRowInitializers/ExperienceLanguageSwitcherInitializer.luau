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
return function(v11, v12, v13) --[[ Line: 21 ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v8 (copy), v10 (copy), v9 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy)
    local v14 = 1;
    local v15 = 1;
    local v16 = false;
    local v17 = nil;
    local v18 = l_Players_0.LocalPlayer.LocaleId:gsub("-", "_");
    local v19 = nil;
    local v20 = {};
    local v21 = {};
    local v22 = {};
    local v23 = {};
    local v24 = {
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
    local v25 = {};
    local v26 = {};
    local v27 = l_Url_0.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"));
    local v28 = l_HttpService_0:RequestInternal({
        Url = v27, 
        Method = "GET"
    });
    local v29 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/source-language/games/%d", game.GameId);
    local v30 = l_HttpService_0:RequestInternal({
        Url = v29, 
        Method = "GET"
    });
    local v31 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/supported-languages/games/%d/in-experience-language-selection", game.GameId);
    local v32 = l_HttpService_0:RequestInternal({
        Url = v31, 
        Method = "GET"
    });
    local v33 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
    local v34 = l_HttpService_0:RequestInternal({
        Url = v33, 
        Method = "GET"
    });
    local function _(v35, v36) --[[ Line: 133 ]] --[[ Name: tryGetErrorMessage ]]
        local v37 = nil;
        if not v35 or not v36 or not v36.StatusCode then
            return "Connection error";
        elseif v36.StatusCode == 401 then
            return "Unauthorized";
        else
            if v36.StatusCode < 200 or v36.StatusCode >= 400 then
                v37 = v36.StatusCode;
            end;
            return v37;
        end;
    end;
    local function v45() --[[ Line: 146 ]] --[[ Name: createSessionDormantLanguageSwitcherRow ]]
        -- upvalues: v11 (copy), v8 (ref), v10 (ref), v12 (copy)
        local l_v11_0 = v11;
        local l_v11_1 = v11;
        local l_v11_2 = v11;
        local v42, v43, v44 = v8:AddNewRow(v11, v10:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", {
            v10:FormatByKey("Feature.SettingsHub.LanguageSelection.Unavailable")
        }, 1);
        l_v11_0.LanguageSelectorFrame = v42;
        l_v11_1.LanguageSelectorLabel = v43;
        l_v11_2.LanguageSelectorMode = v44;
        v11.LanguageSelectorMode:SetInteractable(false);
        v11.LanguageSelectorFrame.LayoutOrder = v12.LanguageSelectorFrame;
    end;
    local function v78(v46, v47) --[[ Line: 162 ]] --[[ Name: userExperienceLanguageSettingsCallback ]]
        -- upvalues: v9 (ref), v45 (copy), v21 (copy), v19 (ref), v17 (ref), v26 (copy), v22 (copy), v20 (copy), v14 (ref), v15 (ref), v11 (copy), v8 (ref), v10 (ref), v12 (copy), l_LocalPlayer_0 (ref), v13 (copy), l_Url_0 (ref), l_HttpService_0 (ref), v16 (ref), l_RunService_0 (ref)
        if not v46 then
            if v47 == nil then
                v47 = "Execution path did not set earliest error to non-nil value.";
            end;
            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. v47);
            v45();
            return;
        else
            local v48 = false;
            for _, v50 in v21 do
                if v50 == v19 then
                    v48 = true;
                end;
                if v50 ~= v17 then
                    table.insert(v26, v22[v50].localeName);
                end;
            end;
            table.sort(v26);
            local v51 = true;
            if v17 == nil or v22[v17].localeName == nil then
                v51 = false;
            end;
            if not v51 then
                v45();
                return;
            else
                table.insert(v26, 1, v22[v17].localeName .. " (Original)");
                if v48 == true then
                    for v52, v53 in v26 do
                        if v52 ~= 1 and v20[v53] == v19 then
                            v14 = v52;
                            v15 = v52;
                        end;
                    end;
                end;
                local l_v11_3 = v11;
                local l_v11_4 = v11;
                local l_v11_5 = v11;
                local v57, v58, v59 = v8:AddNewRow(v11, v10:FormatByKey("Feature.SettingsHub.LanguageSelection.SettingLabel"), "DropDown", v26, v14);
                l_v11_3.LanguageSelectorFrame = v57;
                l_v11_4.LanguageSelectorLabel = v58;
                l_v11_5.LanguageSelectorMode = v59;
                v11.LanguageSelectorFrame.LayoutOrder = v12.LanguageSelectorFrame;
                if v14 == 1 then
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(v17);
                else
                    l_v11_3 = v20[v26[v14]];
                    l_LocalPlayer_0:SetExperienceSettingsLocaleId(l_v11_3);
                end;
                v11.LanguageSelectorMode.CurrentLocale = v11.LanguageSelectorMode.DropDownFrame.DropDownFrameTextLabel.Text;
                l_v11_3 = function(v60) --[[ Line: 248 ]] --[[ Name: toggleTranslation ]]
                    -- upvalues: v11 (ref), v22 (ref), v17 (ref), v20 (ref), v26 (ref), v13 (ref), l_Url_0 (ref), l_HttpService_0 (ref), v15 (ref), l_LocalPlayer_0 (ref), v9 (ref), v16 (ref), l_RunService_0 (ref)
                    v11.LanguageSelectorMode:SetInteractable(false);
                    local v61 = nil;
                    v61 = if v60 == 1 and v22[v17] ~= nil then v22[v17].localeId else v22[v20[v26[v60]]].localeId;
                    local l_CurrentLocale_0 = v11.LanguageSelectorMode.CurrentLocale;
                    local v63 = v26[v60];
                    if l_CurrentLocale_0 ~= v63 then
                        v11.LanguageSelectorMode.CurrentLocale = v63;
                        v13("experience_locale", l_CurrentLocale_0, v63);
                    end;
                    local v64 = {
                        settingValue = {
                            settingType = "SupportedLocale", 
                            settingTargetId = v61
                        }
                    };
                    local v65 = l_Url_0.GAME_INTERNATIONALIZATION_URL .. string.format("v1/user-localization-settings/universe/%d", game.GameId);
                    local v66 = l_HttpService_0:RequestInternal({
                        Url = v65, 
                        Method = "POST", 
                        Headers = {
                            ["Content-Type"] = "application/json"
                        }, 
                        Body = l_HttpService_0:JSONEncode(v64)
                    });
                    local function v70(v67, v68) --[[ Line: 297 ]] --[[ Name: userExperienceLanguageSettingsUpdateCallback ]]
                        -- upvalues: v15 (ref), v60 (copy), l_LocalPlayer_0 (ref), v17 (ref), v20 (ref), v26 (ref), v9 (ref), v16 (ref), v11 (ref)
                        if v67 then
                            v15 = v60;
                            if v60 == 1 then
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v17);
                            else
                                local v69 = v20[v26[v60]];
                                l_LocalPlayer_0:SetExperienceSettingsLocaleId(v69);
                            end;
                        else
                            v9:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. v68);
                            v16 = true;
                            v11.LanguageSelectorMode:SetSelectionIndex(v15);
                        end;
                        v11.LanguageSelectorMode:SetInteractable(true);
                    end;
                    if l_RunService_0:IsStudio() then
                        v15 = v60;
                        if v60 == 1 then
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v17);
                        else
                            local v71 = v20[v26[v60]];
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v71);
                        end;
                        v11.LanguageSelectorMode:SetInteractable(true);
                        return;
                    elseif v16 then
                        v16 = false;
                        v15 = v60;
                        if v60 == 1 then
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v17);
                        else
                            local v72 = v20[v26[v60]];
                            l_LocalPlayer_0:SetExperienceSettingsLocaleId(v72);
                        end;
                        v11.LanguageSelectorMode:SetInteractable(true);
                        return;
                    elseif v61 == nil then
                        v9:warning("Request to update user experience language status failed, keeping language toggle disabled for the remainder of the session. Error: " .. nil);
                        v16 = true;
                        v11.LanguageSelectorMode:SetSelectionIndex(v15);
                        v11.LanguageSelectorMode:SetInteractable(true);
                        return;
                    else
                        v66:Start(function(v73, v74) --[[ Line: 341 ]]
                            -- upvalues: v9 (ref), v65 (copy), v70 (copy)
                            local v75 = false;
                            local v76 = nil;
                            local v77 = nil;
                            if not v73 or not v74 or not v74.StatusCode then
                                v77 = "Connection error";
                            elseif v74.StatusCode == 401 then
                                v77 = "Unauthorized";
                            elseif v74.StatusCode < 200 or v74.StatusCode >= 400 then
                                v77 = v74.StatusCode;
                            end;
                            v76 = v77;
                            if v76 ~= nil then
                                v76 = "User Experience Language Settings Update Request: " .. v76;
                                v9:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v65 .. " with error message: " .. v76);
                            else
                                v9:info("User Experience Language Settings Update Request: " .. "Succeeded with code - " .. v74.StatusCode);
                                v75 = true;
                            end;
                            v70(v75, v76);
                        end);
                        return;
                    end;
                end;
                v11.LanguageSelectorMode.IndexChanged:connect(l_v11_3);
                return;
            end;
        end;
    end;
    local function _(v79, v80) --[[ Line: 370 ]] --[[ Name: experienceSourceLanguageCallback ]]
        -- upvalues: v34 (copy), l_HttpService_0 (ref), v19 (ref), v18 (copy), v17 (ref), v25 (copy), v23 (copy), v9 (ref), v33 (copy), v78 (copy), v45 (copy)
        if v79 then
            v34:Start(function(v81, v82) --[[ Line: 372 ]]
                -- upvalues: l_HttpService_0 (ref), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref), v9 (ref), v33 (ref), v78 (ref)
                local v83 = false;
                local v84 = nil;
                local v85 = nil;
                if not v81 or not v82 or not v82.StatusCode then
                    v85 = "Connection error";
                elseif v82.StatusCode == 401 then
                    v85 = "Unauthorized";
                elseif v82.StatusCode < 200 or v82.StatusCode >= 400 then
                    v85 = v82.StatusCode;
                end;
                v84 = v85;
                if v84 ~= nil then
                    v84 = "User Experience Language Setting Get Request: " .. v84;
                else
                    local v86;
                    v85, v86 = pcall(function() --[[ Line: 381 ]]
                        -- upvalues: l_HttpService_0 (ref), v82 (copy), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref)
                        local l_userUniverseLocalizationSettingValue_0 = l_HttpService_0:JSONDecode(v82.Body).userUniverseLocalizationSettingValue;
                        if l_userUniverseLocalizationSettingValue_0 == nil then
                            v19 = v18;
                            return;
                        else
                            local l_settingTargetId_0 = l_userUniverseLocalizationSettingValue_0.settingTargetId;
                            local l_settingType_0 = l_userUniverseLocalizationSettingValue_0.settingType;
                            if l_settingTargetId_0 == nil then
                                v19 = v18;
                            end;
                            if l_settingType_0 == "SourceOrTranslation" then
                                if l_settingTargetId_0 == 1 then
                                    v19 = v17;
                                    return;
                                else
                                    v19 = v18;
                                    return;
                                end;
                            elseif l_settingType_0 == "LanguageFamily" then
                                if v25[l_settingTargetId_0] == nil then
                                    v19 = v18;
                                    return;
                                else
                                    v19 = v23[v25[l_settingTargetId_0]];
                                    return;
                                end;
                            else
                                if l_settingType_0 == "SupportedLocale" then
                                    if v23[l_settingTargetId_0] == nil then
                                        v19 = v18;
                                        return;
                                    else
                                        v19 = v23[l_settingTargetId_0];
                                    end;
                                end;
                                return;
                            end;
                        end;
                    end);
                    v83 = v85;
                    v84 = v86;
                end;
                if not v83 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v33 .. " with error message: " .. v84);
                end;
                v78(v83, v84);
            end);
            return;
        else
            local l_v80_0 = v80;
            if l_v80_0 == nil then
                l_v80_0 = "Execution path did not set earliest error to non-nil value.";
            end;
            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v80_0);
            v45();
            return;
        end;
    end;
    local function _(v92, v93) --[[ Line: 447 ]] --[[ Name: experienceSupportedLanguagesCallback ]]
        -- upvalues: v30 (copy), l_HttpService_0 (ref), v17 (ref), v24 (copy), v9 (ref), v29 (copy), v34 (copy), v19 (ref), v18 (copy), v25 (copy), v23 (copy), v33 (copy), v78 (copy), v45 (copy)
        if v92 then
            v30:Start(function(v94, v95) --[[ Line: 449 ]]
                -- upvalues: l_HttpService_0 (ref), v17 (ref), v24 (ref), v9 (ref), v29 (ref), v93 (ref), v92 (copy), v34 (ref), v19 (ref), v18 (ref), v25 (ref), v23 (ref), v33 (ref), v78 (ref), v45 (ref)
                local v96 = false;
                local v97 = nil;
                local v98 = nil;
                if not v94 or not v95 or not v95.StatusCode then
                    v98 = "Connection error";
                elseif v95.StatusCode == 401 then
                    v98 = "Unauthorized";
                elseif v95.StatusCode < 200 or v95.StatusCode >= 400 then
                    v98 = v95.StatusCode;
                end;
                v97 = v98;
                if v97 ~= nil then
                    v97 = "Experience Source Language Request: " .. v97;
                else
                    local v99;
                    v98, v99 = pcall(function() --[[ Line: 458 ]]
                        -- upvalues: l_HttpService_0 (ref), v95 (copy), v17 (ref), v24 (ref)
                        v17 = v24[l_HttpService_0:JSONDecode(v95.Body).languageCode];
                    end);
                    v96 = v98;
                    v97 = v99;
                end;
                if not v96 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v29 .. " with error message: " .. v97);
                end;
                if v93 == nil then
                    v93 = v97;
                end;
                v98 = v96 and v92;
                local l_v93_0 = v93;
                if v98 then
                    v34:Start(function(v101, v102) --[[ Line: 372 ]]
                        -- upvalues: l_HttpService_0 (ref), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref), v9 (ref), v33 (ref), v78 (ref)
                        local v103 = false;
                        local v104 = nil;
                        local v105 = nil;
                        if not v101 or not v102 or not v102.StatusCode then
                            v105 = "Connection error";
                        elseif v102.StatusCode == 401 then
                            v105 = "Unauthorized";
                        elseif v102.StatusCode < 200 or v102.StatusCode >= 400 then
                            v105 = v102.StatusCode;
                        end;
                        v104 = v105;
                        if v104 ~= nil then
                            v104 = "User Experience Language Setting Get Request: " .. v104;
                        else
                            local v106;
                            v105, v106 = pcall(function() --[[ Line: 381 ]]
                                -- upvalues: l_HttpService_0 (ref), v102 (copy), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref)
                                local l_userUniverseLocalizationSettingValue_1 = l_HttpService_0:JSONDecode(v102.Body).userUniverseLocalizationSettingValue;
                                if l_userUniverseLocalizationSettingValue_1 == nil then
                                    v19 = v18;
                                    return;
                                else
                                    local l_settingTargetId_1 = l_userUniverseLocalizationSettingValue_1.settingTargetId;
                                    local l_settingType_1 = l_userUniverseLocalizationSettingValue_1.settingType;
                                    if l_settingTargetId_1 == nil then
                                        v19 = v18;
                                    end;
                                    if l_settingType_1 == "SourceOrTranslation" then
                                        if l_settingTargetId_1 == 1 then
                                            v19 = v17;
                                            return;
                                        else
                                            v19 = v18;
                                            return;
                                        end;
                                    elseif l_settingType_1 == "LanguageFamily" then
                                        if v25[l_settingTargetId_1] == nil then
                                            v19 = v18;
                                            return;
                                        else
                                            v19 = v23[v25[l_settingTargetId_1]];
                                            return;
                                        end;
                                    else
                                        if l_settingType_1 == "SupportedLocale" then
                                            if v23[l_settingTargetId_1] == nil then
                                                v19 = v18;
                                                return;
                                            else
                                                v19 = v23[l_settingTargetId_1];
                                            end;
                                        end;
                                        return;
                                    end;
                                end;
                            end);
                            v103 = v105;
                            v104 = v106;
                        end;
                        if not v103 then
                            v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v33 .. " with error message: " .. v104);
                        end;
                        v78(v103, v104);
                    end);
                    return;
                else
                    local l_l_v93_0_0 = l_v93_0;
                    if l_l_v93_0_0 == nil then
                        l_l_v93_0_0 = "Execution path did not set earliest error to non-nil value.";
                    end;
                    v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v93_0_0);
                    v45();
                    return;
                end;
            end);
        else
            local l_v93_1 = v93;
            if l_v93_1 == nil then
                l_v93_1 = "Execution path did not set earliest error to non-nil value.";
            end;
            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v93_1);
            v45();
        end;
    end;
    local _ = function(v113, v114) --[[ Line: 489 ]] --[[ Name: localeInformationCallback ]]
        -- upvalues: v32 (copy), l_HttpService_0 (ref), v22 (copy), v21 (copy), v9 (ref), v31 (copy), v30 (copy), v17 (ref), v24 (copy), v29 (copy), v34 (copy), v19 (ref), v18 (copy), v25 (copy), v23 (copy), v33 (copy), v78 (copy), v45 (copy)
        if v113 then
            v32:Start(function(v115, v116) --[[ Line: 491 ]]
                -- upvalues: l_HttpService_0 (ref), v22 (ref), v21 (ref), v9 (ref), v31 (ref), v114 (ref), v113 (copy), v30 (ref), v17 (ref), v24 (ref), v29 (ref), v34 (ref), v19 (ref), v18 (ref), v25 (ref), v23 (ref), v33 (ref), v78 (ref), v45 (ref)
                local v117 = false;
                local v118 = nil;
                local v119 = nil;
                if not v115 or not v116 or not v116.StatusCode then
                    v119 = "Connection error";
                elseif v116.StatusCode == 401 then
                    v119 = "Unauthorized";
                elseif v116.StatusCode < 200 or v116.StatusCode >= 400 then
                    v119 = v116.StatusCode;
                end;
                v118 = v119;
                if v118 ~= nil then
                    v118 = "Experience Supported Language Language Request: " .. v118;
                else
                    local v120;
                    v119, v120 = pcall(function() --[[ Line: 499 ]]
                        -- upvalues: l_HttpService_0 (ref), v116 (copy), v22 (ref), v21 (ref)
                        local v121 = l_HttpService_0:JSONDecode(v116.Body);
                        local v122 = {};
                        for v123, v124 in pairs(v121.data) do
                            v122[v123] = v124.languageCode;
                        end;
                        for _, v126 in v122 do
                            for v127, v128 in v22 do
                                if v128.languageCode == v126 then
                                    table.insert(v21, v127);
                                end;
                            end;
                        end;
                    end);
                    v117 = v119;
                    v118 = v120;
                end;
                if not v117 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v31 .. " with error message: " .. v118);
                end;
                if v114 == nil then
                    v114 = v118;
                end;
                v119 = v117 and v113;
                local l_v114_0 = v114;
                if v119 then
                    v30:Start(function(v130, v131) --[[ Line: 449 ]]
                        -- upvalues: l_HttpService_0 (ref), v17 (ref), v24 (ref), v9 (ref), v29 (ref), l_v114_0 (ref), v119 (copy), v34 (ref), v19 (ref), v18 (ref), v25 (ref), v23 (ref), v33 (ref), v78 (ref), v45 (ref)
                        local v132 = false;
                        local v133 = nil;
                        local v134 = nil;
                        if not v130 or not v131 or not v131.StatusCode then
                            v134 = "Connection error";
                        elseif v131.StatusCode == 401 then
                            v134 = "Unauthorized";
                        elseif v131.StatusCode < 200 or v131.StatusCode >= 400 then
                            v134 = v131.StatusCode;
                        end;
                        v133 = v134;
                        if v133 ~= nil then
                            v133 = "Experience Source Language Request: " .. v133;
                        else
                            local v135;
                            v134, v135 = pcall(function() --[[ Line: 458 ]]
                                -- upvalues: l_HttpService_0 (ref), v131 (copy), v17 (ref), v24 (ref)
                                v17 = v24[l_HttpService_0:JSONDecode(v131.Body).languageCode];
                            end);
                            v132 = v134;
                            v133 = v135;
                        end;
                        if not v132 then
                            v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v29 .. " with error message: " .. v133);
                        end;
                        if l_v114_0 == nil then
                            l_v114_0 = v133;
                        end;
                        v134 = v132 and v119;
                        local l_l_v114_0_0 = l_v114_0;
                        if v134 then
                            v34:Start(function(v137, v138) --[[ Line: 372 ]]
                                -- upvalues: l_HttpService_0 (ref), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref), v9 (ref), v33 (ref), v78 (ref)
                                local v139 = false;
                                local v140 = nil;
                                local v141 = nil;
                                if not v137 or not v138 or not v138.StatusCode then
                                    v141 = "Connection error";
                                elseif v138.StatusCode == 401 then
                                    v141 = "Unauthorized";
                                elseif v138.StatusCode < 200 or v138.StatusCode >= 400 then
                                    v141 = v138.StatusCode;
                                end;
                                v140 = v141;
                                if v140 ~= nil then
                                    v140 = "User Experience Language Setting Get Request: " .. v140;
                                else
                                    local v142;
                                    v141, v142 = pcall(function() --[[ Line: 381 ]]
                                        -- upvalues: l_HttpService_0 (ref), v138 (copy), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref)
                                        local l_userUniverseLocalizationSettingValue_2 = l_HttpService_0:JSONDecode(v138.Body).userUniverseLocalizationSettingValue;
                                        if l_userUniverseLocalizationSettingValue_2 == nil then
                                            v19 = v18;
                                            return;
                                        else
                                            local l_settingTargetId_2 = l_userUniverseLocalizationSettingValue_2.settingTargetId;
                                            local l_settingType_2 = l_userUniverseLocalizationSettingValue_2.settingType;
                                            if l_settingTargetId_2 == nil then
                                                v19 = v18;
                                            end;
                                            if l_settingType_2 == "SourceOrTranslation" then
                                                if l_settingTargetId_2 == 1 then
                                                    v19 = v17;
                                                    return;
                                                else
                                                    v19 = v18;
                                                    return;
                                                end;
                                            elseif l_settingType_2 == "LanguageFamily" then
                                                if v25[l_settingTargetId_2] == nil then
                                                    v19 = v18;
                                                    return;
                                                else
                                                    v19 = v23[v25[l_settingTargetId_2]];
                                                    return;
                                                end;
                                            else
                                                if l_settingType_2 == "SupportedLocale" then
                                                    if v23[l_settingTargetId_2] == nil then
                                                        v19 = v18;
                                                        return;
                                                    else
                                                        v19 = v23[l_settingTargetId_2];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end;
                                    end);
                                    v139 = v141;
                                    v140 = v142;
                                end;
                                if not v139 then
                                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v33 .. " with error message: " .. v140);
                                end;
                                v78(v139, v140);
                            end);
                            return;
                        else
                            local l_l_l_v114_0_0_0 = l_l_v114_0_0;
                            if l_l_l_v114_0_0_0 == nil then
                                l_l_l_v114_0_0_0 = "Execution path did not set earliest error to non-nil value.";
                            end;
                            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_v114_0_0_0);
                            v45();
                            return;
                        end;
                    end);
                else
                    local l_l_v114_0_1 = l_v114_0;
                    if l_l_v114_0_1 == nil then
                        l_l_v114_0_1 = "Execution path did not set earliest error to non-nil value.";
                    end;
                    v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v114_0_1);
                    v45();
                end;
            end);
        else
            local l_v114_1 = v114;
            if l_v114_1 == nil then
                l_v114_1 = "Execution path did not set earliest error to non-nil value.";
            end;
            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_v114_1);
            v45();
            --[[ close >= 2 ]]
        end;
    end;
    v28:Start(function(v150, v151) --[[ Line: 538 ]]
        -- upvalues: l_HttpService_0 (ref), v24 (copy), v25 (copy), v22 (copy), v23 (copy), v20 (copy), v9 (ref), v27 (copy), v32 (copy), v21 (copy), v31 (copy), v30 (copy), v17 (ref), v29 (copy), v34 (copy), v19 (ref), v18 (copy), v33 (copy), v78 (copy), v45 (copy)
        local v152 = false;
        local v153 = nil;
        local v154 = nil;
        if not v150 or not v151 or not v151.StatusCode then
            v154 = "Connection error";
        elseif v151.StatusCode == 401 then
            v154 = "Unauthorized";
        elseif v151.StatusCode < 200 or v151.StatusCode >= 400 then
            v154 = v151.StatusCode;
        end;
        v153 = v154;
        if v153 ~= nil then
            v153 = "Locale Information Request: " .. v153;
        else
            local v155;
            v154, v155 = pcall(function() --[[ Line: 547 ]]
                -- upvalues: l_HttpService_0 (ref), v151 (copy), v24 (ref), v25 (ref), v22 (ref), v23 (ref), v20 (ref)
                local v156 = l_HttpService_0:JSONDecode(v151.Body);
                for _, v158 in pairs(v156.data) do
                    local l_languageCode_0 = v158.locale.language.languageCode;
                    local l_id_0 = v158.locale.language.id;
                    local l_name_0 = v158.locale.language.name;
                    local l_locale_0 = v158.locale.locale;
                    local l_id_1 = v158.locale.id;
                    local l_name_1 = v158.locale.name;
                    if v24[l_languageCode_0] == l_locale_0 then
                        v25[l_id_0] = l_id_1;
                    end;
                    v22[l_locale_0] = {
                        localeName = l_name_1, 
                        localeId = l_id_1, 
                        languageName = l_name_0, 
                        languageId = l_id_0, 
                        languageCode = l_languageCode_0
                    };
                    v23[l_id_1] = l_locale_0;
                    v20[l_name_1] = l_locale_0;
                end;
            end);
            v152 = v154;
            v153 = v155;
        end;
        if not v152 then
            v9:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v27 .. " with error message: " .. v153);
        end;
        v154 = v152;
        local l_v153_0 = v153;
        if v154 then
            v32:Start(function(v166, v167) --[[ Line: 491 ]]
                -- upvalues: l_HttpService_0 (ref), v22 (ref), v21 (ref), v9 (ref), v31 (ref), l_v153_0 (ref), v154 (copy), v30 (ref), v17 (ref), v24 (ref), v29 (ref), v34 (ref), v19 (ref), v18 (ref), v25 (ref), v23 (ref), v33 (ref), v78 (ref), v45 (ref)
                local v168 = false;
                local v169 = nil;
                local v170 = nil;
                if not v166 or not v167 or not v167.StatusCode then
                    v170 = "Connection error";
                elseif v167.StatusCode == 401 then
                    v170 = "Unauthorized";
                elseif v167.StatusCode < 200 or v167.StatusCode >= 400 then
                    v170 = v167.StatusCode;
                end;
                v169 = v170;
                if v169 ~= nil then
                    v169 = "Experience Supported Language Language Request: " .. v169;
                else
                    local v171;
                    v170, v171 = pcall(function() --[[ Line: 499 ]]
                        -- upvalues: l_HttpService_0 (ref), v167 (copy), v22 (ref), v21 (ref)
                        local v172 = l_HttpService_0:JSONDecode(v167.Body);
                        local v173 = {};
                        for v174, v175 in pairs(v172.data) do
                            v173[v174] = v175.languageCode;
                        end;
                        for _, v177 in v173 do
                            for v178, v179 in v22 do
                                if v179.languageCode == v177 then
                                    table.insert(v21, v178);
                                end;
                            end;
                        end;
                    end);
                    v168 = v170;
                    v169 = v171;
                end;
                if not v168 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v31 .. " with error message: " .. v169);
                end;
                if l_v153_0 == nil then
                    l_v153_0 = v169;
                end;
                v170 = v168 and v154;
                local l_l_v153_0_0 = l_v153_0;
                if v170 then
                    v30:Start(function(v181, v182) --[[ Line: 449 ]]
                        -- upvalues: l_HttpService_0 (ref), v17 (ref), v24 (ref), v9 (ref), v29 (ref), l_l_v153_0_0 (ref), v170 (copy), v34 (ref), v19 (ref), v18 (ref), v25 (ref), v23 (ref), v33 (ref), v78 (ref), v45 (ref)
                        local v183 = false;
                        local v184 = nil;
                        local v185 = nil;
                        if not v181 or not v182 or not v182.StatusCode then
                            v185 = "Connection error";
                        elseif v182.StatusCode == 401 then
                            v185 = "Unauthorized";
                        elseif v182.StatusCode < 200 or v182.StatusCode >= 400 then
                            v185 = v182.StatusCode;
                        end;
                        v184 = v185;
                        if v184 ~= nil then
                            v184 = "Experience Source Language Request: " .. v184;
                        else
                            local v186;
                            v185, v186 = pcall(function() --[[ Line: 458 ]]
                                -- upvalues: l_HttpService_0 (ref), v182 (copy), v17 (ref), v24 (ref)
                                v17 = v24[l_HttpService_0:JSONDecode(v182.Body).languageCode];
                            end);
                            v183 = v185;
                            v184 = v186;
                        end;
                        if not v183 then
                            v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v29 .. " with error message: " .. v184);
                        end;
                        if l_l_v153_0_0 == nil then
                            l_l_v153_0_0 = v184;
                        end;
                        v185 = v183 and v170;
                        local l_l_l_v153_0_0_0 = l_l_v153_0_0;
                        if v185 then
                            v34:Start(function(v188, v189) --[[ Line: 372 ]]
                                -- upvalues: l_HttpService_0 (ref), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref), v9 (ref), v33 (ref), v78 (ref)
                                local v190 = false;
                                local v191 = nil;
                                local v192 = nil;
                                if not v188 or not v189 or not v189.StatusCode then
                                    v192 = "Connection error";
                                elseif v189.StatusCode == 401 then
                                    v192 = "Unauthorized";
                                elseif v189.StatusCode < 200 or v189.StatusCode >= 400 then
                                    v192 = v189.StatusCode;
                                end;
                                v191 = v192;
                                if v191 ~= nil then
                                    v191 = "User Experience Language Setting Get Request: " .. v191;
                                else
                                    local v193;
                                    v192, v193 = pcall(function() --[[ Line: 381 ]]
                                        -- upvalues: l_HttpService_0 (ref), v189 (copy), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref)
                                        local l_userUniverseLocalizationSettingValue_3 = l_HttpService_0:JSONDecode(v189.Body).userUniverseLocalizationSettingValue;
                                        if l_userUniverseLocalizationSettingValue_3 == nil then
                                            v19 = v18;
                                            return;
                                        else
                                            local l_settingTargetId_3 = l_userUniverseLocalizationSettingValue_3.settingTargetId;
                                            local l_settingType_3 = l_userUniverseLocalizationSettingValue_3.settingType;
                                            if l_settingTargetId_3 == nil then
                                                v19 = v18;
                                            end;
                                            if l_settingType_3 == "SourceOrTranslation" then
                                                if l_settingTargetId_3 == 1 then
                                                    v19 = v17;
                                                    return;
                                                else
                                                    v19 = v18;
                                                    return;
                                                end;
                                            elseif l_settingType_3 == "LanguageFamily" then
                                                if v25[l_settingTargetId_3] == nil then
                                                    v19 = v18;
                                                    return;
                                                else
                                                    v19 = v23[v25[l_settingTargetId_3]];
                                                    return;
                                                end;
                                            else
                                                if l_settingType_3 == "SupportedLocale" then
                                                    if v23[l_settingTargetId_3] == nil then
                                                        v19 = v18;
                                                        return;
                                                    else
                                                        v19 = v23[l_settingTargetId_3];
                                                    end;
                                                end;
                                                return;
                                            end;
                                        end;
                                    end);
                                    v190 = v192;
                                    v191 = v193;
                                end;
                                if not v190 then
                                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v33 .. " with error message: " .. v191);
                                end;
                                v78(v190, v191);
                            end);
                            return;
                        else
                            local l_l_l_l_v153_0_0_0_0 = l_l_l_v153_0_0_0;
                            if l_l_l_l_v153_0_0_0_0 == nil then
                                l_l_l_l_v153_0_0_0_0 = "Execution path did not set earliest error to non-nil value.";
                            end;
                            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_l_v153_0_0_0_0);
                            v45();
                            return;
                        end;
                    end);
                else
                    local l_l_l_v153_0_0_1 = l_l_v153_0_0;
                    if l_l_l_v153_0_0_1 == nil then
                        l_l_l_v153_0_0_1 = "Execution path did not set earliest error to non-nil value.";
                    end;
                    v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_l_v153_0_0_1);
                    v45();
                end;
            end);
        else
            local l_l_v153_0_1 = l_v153_0;
            if l_l_v153_0_1 == nil then
                l_l_v153_0_1 = "Execution path did not set earliest error to non-nil value.";
            end;
            v9:warning("GameSettings language selector initialization failed to get all required information; defaulting to player locale and disabling language selection toggle. Earliest error message: " .. l_l_v153_0_1);
            v45();
            --[[ close >= 6 ]]
        end;
    end);
end;