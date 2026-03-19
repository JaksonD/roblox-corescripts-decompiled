local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_TextService_0 = game:GetService("TextService");
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_Enums_0 = v3.Enums;
local l_Image_0 = v3.Image;
local l_Skeleton_0 = v3.Skeleton;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local l_Icon_0 = v3.Icon;
local l_IconSize_0 = v3.Enums.IconSize;
local l_Flags_0 = v3.Utility.Flags;
local l_StatusIndicator_0 = v3.StatusIndicator;
local l_StatusIndicatorVariant_0 = v3.Enums.StatusIndicatorVariant;
local v16 = require(l_script_FirstAncestor_0.Flags.FIntSocalCarouselMaxNewRequestsCount);
return function(v17) --[[ Line: 39 ]] --[[ Name: Tile ]]
    -- upvalues: v4 (copy), l_useTokens_0 (copy), l_TextService_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_StatusIndicator_0 (copy), l_Flags_0 (copy), l_StatusIndicatorVariant_0 (copy), v16 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Skeleton_0 (copy)
    local v18 = v17.tileRef or v4.useRef(nil);
    local v19 = l_useTokens_0();
    local v20, v21 = v4.useState(false);
    local l_TitleSmall_0 = v19.Typography.TitleSmall;
    local v23 = v4.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v17 (copy), l_TextService_0 (ref), l_TitleSmall_0 (copy)
        if not v17.title then
            return Vector2.new(0, 0);
        else
            return l_TextService_0:GetTextSize(v17.title, l_TitleSmall_0.FontSize, l_TitleSmall_0.Font, Vector2.new(500, 500));
        end;
    end, {
        v17.title
    });
    local v24 = v4.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v17 (copy), v4 (ref), l_View_0 (ref), l_Image_0 (ref)
        if not v17.presenceIconEnabled and not v17.titleIcon then
            return nil;
        elseif v17.presenceIconEnabled then
            return (v4.createElement(l_View_0, {
                tag = "size-300-300 bg-system-success radius-circle", 
                LayoutOrder = 1
            }));
        elseif v17.titleIcon then
            return (v4.createElement(l_Image_0, {
                Image = v17.titleIcon, 
                tag = "size-300-300 radius-circle", 
                LayoutOrder = 1
            }));
        else
            return nil;
        end;
    end, {
        v17.titleIcon, 
        v17.presenceIconEnabled
    });
    local v26 = v4.useMemo(function() --[[ Line: 75 ]]
        -- upvalues: v18 (copy), v24 (copy), v4 (ref), v23 (copy)
        if not v18.current then
            return nil;
        else
            local v25 = if v24 then v18.current.AbsoluteSize.X - 16 else v18.current.AbsoluteSize.X;
            return (v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v25, v23.Y)
            }));
        end;
    end, {
        v23
    });
    local v30 = v4.useCallback(function(v27) --[[ Line: 86 ]]
        -- upvalues: v21 (copy), l_Enums_0 (ref)
        local l_v21_0 = v21;
        local v29 = true;
        if v27 ~= l_Enums_0.ControlState.Hover then
            v29 = v27 == l_Enums_0.ControlState.Pressed;
        end;
        l_v21_0(v29);
    end, {});
    local v31 = v4.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v17 (copy), v4 (ref), l_Text_0 (ref), v19 (copy)
        if not v17.subtitle then
            return nil;
        else
            return (v4.createElement(l_Text_0, {
                tag = "size-full-0 auto-y clip text-truncate-end", 
                fontStyle = v19.Typography.LabelSmall, 
                Text = v17.subtitle, 
                LayoutOrder = 3
            }));
        end;
    end, {
        v17.subtitle
    });
    local v32 = v4.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: v17 (copy), v4 (ref), l_StatusIndicator_0 (ref), l_Flags_0 (ref), l_StatusIndicatorVariant_0 (ref), v16 (ref)
        if not v17.badge then
            return nil;
        else
            return (v4.createElement(l_StatusIndicator_0, {
                Position = UDim2.new(0.9, 0, 0.1, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                variant = if l_Flags_0.FoundationStatusIndicatorVariantExperiment then l_StatusIndicatorVariant_0.Alert else l_StatusIndicatorVariant_0.Emphasis, 
                value = tonumber(v17.badge), 
                max = v16
            }));
        end;
    end, {
        v17.badge
    });
    return v4.createElement(l_View_0, {
        tag = "auto-none", 
        Size = v17.itemSize, 
        LayoutOrder = v17.index, 
        ref = v18, 
        onStateChanged = v30, 
        onActivated = v17.onActivated, 
        stateLayer = {
            affordance = l_Enums_0.StateLayerAffordance.None
        }, 
        selection = if v17.selectionOrder then {
            SelectionOrder = v17.selectionOrder, 
            Selectable = v17.selectable == nil or v17.selectable
        } else nil
    }, {
        Content = v4.createElement(l_View_0, {
            tag = "size-full col align-x-center gap-small"
        }, {
            Image = v4.createElement(l_Image_0, {
                Image = v17.image, 
                tag = {
                    ["size-full"] = true, 
                    ["aspect-1-1"] = true, 
                    ["bg-shift-300"] = not v20 and not v17.altBackground, 
                    ["bg-system-neutral"] = not v20 and v17.altBackground, 
                    ["stroke-thick"] = true, 
                    ["stroke-emphasis"] = true, 
                    ["radius-circle"] = true, 
                    ["bg-shift-400"] = v20 and not v17.altBackground, 
                    ["bg-system-contrast"] = v20 and v17.altBackground, 
                    ["align-x-center"] = true, 
                    ["align-y-center"] = true, 
                    row = true
                }, 
                LayoutOrder = 1
            }, {
                Icon = if v17.icon then v4.createElement(l_Icon_0, {
                    name = v17.icon, 
                    size = l_IconSize_0.Large
                }) else nil
            }), 
            TextContainer = v4.createElement(l_View_0, {
                tag = "size-full-0 row auto-y gap-xsmall align-x-center align-y-center", 
                LayoutOrder = 2
            }, {
                TitleIcon = v24, 
                Title = if v17.title then v4.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left clip text-truncate-end", 
                    fontStyle = v19.Typography.TitleSmall, 
                    Text = v17.title, 
                    LayoutOrder = 2
                }, {
                    UISizeConstraint = v26
                }) else v4.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, 16), 
                    LayoutOrder = 2
                })
            }), 
            Subtitle = v31
        }), 
        Badge = v32
    });
end;