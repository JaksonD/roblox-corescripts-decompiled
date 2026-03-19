local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Components.Button);
local v5 = require(l_script_FirstAncestor_0.Components.CloseAffordance);
local v6 = require(l_script_FirstAncestor_0.Enums.CloseAffordanceVariant);
local v7 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v8 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v9 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v10 = require(l_script_FirstAncestor_0.Utility.Logger);
local v11 = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local v12 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext);
local v14 = require(l_script_FirstAncestor_0.Enums.Radius);
local v15 = require(l_script_FirstAncestor_0.Components.Text);
local v16 = require(l_script_FirstAncestor_0.Utility.Localization.Translator);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v18 = require(l_script_FirstAncestor_0.Components.View);
local v19 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v20 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v21 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v22 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v23 = require(l_script_FirstAncestor_0.Components.Popover);
local v24 = {
    isOpen = false, 
    align = v11.Start, 
    side = v12.Right, 
    testId = "--foundation-coachmark"
};
local function _(v25, v26) --[[ Line: 72 ]] --[[ Name: stepsText ]]
    -- upvalues: v16 (copy)
    return v16:FormatByKey("CommonUI.Controls.Label.PageCount", {
        current = v25, 
        total = v26
    });
end;
return v3.memo(v3.forwardRef(function(v28, v29) --[[ Line: 76 ]] --[[ Name: Coachmark ]]
    -- upvalues: v22 (copy), v24 (copy), v20 (copy), v19 (copy), v3 (copy), v10 (copy), v9 (copy), v8 (copy), v2 (copy), v4 (copy), v23 (copy), v21 (copy), v14 (copy), v13 (copy), v7 (copy), v18 (copy), v5 (copy), v6 (copy), v15 (copy), v16 (copy)
    local v30 = v22(v28, v24);
    local v31 = v20();
    local v32 = v19(320);
    local v33 = if v30.onClose then {
        MaxSize = Vector2.new(v32 - v31.Size.Size_1200, 1e999)
    } else nil;
    local v39 = v3.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v30 (copy), v10 (ref), v9 (ref), v8 (ref), v2 (ref), v3 (ref), v4 (ref)
        local v34 = {};
        if not v30.actions then
            return v34;
        else
            for v35, v36 in v30.actions do
                if v35 > 2 then
                    v10:warning((("Coachmark only supports up to %* actions"):format(2)));
                    return v34;
                else
                    local v37 = {
                        LayoutOrder = v35, 
                        size = v9.Medium, 
                        fillBehavior = v8.Fill, 
                        testId = ("%*--action-%*"):format(v30.testId, v35)
                    };
                    local v38 = v2.union(v36, v37);
                    v34["CoachmarkButton" .. v35] = v3.createElement(v4, v38);
                end;
            end;
            return v34;
        end;
    end, {
        v30.actions
    });
    local l_createElement_0 = v3.createElement;
    local l_Root_0 = v23.Root;
    local v42 = {
        isOpen = v30.isOpen, 
        testId = v30.testId
    };
    local v43 = {
        Anchor = v3.createElement(v23.Anchor, v21(v30, {
            anchorRef = v30.anchorRef
        }), v30.children)
    };
    local l_createElement_1 = v3.createElement;
    local l_Content_0 = v23.Content;
    local v46 = {
        hasArrow = true, 
        align = v30.align, 
        side = {
            position = v30.side, 
            offset = v31.Size.Size_200
        }, 
        radius = v14.Medium, 
        backgroundStyle = v31.Inverse.Surface.Surface_0, 
        selection = v30.selection, 
        selectionGroup = v30.selectionGroup, 
        ref = v29
    };
    local l_createElement_2 = v3.createElement;
    local l_Provider_0 = v13.Provider;
    local v49 = {
        value = {
            colorMode = v7.Inverse
        }
    };
    local l_createElement_3 = v3.createElement;
    local l_v18_0 = v18;
    local v52 = {
        tag = "col auto-xy gap-medium padding-bottom-medium", 
        sizeConstraint = {
            MaxSize = Vector2.new(v32, 1e999)
        }
    };
    local v53 = {
        CloseAffordanceContainer = if v30.onClose then v3.createElement("Folder", {}, {
            CloseAffordance = v3.createElement(v5, {
                onActivated = v30.onClose, 
                size = v9.Small, 
                variant = v6.Utility, 
                Position = UDim2.new(1, -v31.Padding.Small, 0, v31.Padding.Small), 
                AnchorPoint = Vector2.new(1, 0), 
                testId = ("%*--close-affordance"):format(v30.testId)
            })
        }) else nil, 
        Media = if v30.media then v3.createElement(v18, {
            LayoutOrder = 1, 
            tag = "size-full-0 auto-y"
        }, v30.media) else nil
    };
    local l_createElement_4 = v3.createElement;
    local l_v18_1 = v18;
    local v56 = {
        LayoutOrder = 2, 
        tag = "col gap-xsmall auto-xy padding-top-medium padding-x-medium padding-bottom-xsmall"
    };
    local v57 = {};
    local v58;
    if v30.steps then
        v58 = v3.createElement;
        local l_v15_0 = v15;
        local v60 = {
            LayoutOrder = 1
        };
        local l_current_0 = v30.steps.current;
        local l_total_0 = v30.steps.total;
        v60.Text = v16:FormatByKey("CommonUI.Controls.Label.PageCount", {
            current = l_current_0, 
            total = l_total_0
        });
        v60.tag = "auto-xy text-label-small text-align-x-left content-inverse-default text-truncate-end";
        v60.sizeConstraint = v33;
        v60.testId = ("%*--step-indicator"):format(v30.testId);
        v58 = v58(l_v15_0, v60);
    else
        v58 = nil;
    end;
    v57.StepIndicator = v58;
    v57.Header = v3.createElement(v15, {
        LayoutOrder = 2, 
        Text = v30.title, 
        tag = "auto-xy text-title-large text-align-x-left content-inverse-emphasis text-truncate-split", 
        sizeConstraint = v33, 
        testId = ("%*--header"):format(v30.testId)
    });
    v57.Text = if v30.text and v30.text ~= "" then v3.createElement(v15, {
        LayoutOrder = 3, 
        Text = v30.text, 
        tag = "size-full-0 auto-y text-wrap text-align-x-left text-body-medium content-inverse-default", 
        testId = ("%*--text"):format(v30.testId)
    }) else nil;
    v53.ContentSection = l_createElement_4(l_v18_1, v56, v57);
    v53.Actions = if v30.actions and #v30.actions > 0 then v3.createElement(v18, {
        LayoutOrder = 3, 
        tag = "row gap-small auto-y padding-x-medium size-full-0"
    }, v39) else nil;
    v43.Content = l_createElement_1(l_Content_0, v46, l_createElement_2(l_Provider_0, v49, l_createElement_3(l_v18_0, v52, v53)));
    return l_createElement_0(l_Root_0, v42, v43);
end));