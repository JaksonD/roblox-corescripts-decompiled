local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_Text_0 = v2.Text;
local v5 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.useOpenLink);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
return v3.memo(function(v8) --[[ Line: 28 ]] --[[ Name: TextWithTranslation ]]
    -- upvalues: l_useArTranslation_0 (copy), v5 (copy), v3 (copy), l_Text_0 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local l_translateIntoRichTextString_0 = l_useArTranslation_0().translateIntoRichTextString;
    local v11 = v5();
    local v12, v13 = v3.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: l_translateIntoRichTextString_0 (copy), v8 (copy)
        return l_translateIntoRichTextString_0(v8.input);
    end, {
        v8.input, 
        l_translateIntoRichTextString_0
    });
    local v15 = v3.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v13 (copy), v11 (copy), l_translateIntoString_0 (copy), v8 (copy)
        local v14 = nil;
        if v13 ~= nil then
            v14 = v13.href;
        end;
        v11(l_translateIntoString_0(v8.input), v14);
    end, {
        v13, 
        v8.input, 
        v11, 
        l_translateIntoString_0
    });
    return v3.createElement(l_Text_0, {
        Text = v12, 
        RichText = true, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        tag = v8.tag, 
        LayoutOrder = v8.layoutOrder, 
        onActivated = if v13 ~= nil then v15 else nil
    });
end);