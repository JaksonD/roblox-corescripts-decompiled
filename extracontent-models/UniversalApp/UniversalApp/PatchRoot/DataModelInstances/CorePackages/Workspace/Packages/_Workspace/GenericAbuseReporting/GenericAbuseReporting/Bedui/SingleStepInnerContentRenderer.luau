local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_View_0 = v2.View;
local v5 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local v6 = require(l_script_FirstAncestor_0.Bedui.Utils.BeduiAnalytics);
local l_ComponentType_0 = v5.ComponentType;
local v8 = require(l_script_FirstAncestor_0.Bedui.Components.Dropdown);
local v9 = require(l_script_FirstAncestor_0.Bedui.Components.FreeComment);
local v10 = require(l_script_FirstAncestor_0.Bedui.Components.Paragraph);
local v11 = require(l_script_FirstAncestor_0.Bedui.Components.Selector);
local l_sendAnalyticsEvent_0 = v6.sendAnalyticsEvent;
local l_TelemetryEventType_0 = v6.TelemetryEventType;
local v14 = require(l_script_FirstAncestor_0.Bedui.Provider.useAnalyticsContext);
local v15 = require(l_script_FirstAncestor_0.Bedui.Components.WebViewLink);
local l_FFlagAddThumbnailSelectorReport_0 = require(l_Parent_0.SharedFlags).FFlagAddThumbnailSelectorReport;
return v3.memo(function(v17) --[[ Line: 30 ]] --[[ Name: SingleStepInnerContentRenderer ]]
    -- upvalues: v14 (copy), v3 (copy), l_ComponentType_0 (copy), v8 (copy), v9 (copy), v10 (copy), v15 (copy), l_FFlagAddThumbnailSelectorReport_0 (copy), v11 (copy), l_sendAnalyticsEvent_0 (copy), l_TelemetryEventType_0 (copy), l_View_0 (copy)
    local v18 = v14();
    local v37 = v3.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v17 (copy), l_ComponentType_0 (ref), v3 (ref), v8 (ref), v9 (ref), v10 (ref), v15 (ref), l_FFlagAddThumbnailSelectorReport_0 (ref), v11 (ref), v18 (copy), l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref)
        if v17.contentConfig == nil then
            return {};
        else
            local v19 = {};
            if v17.contentConfig.type == "configurableComponentList" then
                for v20, v21 in ipairs(v17.contentConfig.configurableComponentList.components) do
                    if v21.componentType == l_ComponentType_0.Dropdown then
                        local v22 = ("%*%*"):format(v21.componentType, v20);
                        local l_createElement_0 = v3.createElement;
                        local l_v8_0 = v8;
                        local v25 = {
                            component = v21
                        };
                        local v26 = false;
                        if v21.formDataKey ~= nil then
                            v26 = table.find(v17.formDataKeysWithError, v21.formDataKey) ~= nil;
                        end;
                        v25.isErrorState = v26;
                        v25.layoutOrder = v20;
                        v19[v22] = l_createElement_0(l_v8_0, v25);
                    elseif v21.componentType == l_ComponentType_0.FreeComment then
                        local v27 = ("%*%*"):format(v21.componentType, v20);
                        local l_createElement_1 = v3.createElement;
                        local l_v9_0 = v9;
                        local v30 = {
                            component = v21
                        };
                        local v31 = false;
                        if v21.formDataKey ~= nil then
                            v31 = table.find(v17.formDataKeysWithError, v21.formDataKey) ~= nil;
                        end;
                        v30.isErrorState = v31;
                        v30.layoutOrder = v20;
                        v19[v27] = l_createElement_1(l_v9_0, v30);
                    elseif v21.componentType == l_ComponentType_0.Paragraph then
                        v19[("%*%*"):format(v21.componentType, v20)] = v3.createElement(v10, {
                            component = v21, 
                            layoutOrder = v20
                        });
                    elseif v21.componentType == l_ComponentType_0.WebViewLink then
                        v19[("%*%*"):format(v21.componentType, v20)] = v3.createElement(v15, {
                            component = v21, 
                            layoutOrder = v20
                        });
                    elseif l_FFlagAddThumbnailSelectorReport_0 and v21.componentType == l_ComponentType_0.Selector then
                        local v32 = ("%*%*"):format(v21.componentType, v20);
                        local l_createElement_2 = v3.createElement;
                        local l_v11_0 = v11;
                        local v35 = {
                            abuseVector = v18.abuseVector, 
                            component = v21
                        };
                        local v36 = false;
                        if v21.formDataKey ~= nil then
                            v36 = table.find(v17.formDataKeysWithError, v21.formDataKey) ~= nil;
                        end;
                        v35.isErrorState = v36;
                        v35.layoutOrder = v20;
                        v19[v32] = l_createElement_2(l_v11_0, v35);
                    else
                        l_sendAnalyticsEvent_0({
                            eventType = l_TelemetryEventType_0.Error, 
                            context = v18, 
                            meta = {
                                error = ("SingleStepInnerContentRenderer - Unsupported component type: %*"):format(v21.componentType)
                            }
                        });
                    end;
                end;
                return v19;
            else
                return {};
            end;
        end;
    end, {
        v17.contentConfig, 
        v17.formDataKeysWithError, 
        l_sendAnalyticsEvent_0, 
        v18
    });
    return v3.createElement(l_View_0, {
        tag = "size-full-0 auto-y col gap-xxlarge"
    }, v37);
end);