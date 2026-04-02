local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Components.AlertActions);
local v5 = require(l_script_FirstAncestor_0.Components.AlertActions.AlertConstants);
local _ = require(l_script_FirstAncestor_0.Enums.AlertSeverity);
local v7 = require(l_Parent_0.BuilderIcons);
local v8 = require(l_script_FirstAncestor_0.Components.CloseAffordance);
local v9 = require(l_script_FirstAncestor_0.Enums.CloseAffordanceVariant);
local v10 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v11 = require(l_script_FirstAncestor_0.Components.Icon);
local v12 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v13 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v14 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local v15 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v17 = require(l_script_FirstAncestor_0.Components.View);
local v18 = require(l_script_FirstAncestor_0.Utility.escapeRichText);
local v19 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v20 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v21 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_IconVariant_0 = v7.IconVariant;
local v23 = require(script.Parent.useFeedbackAlertVariants);
local v24 = {
    testId = "--foundation-feedback-alert"
};
return v2.memo(v2.forwardRef(function(v25, v26) --[[ Line: 50 ]] --[[ Name: FeedbackAlert ]]
    -- upvalues: v21 (copy), v24 (copy), v19 (copy), v23 (copy), v3 (copy), v18 (copy), v2 (copy), v10 (copy), v17 (copy), v20 (copy), v11 (copy), v5 (copy), v12 (copy), l_IconVariant_0 (copy), v15 (copy), v14 (copy), v8 (copy), v13 (copy), v9 (copy), v4 (copy)
    local v27 = v21(v25, v24);
    local v28 = v19();
    local v29 = v23(v28, v27.severity);
    local v30 = v3.useComposedRef(v26);
    local v31 = if v27.link then v18(v27.link.text) else nil;
    local v32, v33 = v2.useState(false);
    local v35 = v2.useCallback(function(v34) --[[ Line: 60 ]]
        -- upvalues: v33 (copy), v10 (ref)
        v33(v34 == v10.Hover);
    end, {});
    return v2.createElement(v17, v20(v27, {
        tag = v29.container.tag, 
        stroke = v29.stroke, 
        backgroundStyle = v29.backgroundStyle, 
        ref = v30
    }), {
        HeaderRow = v2.createElement(v17, {
            LayoutOrder = 1, 
            tag = v29.headerRow.tag, 
            testId = ("%*--header"):format(v27.testId)
        }, {
            Icon = v2.createElement(v11, {
                LayoutOrder = 1, 
                name = v5.SEVERITY_TO_ICON[v27.severity], 
                size = v12.Large, 
                variant = l_IconVariant_0.Filled, 
                style = v29.icon.style, 
                testId = ("%*--icon"):format(v27.testId)
            }), 
            Content = v2.createElement(v17, {
                LayoutOrder = 2, 
                tag = "row align-y-center fill gap-xsmall auto-y", 
                testId = ("%*--content"):format(v27.testId)
            }, {
                Title = v2.createElement(v15, {
                    Text = v27.title, 
                    tag = v29.title.tag, 
                    LayoutOrder = 1, 
                    testId = ("%*--title"):format(v27.testId)
                }), 
                Subtitle = if v27.subtitle then v2.createElement(v15, {
                    Text = v27.subtitle, 
                    tag = v29.subtitle.tag, 
                    LayoutOrder = 2, 
                    testId = ("%*--subtitle"):format(v27.testId)
                }) else nil, 
                Separator = if v27.link then v2.createElement(v15, {
                    Text = "\194\183", 
                    tag = "auto-xy text-body-medium content-default", 
                    LayoutOrder = 3, 
                    testId = ("%*--separator"):format(v27.testId)
                }) else nil, 
                Link = if v27.link then v2.createElement(v15, {
                    Text = if v32 then ("<u>%*</u>"):format(v31) else v31, 
                    RichText = true, 
                    tag = v29.link.tag, 
                    LayoutOrder = 4, 
                    stateLayer = {
                        affordance = v14.None
                    }, 
                    onStateChanged = v35, 
                    onActivated = v27.link.onActivated, 
                    testId = ("%*--link"):format(v27.testId)
                }) else nil
            }), 
            Close = if v27.onClose ~= nil then v2.createElement(v8, {
                onActivated = v27.onClose, 
                size = v13.XSmall, 
                variant = v9.Utility, 
                LayoutOrder = 3, 
                testId = ("%*--close"):format(v27.testId)
            }) else nil
        }), 
        Description = if v27.description then v2.createElement(v15, {
            Text = v27.description, 
            tag = v29.description.tag, 
            LayoutOrder = 2, 
            testId = ("%*--description"):format(v27.testId)
        }) else nil, 
        Actions = v2.createElement(v4, {
            actions = v27.actions, 
            testId = ("%*--actions"):format(v27.testId), 
            LayoutOrder = 3
        })
    });
end));