local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v4 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportFormDataContext);
local l_FFlagAddThumbnailSelectorReport_0 = require(l_Parent_0.SharedFlags).FFlagAddThumbnailSelectorReport;
return function(v6) --[[ Line: 19 ]] --[[ Name: AbuseReportFormDataProvider ]]
    -- upvalues: v2 (copy), v4 (copy), l_FFlagAddThumbnailSelectorReport_0 (copy)
    local v7, v8 = v2.useState({});
    local v9, v10 = v2.useState({});
    local v15 = v2.useCallback(function(v11, v12) --[[ Line: 23 ]]
        -- upvalues: v8 (copy)
        v8(function(v13) --[[ Line: 24 ]]
            -- upvalues: v11 (copy), v12 (copy)
            local v14 = table.clone(v13);
            v14[v11] = v12;
            return v14;
        end);
    end, {});
    local v20 = v2.useCallback(function(v16, v17) --[[ Line: 31 ]]
        -- upvalues: v10 (copy)
        v10(function(v18) --[[ Line: 32 ]]
            -- upvalues: v16 (copy), v17 (copy)
            local v19 = table.clone(v18);
            v19[v16] = v17;
            return v19;
        end);
    end, {});
    return v2.createElement(v4.Provider, {
        value = {
            formData = v7, 
            updateForm = v15, 
            custom = v6.custom, 
            additionalReportTags = if l_FFlagAddThumbnailSelectorReport_0 then v9 else nil, 
            updateAdditionalReportTags = if l_FFlagAddThumbnailSelectorReport_0 then v20 else nil
        }
    }, v6.children);
end;