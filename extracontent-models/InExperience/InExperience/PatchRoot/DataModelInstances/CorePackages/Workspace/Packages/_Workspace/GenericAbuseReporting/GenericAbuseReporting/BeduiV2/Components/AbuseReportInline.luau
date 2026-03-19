local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local _ = require(l_Parent_0.RobloxAppEnums);
local v6 = require(l_Parent_0.RobloxAppHooks);
local l_Icon_0 = v3.Icon;
local l_IconName_0 = v3.Enums.IconName;
local l_InputSize_0 = v3.Enums.InputSize;
local l_useDeviceOrientation_0 = v6.useDeviceOrientation;
local l_View_0 = v3.View;
local v12 = require(l_script_FirstAncestor_0.BeduiV2.Components.AbuseReportTooltip);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
return v4.memo(function(v14) --[[ Line: 32 ]] --[[ Name: AbuseReportInline ]]
    -- upvalues: v4 (copy), l_useDeviceOrientation_0 (copy), l_GuiService_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_InputSize_0 (copy), v12 (copy)
    local l_abuseReportFlow_0 = v14.abuseReportFlow;
    local l_config_0 = l_abuseReportFlow_0.config;
    local l_currentPageElement_0 = l_abuseReportFlow_0.currentPageElement;
    local v18, v19 = v4.useState(l_config_0.display.titleDisclosure and l_config_0.display.titleDisclosure.openByDefault or false);
    local v20 = l_useDeviceOrientation_0();
    local v21 = l_GuiService_0.ViewportDisplaySize == Enum.DisplaySize.Small;
    local v22 = false;
    if v20 == "Landscape" then
        v22 = v21;
    end;
    local v24 = v4.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v19 (copy)
        v19(function(v23) --[[ Line: 44 ]]
            return not v23;
        end);
    end, {});
    return v4.createElement(l_View_0, {
        tag = "size-full-0 auto-y"
    }, {
        OverlaidControlsLayout = v22 and v4.createElement(l_View_0, {
            tag = "size-full-0 auto-y"
        }, {
            BackButtonContainer = v4.createElement(l_View_0, {
                isDisabled = not l_abuseReportFlow_0.canGoBack, 
                onActivated = l_abuseReportFlow_0.goBack, 
                tag = "auto-xy align-x-center padding-medium radius-circle anchor-top-left position-top-left"
            }, v4.createElement(l_Icon_0, {
                name = l_IconName_0.ChevronLargeLeft, 
                size = l_InputSize_0.Medium, 
                style = {
                    Transparency = l_abuseReportFlow_0.canGoBack and 0 or 1
                }
            })), 
            Content = v4.createElement(l_View_0, {
                tag = "auto-xy fill col padding-top-medium", 
                LayoutOrder = 2
            }, l_currentPageElement_0), 
            AbuseReportTooltipContainer = v4.createElement(l_View_0, {
                tag = "auto-xy align-x-center padding-medium radius-circle anchor-top-right position-top-right", 
                onActivated = v24, 
                ZIndex = 2
            }, if l_config_0.display.titleDisclosure then v4.createElement(v12, {
                tooltipTitle = l_config_0.display.titleDisclosure.tooltipTitle, 
                tooltipText = l_config_0.display.titleDisclosure.tooltipText, 
                buttonLabel = l_config_0.display.titleDisclosure.buttonLabel, 
                isOpen = v18, 
                onClose = v24
            }, v4.createElement(l_Icon_0, {
                name = l_IconName_0.CircleI, 
                size = l_InputSize_0.Medium
            })) else nil)
        })
    });
end);