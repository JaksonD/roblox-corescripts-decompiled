local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local l_Flags_0 = v2.Utility.Flags;
local l_StatusIndicatorVariant_0 = v2.Enums.StatusIndicatorVariant;
local v5 = require(l_Parent_0.App.Indicator.Enum.BadgeVariant);
return function(v6) --[[ Line: 9 ]] --[[ Name: migrateBadgeVariantToStatusIndicatorVariant ]]
    -- upvalues: l_Flags_0 (copy), v5 (copy), l_StatusIndicatorVariant_0 (copy)
    if l_Flags_0.FoundationStatusIndicatorVariantExperiment then
        if v6 == v5.Alert then
            return l_StatusIndicatorVariant_0.Alert;
        else
            return l_StatusIndicatorVariant_0.Contrast_Experiment;
        end;
    else
        return l_StatusIndicatorVariant_0.Emphasis;
    end;
end;