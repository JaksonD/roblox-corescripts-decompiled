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
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
return v3.memo(function(v11) --[[ Line: 29 ]] --[[ Name: AbuseReportInline ]]
    -- upvalues: v3 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_InputSize_0 (copy), v8 (copy), v10 (copy)
    local l_abuseReportFlow_0 = v11.abuseReportFlow;
    local l_config_0 = l_abuseReportFlow_0.config;
    local l_currentPageElement_0 = l_abuseReportFlow_0.currentPageElement;
    local v15, v16 = v3.useState(l_config_0.display.titleDisclosure and l_config_0.display.titleDisclosure.openByDefault or false);
    local v18 = v3.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v16 (copy)
        v16(function(v17) --[[ Line: 37 ]]
            return not v17;
        end);
    end, {});
    local v19 = v3.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: v3 (ref), l_View_0 (ref), l_abuseReportFlow_0 (copy), v11 (copy), l_Icon_0 (ref), l_IconName_0 (ref), l_InputSize_0 (ref)
        return v3.createElement(l_View_0, {
            isDisabled = not l_abuseReportFlow_0.canGoBack, 
            onActivated = l_abuseReportFlow_0.goBack, 
            tag = {
                ["auto-xy align-x-center padding-medium radius-circle"] = true, 
                ["anchor-top-left position-top-left"] = v11.shouldUseOverlaidControls
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
        v11.shouldUseOverlaidControls
    });
    local v20 = v3.useMemo(function() --[[ Line: 65 ]]
        -- upvalues: l_config_0 (copy), v3 (ref), l_View_0 (ref), v18 (copy), v11 (copy), v8 (ref), v15 (copy), l_Icon_0 (ref), l_IconName_0 (ref), l_InputSize_0 (ref)
        if l_config_0.display.titleDisclosure then
            return (v3.createElement(l_View_0, {
                onActivated = v18, 
                tag = {
                    ["auto-xy align-x-center padding-medium radius-circle"] = true, 
                    ["anchor-top-right position-top-right"] = v11.shouldUseOverlaidControls
                }, 
                LayoutOrder = 3, 
                ZIndex = 2
            }, v3.createElement(v8, {
                tooltipTitle = l_config_0.display.titleDisclosure.tooltipTitle, 
                tooltipText = l_config_0.display.titleDisclosure.tooltipText, 
                buttonLabel = l_config_0.display.titleDisclosure.buttonLabel, 
                isOpen = v15, 
                onClose = v18
            }, v3.createElement(l_Icon_0, {
                name = l_IconName_0.CircleI, 
                size = l_InputSize_0.Medium
            }))));
        else
            return nil;
        end;
    end, {
        l_config_0.display.titleDisclosure, 
        v18, 
        v15, 
        v11.shouldUseOverlaidControls
    });
    return v3.createElement(l_View_0, {
        tag = "size-full"
    }, {
        OverlaidControlsLayout = v11.shouldUseOverlaidControls and v3.createElement(l_View_0, {
            tag = "size-full"
        }, {
            BackButtonContainer = v19, 
            Content = v3.createElement(l_View_0, {
                tag = "col size-full padding-top-medium", 
                LayoutOrder = 2
            }, l_currentPageElement_0), 
            AbuseReportTooltipContainer = v20
        }), 
        ControlRowLayout = not v11.shouldUseOverlaidControls and v3.createElement(l_View_0, {
            tag = "col size-full"
        }, {
            ControlRow = v3.createElement(l_View_0, {
                tag = "row flex-between size-full-0 auto-y", 
                LayoutOrder = 1
            }, {
                BackButtonContainer = v19, 
                Title = if l_config_0.display.title then v3.createElement(l_View_0, {
                    tag = "align-x-center auto-xy padding-medium"
                }, v3.createElement(v10, {
                    input = l_config_0.display.title, 
                    tag = "auto-xy text-heading-small", 
                    layoutOrder = 2
                })) else nil, 
                AbuseReportTooltipContainer = v20
            }), 
            Content = v3.createElement(l_View_0, {
                tag = "col size-full-0 padding-top-medium fill", 
                LayoutOrder = 2
            }, l_currentPageElement_0)
        })
    });
end);