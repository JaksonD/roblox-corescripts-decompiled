local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Config);
local v2 = require(l_script_FirstAncestor_0.memoize);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatRewrite);
local function _(v4) --[[ Line: 7 ]]
    local v5 = true;
    if v4 ~= nil then
        v5 = v4 == "";
    end;
    return v5;
end;
return (v2(function(v7, v8) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v9 = {
        text = v7.text or "", 
        prefixText = v7.prefixText or "", 
        translation = v7.translation or "", 
        useTranslation = v7.useTranslation, 
        bodyTextProperties = {}, 
        prefixTextProperties = {}, 
        wasRewritten = if v3 then v7.wasRewritten or false else nil, 
        originalText = if v3 then v7.originalText or "" else nil
    };
    if v8 then
        for v10, _ in pairs(v1.DefaultChatWindowMessagePropertiesInstanceSettings) do
            v9.bodyTextProperties[v10] = v8[v10];
            v9.prefixTextProperties[v10] = v8[v10];
        end;
    end;
    if v7.chatWindowMessageProperties then
        local l_chatWindowMessageProperties_0 = v7.chatWindowMessageProperties;
        local l_Text_0 = l_chatWindowMessageProperties_0.Text;
        local v14 = true;
        if l_Text_0 ~= nil then
            v14 = l_Text_0 == "";
        end;
        v9.text = if v14 then v9.text else l_chatWindowMessageProperties_0.Text;
        l_Text_0 = l_chatWindowMessageProperties_0.PrefixText;
        v14 = true;
        if l_Text_0 ~= nil then
            v14 = l_Text_0 == "";
        end;
        v9.prefixText = if v14 then v9.prefixText else l_chatWindowMessageProperties_0.PrefixText;
        l_Text_0 = l_chatWindowMessageProperties_0.Translation;
        v14 = true;
        if l_Text_0 ~= nil then
            v14 = l_Text_0 == "";
        end;
        v9.translation = if v14 then v9.translation else l_chatWindowMessageProperties_0.Translation;
        for v15, _ in pairs(v1.DefaultChatWindowMessagePropertiesInstanceSettings) do
            v9.bodyTextProperties[v15] = l_chatWindowMessageProperties_0[v15];
            v9.prefixTextProperties[v15] = l_chatWindowMessageProperties_0[v15];
        end;
        if l_chatWindowMessageProperties_0.PrefixTextProperties then
            local l_PrefixTextProperties_0 = l_chatWindowMessageProperties_0.PrefixTextProperties;
            local l_PrefixText_0 = l_PrefixTextProperties_0.PrefixText;
            l_Text_0 = true;
            if l_PrefixText_0 ~= nil then
                l_Text_0 = l_PrefixText_0 == "";
            end;
            v9.prefixText = if l_Text_0 then v9.prefixText else l_PrefixTextProperties_0.PrefixText;
            for v19, _ in pairs(v1.DefaultChatWindowMessagePropertiesInstanceSettings) do
                v9.prefixTextProperties[v19] = l_PrefixTextProperties_0[v19];
            end;
            v14 = l_PrefixTextProperties_0:FindFirstChildOfClass("UIGradient");
            if v14 then
                l_Text_0 = {};
                for v21, _ in pairs(v1.DefaultChatWindowChildrenCustomizationProperties.UIGradient) do
                    l_Text_0[v21] = v14[v21];
                end;
                v9.prefixTextProperties.UIGradient = l_Text_0;
            end;
        end;
    end;
    return v9;
end));