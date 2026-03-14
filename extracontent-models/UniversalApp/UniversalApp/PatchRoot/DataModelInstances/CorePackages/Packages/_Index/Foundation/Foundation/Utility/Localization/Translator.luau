local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v2 = require(l_script_FirstAncestor_0.Utility.Wrappers);
local l_LocalizationService_0 = v2.Services.LocalizationService;
local l_GuiService_0 = v2.Services.GuiService;
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_script_FirstAncestor_0.Generated.Translations.GeneratedTranslations);
(function(v7) --[[ Line: 11 ]] --[[ Name: createFoundationLocalizationTable ]]
    -- upvalues: l_GuiService_0 (copy), v5 (copy), v6 (copy)
    local l_l_GuiService_0_FirstChild_0 = l_GuiService_0:FindFirstChild(v5.LOCALIZATION_TABLE_NAME);
    if l_l_GuiService_0_FirstChild_0 ~= nil and l_l_GuiService_0_FirstChild_0:IsA("LocalizationTable") then
        l_l_GuiService_0_FirstChild_0:SetEntries(v6);
        return;
    else
        local l_LocalizationTable_0 = Instance.new("LocalizationTable");
        l_LocalizationTable_0.Name = v5.LOCALIZATION_TABLE_NAME;
        l_LocalizationTable_0.Archivable = false;
        l_LocalizationTable_0.SourceLocaleId = "en-us";
        l_LocalizationTable_0:SetEntries(v6);
        l_LocalizationTable_0.Parent = v7;
        return;
    end;
end)(l_GuiService_0);
local l_Translator_0 = l_GuiService_0:FindFirstChild(v5.LOCALIZATION_TABLE_NAME):GetTranslator("en-us");
local v11 = {};
local function _(v12) --[[ Line: 35 ]] --[[ Name: getTranslatorForLocale ]]
    -- upvalues: v11 (copy), l_GuiService_0 (copy), v5 (copy)
    local v13 = v11[v12];
    if v13 then
        return v13;
    else
        v13 = l_GuiService_0:FindFirstChild(v5.LOCALIZATION_TABLE_NAME):GetTranslator(v12);
        v11[v12] = v13;
        return v13;
    end;
end;
local function _() --[[ Line: 49 ]] --[[ Name: getTranslator ]]
    -- upvalues: l_LocalizationService_0 (copy), v11 (copy), l_GuiService_0 (copy), v5 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v16 = v11[l_RobloxLocaleId_0];
    if v16 then
        return v16;
    else
        v16 = l_GuiService_0:FindFirstChild(v5.LOCALIZATION_TABLE_NAME):GetTranslator(l_RobloxLocaleId_0);
        v11[l_RobloxLocaleId_0] = v16;
        return v16;
    end;
end;
local function v23(v18, v19, v20) --[[ Line: 53 ]] --[[ Name: formatByKeyWithFallback ]]
    -- upvalues: l_Translator_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 54 ]]
        -- upvalues: v20 (copy), v18 (copy), v19 (copy)
        return v20:FormatByKey(v18, v19);
    end);
    if l_status_0 then
        return l_result_0;
    elseif v20.LocaleId == "zh-cjv" then
        return "";
    else
        return l_Translator_0:FormatByKey(v18, v19);
    end;
end;
return {
    FormatByKey = function(_, v25, v26) --[[ Line: 69 ]] --[[ Name: FormatByKey ]]
        -- upvalues: v23 (copy), l_LocalizationService_0 (copy), v11 (copy), l_GuiService_0 (copy), v5 (copy)
        local l_v23_0 = v23;
        local l_v25_0 = v25;
        local l_v26_0 = v26;
        local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
        local v31 = v11[l_RobloxLocaleId_1];
        local v32;
        if v31 then
            v32 = v31;
        else
            v31 = l_GuiService_0:FindFirstChild(v5.LOCALIZATION_TABLE_NAME):GetTranslator(l_RobloxLocaleId_1);
            v11[l_RobloxLocaleId_1] = v31;
            v32 = v31;
        end;
        return l_v23_0(l_v25_0, l_v26_0, v32);
    end, 
    FormatByKeyForLocale = function(_, v34, v35, v36) --[[ Line: 73 ]] --[[ Name: FormatByKeyForLocale ]]
        -- upvalues: v23 (copy), v11 (copy), l_GuiService_0 (copy), v5 (copy)
        local l_v23_1 = v23;
        local l_v34_0 = v34;
        local l_v36_0 = v36;
        local v40 = v11[v35];
        local v41;
        if v40 then
            v41 = v40;
        else
            v40 = l_GuiService_0:FindFirstChild(v5.LOCALIZATION_TABLE_NAME):GetTranslator(v35);
            v11[v35] = v40;
            v41 = v40;
        end;
        return l_v23_1(l_v34_0, l_v36_0, v41);
    end
};