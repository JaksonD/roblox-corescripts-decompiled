local v0 = {
    Zendesk = "zendesk"
};
local v1 = {
    PolicyUpdate = "policy_update", 
    ParentalControlsLaunch = "parental_controls_launch", 
    SpendingSettings = "spending_settings"
};
local function v6(v2) --[[ Line: 17 ]]
    local v3 = {
        ["zh-cn"] = "zh-cn", 
        zh_cn = "zh-cn", 
        ["zh-cjv"] = "zh-cn", 
        zh_cjv = "zh-cn", 
        ["zh-hans"] = "zh-cn", 
        zh_hans = "zh-cn", 
        ["zh-tw"] = "zh-tw", 
        zh_tw = "zh-tw", 
        ["zh-hant"] = "zh-tw", 
        zh_hant = "zh-tw", 
        ["en-us"] = "en-us", 
        en_us = "en-us", 
        en = "en-us", 
        ["en-gb"] = "en-gb", 
        en_gb = "en-gb", 
        ["fr-ca"] = "fr-ca", 
        fr_ca = "fr-ca", 
        nb = "no", 
        ["nb-no"] = "no", 
        nb_no = "no"
    };
    if v3[v2] then
        return v3[v2];
    else
        local v4 = {};
        for v5 in v2:gmatch("([^%-_]+)") do
            table.insert(v4, v5);
        end;
        if v4[1] then
            return v4[1];
        else
            return "en";
        end;
    end;
end;
return {
    ExternalWebDomainEnum = v0, 
    ExternalWebPageTypeEnum = v1, 
    getZendeskUrl = function(v7) --[[ Line: 72 ]]
        -- upvalues: v6 (copy)
        local v8 = "https://en.help.roblox.com/hc/";
        local l_locale_0 = v7.locale;
        v8 = if if l_locale_0 then not not string.match(l_locale_0, "^[%w%-_]+$") else false then v8 .. v6(v7.locale) else v8 .. "en-us";
        l_locale_0 = v7.articleid;
        if if l_locale_0 then not not string.match(l_locale_0, "^[a-zA-Z0-9]+$") else false then
            v8 = v8 .. "/articles/" .. v7.articleid;
        end;
        return v8;
    end, 
    getZendeskWebViewTitleKey = function(v10) --[[ Line: 86 ]]
        -- upvalues: v1 (copy)
        if v10 == v1.PolicyUpdate then
            return "Feature.Notifications.Webview.Title.PolicyUpdate";
        elseif v10 == v1.ParentalControlsLaunch then
            return "Feature.Notifications.Webview.Title.ParentalControlsLaunch";
        elseif v10 == v1.SpendingSettings then
            return "Feature.Notifications.Webview.Title.SpendingSettings";
        else
            return "CommonUI.Features.Label.Help";
        end;
    end, 
    getExternalLocale = v6, 
    isValidLocale = function(v11) --[[ Line: 56 ]]
        if v11 then
            return not not string.match(v11, "^[%w%-_]+$");
        else
            return false;
        end;
    end, 
    isValidArticleId = function(v12) --[[ Line: 64 ]]
        if v12 then
            return not not string.match(v12, "^[a-zA-Z0-9]+$");
        else
            return false;
        end;
    end
};