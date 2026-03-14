local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Chat_0 = game:GetService("Chat");
local v2 = {
    System = "InGame.Chat.Label.SystemMessagePrefix", 
    Team = "InGame.Chat.Label.TeamMessagePrefix"
};
local v3 = {
    ["From(%s.+)"] = {
        English = "From", 
        LocalizationKey = "InGame.Chat.Label.From"
    }, 
    ["To(%s.+)"] = {
        English = "To", 
        LocalizationKey = "InGame.Chat.Label.To"
    }
};
return {
    _hasFetchedLocalization = false, 
    _getTranslator = function(v4) --[[ Line: 27 ]] --[[ Name: _getTranslator ]]
        -- upvalues: l_Chat_0 (copy), l_LocalizationService_0 (copy)
        if not v4._translator and not v4._hasFetchedLocalization then
            v4._hasFetchedLocalization = true;
            local v5 = l_Chat_0:WaitForChild("ChatLocalization", 4);
            if v5 then
                v4._translator = v5:GetTranslator(l_LocalizationService_0.RobloxLocaleId);
                l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 35 ]]
                    -- upvalues: v4 (copy)
                    v4._hasFetchedLocalization = false;
                    v4._translator = nil;
                end);
            else
                warn("Missing ChatLocalization. Chat interface will not be localized.");
            end;
        end;
        return v4._translator;
    end, 
    Get = function(v6, v7, v8, v9) --[[ Line: 47 ]] --[[ Name: Get ]]
        local l_v8_0 = v8;
        pcall(function() --[[ Line: 49 ]]
            -- upvalues: v6 (copy), l_v8_0 (ref), v7 (copy), v9 (copy)
            local v11 = v6:_getTranslator();
            if v11 then
                l_v8_0 = v11:FormatByKey(v7, v9);
                return;
            else
                warn("Missing Translator. Used default for", v7);
                return;
            end;
        end);
        return l_v8_0;
    end, 
    LocalizeFormattedMessage = function(v12, v13) --[[ Line: 60 ]] --[[ Name: LocalizeFormattedMessage ]]
        local v14, v15 = string.find(v13, "{RBX_LOCALIZATION_KEY}");
        if not v14 then
            return v13;
        else
            local v16, v17 = string.find(v13, "{RBX_LOCALIZATION_DEFAULT}");
            if not v16 then
                return v13;
            else
                local v18, v19 = string.find(v13, "{RBX_LOCALIZATION_PARAMS}");
                local v20 = string.sub(v13, v15 + 1, v16 - 1);
                local v21 = nil;
                if not v18 then
                    return v12:Get(v20, (string.sub(v13, v17 + 1)));
                else
                    v21 = string.sub(v13, v17 + 1, v18 - 1);
                    local v22 = string.sub(v13, v19 + 1);
                    local v23 = {};
                    for v24, v25 in string.gmatch(v22, "([^%s]+)=([^%s]+)") do
                        v23[v24] = v25;
                    end;
                    return v12:Get(v20, v21, v23);
                end;
            end;
        end;
    end, 
    FormatMessageToSend = function(_, v27, v28, v29, v30) --[[ Line: 89 ]] --[[ Name: FormatMessageToSend ]]
        if v29 and v30 then
            return "{RBX_LOCALIZATION_KEY}" .. v27 .. "{RBX_LOCALIZATION_DEFAULT}" .. v28 .. "{RBX_LOCALIZATION_PARAMS}" .. v29 .. "=" .. v30;
        else
            return "{RBX_LOCALIZATION_KEY}" .. v27 .. "{RBX_LOCALIZATION_DEFAULT}" .. v28;
        end;
    end, 
    tryLocalize = function(v31, v32) --[[ Line: 100 ]] --[[ Name: tryLocalize ]]
        -- upvalues: v2 (copy), v3 (copy)
        if v2[v32] then
            return v31:Get(v2[v32], v32);
        else
            for v33, v34 in pairs(v2) do
                if string.find(v32, v33) then
                    local v35 = v31:Get(v34, v33);
                    return string.gsub(v32, v33, v35, 1);
                end;
            end;
            for v36, v37 in pairs(v3) do
                local v38 = string.find(v32, v36);
                local v39 = string.match(v32, v36);
                if v38 and v39 then
                    local v40 = v31:Get(v37.LocalizationKey, v37.English);
                    return (if v38 > 1 then v32:sub(1, v38 - 1) else "") .. v40 .. v39;
                end;
            end;
            return v32;
        end;
    end
};