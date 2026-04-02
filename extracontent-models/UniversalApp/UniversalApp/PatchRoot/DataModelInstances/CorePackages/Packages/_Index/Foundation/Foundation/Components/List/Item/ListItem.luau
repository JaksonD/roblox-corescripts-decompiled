local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v5 = require(l_Components_0.Checkbox);
local v6 = require(l_Components_0.Divider);
local v7 = require(l_Components_0.Icon);
local v8 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v9 = require(l_script_FirstAncestor_0.Enums.ListItemInputType);
local v10 = require(l_Components_0.RadioGroup);
local v11 = require(l_Components_0.Text);
local v12 = require(l_Components_0.Toggle);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v14 = require(l_Components_0.View);
local v15 = require(l_script_FirstAncestor_0.Utility.escapeRichText);
local v16 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v17 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v18 = require(script.Parent.useListItemVariants);
local v19 = require(script.Parent.Parent.Accessory);
local v20 = require(script.Parent.Parent.useAccessoryVariants);
local v21 = require(script.Parent.Parent.useList);
local v22 = {};
return v3.memo(v3.forwardRef(function(v23, v24) --[[ Line: 52 ]] --[[ Name: ListItem ]]
    -- upvalues: v17 (copy), v22 (copy), v21 (copy), v8 (copy), v16 (copy), v18 (copy), v20 (copy), v3 (copy), v14 (copy), v19 (copy), v11 (copy), v15 (copy), v7 (copy), v2 (copy), v9 (copy), v10 (copy), v5 (copy), v12 (copy), v6 (copy)
    local v25 = v17(v23, v22);
    local v26 = v21();
    local v27 = v26.size or v8.Medium;
    local v28 = v16();
    local v29 = v18(v28, v27);
    local v30 = v20(v28, v27, "Icon");
    local v31 = false;
    if typeof(v25.onActivated) == "table" then
        v31 = v25.onActivated.onActivated ~= nil;
    end;
    local v32 = v3.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v31 (copy), v25 (copy)
        if v31 then
            return v25.onActivated.onActivated;
        elseif v25.onActivated ~= nil then
            return v25.onActivated;
        else
            return nil;
        end;
    end, {
        v25.onActivated, 
        v31
    });
    local v33 = v3.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v31 (copy), v25 (copy)
        if v31 then
            return v25.onActivated.inputType;
        else
            return nil;
        end;
    end, {
        v25.onActivated, 
        v31
    });
    local v34 = v3.useMemo(function() --[[ Line: 80 ]]
        -- upvalues: v31 (copy), v25 (copy)
        if v31 then
            return v25.onActivated.isChecked;
        else
            return nil;
        end;
    end, {
        v25.onActivated, 
        v31
    });
    local v35 = v3.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v25 (copy)
        if typeof(v25.title) == "string" then
            return v25.title;
        elseif typeof(v25.title) == "table" then
            return v25.title.title;
        else
            return nil;
        end;
    end, {
        v25.title
    });
    local v36 = v3.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v25 (copy)
        if typeof(v25.title) == "table" then
            if v25.title.title ~= nil then
                return v25.title.metadata;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end, {
        v25.title
    });
    local v37 = v3.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: v35 (copy)
        return v35 and string.gsub(v35, "%s+", "-") or "";
    end, {
        v35
    });
    v25.testId = if v25.testId then v25.testId else ("%*--item-%*"):format(v26.testId, v37);
    local v38 = v3.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v32 (copy)
        if v32 then
            v32();
        end;
    end, {
        v32
    });
    return v3.createElement(v14, {
        tag = "col size-full-0 auto-y", 
        LayoutOrder = v25.LayoutOrder, 
        ref = v24
    }, {
        ListItemContainer = v3.createElement(v14, {
            tag = "size-full-0 auto-y padding-y-xsmall"
        }, {
            ListItem = v3.createElement(v14, {
                onActivated = v32, 
                testId = v25.testId, 
                tag = {
                    ["row align-y-center gap-medium size-full-0 auto-y padding-y-medium radius-medium"] = true, 
                    ["padding-x-large"] = v26.isInset
                }
            }, {
                LeadingContainer = if v25.leading then v3.createElement(v19, {
                    config = v25.leading, 
                    size = v27, 
                    testId = ("%*--leading-accessory"):format(v25.testId), 
                    LayoutOrder = 0
                }) else nil, 
                Content = v3.createElement(v14, {
                    tag = "row flex-between align-x-center align-y-center fill gap-medium auto-y", 
                    LayoutOrder = 1
                }, {
                    TextContainer = v3.createElement(v14, {
                        tag = "col fill gap-small auto-y padding-y-xsmall", 
                        LayoutOrder = 1
                    }, {
                        TitleContainer = if v35 then v3.createElement(v14, {
                            tag = "col gap-xsmall auto-xy", 
                            LayoutOrder = 0
                        }, {
                            Title = if v35 then v3.createElement(v11, {
                                Text = v15(v35), 
                                RichText = true, 
                                tag = v29.title.tag, 
                                LayoutOrder = 0
                            }) else nil, 
                            Metadata = if v36 then v3.createElement(v11, {
                                Text = v36, 
                                RichText = true, 
                                tag = v29.metadata.tag, 
                                LayoutOrder = 1
                            }) else nil
                        }) else nil, 
                        Description = v25.description and v3.createElement(v11, {
                            Text = v25.description, 
                            RichText = true, 
                            tag = v29.description.tag, 
                            LayoutOrder = 1
                        })
                    }), 
                    TrailingContainer = if v25.trailing then v3.createElement(v14, {
                        tag = "align-x-center align-y-center auto-xy", 
                        LayoutOrder = 2
                    }, v25.trailing) else nil, 
                    ActivatedIconContainer = if v25.onActivated then v3.createElement(v14, {
                        tag = "align-x-center align-y-center auto-xy", 
                        LayoutOrder = 3
                    }, {
                        ActivatedIcon = if v33 == nil then v3.createElement(v7, {
                            name = v2.Icon.ChevronLargeRight, 
                            size = v29.icon.size, 
                            testId = ("%*--activated-icon"):format(v25.testId)
                        }) else if v33 == v9.Radio then v3.createElement(v10.Root, {
                            value = v34 and "radio" or "", 
                            onValueChanged = v38, 
                            Selectable = false
                        }, v3.createElement(v10.Item, {
                            value = "radio", 
                            label = "", 
                            size = v27
                        })) else v3.createElement(if v33 == v9.Checkbox then v5 else v12, {
                            label = "", 
                            onActivated = v38, 
                            isChecked = v34, 
                            size = v27, 
                            Selectable = false
                        })
                    }) else nil
                })
            })
        }), 
        Divider = if v26.hasDivider then v3.createElement(v14, {
            tag = {
                ["row gap-medium size-full-0 auto-y"] = true, 
                ["padding-x-large"] = v26.isInset
            }, 
            LayoutOrder = 2
        }, {
            LeadingSpacer = if v25.leading then v3.createElement(v14, {
                Size = UDim2.fromOffset(v30.container.Size.X.Offset, 0), 
                LayoutOrder = 0
            }) else nil, 
            DividerLine = v3.createElement(v14, {
                tag = "fill auto-y", 
                LayoutOrder = 1
            }, v3.createElement(v6))
        }) else nil
    });
end));