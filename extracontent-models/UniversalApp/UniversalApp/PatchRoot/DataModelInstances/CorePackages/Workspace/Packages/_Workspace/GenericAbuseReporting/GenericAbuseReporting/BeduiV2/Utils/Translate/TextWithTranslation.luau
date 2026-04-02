local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_Text_0 = v2.Text;
local v5 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.useOpenLink);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local v8 = game:DefineFastFlag("AddFontStyleToTextWithTranslation", false);
return v3.memo(function(v9) --[[ Line: 32 ]] --[[ Name: TextWithTranslation ]]
    -- upvalues: l_useArTranslation_0 (copy), v5 (copy), v3 (copy), l_Text_0 (copy), v8 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local l_translateIntoRichTextString_0 = l_useArTranslation_0().translateIntoRichTextString;
    local v12 = v5();
    local v13, v14 = v3.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: l_translateIntoRichTextString_0 (copy), v9 (copy)
        return l_translateIntoRichTextString_0(v9.input);
    end, {
        v9.input, 
        l_translateIntoRichTextString_0
    });
    local v16 = v3.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v14 (copy), v12 (copy), l_translateIntoString_0 (copy), v9 (copy)
        local v15 = nil;
        if v14 ~= nil then
            v15 = v14.href;
        end;
        v12(l_translateIntoString_0(v9.input), v15);
    end, {
        v14, 
        v9.input, 
        v12, 
        l_translateIntoString_0
    });
    return v3.createElement(l_Text_0, {
        Text = v13, 
        RichText = true, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        fontStyle = if v8 then v9.fontStyle else nil, 
        tag = v9.tag, 
        LayoutOrder = v9.layoutOrder, 
        onActivated = if v14 ~= nil then v16 else nil
    });
end);