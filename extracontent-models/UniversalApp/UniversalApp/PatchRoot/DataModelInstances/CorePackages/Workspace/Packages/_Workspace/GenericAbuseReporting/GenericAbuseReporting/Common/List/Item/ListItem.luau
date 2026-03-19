local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_Divider_0 = v1.Divider;
local l_InputSize_0 = v1.Enums.InputSize;
local l_RadioGroup_0 = v1.RadioGroup;
local l_Text_0 = v1.Text;
local l_View_0 = v1.View;
local l_withDefaults_0 = v1.Utility.withDefaults;
local v9 = require(script.Parent.Parent.useList);
local v10 = {
    hasDivider = false
};
return v2.memo(v2.forwardRef(function(v11, v12) --[[ Line: 30 ]] --[[ Name: ListItem ]]
    -- upvalues: l_withDefaults_0 (copy), v10 (copy), v9 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), l_RadioGroup_0 (copy), l_InputSize_0 (copy), l_Divider_0 (copy)
    local v13 = l_withDefaults_0(v11, v10);
    local v14 = v9();
    local l_value_0 = v14.value;
    local v16 = v2.useRef(nil);
    local v17 = v2.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v14 (copy), v13 (copy)
        v14.onValueChanged(v13.value);
    end, {
        v14, 
        v13.value
    });
    local l_createElement_0 = v2.createElement;
    local l_l_View_0_0 = l_View_0;
    local v20 = {
        tag = "size-full-0 auto-y col", 
        ref = v12
    };
    local v21 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_View_0_1 = l_View_0;
    local v24 = {
        onActivated = v17, 
        tag = "size-full-0 auto-y padding-medium"
    };
    local v25 = {};
    local l_createElement_2 = v2.createElement;
    local l_l_View_0_2 = l_View_0;
    local v28 = {
        tag = {
            ["size-full-0 auto-y row gap-medium align-x-center align-y-center flex-between"] = true, 
            ["padding-x-large"] = v13.hasMargin
        }
    };
    local v29 = {
        TextBlock = v2.createElement(l_View_0, {
            tag = "size-full-0 auto-xy col gap-small shrink", 
            LayoutOrder = 0
        }, {
            TitleBlock = v2.createElement(l_View_0, {
                tag = "auto-xy col gap-xsmall", 
                LayoutOrder = 0
            }, {
                Title = v2.createElement(l_Text_0, {
                    Text = v13.title, 
                    RichText = true, 
                    tag = "auto-xy text-align-x-left text-title-medium text-wrap content-emphasis", 
                    LayoutOrder = 0
                }), 
                Metadata = v13.metadata and v2.createElement(l_Text_0, {
                    Text = v13.metadata, 
                    RichText = true, 
                    tag = "auto-xy text-align-x-left text-body-small text-wrap", 
                    LayoutOrder = 1
                })
            }), 
            Description = v13.description and v2.createElement(l_Text_0, {
                Text = v13.description, 
                RichText = true, 
                tag = "auto-xy text-align-x-left text-body-small text-wrap", 
                LayoutOrder = 1
            })
        })
    };
    local l_createElement_3 = v2.createElement;
    local l_l_View_0_3 = l_View_0;
    local v32 = {
        tag = "size-600-0 auto-y align-y-center col", 
        LayoutOrder = 1
    };
    local v33 = {};
    local v34 = false;
    if v13.trailingAccessory == "Radio" then
        v34 = v2.createElement(l_RadioGroup_0.Root, {
            onValueChanged = v17, 
            value = l_value_0, 
            Selectable = true
        }, {
            v2.createElement(l_RadioGroup_0.Item, {
                value = v13.value, 
                label = "", 
                size = l_InputSize_0.Small, 
                ref = v16
            })
        });
    end;
    v33.Radio = v34;
    v29.AccessoryBlock = l_createElement_3(l_l_View_0_3, v32, v33);
    v25.ListItemContent = l_createElement_2(l_l_View_0_2, v28, v29);
    v21.ListItem = l_createElement_1(l_l_View_0_1, v24, v25);
    v21.Divider = v13.hasDivider and v2.createElement(l_Divider_0, {
        LayoutOrder = 2
    }) or nil;
    return l_createElement_0(l_l_View_0_0, v20, v21);
end));