local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_Divider_0 = v1.Divider;
local l_Icon_0 = v1.Icon;
local l_IconName_0 = v1.Enums.IconName;
local l_InputSize_0 = v1.Enums.InputSize;
local l_RadioGroup_0 = v1.RadioGroup;
local l_Text_0 = v1.Text;
local l_View_0 = v1.View;
local l_withDefaults_0 = v1.Utility.withDefaults;
local v11 = require(script.Parent.Parent.useList);
local l_FFlagAbuseReportMenuV2_0 = require(l_Parent_0.SharedFlags).FFlagAbuseReportMenuV2;
local v13 = game:DefineFastFlag("ReportListRadioSelectable", false);
local v14 = {
    hasDivider = false
};
return v2.memo(v2.forwardRef(function(v15, v16) --[[ Line: 35 ]] --[[ Name: ListItem ]]
    -- upvalues: l_withDefaults_0 (copy), v14 (copy), v11 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), l_RadioGroup_0 (copy), v13 (copy), l_InputSize_0 (copy), l_FFlagAbuseReportMenuV2_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_Divider_0 (copy)
    local v17 = l_withDefaults_0(v15, v14);
    local v18 = v11();
    local l_value_0 = v18.value;
    local v20 = v2.useRef(nil);
    local v21 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v18 (copy), v17 (copy)
        v18.onValueChanged(v17.value);
    end, {
        v18, 
        v17.value
    });
    local l_createElement_0 = v2.createElement;
    local l_l_View_0_0 = l_View_0;
    local v24 = {
        tag = "size-full-0 auto-y col", 
        ref = v16
    };
    local v25 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_View_0_1 = l_View_0;
    local v28 = {
        onActivated = v21, 
        tag = "size-full-0 auto-y padding-medium"
    };
    local v29 = {};
    local l_createElement_2 = v2.createElement;
    local l_l_View_0_2 = l_View_0;
    local v32 = {
        tag = {
            ["size-full-0 auto-y row gap-medium align-x-center align-y-center flex-between"] = true, 
            ["padding-x-large"] = v17.hasMargin
        }
    };
    local v33 = {
        TextBlock = v2.createElement(l_View_0, {
            tag = "size-full-0 auto-xy col gap-small shrink", 
            LayoutOrder = 0
        }, {
            TitleBlock = v2.createElement(l_View_0, {
                tag = "auto-xy col gap-xsmall", 
                LayoutOrder = 0
            }, {
                Title = v2.createElement(l_Text_0, {
                    Text = v17.title, 
                    RichText = true, 
                    tag = "auto-xy text-align-x-left text-title-medium text-wrap content-emphasis", 
                    LayoutOrder = 0
                }), 
                Metadata = v17.metadata and v2.createElement(l_Text_0, {
                    Text = v17.metadata, 
                    RichText = true, 
                    tag = "auto-xy text-align-x-left text-body-small text-wrap", 
                    LayoutOrder = 1
                })
            }), 
            Description = v17.description and v2.createElement(l_Text_0, {
                Text = v17.description, 
                RichText = true, 
                tag = "auto-xy text-align-x-left text-body-small text-wrap", 
                LayoutOrder = 1
            })
        })
    };
    local l_createElement_3 = v2.createElement;
    local l_l_View_0_3 = l_View_0;
    local v36 = {
        tag = "size-600-0 auto-y align-y-center col", 
        LayoutOrder = 1
    };
    local v37 = {};
    local v38 = false;
    if v17.trailingAccessory == "Radio" then
        v38 = v2.createElement(l_RadioGroup_0.Root, {
            onValueChanged = v21, 
            value = l_value_0, 
            Selectable = not v13 or false
        }, {
            v2.createElement(l_RadioGroup_0.Item, {
                value = v17.value, 
                label = "", 
                size = l_InputSize_0.Small, 
                ref = v20
            })
        });
    end;
    v37.Radio = v38;
    v37.Chevron = if l_FFlagAbuseReportMenuV2_0 then v17.trailingAccessory == "Chevron" and v2.createElement(l_Icon_0, {
        name = l_IconName_0.ChevronLargeRight
    }) else nil;
    v33.AccessoryBlock = l_createElement_3(l_l_View_0_3, v36, v37);
    v29.ListItemContent = l_createElement_2(l_l_View_0_2, v32, v33);
    v25.ListItem = l_createElement_1(l_l_View_0_1, v28, v29);
    v25.Divider = v17.hasDivider and v2.createElement(l_Divider_0, {
        LayoutOrder = 2
    }) or nil;
    return l_createElement_0(l_l_View_0_0, v24, v25);
end));