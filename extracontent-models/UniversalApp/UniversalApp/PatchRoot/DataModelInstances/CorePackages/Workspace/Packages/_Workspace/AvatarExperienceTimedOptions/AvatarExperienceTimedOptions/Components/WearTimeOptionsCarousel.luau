local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v5.Hooks.useTokens;
local l_Text_0 = v5.Text;
local l_View_0 = v5.View;
local l_Enums_0 = v5.Enums;
local v10 = require(script.Parent.WearTimeOptionButton);
local _ = require(l_script_FirstAncestor_0.Types.TimedOptionType);
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v2.CombinedFFlagShouldUseLegacyGamepadFocus;
local l_AXTooltip_0 = require(l_Parent_0.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip;
return function(v14) --[[ Line: 33 ]] --[[ Name: WearTimeOptionsCarousel ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v3 (copy), v10 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), l_View_0 (copy), l_Text_0 (copy), v5 (copy), l_Enums_0 (copy), l_AXTooltip_0 (copy)
    local v15 = l_useTokens_0();
    local v16 = l_useLocalization_0({
        wearTimeOptions = "Feature.Durables.ItemDetails.WearTimeOptions.Title", 
        tooltipText = "Feature.Durables.FTUX.Tooltip"
    });
    local v17, v18 = v3.useState(false);
    v3.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: v18 (copy)
        local v19 = task.delay(5, function() --[[ Line: 43 ]]
            -- upvalues: v18 (ref)
            v18(false);
        end);
        return function() --[[ Line: 47 ]]
            -- upvalues: v19 (copy)
            task.cancel(v19);
        end;
    end, {});
    local v22, v23 = v3.useState(function() --[[ Line: 52 ]]
        -- upvalues: v14 (copy)
        for v20, v21 in v14.options do
            if v21.selected then
                return v20;
            end;
        end;
        return 1;
    end);
    local v27 = v3.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v14 (copy), v3 (ref), v10 (ref), v22 (copy), v23 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (ref)
        local v24 = {};
        for v25, v26 in v14.options do
            v24[v25] = v3.createElement(v10, {
                option = {
                    days = v26.days, 
                    price = v26.price, 
                    selected = v25 == v22
                }, 
                onActivated = function() --[[ Line: 72 ]] --[[ Name: onActivated ]]
                    -- upvalues: v23 (ref), v25 (copy), v14 (ref)
                    v23(v25);
                    if v14.onOptionActivated then
                        v14.onOptionActivated(v25);
                    end;
                end, 
                LayoutOrder = v25, 
                ref = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v25 == 1 and v14.firstOptionRef then v14.firstOptionRef else nil, 
                nextSelectionDownRef = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v25 == #v14.options then v14.nextSelectionDown else nil
            });
        end;
        return v24;
    end, {
        v14.options, 
        v22, 
        v14.onOptionActivated, 
        if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v14.firstOptionRef else nil, 
        if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v14.nextSelectionDown else nil
    });
    local v28 = v3.createElement(l_View_0, {
        tag = "row gap-medium align-y-center auto-xy"
    }, {
        Options = v3.createElement(v3.Fragment, nil, v27)
    });
    local v29 = nil;
    v29 = if v14.useWrapping then v3.createElement(l_View_0, {
        tag = "row wrap gap-medium align-y-center size-full-0 auto-y", 
        LayoutOrder = 2, 
        wrap = true
    }, v27) else v3.createElement(l_View_0, {
        tag = "size-full-0", 
        Size = UDim2.new(1, 0, 0, v15.Size.Size_1200), 
        LayoutOrder = 2
    }, {
        ScrollingFrame = v3.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(0, 0, 0, v15.Size.Size_1200), 
            AutomaticCanvasSize = Enum.AutomaticSize.X, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ClipsDescendants = false, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            Selectable = false
        }, v28)
    });
    return v3.createElement(l_View_0, {
        LayoutOrder = v14.LayoutOrder, 
        tag = "size-full-0 auto-y col gap-medium"
    }, {
        Heading = v3.createElement(l_View_0, {
            tag = "auto-xy row gap-xxsmall align-y-center", 
            LayoutOrder = 1
        }, {
            HeadingText = v3.createElement(l_Text_0, {
                Text = v16.wearTimeOptions, 
                textStyle = v15.Color.Content.Emphasis, 
                fontStyle = {
                    Font = v15.Typography.TitleLarge.Font, 
                    FontSize = v15.FontSize.FontSize_500
                }, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }), 
            InfoIconContainer = v3.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = 2
            }, {
                InfoIcon = v3.createElement(v5.IconButton, {
                    icon = l_Enums_0.IconName.CircleI, 
                    size = l_Enums_0.IconSize.Small, 
                    onActivated = function() --[[ Line: 161 ]] --[[ Name: onActivated ]]
                        -- upvalues: v18 (copy)
                        v18(true);
                    end
                }), 
                Tooltip = v3.createElement(l_AXTooltip_0, {
                    isOpen = v17, 
                    popoverSide = "Top", 
                    tooltipText = v16.tooltipText, 
                    maxWidth = v15.Size.Size_1200 * 3, 
                    onTooltipActivated = function() --[[ Line: 170 ]] --[[ Name: onTooltipActivated ]]
                        -- upvalues: v18 (copy)
                        v18(false);
                    end
                })
            })
        }), 
        CarouselContainer = v29
    });
end;