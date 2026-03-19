local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useMotion_0 = require(l_Parent_0.Motion).useMotion;
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v5 = require(l_Components_0.Icon);
local v6 = require(l_Components_0.Text);
local _ = require(l_Components_0.Types);
local v8 = require(l_Components_0.View);
local v9 = require(l_script_FirstAncestor_0.Constants);
local v10 = require(l_script_FirstAncestor_0.Utility.escapeRichText);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v12 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v13 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v14 = require(script.Parent.useOptionSelectorGroupItemMotionStates);
local v15 = require(script.Parent.useOptionSelectorGroupItemVariants);
local v16 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v17 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v18 = require(l_script_FirstAncestor_0.Enums.Orientation);
local v19 = require(script.Parent.Parent.useOptionSelectorGroup);
local function _(v20, v21) --[[ Line: 35 ]] --[[ Name: getTransparency ]]
    return v21:map(function(v22) --[[ Line: 39 ]]
        -- upvalues: v20 (copy)
        if v20 ~= nil then
            return v20 + (1 - v20) * v22;
        else
            return v22;
        end;
    end);
end;
local function v29(v24, v25, v26) --[[ Line: 47 ]] --[[ Name: getTextStyle ]]
    -- upvalues: v2 (copy)
    return v2.joinBindings({
        v24, 
        v25
    }):map(function(v27) --[[ Line: 52 ]]
        -- upvalues: v26 (copy)
        local v28 = v27[2];
        return {
            Color3 = v26, 
            Transparency = v28
        };
    end);
end;
local v30 = {
    isDisabled = false, 
    size = v17.Medium, 
    width = UDim.new(0, 0)
};
return v2.memo(v2.forwardRef(function(v31, v32) --[[ Line: 89 ]] --[[ Name: OptionSelectorGroupItem ]]
    -- upvalues: v13 (copy), v30 (copy), v19 (copy), v18 (copy), v16 (copy), v11 (copy), v15 (copy), v14 (copy), v9 (copy), l_useMotion_0 (copy), v2 (copy), v6 (copy), v10 (copy), v29 (copy), v8 (copy), v12 (copy), v5 (copy)
    local v33 = v13(v31, v30);
    local v34 = v19();
    local v35 = v34.value == v33.value;
    local v36 = v33.label or v33.value;
    local v37 = if v34.orientation == v18.Vertical then v18.Horizontal else v18.Vertical;
    local v38 = if v37 == v18.Horizontal then v16.Fit else v33.fillBehavior or v16.Fill;
    local v39 = UDim2.fromScale(1, 0);
    local v40 = v11();
    local v41 = v15(v40, v33.size);
    local l_Color3_0 = v41.content.Color3;
    local v43 = if v35 then v40.Color.System.Contrast else v40.Color.Stroke.Emphasis;
    local v44 = v14(0, v9.DISABLED_TRANSPARENCY);
    local v45, v46 = l_useMotion_0(v44.Default);
    local v47, _ = l_useMotion_0(v44.Default);
    v2.useEffect(function() --[[ Line: 119 ]]
        -- upvalues: v33 (copy), v46 (copy), v44 (copy)
        if v33.isDisabled then
            v46(v44.Disabled);
            return;
        else
            v46(v44.Default);
            return;
        end;
    end, {
        v33.isDisabled
    });
    local v49 = v2.useCallback(function() --[[ Line: 128 ]]
        -- upvalues: v34 (copy), v33 (copy)
        v34.onValueChanged(if v34.value == v33.value then nil else v33.value);
    end, {
        v33.isDisabled, 
        v33.value, 
        v34.onValueChanged, 
        v34.value
    });
    v33.testId = ("%*--item-%*"):format(v34.testId, v33.value);
    local v50 = v2.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v41 (copy), v40 (copy)
        return {
            radius = UDim.new(0, v41.container.radius), 
            offset = v40.Size.Size_200, 
            borderWidth = v40.Stroke.Thicker
        };
    end, {
        v40, 
        v41.container.radius
    });
    local v51 = v2.createElement(v6, {
        Text = v10(v36), 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        RichText = true, 
        tag = v41.label.tag, 
        textStyle = v29(v47.textTransparency, v45.transparency, l_Color3_0), 
        LayoutOrder = 2
    });
    local l_createElement_0 = v2.createElement;
    local l_v8_0 = v8;
    local l_v12_0 = v12;
    local l_v33_0 = v33;
    local v56 = {};
    local v57 = {
        Color = v43.Color3
    };
    local l_Transparency_0 = v43.Transparency;
    v57.Transparency = v45.transparency:map(function(v59) --[[ Line: 39 ]]
        -- upvalues: l_Transparency_0 (copy)
        if l_Transparency_0 ~= nil then
            return l_Transparency_0 + (1 - l_Transparency_0) * v59;
        else
            return v59;
        end;
    end);
    v56.stroke = v57;
    v56.Size = v39;
    v56.selection = {
        Selectable = not v33.isDisabled and v34.Selectable
    };
    v56.cursor = v50;
    v56.onActivated = v49;
    v56.isDisabled = v33.isDisabled;
    v56.tag = {
        ["auto-xy"] = v38 ~= v16.Fill, 
        ["fill auto-y"] = v38 == v16.Fill, 
        [v41.container.tag] = true
    };
    v56.ref = v32;
    return l_createElement_0(l_v8_0, l_v12_0(l_v33_0, v56), {
        ItemInner = v2.createElement(v8, {
            tag = v41.itemInner.tag, 
            Size = v39
        }, {
            IconRow = v2.createElement(v8, {
                tag = "size-full-0 auto-y row gap-small align-y-center", 
                LayoutOrder = 1
            }, {
                Icon = if v33.icon then v2.createElement(v5, {
                    name = v33.icon, 
                    size = v41.icon.size, 
                    style = v45.transparency:map(function(v60) --[[ Line: 190 ]]
                        -- upvalues: l_Color3_0 (copy)
                        return {
                            Color3 = l_Color3_0, 
                            Transparency = v60
                        };
                    end), 
                    LayoutOrder = 0
                }) else nil, 
                Label = if v37 == v18.Horizontal then v51 else v2.createElement(v8, {
                    tag = "grow"
                }), 
                Checkmark = v2.createElement(v5, {
                    name = "check-large", 
                    size = v41.icon.size, 
                    style = v45.transparency:map(function(v61) --[[ Line: 205 ]]
                        -- upvalues: l_Color3_0 (copy), v35 (copy)
                        return {
                            Color3 = l_Color3_0, 
                            Transparency = if v35 then v61 else 1
                        };
                    end), 
                    LayoutOrder = 3
                })
            }), 
            Label = if v37 == v18.Vertical then v51 else nil, 
            Metadata = if v33.metadata then v2.createElement(v6, {
                Text = v10(v33.metadata), 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                RichText = true, 
                tag = v41.metadata.tag, 
                textStyle = v29(v47.textTransparency, v45.transparency, l_Color3_0), 
                LayoutOrder = 3
            }) else nil, 
            Description = if v33.description then v2.createElement(v6, {
                Text = v10(v33.description), 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                RichText = true, 
                tag = v41.description.tag, 
                textStyle = v29(v47.textTransparency, v45.transparency, l_Color3_0), 
                LayoutOrder = 4
            }) else nil
        })
    });
end));