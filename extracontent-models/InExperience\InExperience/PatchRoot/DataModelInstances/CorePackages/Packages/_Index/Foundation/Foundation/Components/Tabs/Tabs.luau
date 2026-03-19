local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v5 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v6 = require(script.Parent.TabItem);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Components.View);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v10 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(l_script_FirstAncestor_0.Utility.useAnimatedHighlight);
local v13 = require(script.Parent.OverflowScrollContainer);
local v14 = {
    fillBehavior = v4.Fill, 
    size = v5.Medium, 
    testId = "--foundation-tabs", 
    ZIndex = 1
};
return v3.memo(v3.forwardRef(function(v15, v16) --[[ Line: 44 ]] --[[ Name: Tabs ]]
    -- upvalues: v9 (copy), v11 (copy), v14 (copy), v3 (copy), v2 (copy), v4 (copy), v12 (copy), v8 (copy), v10 (copy), v13 (copy), v6 (copy)
    local v17 = v9();
    local v18 = v11(v15, v14);
    local v19, v20 = v3.useState(v18.defaultActiveTabId or v2.get(v18, {
        1, 
        "id"
    }));
    local v22 = v3.useCallback(function(v21) --[[ Line: 50 ]]
        -- upvalues: v18 (copy), v20 (copy)
        if v18.onActivated then
            v18.onActivated(v21);
        end;
        v20(v21);
    end);
    local v23 = v18.fillBehavior == v4.Fill;
    local v24 = v18.activeTabId or v19;
    local v26 = v2.find(v18.tabs, function(v25) --[[ Line: 59 ]]
        -- upvalues: v24 (copy)
        return v25.id == v24;
    end);
    local v27 = v3.useRef(nil);
    local v28 = v12(v24, v16 or v27, v18.size, v18.fillBehavior);
    local l_highlightPosition_0 = v28.highlightPosition;
    local l_highlightWidth_0 = v28.highlightWidth;
    local l_activeItemHeight_0 = v28.activeItemHeight;
    local l_itemRefs_0 = v28.itemRefs;
    return v3.createElement(v8, {
        tag = "size-full-0 auto-y clip"
    }, {
        Tabs = v3.createElement(v8, v10(v18, {
            ref = v16 or v27, 
            tag = "auto-y size-full-0 col"
        }), {
            Wrapper = v3.createElement(v8, {
                LayoutOrder = 1, 
                tag = "auto-y size-full-0", 
                testId = ("%*--wrapper"):format(v18.testId)
            }, {
                ScrollContainer = v3.createElement(v13, {
                    LayoutOrder = 1, 
                    size = v18.size, 
                    testId = ("%*--scroll-container"):format(v18.testId)
                }, {
                    TabList = v3.createElement(v8, {
                        tag = {
                            ["row auto-xy flex-y-fill"] = true, 
                            ["gap-large"] = not v23, 
                            ["size-full-0"] = v23
                        }, 
                        testId = ("%*--list"):format(v18.testId)
                    }, v2.map(v18.tabs, function(v33, v34) --[[ Line: 103 ]]
                        -- upvalues: v3 (ref), v6 (ref), v24 (copy), v22 (copy), v18 (copy), l_itemRefs_0 (copy)
                        return v3.createElement(v6, {
                            id = v33.id, 
                            text = v33.text, 
                            key = tostring(v33.id), 
                            icon = v33.icon, 
                            isActive = v33.id == v24, 
                            onActivated = v22, 
                            LayoutOrder = v34, 
                            fillBehavior = v18.fillBehavior, 
                            size = v18.size, 
                            isDisabled = v33.isDisabled, 
                            testId = ("%*--item-%*"):format(v18.testId, v33.id), 
                            ref = l_itemRefs_0[v33.id]
                        });
                    end))
                }), 
                Border = v3.createElement(v8, {
                    LayoutOrder = 2, 
                    AnchorPoint = Vector2.new(0, 1), 
                    Size = UDim2.new(1, 0, 0, v17.Stroke.Thick), 
                    Position = UDim2.fromScale(0, 1), 
                    backgroundStyle = v17.Color.Stroke.Default, 
                    testId = ("%*--border"):format(v18.testId)
                })
            }), 
            Content = if v26 and v26.content then v3.createElement(v8, {
                LayoutOrder = 2, 
                tag = "auto-y size-full-0", 
                testId = ("%*--content"):format(v18.testId)
            }, v26.content) else nil
        }), 
        AnimatedBorder = v3.createElement(v8, {
            LayoutOrder = 0, 
            ZIndex = v18.ZIndex + 1, 
            Size = l_highlightWidth_0:map(function(v35) --[[ Line: 143 ]]
                -- upvalues: v17 (copy)
                return UDim2.fromOffset(v35, v17.Stroke.Thick);
            end), 
            Position = v3.joinBindings({
                l_highlightPosition_0, 
                l_activeItemHeight_0
            }):map(function(v36) --[[ Line: 146 ]]
                -- upvalues: v17 (copy)
                local v37 = v36[1];
                local v38 = v36[2];
                return UDim2.fromOffset(v37, v38 - v17.Stroke.Thick);
            end), 
            backgroundStyle = v17.Color.System.Contrast, 
            testId = ("%*--animated-border"):format(v18.testId)
        })
    });
end));