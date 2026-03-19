local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Motion);
local l_useMotion_0 = v2.useMotion;
local l_AnimatePresence_0 = v2.AnimatePresence;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactOtter);
local v7 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v8 = require(script.Parent.Spinner);
local v9 = require(script.Parent.endAlignedIcons);
local v10 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local _ = require(script.Parent.Types);
local v12 = require(l_script_FirstAncestor_0.Enums.FillBehavior);
local v13 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v14 = require(script.Parent.ButtonIcon);
local v15 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v17 = require(l_script_FirstAncestor_0.Components.View);
local v18 = require(l_script_FirstAncestor_0.Constants);
local v19 = require(l_script_FirstAncestor_0.Utility.Flags);
local v20 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v21 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v22 = require(script.Parent.useButtonMotionStates);
local v23 = require(script.Parent.useButtonVariants);
local v24 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_usePresentationContext_0 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext).usePresentationContext;
local v26 = {
    [v10.Link] = {
        format = "<u>%s</u>", 
        controlState = {
            v13.Hover, 
            v13.Pressed
        }
    }
};
local function v28(v27) --[[ Line: 54 ]] --[[ Name: onProgressChange ]]
    -- upvalues: v18 (copy)
    return NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(math.max(0, v27 - 1.0E-4), 0), 
        NumberSequenceKeypoint.new(math.min(1, v27 + 1.0E-4), v18.DISABLED_TRANSPARENCY), 
        NumberSequenceKeypoint.new(1, v18.DISABLED_TRANSPARENCY)
    });
end;
local function _(v29, v30) --[[ Line: 63 ]] --[[ Name: getTransparency ]]
    return v30:map(function(v31) --[[ Line: 67 ]]
        -- upvalues: v29 (copy)
        if v29 ~= nil then
            return v29 + (1 - v29) * v31;
        else
            return v31;
        end;
    end);
end;
local v33 = {
    isDisabled = false, 
    isLoading = false, 
    variant = v10.Standard, 
    size = v7.Medium, 
    width = UDim.new(0, 0), 
    inputDelay = 0, 
    testId = "--foundation-button"
};
return v5.memo(v5.forwardRef(function(v34, v35) --[[ Line: 102 ]] --[[ Name: Button ]]
    -- upvalues: v20 (copy), v33 (copy), v5 (copy), v13 (copy), v6 (copy), v9 (copy), v24 (copy), l_usePresentationContext_0 (copy), v23 (copy), v22 (copy), v18 (copy), l_useMotion_0 (copy), v26 (copy), v17 (copy), v21 (copy), v19 (copy), v12 (copy), l_AnimatePresence_0 (copy), v8 (copy), v14 (copy), v15 (copy), v28 (copy)
    local v36 = v20(v34, v33);
    local l_inputDelay_0 = v36.inputDelay;
    local v38, v39 = v5.useBinding(v13.Initialize);
    local v40, v41 = v5.useState(l_inputDelay_0 > 0);
    local v42, v43 = v6.useAnimatedBinding(0, function() --[[ Line: 108 ]]
        -- upvalues: v41 (copy)
        v41(false);
    end);
    local v44 = v36.icon and v9[v36.icon];
    v5.useEffect(function() --[[ Line: 114 ]]
        -- upvalues: v40 (copy), v43 (copy), v6 (ref)
        if v40 == false then
            v43(v6.instant(0));
        end;
    end, {
        v40
    });
    v5.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: v40 (copy), v41 (copy), l_inputDelay_0 (copy), v43 (copy), v6 (ref)
        if v40 then
            v41(false);
        end;
        if l_inputDelay_0 > 0 then
            v41(true);
            v43((v6.ease(1, {
                duration = l_inputDelay_0, 
                easingStyle = Enum.EasingStyle.Quad
            })));
        end;
    end, {
        l_inputDelay_0
    });
    local v45 = v24();
    local v46 = l_usePresentationContext_0();
    local v47 = v23(v45, v36.size, v36.variant, if v46 then v46.colorMode else nil);
    local v48 = v22(v47.content.style.Transparency, v18.DISABLED_TRANSPARENCY);
    local v49, v50 = l_useMotion_0(v48.Default);
    local v51, v52 = l_useMotion_0(v48.Default);
    v5.useEffect(function() --[[ Line: 149 ]]
        -- upvalues: v36 (copy), v52 (copy), v48 (copy)
        if v36.isLoading then
            v52(v48.Loading);
            return;
        else
            v52(v48.Default);
            return;
        end;
    end, {
        v36.isLoading
    });
    v5.useEffect(function() --[[ Line: 157 ]]
        -- upvalues: v36 (copy), v50 (copy), v48 (copy)
        if v36.isDisabled then
            v50(v48.Disabled);
            return;
        else
            v50(v48.Default);
            return;
        end;
    end, {
        v36.isDisabled
    });
    local v53 = v5.useMemo(function() --[[ Line: 165 ]]
        -- upvalues: v47 (copy), v45 (copy)
        return {
            radius = UDim.new(0, v47.container.radius), 
            offset = v45.Size.Size_200, 
            borderWidth = v45.Stroke.Thicker
        };
    end, {
        v45, 
        v47.container.radius
    });
    local v54 = v36.text and v36.text ~= "";
    local v57 = v5.useCallback(function(v55) --[[ Line: 175 ]]
        -- upvalues: v26 (ref), v36 (copy), v54 (copy)
        local v56 = v26[v36.variant];
        if v54 and v56 and table.find(v56.controlState, v55) then
            return (v56.format:format(v36.text));
        else
            return v36.text;
        end;
    end, {
        v36.text, 
        v36.variant, 
        v54
    });
    local l_createElement_0 = v5.createElement;
    local l_v17_0 = v17;
    local l_v21_0 = v21;
    local l_v36_0 = v36;
    local v62 = {
        AutomaticSize = if v19.FoundationButtonWidthAutoSize then if v36.width.Scale == 0 and v36.width.Offset == 0 then Enum.AutomaticSize.X else nil else if v36.width.Scale == 0 then Enum.AutomaticSize.X else nil, 
        cornerRadius = UDim.new(0, v47.container.radius)
    };
    local v63;
    if v47.container.style then
        local l_Transparency_0 = v47.container.style.Transparency;
        v63 = v49.transparency:map(function(v65) --[[ Line: 67 ]]
            -- upvalues: l_Transparency_0 (copy)
            if l_Transparency_0 ~= nil then
                return l_Transparency_0 + (1 - l_Transparency_0) * v65;
            else
                return v65;
            end;
        end):map(function(v66) --[[ Line: 192 ]]
            -- upvalues: v47 (copy)
            return {
                Color3 = v47.container.style.Color3, 
                Transparency = v66
            };
        end);
    else
        v63 = nil;
    end;
    v62.backgroundStyle = v63;
    v62.flexItem = if v36.fillBehavior then {
        FlexMode = if v36.fillBehavior == v12.Fill then Enum.UIFlexMode.Fill else Enum.UIFlexMode.Shrink
    } else nil;
    if v47.container.stroke then
        v63 = {
            Color = v47.container.stroke.Color
        };
        local l_Transparency_1 = v47.container.stroke.Transparency;
        v63.Transparency = v49.transparency:map(function(v68) --[[ Line: 67 ]]
            -- upvalues: l_Transparency_1 (copy)
            if l_Transparency_1 ~= nil then
                return l_Transparency_1 + (1 - l_Transparency_1) * v68;
            else
                return v68;
            end;
        end);
    else
        v63 = nil;
    end;
    v62.stroke = v63;
    v62.Size = UDim2.new(v36.fillBehavior == v12.Fill and 1 or v36.width.Scale, v36.fillBehavior == v12.Fill and 0 or v36.width.Offset, 0, v47.container.height);
    v62.selection = {
        Selectable = not v36.isDisabled and v36.Selectable, 
        NextSelectionUp = v36.NextSelectionUp, 
        NextSelectionDown = v36.NextSelectionDown, 
        NextSelectionLeft = v36.NextSelectionLeft, 
        NextSelectionRight = v36.NextSelectionRight
    };
    v62.cursor = v53;
    v62.onActivated = v36.onActivated;
    v62.onStateChanged = v39;
    v62.isDisabled = v36.isDisabled or v36.isLoading or v40;
    v62.stateLayer = v47.container.stateLayer;
    v62.tag = v47.container.tag;
    v62.ref = v35;
    return l_createElement_0(l_v17_0, l_v21_0(l_v36_0, v62), {
        Loading = if v36.isLoading then v5.createElement("Folder", {}, {
            PresenceWrapper = v5.createElement(l_AnimatePresence_0, {}, {
                Spinner = v5.createElement(v8, {
                    Size = v47.icon.size - if v19.FoundationUsePath2DSpinner then UDim2.fromOffset(v45.Padding.XSmall, v45.Padding.XSmall) else UDim2.fromOffset(0, 0), 
                    style = v49.transparency:map(function(v69) --[[ Line: 246 ]]
                        -- upvalues: v47 (copy)
                        return {
                            Color3 = v47.content.style.Color3, 
                            Transparency = v69
                        };
                    end), 
                    testId = ("%*--spinner"):format(v36.testId)
                })
            })
        }) else nil, 
        IconWrapper = if v36.icon then v5.createElement(v17, {
            Size = if v36.icon then v47.icon.size else nil, 
            LayoutOrder = if v36.icon then v44 and 3 or 1 else nil, 
            testId = if v36.icon then ("%*--icon-wrapper"):format(v36.testId) else nil
        }, {
            Icon = v5.createElement(v14, {
                icon = v36.icon, 
                isLoading = v36.isLoading, 
                variant = v36.variant, 
                size = v36.size, 
                disabledTransparencyBinding = v49.transparency, 
                textTransparencyBinding = v51.textTransparency, 
                testId = v36.testId
            })
        }) else nil, 
        Text = if v54 then v5.createElement(v15, {
            Text = v38:map(v57), 
            RichText = v26[v36.variant] ~= nil, 
            tag = v47.text.tag, 
            textStyle = v5.joinBindings({
                v49.transparency, 
                v51.textTransparency
            }):map(function(v70) --[[ Line: 284 ]]
                -- upvalues: v47 (copy)
                local v71 = v70[1];
                local v72 = v70[2];
                return {
                    Color3 = v47.content.style.Color3, 
                    Transparency = v72 + v71
                };
            end), 
            LayoutOrder = 2, 
            testId = ("%*--text"):format(v36.testId)
        }) else nil, 
        Gradient = if v40 then v5.createElement("UIGradient", {
            Transparency = v42:map(v28)
        }) else nil
    });
end));