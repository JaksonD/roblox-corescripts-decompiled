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
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local v17 = require(l_script_FirstAncestor_0.Flags.FIntSocalCarouselMaxNewRequestsCount);
return function(v18) --[[ Line: 41 ]] --[[ Name: Tile ]]
    -- upvalues: v4 (copy), l_useTokens_0 (copy), l_TextService_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_StatusIndicator_0 (copy), l_Flags_0 (copy), l_StatusIndicatorVariant_0 (copy), v17 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Skeleton_0 (copy)
    local v19 = v18.tileRef or v4.useRef(nil);
    local v20 = l_useTokens_0();
    local v21, v22 = v4.useState(false);
    local l_TitleSmall_0 = v20.Typography.TitleSmall;
    local v24 = v4.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v18 (copy), l_TextService_0 (ref), l_TitleSmall_0 (copy)
        if not v18.title then
            return Vector2.new(0, 0);
        else
            return l_TextService_0:GetTextSize(v18.title, l_TitleSmall_0.FontSize, l_TitleSmall_0.Font, Vector2.new(500, 500));
        end;
    end, {
        v18.title
    });
    local v25 = v4.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: v18 (copy), v4 (ref), l_View_0 (ref), l_Image_0 (ref)
        if not v18.presenceIconEnabled and not v18.titleIcon then
            return nil;
        elseif v18.presenceIconEnabled then
            return (v4.createElement(l_View_0, {
                tag = "size-300-300 bg-system-success radius-circle", 
                LayoutOrder = 1
            }));
        elseif v18.titleIcon then
            return (v4.createElement(l_Image_0, {
                Image = v18.titleIcon, 
                tag = "size-300-300 radius-circle", 
                LayoutOrder = 1
            }));
        else
            return nil;
        end;
    end, {
        v18.titleIcon, 
        v18.presenceIconEnabled
    });
    local v27 = v4.useMemo(function() --[[ Line: 77 ]]
        -- upvalues: v19 (copy), v25 (copy), v4 (ref), v24 (copy)
        if not v19.current then
            return nil;
        else
            local v26 = if v25 then v19.current.AbsoluteSize.X - 16 else v19.current.AbsoluteSize.X;
            return (v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v26, v24.Y)
            }));
        end;
    end, {
        v24
    });
    local v31 = v4.useCallback(function(v28) --[[ Line: 88 ]]
        -- upvalues: v22 (copy), l_Enums_0 (ref)
        local l_v22_0 = v22;
        local v30 = true;
        if v28 ~= l_Enums_0.ControlState.Hover then
            v30 = v28 == l_Enums_0.ControlState.Pressed;
        end;
        l_v22_0(v30);
    end, {});
    local v32 = v4.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: v18 (copy), v4 (ref), l_Text_0 (ref), v20 (copy)
        if not v18.subtitle then
            return nil;
        else
            return (v4.createElement(l_Text_0, {
                tag = "size-full-0 auto-y clip text-truncate-end", 
                fontStyle = v20.Typography.LabelSmall, 
                Text = v18.subtitle, 
                LayoutOrder = 3
            }));
        end;
    end, {
        v18.subtitle
    });
    local v33 = v4.useMemo(function() --[[ Line: 105 ]]
        -- upvalues: v18 (copy), v4 (ref), l_StatusIndicator_0 (ref), l_Flags_0 (ref), l_StatusIndicatorVariant_0 (ref), v17 (ref)
        if not v18.badge then
            return nil;
        else
            return (v4.createElement(l_StatusIndicator_0, {
                Position = UDim2.new(0.9, 0, 0.1, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                variant = if l_Flags_0.FoundationStatusIndicatorVariantExperiment then l_StatusIndicatorVariant_0.Alert else l_StatusIndicatorVariant_0.Emphasis, 
                value = tonumber(v18.badge), 
                max = v17
            }));
        end;
    end, {
        v18.badge
    });
    return v4.createElement(l_View_0, {
        tag = "auto-none", 
        Size = v18.itemSize, 
        LayoutOrder = v18.index, 
        ref = v19, 
        onStateChanged = v31, 
        onActivated = v18.onActivated, 
        stateLayer = {
            affordance = l_Enums_0.StateLayerAffordance.None
        }, 
        selection = if v18.selectionOrder then {
            SelectionOrder = v18.selectionOrder, 
            Selectable = v18.selectable == nil or v18.selectable
        } else nil
    }, {
        Content = v4.createElement(l_View_0, {
            tag = "size-full col align-x-center gap-small"
        }, {
            Image = v4.createElement(l_Image_0, {
                Image = v18.image, 
                tag = {
                    ["size-full"] = true, 
                    ["aspect-1-1"] = true, 
                    ["bg-shift-300"] = not v21 and not v18.altBackground, 
                    ["bg-system-neutral"] = not v21 and v18.altBackground, 
                    ["stroke-thick"] = not l_FFlagLuaAppCompositionSupport_0, 
                    ["stroke-emphasis"] = not l_FFlagLuaAppCompositionSupport_0, 
                    ["radius-circle"] = true, 
                    ["bg-shift-400"] = v21 and not v18.altBackground, 
                    ["bg-system-contrast"] = v21 and v18.altBackground, 
                    ["align-x-center"] = true, 
                    ["align-y-center"] = true, 
                    row = true
                }, 
                stroke = if l_FFlagLuaAppCompositionSupport_0 then {
                    Color = v20.Color.Stroke.Emphasis.Color3, 
                    Transparency = v20.Color.Stroke.Emphasis.Transparency, 
                    Thickness = v20.Stroke.Thick, 
                    BorderStrokePosition = Enum.BorderStrokePosition.Inner
                } else nil, 
                LayoutOrder = 1
            }, {
                Icon = if v18.icon then v4.createElement(l_Icon_0, {
                    name = v18.icon, 
                    size = l_IconSize_0.Large
                }) else nil
            }), 
            TextContainer = v4.createElement(l_View_0, {
                tag = "size-full-0 row auto-y gap-xsmall align-x-center align-y-center", 
                LayoutOrder = 2
            }, {
                TitleIcon = v25, 
                Title = if v18.title then v4.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left clip text-truncate-end", 
                    fontStyle = v20.Typography.TitleSmall, 
                    Text = v18.title, 
                    LayoutOrder = 2
                }, {
                    UISizeConstraint = v27
                }) else v4.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, 16), 
                    LayoutOrder = 2
                })
            }), 
            Subtitle = v32
        }), 
        Badge = v33
    });
end;