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
    local function v76(v46, v47) --[[ Line: 162 ]] --[[ Name: userExperienceLanguageSettingsCallback ]]
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
                        v70(true, nil);
                        return;
                    elseif v16 then
                        v16 = false;
                        v70(true, nil);
                        return;
                    elseif v61 == nil then
                        v70(false, nil);
                        return;
                    else
                        v66:Start(function(v71, v72) --[[ Line: 341 ]]
                            -- upvalues: v9 (ref), v65 (copy), v70 (copy)
                            local v73 = false;
                            local v74 = nil;
                            local v75 = nil;
                            if not v71 or not v72 or not v72.StatusCode then
                                v75 = "Connection error";
                            elseif v72.StatusCode == 401 then
                                v75 = "Unauthorized";
                            elseif v72.StatusCode < 200 or v72.StatusCode >= 400 then
                                v75 = v72.StatusCode;
                            end;
                            v74 = v75;
                            if v74 ~= nil then
                                v74 = "User Experience Language Settings Update Request: " .. v74;
                                v9:warning("GameSettings language selector toggle: Failed to update user experience language status from GameInternationalization API for " .. v65 .. " with error message: " .. v74);
                            else
                                v9:info("User Experience Language Settings Update Request: " .. "Succeeded with code - " .. v72.StatusCode);
                                v73 = true;
                            end;
                            v70(v73, v74);
                        end);
                        return;
                    end;
                end;
                v11.LanguageSelectorMode.IndexChanged:connect(l_v11_3);
                return;
            end;
        end;
    end;
    local function _(v77, v78) --[[ Line: 370 ]] --[[ Name: experienceSourceLanguageCallback ]]
        -- upvalues: v34 (copy), l_HttpService_0 (ref), v19 (ref), v18 (copy), v17 (ref), v25 (copy), v23 (copy), v9 (ref), v33 (copy), v76 (copy)
        if v77 then
            v34:Start(function(v79, v80) --[[ Line: 372 ]]
                -- upvalues: l_HttpService_0 (ref), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref), v9 (ref), v33 (ref), v76 (ref)
                local v81 = false;
                local v82 = nil;
                local v83 = nil;
                if not v79 or not v80 or not v80.StatusCode then
                    v83 = "Connection error";
                elseif v80.StatusCode == 401 then
                    v83 = "Unauthorized";
                elseif v80.StatusCode < 200 or v80.StatusCode >= 400 then
                    v83 = v80.StatusCode;
                end;
                v82 = v83;
                if v82 ~= nil then
                    v82 = "User Experience Language Setting Get Request: " .. v82;
                else
                    local v84;
                    v83, v84 = pcall(function() --[[ Line: 381 ]]
                        -- upvalues: l_HttpService_0 (ref), v80 (copy), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref)
                        local l_userUniverseLocalizationSettingValue_0 = l_HttpService_0:JSONDecode(v80.Body).userUniverseLocalizationSettingValue;
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
                    v81 = v83;
                    v82 = v84;
                end;
                if not v81 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v33 .. " with error message: " .. v82);
                end;
                v76(v81, v82);
            end);
            return;
        else
            v76(false, v78);
            return;
        end;
    end;
    local function _(v89, v90) --[[ Line: 447 ]] --[[ Name: experienceSupportedLanguagesCallback ]]
        -- upvalues: v30 (copy), l_HttpService_0 (ref), v17 (ref), v24 (copy), v9 (ref), v29 (copy), v34 (copy), v19 (ref), v18 (copy), v25 (copy), v23 (copy), v33 (copy), v76 (copy)
        if v89 then
            v30:Start(function(v91, v92) --[[ Line: 449 ]]
                -- upvalues: l_HttpService_0 (ref), v17 (ref), v24 (ref), v9 (ref), v29 (ref), v90 (ref), v89 (copy), v34 (ref), v19 (ref), v18 (ref), v25 (ref), v23 (ref), v33 (ref), v76 (ref)
                local v93 = false;
                local v94 = nil;
                local v95 = nil;
                if not v91 or not v92 or not v92.StatusCode then
                    v95 = "Connection error";
                elseif v92.StatusCode == 401 then
                    v95 = "Unauthorized";
                elseif v92.StatusCode < 200 or v92.StatusCode >= 400 then
                    v95 = v92.StatusCode;
                end;
                v94 = v95;
                if v94 ~= nil then
                    v94 = "Experience Source Language Request: " .. v94;
                else
                    local v96;
                    v95, v96 = pcall(function() --[[ Line: 458 ]]
                        -- upvalues: l_HttpService_0 (ref), v92 (copy), v17 (ref), v24 (ref)
                        v17 = v24[l_HttpService_0:JSONDecode(v92.Body).languageCode];
                    end);
                    v93 = v95;
                    v94 = v96;
                end;
                if not v93 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v29 .. " with error message: " .. v94);
                end;
                if v90 == nil then
                    v90 = v94;
                end;
                v95 = v93 and v89;
                local l_v90_0 = v90;
                if v95 then
                    v34:Start(function(v98, v99) --[[ Line: 372 ]]
                        -- upvalues: l_HttpService_0 (ref), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref), v9 (ref), v33 (ref), v76 (ref)
                        local v100 = false;
                        local v101 = nil;
                        local v102 = nil;
                        if not v98 or not v99 or not v99.StatusCode then
                            v102 = "Connection error";
                        elseif v99.StatusCode == 401 then
                            v102 = "Unauthorized";
                        elseif v99.StatusCode < 200 or v99.StatusCode >= 400 then
                            v102 = v99.StatusCode;
                        end;
                        v101 = v102;
                        if v101 ~= nil then
                            v101 = "User Experience Language Setting Get Request: " .. v101;
                        else
                            local v103;
                            v102, v103 = pcall(function() --[[ Line: 381 ]]
                                -- upvalues: l_HttpService_0 (ref), v99 (copy), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref)
                                local l_userUniverseLocalizationSettingValue_1 = l_HttpService_0:JSONDecode(v99.Body).userUniverseLocalizationSettingValue;
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
                            v100 = v102;
                            v101 = v103;
                        end;
                        if not v100 then
                            v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v33 .. " with error message: " .. v101);
                        end;
                        v76(v100, v101);
                    end);
                    return;
                else
                    v76(false, l_v90_0);
                    return;
                end;
            end);
        else
            v76(false, v90);
        end;
    end;
    local _ = function(v108, v109) --[[ Line: 489 ]] --[[ Name: localeInformationCallback ]]
        -- upvalues: v32 (copy), l_HttpService_0 (ref), v22 (copy), v21 (copy), v9 (ref), v31 (copy), v30 (copy), v17 (ref), v24 (copy), v29 (copy), v34 (copy), v19 (ref), v18 (copy), v25 (copy), v23 (copy), v33 (copy), v76 (copy)
        if v108 then
            v32:Start(function(v110, v111) --[[ Line: 491 ]]
                -- upvalues: l_HttpService_0 (ref), v22 (ref), v21 (ref), v9 (ref), v31 (ref), v109 (ref), v108 (copy), v30 (ref), v17 (ref), v24 (ref), v29 (ref), v34 (ref), v19 (ref), v18 (ref), v25 (ref), v23 (ref), v33 (ref), v76 (ref)
                local v112 = false;
                local v113 = nil;
                local v114 = nil;
                if not v110 or not v111 or not v111.StatusCode then
                    v114 = "Connection error";
                elseif v111.StatusCode == 401 then
                    v114 = "Unauthorized";
                elseif v111.StatusCode < 200 or v111.StatusCode >= 400 then
                    v114 = v111.StatusCode;
                end;
                v113 = v114;
                if v113 ~= nil then
                    v113 = "Experience Supported Language Language Request: " .. v113;
                else
                    local v115;
                    v114, v115 = pcall(function() --[[ Line: 499 ]]
                        -- upvalues: l_HttpService_0 (ref), v111 (copy), v22 (ref), v21 (ref)
                        local v116 = l_HttpService_0:JSONDecode(v111.Body);
                        local v117 = {};
                        for v118, v119 in pairs(v116.data) do
                            v117[v118] = v119.languageCode;
                        end;
                        for _, v121 in v117 do
                            for v122, v123 in v22 do
                                if v123.languageCode == v121 then
                                    table.insert(v21, v122);
                                end;
                            end;
                        end;
                    end);
                    v112 = v114;
                    v113 = v115;
                end;
                if not v112 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v31 .. " with error message: " .. v113);
                end;
                if v109 == nil then
                    v109 = v113;
                end;
                v114 = v112 and v108;
                local l_v109_0 = v109;
                if v114 then
                    v30:Start(function(v125, v126) --[[ Line: 449 ]]
                        -- upvalues: l_HttpService_0 (ref), v17 (ref), v24 (ref), v9 (ref), v29 (ref), l_v109_0 (ref), v114 (copy), v34 (ref), v19 (ref), v18 (ref), v25 (ref), v23 (ref), v33 (ref), v76 (ref)
                        local v127 = false;
                        local v128 = nil;
                        local v129 = nil;
                        if not v125 or not v126 or not v126.StatusCode then
                            v129 = "Connection error";
                        elseif v126.StatusCode == 401 then
                            v129 = "Unauthorized";
                        elseif v126.StatusCode < 200 or v126.StatusCode >= 400 then
                            v129 = v126.StatusCode;
                        end;
                        v128 = v129;
                        if v128 ~= nil then
                            v128 = "Experience Source Language Request: " .. v128;
                        else
                            local v130;
                            v129, v130 = pcall(function() --[[ Line: 458 ]]
                                -- upvalues: l_HttpService_0 (ref), v126 (copy), v17 (ref), v24 (ref)
                                v17 = v24[l_HttpService_0:JSONDecode(v126.Body).languageCode];
                            end);
                            v127 = v129;
                            v128 = v130;
                        end;
                        if not v127 then
                            v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v29 .. " with error message: " .. v128);
                        end;
                        if l_v109_0 == nil then
                            l_v109_0 = v128;
                        end;
                        v129 = v127 and v114;
                        local l_l_v109_0_0 = l_v109_0;
                        if v129 then
                            v34:Start(function(v132, v133) --[[ Line: 372 ]]
                                -- upvalues: l_HttpService_0 (ref), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref), v9 (ref), v33 (ref), v76 (ref)
                                local v134 = false;
                                local v135 = nil;
                                local v136 = nil;
                                if not v132 or not v133 or not v133.StatusCode then
                                    v136 = "Connection error";
                                elseif v133.StatusCode == 401 then
                                    v136 = "Unauthorized";
                                elseif v133.StatusCode < 200 or v133.StatusCode >= 400 then
                                    v136 = v133.StatusCode;
                                end;
                                v135 = v136;
                                if v135 ~= nil then
                                    v135 = "User Experience Language Setting Get Request: " .. v135;
                                else
                                    local v137;
                                    v136, v137 = pcall(function() --[[ Line: 381 ]]
                                        -- upvalues: l_HttpService_0 (ref), v133 (copy), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref)
                                        local l_userUniverseLocalizationSettingValue_2 = l_HttpService_0:JSONDecode(v133.Body).userUniverseLocalizationSettingValue;
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
                                    v134 = v136;
                                    v135 = v137;
                                end;
                                if not v134 then
                                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v33 .. " with error message: " .. v135);
                                end;
                                v76(v134, v135);
                            end);
                            return;
                        else
                            v76(false, l_l_v109_0_0);
                            return;
                        end;
                    end);
                else
                    v76(false, l_v109_0);
                end;
            end);
        else
            v76(false, v109);
            --[[ close >= 2 ]]
        end;
    end;
    v28:Start(function(v142, v143) --[[ Line: 538 ]]
        -- upvalues: l_HttpService_0 (ref), v24 (copy), v25 (copy), v22 (copy), v23 (copy), v20 (copy), v9 (ref), v27 (copy), v32 (copy), v21 (copy), v31 (copy), v30 (copy), v17 (ref), v29 (copy), v34 (copy), v19 (ref), v18 (copy), v33 (copy), v76 (copy)
        local v144 = false;
        local v145 = nil;
        local v146 = nil;
        if not v142 or not v143 or not v143.StatusCode then
            v146 = "Connection error";
        elseif v143.StatusCode == 401 then
            v146 = "Unauthorized";
        elseif v143.StatusCode < 200 or v143.StatusCode >= 400 then
            v146 = v143.StatusCode;
        end;
        v145 = v146;
        if v145 ~= nil then
            v145 = "Locale Information Request: " .. v145;
        else
            local v147;
            v146, v147 = pcall(function() --[[ Line: 547 ]]
                -- upvalues: l_HttpService_0 (ref), v143 (copy), v24 (ref), v25 (ref), v22 (ref), v23 (ref), v20 (ref)
                local v148 = l_HttpService_0:JSONDecode(v143.Body);
                for _, v150 in pairs(v148.data) do
                    local l_languageCode_0 = v150.locale.language.languageCode;
                    local l_id_0 = v150.locale.language.id;
                    local l_name_0 = v150.locale.language.name;
                    local l_locale_0 = v150.locale.locale;
                    local l_id_1 = v150.locale.id;
                    local l_name_1 = v150.locale.name;
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
            v144 = v146;
            v145 = v147;
        end;
        if not v144 then
            v9:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v27 .. " with error message: " .. v145);
        end;
        v146 = v144;
        local l_v145_0 = v145;
        if v146 then
            v32:Start(function(v158, v159) --[[ Line: 491 ]]
                -- upvalues: l_HttpService_0 (ref), v22 (ref), v21 (ref), v9 (ref), v31 (ref), l_v145_0 (ref), v146 (copy), v30 (ref), v17 (ref), v24 (ref), v29 (ref), v34 (ref), v19 (ref), v18 (ref), v25 (ref), v23 (ref), v33 (ref), v76 (ref)
                local v160 = false;
                local v161 = nil;
                local v162 = nil;
                if not v158 or not v159 or not v159.StatusCode then
                    v162 = "Connection error";
                elseif v159.StatusCode == 401 then
                    v162 = "Unauthorized";
                elseif v159.StatusCode < 200 or v159.StatusCode >= 400 then
                    v162 = v159.StatusCode;
                end;
                v161 = v162;
                if v161 ~= nil then
                    v161 = "Experience Supported Language Language Request: " .. v161;
                else
                    local v163;
                    v162, v163 = pcall(function() --[[ Line: 499 ]]
                        -- upvalues: l_HttpService_0 (ref), v159 (copy), v22 (ref), v21 (ref)
                        local v164 = l_HttpService_0:JSONDecode(v159.Body);
                        local v165 = {};
                        for v166, v167 in pairs(v164.data) do
                            v165[v166] = v167.languageCode;
                        end;
                        for _, v169 in v165 do
                            for v170, v171 in v22 do
                                if v171.languageCode == v169 then
                                    table.insert(v21, v170);
                                end;
                            end;
                        end;
                    end);
                    v160 = v162;
                    v161 = v163;
                end;
                if not v160 then
                    v9:warning("GameSettings language selector initialization: Failed to get response from Localization API for " .. v31 .. " with error message: " .. v161);
                end;
                if l_v145_0 == nil then
                    l_v145_0 = v161;
                end;
                v162 = v160 and v146;
                local l_l_v145_0_0 = l_v145_0;
                if v162 then
                    v30:Start(function(v173, v174) --[[ Line: 449 ]]
                        -- upvalues: l_HttpService_0 (ref), v17 (ref), v24 (ref), v9 (ref), v29 (ref), l_l_v145_0_0 (ref), v162 (copy), v34 (ref), v19 (ref), v18 (ref), v25 (ref), v23 (ref), v33 (ref), v76 (ref)
                        local v175 = false;
                        local v176 = nil;
                        local v177 = nil;
                        if not v173 or not v174 or not v174.StatusCode then
                            v177 = "Connection error";
                        elseif v174.StatusCode == 401 then
                            v177 = "Unauthorized";
                        elseif v174.StatusCode < 200 or v174.StatusCode >= 400 then
                            v177 = v174.StatusCode;
                        end;
                        v176 = v177;
                        if v176 ~= nil then
                            v176 = "Experience Source Language Request: " .. v176;
                        else
                            local v178;
                            v177, v178 = pcall(function() --[[ Line: 458 ]]
                                -- upvalues: l_HttpService_0 (ref), v174 (copy), v17 (ref), v24 (ref)
                                v17 = v24[l_HttpService_0:JSONDecode(v174.Body).languageCode];
                            end);
                            v175 = v177;
                            v176 = v178;
                        end;
                        if not v175 then
                            v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v29 .. " with error message: " .. v176);
                        end;
                        if l_l_v145_0_0 == nil then
                            l_l_v145_0_0 = v176;
                        end;
                        v177 = v175 and v162;
                        local l_l_l_v145_0_0_0 = l_l_v145_0_0;
                        if v177 then
                            v34:Start(function(v180, v181) --[[ Line: 372 ]]
                                -- upvalues: l_HttpService_0 (ref), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref), v9 (ref), v33 (ref), v76 (ref)
                                local v182 = false;
                                local v183 = nil;
                                local v184 = nil;
                                if not v180 or not v181 or not v181.StatusCode then
                                    v184 = "Connection error";
                                elseif v181.StatusCode == 401 then
                                    v184 = "Unauthorized";
                                elseif v181.StatusCode < 200 or v181.StatusCode >= 400 then
                                    v184 = v181.StatusCode;
                                end;
                                v183 = v184;
                                if v183 ~= nil then
                                    v183 = "User Experience Language Setting Get Request: " .. v183;
                                else
                                    local v185;
                                    v184, v185 = pcall(function() --[[ Line: 381 ]]
                                        -- upvalues: l_HttpService_0 (ref), v181 (copy), v19 (ref), v18 (ref), v17 (ref), v25 (ref), v23 (ref)
                                        local l_userUniverseLocalizationSettingValue_3 = l_HttpService_0:JSONDecode(v181.Body).userUniverseLocalizationSettingValue;
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
                                    v182 = v184;
                                    v183 = v185;
                                end;
                                if not v182 then
                                    v9:warning("GameSettings language selector initialization: Failed to get response from GameInternationalization API for " .. v33 .. " with error message: " .. v183);
                                end;
                                v76(v182, v183);
                            end);
                            return;
                        else
                            v76(false, l_l_l_v145_0_0_0);
                            return;
                        end;
                    end);
                else
                    v76(false, l_l_v145_0_0);
                end;
            end);
        else
            v76(false, l_v145_0);
            --[[ close >= 6 ]]
        end;
    end);
end;