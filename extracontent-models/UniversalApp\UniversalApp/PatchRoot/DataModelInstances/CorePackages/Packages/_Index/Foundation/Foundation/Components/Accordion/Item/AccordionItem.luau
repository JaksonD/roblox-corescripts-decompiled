local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_script_FirstAncestor_0.Components.Divider);
local v6 = require(l_script_FirstAncestor_0.Components.Icon);
local v7 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Components.View);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(script.Parent.Parent.useAccordion);
local v13 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v16 = require(script.Parent.Parent.useAccordionItemVariants);
local v17 = {
    hasDivider = true, 
    isExpanded = false
};
local function _(v18) --[[ Line: 57 ]] --[[ Name: getCommonEaseConfig ]]
    return {
        easingStyle = v18.Ease.StandardOut, 
        duration = v18.Time.Time_300, 
        startingValue = nil
    };
end;
return v3.memo(v3.forwardRef(function(v20, v21) --[[ Line: 65 ]] --[[ Name: AccordionItem ]]
    -- upvalues: v11 (copy), v17 (copy), v13 (copy), v3 (copy), v4 (copy), v12 (copy), v16 (copy), v9 (copy), v10 (copy), v6 (copy), v7 (copy), v5 (copy)
    local v22 = v11(v20, v17);
    local v23 = v13();
    local v25 = v3.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v23 (copy)
        local l_v23_0 = v23;
        return {
            easingStyle = l_v23_0.Ease.StandardOut, 
            duration = l_v23_0.Time.Time_300, 
            startingValue = nil
        };
    end, {
        v23
    });
    local v26, v27 = v3.useState(v22.isExpanded);
    local v28 = v3.useRef(false);
    local v29, v30 = v4.useAnimatedBinding(0);
    local v31, v32 = v4.useAnimatedBinding(0, function() --[[ Line: 76 ]]
        -- upvalues: v28 (copy), v27 (copy)
        if v28.current then
            v27(false);
            v28.current = false;
        end;
    end);
    local v33 = v3.useRef(nil);
    local v34 = v3.useCallback(function() --[[ Line: 83 ]]
        -- upvalues: v28 (copy), v32 (copy), v4 (ref), v25 (copy), v30 (copy)
        v28.current = true;
        v32(v4.ease(0, v25));
        v30(v4.ease(0, v25));
    end, {});
    local v35 = v3.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v33 (copy), v26 (copy), v32 (copy), v4 (ref), v25 (copy)
        if v33 and v33.current and v26 then
            v32(v4.ease(v33.current.AbsoluteSize.Y, v25));
        end;
    end, {
        v33, 
        v26
    });
    v3.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: v26 (copy), v22 (copy), v34 (copy), v27 (copy)
        if v26 and not v22.isExpanded then
            v34();
            return;
        else
            v27(v22.isExpanded);
            return;
        end;
    end, {
        v22.isExpanded
    });
    v3.useEffect(function() --[[ Line: 103 ]]
        -- upvalues: v26 (copy), v30 (copy), v4 (ref), v25 (copy)
        if v26 then
            v30(v4.ease(-180, v25));
        end;
    end, {
        v26
    });
    local v36 = v12();
    local l_onAccordionItemActivated_0 = v36.onAccordionItemActivated;
    local l_itemSize_0 = v36.itemSize;
    local v39 = v16(v23, l_itemSize_0, false);
    local v40 = v3.useCallback(function() --[[ Line: 114 ]]
        -- upvalues: v26 (copy), v34 (copy), v27 (copy)
        if v26 then
            v34();
            return;
        else
            v27(true);
            return;
        end;
    end, {
        v26
    });
    local v41 = if v22.onActivated then v22.onActivated else if l_onAccordionItemActivated_0 then l_onAccordionItemActivated_0(v22.id, v26) else v40;
    v22.testId = ("%*--item-%*"):format(v36.testId, v22.id);
    return v3.createElement(v9, v10(v22, {
        tag = v39.container.tag, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        stateLayer = v39.container.stateLayer, 
        ref = v21
    }), {
        Header = v3.createElement(v9, {
            LayoutOrder = 1, 
            tag = v39.header.tag, 
            onActivated = v41, 
            testId = ("%*--header"):format(v22.testId)
        }, {
            LeadingIcon = if v22.leadingIcon then v3.createElement(v6, {
                LayoutOrder = 1, 
                name = if type(v22.leadingIcon) == "table" then v22.leadingIcon.name else v22.leadingIcon, 
                variant = if type(v22.leadingIcon) == "table" then v22.leadingIcon.variant else nil, 
                style = v39.icon.style, 
                size = v39.icon.size, 
                testId = ("%*--leading-icon"):format(v22.testId)
            }) else nil, 
            Title = v3.createElement(v7, {
                LayoutOrder = 2, 
                Text = v22.text, 
                tag = v39.text.tag, 
                testId = ("%*--title"):format(v22.testId)
            }), 
            CollapseIcon = v3.createElement(v9, {
                tag = "auto-xy", 
                LayoutOrder = 3
            }, {
                Icon = v3.createElement(v6, {
                    name = "chevron-large-down", 
                    Rotation = v29, 
                    style = v39.icon.style, 
                    size = v39.icon.size, 
                    testId = ("%*--collapse-icon"):format(v22.testId)
                })
            })
        }), 
        Content = if v26 then v3.createElement(v9, {
            tag = "col", 
            LayoutOrder = 2, 
            testId = ("%*--content"):format(v22.testId), 
            Size = if v31 then v31:map(function(v42) --[[ Line: 180 ]]
                return UDim2.new(1, 0, 0, v42);
            end) else nil, 
            ClipsDescendants = true
        }, {
            AnimatedContainer = v3.createElement(v9, {
                tag = v39.content.tag, 
                ref = v33, 
                onAbsoluteSizeChanged = v35, 
                flexItem = {
                    FlexMode = Enum.UIFlexMode.None
                }, 
                testId = ("%*--animated-content"):format(v22.testId)
            }, {
                v22.children
            })
        }) else nil, 
        Divider = if v22.hasDivider then v3.createElement(v5, {
            LayoutOrder = 3, 
            testId = ("%*--divider"):format(v22.testId)
        }) else nil
    });
end));