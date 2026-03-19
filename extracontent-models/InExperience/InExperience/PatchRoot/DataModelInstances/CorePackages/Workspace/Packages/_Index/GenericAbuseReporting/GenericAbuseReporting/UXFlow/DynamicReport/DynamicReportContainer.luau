local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v4 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v4.FoundationProvider;
local l_ThemeContext_0 = require(l_Parent_0.Style).ThemeContext;
local v7 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportAnalyticsProvider);
local v8 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiProvider);
local v9 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportFormDataProvider);
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v11 = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v12 = require(l_script_FirstAncestor_0.UXFlow.DynamicReport.DynamicReport);
local v13 = require(l_script_FirstAncestor_0.UXFlow.DynamicReportV2.DynamicReportV2Container);
local l_FFlagAddThumbnailSelectorReport_0 = require(l_Parent_0.SharedFlags).FFlagAddThumbnailSelectorReport;
local v15 = game:DefineFastFlag("EnableDynamicReportV2ForUserProfileReports3", false);
return v2.memo(function(v16) --[[ Line: 37 ]] --[[ Name: DynamicReportContainer ]]
    -- upvalues: v2 (copy), l_ThemeContext_0 (copy), v15 (copy), v11 (copy), v13 (copy), l_LayerCollectorProvider_0 (copy), l_FoundationProvider_0 (copy), v4 (copy), v8 (copy), v9 (copy), l_FFlagAddThumbnailSelectorReport_0 (copy), v7 (copy), v12 (copy)
    local v17 = v2.useContext(l_ThemeContext_0);
    if v15 and v16.abuseVector == v11.UserProfile then
        local v18 = {
            abuseVector = v16.abuseVector, 
            targetId = v16.targetId, 
            onClose = v16.onClose, 
            onSubmit = v16.onSubmit, 
            custom = v16.custom
        };
        return v2.createElement(v13, v18);
    else
        return v2.createElement(l_LayerCollectorProvider_0, {}, {
            FoundationProvider = v2.createElement(l_FoundationProvider_0, {
                theme = if v17.theme == "light" then v4.Enums.Theme.Light else v4.Enums.Theme.Dark
            }, {
                AbuseReportBeduiProvider = v2.createElement(v8, {
                    abuseVector = v16.abuseVector
                }, {
                    AbuseReportFormDataProvider = v2.createElement(v9, {
                        custom = if l_FFlagAddThumbnailSelectorReport_0 then v16.custom else nil
                    }, {
                        AbuseReportAnalyticsProvider = v2.createElement(v7, {
                            abuseVector = v16.abuseVector
                        }, {
                            DynamicReport = v2.createElement(v12, v16)
                        })
                    })
                })
            })
        });
    end;
end);