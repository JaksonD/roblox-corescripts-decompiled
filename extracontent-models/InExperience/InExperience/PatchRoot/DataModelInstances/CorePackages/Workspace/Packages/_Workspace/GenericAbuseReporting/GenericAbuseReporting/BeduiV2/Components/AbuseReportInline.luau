local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_Icon_0 = v2.Icon;
local l_IconName_0 = v2.Enums.IconName;
local l_InputSize_0 = v2.Enums.InputSize;
local l_View_0 = v2.View;
local v8 = require(l_script_FirstAncestor_0.BeduiV2.Components.AbuseReportTooltip);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v11 = require(l_script_FirstAncestor_0.BeduiV2.Components.SlideTransition);
local l_useLayoutSlots_0 = v10.useLayoutSlots;
return v3.memo(function(v13) --[[ Line: 32 ]] --[[ Name: AbuseReportInline ]]
    -- upvalues: l_useLayoutSlots_0 (copy), v3 (copy), v11 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_InputSize_0 (copy), v8 (copy)
    local l_InlineContainer_0 = l_useLayoutSlots_0().InlineContainer;
    local l_abuseReportFlow_0 = v13.abuseReportFlow;
    local l_config_0 = l_abuseReportFlow_0.config;
    local l_currentPageElement_0 = l_abuseReportFlow_0.currentPageElement;
    local v18 = v3.createElement(v11, {
        nodeContent = v3.createElement(l_InlineContainer_0 or v3.Fragment, nil, l_currentPageElement_0), 
        nodeId = l_abuseReportFlow_0.currentNodeId, 
        nodeType = l_abuseReportFlow_0.currentNodeType, 
        direction = l_abuseReportFlow_0.navigationDirection
    });
    local v19, v20 = v3.useState(l_config_0.display.titleDisclosure and l_config_0.display.titleDisclosure.openByDefault or false);
    local v22 = v3.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v20 (copy)
        v20(function(v21) --[[ Line: 49 ]]
            return not v21;
        end);
    end, {});
    local v23 = v3.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v3 (ref), l_View_0 (ref), l_abuseReportFlow_0 (copy), v13 (copy), l_Icon_0 (ref), l_IconName_0 (ref), l_InputSize_0 (ref)
        return v3.createElement(l_View_0, {
            isDisabled = not l_abuseReportFlow_0.canGoBack, 
            onActivated = l_abuseReportFlow_0.goBack, 
            tag = {
                ["auto-xy align-x-center padding-medium radius-circle"] = true, 
                ["anchor-top-left position-top-left"] = v13.shouldUseOverlaidControls
            }, 
            LayoutOrder = 1
        }, v3.createElement(l_Icon_0, {
            name = l_IconName_0.ChevronLargeLeft, 
            size = l_InputSize_0.Medium, 
            style = {
                Transparency = l_abuseReportFlow_0.canGoBack and 0 or 1
            }
        }));
    end, {
        l_abuseReportFlow_0.canGoBack, 
        l_abuseReportFlow_0.goBack, 
        v13.shouldUseOverlaidControls
    });
    local v24 = v3.useMemo(function() --[[ Line: 77 ]]
        -- upvalues: l_config_0 (copy), v3 (ref), l_View_0 (ref), v22 (copy), v13 (copy), v8 (ref), v19 (copy), l_Icon_0 (ref), l_IconName_0 (ref), l_InputSize_0 (ref)
        if l_config_0.display.titleDisclosure then
            return (v3.createElement(l_View_0, {
                onActivated = v22, 
                tag = {
                    ["auto-xy align-x-center padding-medium radius-circle"] = true, 
                    ["anchor-top-right position-top-right"] = v13.shouldUseOverlaidControls
                }, 
                LayoutOrder = 3, 
                ZIndex = 2
            }, v3.createElement(v8, {
                tooltipTitle = l_config_0.display.titleDisclosure.tooltipTitle, 
                tooltipText = l_config_0.display.titleDisclosure.tooltipText, 
                buttonLabel = l_config_0.display.titleDisclosure.buttonLabel, 
                isOpen = v19, 
                onClose = v22
            }, v3.createElement(l_Icon_0, {
                name = l_IconName_0.CircleI, 
                size = l_InputSize_0.Medium
            }))));
        else
            return nil;
        end;
    end, {
        l_config_0.display.titleDisclosure, 
        v22, 
        v19, 
        v13.shouldUseOverlaidControls
    });
    return v3.createElement(l_View_0, {
        tag = "size-full"
    }, {
        OverlaidControlsLayout = v13.shouldUseOverlaidControls and v3.createElement(l_View_0, {
            tag = "size-full"
        }, {
            BackButtonContainer = v23, 
            Content = v3.createElement(l_View_0, {
                tag = "col gap-xlarge size-full padding-top-medium", 
                LayoutOrder = 2
            }, v18), 
            AbuseReportTooltipContainer = v24
        }), 
        ControlRowLayout = not v13.shouldUseOverlaidControls and v3.createElement(l_View_0, {
            tag = "col size-full"
        }, {
            ControlRow = v3.createElement(l_View_0, {
                tag = "row flex-between size-full-0 auto-y", 
                LayoutOrder = 1
            }, {
                BackButtonContainer = v23, 
                AbuseReportTooltipContainer = v24
            }), 
            Content = v3.createElement(l_View_0, {
                tag = "col fill size-full-0 padding-top-medium", 
                LayoutOrder = 2
            }, v18)
        })
    });
end);