local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.AvatarExperienceFlags);
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v4.Hooks.useTokens;
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local l_Enums_0 = v4.Enums;
local v9 = require(script.Parent.WearTimeOptionButton);
local _ = require(script.Parent.WearTimeList);
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v1.CombinedFFlagShouldUseLegacyGamepadFocus;
local l_AXTooltip_0 = require(l_Parent_0.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip;
return function(v13) --[[ Line: 34 ]] --[[ Name: WearTimeOptionsCarousel ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v2 (copy), v9 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), l_View_0 (copy), l_Text_0 (copy), v4 (copy), l_Enums_0 (copy), l_AXTooltip_0 (copy)
    local v14 = l_useTokens_0();
    local v15 = l_useLocalization_0({
        wearTimeOptions = "Feature.Durables.ItemDetails.WearTimeOptions.Title", 
        tooltipText = "Feature.Durables.FTUX.Tooltip"
    });
    local v16, v17 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 43 ]]
        -- upvalues: v17 (copy)
        local v18 = task.delay(5, function() --[[ Line: 44 ]]
            -- upvalues: v17 (ref)
            v17(false);
        end);
        return function() --[[ Line: 48 ]]
            -- upvalues: v18 (copy)
            task.cancel(v18);
        end;
    end, {});
    local v21, v22 = v2.useState(function() --[[ Line: 53 ]]
        -- upvalues: v13 (copy)
        for v19, v20 in v13.options do
            if v20.selected then
                return v19;
            end;
        end;
        return 1;
    end);
    local v26 = v2.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v13 (copy), v2 (ref), v9 (ref), v21 (copy), v22 (copy), l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (ref)
        local v23 = {};
        for v24, v25 in v13.options do
            v23[v24] = v2.createElement(v9, {
                option = {
                    days = v25.days, 
                    price = v25.price, 
                    selected = v24 == v21
                }, 
                onActivated = function() --[[ Line: 73 ]] --[[ Name: onActivated ]]
                    -- upvalues: v22 (ref), v24 (copy), v13 (ref)
                    v22(v24);
                    if v13.onOptionActivated then
                        v13.onOptionActivated(v24);
                    end;
                end, 
                LayoutOrder = v24, 
                ref = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v24 == 1 and v13.firstOptionRef then v13.firstOptionRef else nil, 
                nextSelectionDownRef = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and v24 == #v13.options then v13.nextSelectionDown else nil
            });
        end;
        return v23;
    end, {
        v13.options, 
        v21, 
        v13.onOptionActivated, 
        if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v13.firstOptionRef else nil, 
        if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v13.nextSelectionDown else nil
    });
    local v27 = v2.createElement(l_View_0, {
        tag = "row gap-medium align-y-center auto-xy"
    }, {
        Options = v2.createElement(v2.Fragment, nil, v26)
    });
    local v28 = nil;
    v28 = if v13.useWrapping then v2.createElement(l_View_0, {
        tag = "row wrap gap-medium align-y-center size-full-0 auto-y", 
        LayoutOrder = 2, 
        wrap = true
    }, v26) else v2.createElement(l_View_0, {
        tag = "size-full-0", 
        Size = UDim2.new(1, 0, 0, v14.Size.Size_1200), 
        LayoutOrder = 2
    }, {
        ScrollingFrame = v2.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(0, 0, 0, v14.Size.Size_1200), 
            AutomaticCanvasSize = Enum.AutomaticSize.X, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ClipsDescendants = false, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            Selectable = false
        }, v27)
    });
    return v2.createElement(l_View_0, {
        LayoutOrder = v13.LayoutOrder, 
        tag = "size-full-0 auto-y col gap-medium"
    }, {
        Heading = v2.createElement(l_View_0, {
            tag = "auto-xy row gap-xxsmall align-y-center", 
            LayoutOrder = 1
        }, {
            HeadingText = v2.createElement(l_Text_0, {
                Text = v15.wearTimeOptions, 
                textStyle = v14.Color.Content.Emphasis, 
                fontStyle = {
                    Font = v14.Typography.TitleLarge.Font, 
                    FontSize = v14.FontSize.FontSize_500
                }, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }), 
            InfoIconContainer = v2.createElement(l_View_0, {
                tag = "auto-xy", 
                LayoutOrder = 2
            }, {
                InfoIcon = v2.createElement(v4.IconButton, {
                    icon = l_Enums_0.IconName.CircleI, 
                    size = l_Enums_0.IconSize.Small, 
                    onActivated = function() --[[ Line: 162 ]] --[[ Name: onActivated ]]
                        -- upvalues: v17 (copy)
                        v17(true);
                    end
                }), 
                Tooltip = v2.createElement(l_AXTooltip_0, {
                    isOpen = v16, 
                    popoverSide = "Top", 
                    tooltipText = v15.tooltipText, 
                    maxWidth = v14.Size.Size_1200 * 3, 
                    onTooltipActivated = function() --[[ Line: 171 ]] --[[ Name: onTooltipActivated ]]
                        -- upvalues: v17 (copy)
                        v17(false);
                    end
                })
            })
        }), 
        CarouselContainer = v28
    });
end;