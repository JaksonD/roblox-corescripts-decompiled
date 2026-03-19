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
local v13 = {
    hasDivider = false
};
return v2.memo(v2.forwardRef(function(v14, v15) --[[ Line: 34 ]] --[[ Name: ListItem ]]
    -- upvalues: l_withDefaults_0 (copy), v13 (copy), v11 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), l_RadioGroup_0 (copy), l_InputSize_0 (copy), l_FFlagAbuseReportMenuV2_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_Divider_0 (copy)
    local v16 = l_withDefaults_0(v14, v13);
    local v17 = v11();
    local l_value_0 = v17.value;
    local v19 = v2.useRef(nil);
    local v20 = v2.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: v17 (copy), v16 (copy)
        v17.onValueChanged(v16.value);
    end, {
        v17, 
        v16.value
    });
    local l_createElement_0 = v2.createElement;
    local l_l_View_0_0 = l_View_0;
    local v23 = {
        tag = "size-full-0 auto-y col", 
        ref = v15
    };
    local v24 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_View_0_1 = l_View_0;
    local v27 = {
        onActivated = v20, 
        tag = "size-full-0 auto-y padding-medium"
    };
    local v28 = {};
    local l_createElement_2 = v2.createElement;
    local l_l_View_0_2 = l_View_0;
    local v31 = {
        tag = {
            ["size-full-0 auto-y row gap-medium align-x-center align-y-center flex-between"] = true, 
            ["padding-x-large"] = v16.hasMargin
        }
    };
    local v32 = {
        TextBlock = v2.createElement(l_View_0, {
            tag = "size-full-0 auto-xy col gap-small shrink", 
            LayoutOrder = 0
        }, {
            TitleBlock = v2.createElement(l_View_0, {
                tag = "auto-xy col gap-xsmall", 
                LayoutOrder = 0
            }, {
                Title = v2.createElement(l_Text_0, {
                    Text = v16.title, 
                    RichText = true, 
                    tag = "auto-xy text-align-x-left text-title-medium text-wrap content-emphasis", 
                    LayoutOrder = 0
                }), 
                Metadata = v16.metadata and v2.createElement(l_Text_0, {
                    Text = v16.metadata, 
                    RichText = true, 
                    tag = "auto-xy text-align-x-left text-body-small text-wrap", 
                    LayoutOrder = 1
                })
            }), 
            Description = v16.description and v2.createElement(l_Text_0, {
                Text = v16.description, 
                RichText = true, 
                tag = "auto-xy text-align-x-left text-body-small text-wrap", 
                LayoutOrder = 1
            })
        })
    };
    local l_createElement_3 = v2.createElement;
    local l_l_View_0_3 = l_View_0;
    local v35 = {
        tag = "size-600-0 auto-y align-y-center col", 
        LayoutOrder = 1
    };
    local v36 = {};
    local v37 = false;
    if v16.trailingAccessory == "Radio" then
        v37 = v2.createElement(l_RadioGroup_0.Root, {
            onValueChanged = v20, 
            value = l_value_0, 
            Selectable = true
        }, {
            v2.createElement(l_RadioGroup_0.Item, {
                value = v16.value, 
                label = "", 
                size = l_InputSize_0.Small, 
                ref = v19
            })
        });
    end;
    v36.Radio = v37;
    v36.Chevron = if l_FFlagAbuseReportMenuV2_0 then v16.trailingAccessory == "Chevron" and v2.createElement(l_Icon_0, {
        name = l_IconName_0.ChevronLargeRight
    }) else nil;
    v32.AccessoryBlock = l_createElement_3(l_l_View_0_3, v35, v36);
    v28.ListItemContent = l_createElement_2(l_l_View_0_2, v31, v32);
    v24.ListItem = l_createElement_1(l_l_View_0_1, v27, v28);
    v24.Divider = v16.hasDivider and v2.createElement(l_Divider_0, {
        LayoutOrder = 2
    }) or nil;
    return l_createElement_0(l_l_View_0_0, v23, v24);
end));