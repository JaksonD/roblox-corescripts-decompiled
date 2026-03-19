local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Coachmark_0 = v2.Coachmark;
local l_PopoverAlign_0 = v2.Enums.PopoverAlign;
local l_PopoverSide_0 = v2.Enums.PopoverSide;
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
return v3.memo(v3.forwardRef(function(v10, v11) --[[ Line: 32 ]] --[[ Name: AbuseReportTooltip ]]
    -- upvalues: l_useArTranslation_0 (copy), v3 (copy), l_Coachmark_0 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy), l_ButtonVariant_0 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local v13 = v3.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v10 (copy)
        v10.onClose();
    end, {
        v10.onClose
    });
    return v3.createElement(l_Coachmark_0, {
        title = l_translateIntoString_0(v10.tooltipTitle), 
        text = l_translateIntoString_0(v10.tooltipText), 
        isOpen = v10.isOpen, 
        align = l_PopoverAlign_0.End, 
        side = l_PopoverSide_0.Bottom, 
        onClose = v10.onClose, 
        actions = if v10.buttonLabel then {
            {
                text = l_translateIntoString_0(v10.buttonLabel), 
                onActivated = v13, 
                variant = l_ButtonVariant_0.Emphasis
            }
        } else nil, 
        LayoutOrder = v10.layoutOrder, 
        ref = v11
    }, v10.children);
end));