local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local l_FFlagAddThumbnailSelectorReport_0 = require(l_Parent_0.SharedFlags).FFlagAddThumbnailSelectorReport;
return v2.createContext({
    custom = if l_FFlagAddThumbnailSelectorReport_0 then {} else nil, 
    formData = {}, 
    updateForm = function(_, _) --[[ Line: 16 ]] --[[ Name: updateForm ]]

    end, 
    additionalReportTags = if l_FFlagAddThumbnailSelectorReport_0 then {} else nil, 
    updateAdditionalReportTags = l_FFlagAddThumbnailSelectorReport_0 and function(_, _) --[[ Line: 19 ]]

    end or nil
});