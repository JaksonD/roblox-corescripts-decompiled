local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.SharedFlags);
local l_FStringReportMenuIXPLayer_0 = v3.FStringReportMenuIXPLayer;
local l_FFlagHighlightModePreciseSelectionEnabled_0 = v3.FFlagHighlightModePreciseSelectionEnabled;
local l_FStringHighlightModePreciseSelectionIXPField_0 = v3.FStringHighlightModePreciseSelectionIXPField;
local l_FStringHighlightModePreciseSelectionForceVariant_0 = v3.FStringHighlightModePreciseSelectionForceVariant;
local v8 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants);
return function() --[[ Line: 15 ]] --[[ Name: getHighlightModeVariant ]]
    -- upvalues: l_FFlagHighlightModePreciseSelectionEnabled_0 (copy), v8 (copy), l_FStringHighlightModePreciseSelectionForceVariant_0 (copy), l_IXPService_0 (copy), l_FStringReportMenuIXPLayer_0 (copy), l_FStringHighlightModePreciseSelectionIXPField_0 (copy)
    if not l_FFlagHighlightModePreciseSelectionEnabled_0 then
        return v8.HighlightModeVariants.Default;
    elseif l_FStringHighlightModePreciseSelectionForceVariant_0 ~= "" then
        return l_FStringHighlightModePreciseSelectionForceVariant_0;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
            -- upvalues: l_IXPService_0 (ref), l_FStringReportMenuIXPLayer_0 (ref)
            return l_IXPService_0:GetUserLayerVariables(l_FStringReportMenuIXPLayer_0);
        end);
        if not l_status_0 or not l_result_0 or l_result_0[l_FStringHighlightModePreciseSelectionIXPField_0] == nil then
            return v8.HighlightModeVariants.Default;
        else
            return l_result_0[l_FStringHighlightModePreciseSelectionIXPField_0];
        end;
    end;
end;