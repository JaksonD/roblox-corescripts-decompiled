local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.FocusNavigationUtils);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.SharedFlags);
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v2.FocusNavigableSurfaceIdentifierEnum;
local l_IconButton_0 = v3.IconButton;
local l_InputSize_0 = v3.Enums.InputSize;
local l_Sheet_0 = v3.Sheet;
local l_View_0 = v3.View;
local v12 = require(l_script_FirstAncestor_0.BeduiV2.Components.AbuseReportTooltip);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v15 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local v16 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.FocusNavigation.useFocusNavigationRefs);
local l_FFlagRemoveTitleAddEyebrowReport_0 = v5.FFlagRemoveTitleAddEyebrowReport;
return v4.memo(function(v18) --[[ Line: 39 ]]
    -- upvalues: l_FFlagRemoveTitleAddEyebrowReport_0 (copy), v4 (copy), v16 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_InputSize_0 (copy), v3 (copy), l_ButtonVariant_0 (copy), v15 (copy), v12 (copy)
    local l_abuseReportFlow_0 = v18.abuseReportFlow;
    local l_config_0 = l_abuseReportFlow_0.config;
    local l_currentPageElement_0 = l_abuseReportFlow_0.currentPageElement;
    local v22 = if l_FFlagRemoveTitleAddEyebrowReport_0 then nil else l_abuseReportFlow_0.config.display.title;
    local l_canGoBack_0 = l_abuseReportFlow_0.canGoBack;
    local v24, v25 = v4.useState(l_config_0.display.titleDisclosure and l_config_0.display.titleDisclosure.openByDefault or false);
    local v26 = v16(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, function() --[[ Line: 49 ]]
        -- upvalues: v25 (copy)
        v25(false);
    end);
    v4.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v24 (copy), v18 (copy)
        if v24 then
            v18.takeoverFocus(true);
            return;
        else
            v18.takeoverFocus(false);
            return;
        end;
    end, {
        v18.takeoverFocus, 
        v24
    });
    local v28 = v4.useCallback(function() --[[ Line: 61 ]]
        -- upvalues: v25 (copy)
        v25(function(v27) --[[ Line: 62 ]]
            return not v27;
        end);
    end, {});
    return v4.createElement(v4.Fragment, nil, {
        Header = v4.createElement(l_Sheet_0.Header, nil, v4.createElement(l_View_0, {
            tag = "size-full-0 auto-y row align-y-center gap-small flex-between"
        }, {
            v4.createElement(l_View_0, {
                tag = "auto-xy row align-y-center gap-small"
            }, {
                BackIcon = if l_canGoBack_0 then v4.createElement(l_IconButton_0, {
                    size = l_InputSize_0.Medium, 
                    icon = v3.Enums.IconName.ChevronLargeLeft, 
                    variant = l_ButtonVariant_0.Utility, 
                    onActivated = l_abuseReportFlow_0.goBack, 
                    LayoutOrder = 1
                }) else nil, 
                Title = if l_FFlagRemoveTitleAddEyebrowReport_0 then nil else v4.createElement(v15, {
                    input = v22, 
                    tag = "auto-xy text-heading-small", 
                    layoutOrder = 2
                })
            }); 
            AbuseReportTooltip = if l_config_0.display.titleDisclosure then v4.createElement(v12, {
                tooltipTitle = l_config_0.display.titleDisclosure.tooltipTitle, 
                tooltipText = l_config_0.display.titleDisclosure.tooltipText, 
                buttonLabel = l_config_0.display.titleDisclosure.buttonLabel, 
                layoutOrder = 3, 
                isOpen = v24, 
                onClose = v28, 
                ref = v26
            }, v4.createElement(l_IconButton_0, {
                size = l_InputSize_0.Medium, 
                icon = v3.Enums.IconName.CircleI, 
                variant = l_ButtonVariant_0.Utility, 
                onActivated = v28, 
                LayoutOrder = 3
            })) else nil
        })), 
        Content = l_currentPageElement_0
    });
end);