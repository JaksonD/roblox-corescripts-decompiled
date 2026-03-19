local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v5 = require(l_script_FirstAncestor_0.Content.SduiTextIconRow);
local l_useCountdownSubtitleTextBinding_0 = require(l_Parent_0.GameCollections).useCountdownSubtitleTextBinding;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v2.memo(function(v8) --[[ Line: 23 ]] --[[ Name: SduiCountdownTextIconRow ]]
    -- upvalues: l_useTokens_0 (copy), l_useCountdownSubtitleTextBinding_0 (copy), v2 (copy), v5 (copy), v3 (copy), l_FFlagSduiServerCompat_0 (copy)
    local v9 = l_useTokens_0();
    local v10 = v8.fontStyle or v9.Typography.BodyMedium;
    local v11 = v8.textColor or v9.Color.Content.Default.Color3;
    local v12 = v8.gap or v9.Gap.XXSmall;
    local v13 = v8.iconWidth or v9.Size.Size_400;
    local v14 = v8.onActivated ~= nil;
    local v15 = l_useCountdownSubtitleTextBinding_0(v8.endTimestamp, v8.formatStringHoursMinutes, v8.defaultString);
    return v2.createElement(v5, v3.Dictionary.join({
        gap = v12, 
        fontStyle = v10, 
        textColor = v11, 
        textFlexMode = Enum.UIFlexMode.Shrink, 
        icon = v8.icon, 
        iconWidth = v13, 
        iconColor = v11, 
        Selectable = if not l_FFlagSduiServerCompat_0 then v14 else nil, 
        selectable = if l_FFlagSduiServerCompat_0 then v14 else nil, 
        testId = "--sdui-countdown-text-icon-row"
    }, v8, {
        text = v15
    }));
end);