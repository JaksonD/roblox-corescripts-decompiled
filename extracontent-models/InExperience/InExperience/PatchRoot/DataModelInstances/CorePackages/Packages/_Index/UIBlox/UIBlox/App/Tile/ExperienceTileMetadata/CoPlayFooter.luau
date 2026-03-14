local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.UIBloxConfig);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.React);
local l_Label_0 = require(l_Parent_0.Core.ImageSet.ImageSetComponent).Label;
local v6 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v7 = require(l_Parent_0.Core.Style.useStyle);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local _ = require(l_Parent_0.App.Style.Fonts);
local v10 = {
    size = UDim2.fromScale(1, 1), 
    faceGroupCount = 3, 
    maxBadgeDisplayNumber = 99, 
    styleProps = {}, 
    showEmphasisBorder = false
};
local v11 = {
    containerGap = 6, 
    faceGroupGap = -9, 
    faceBorderWidth = 3, 
    faceBorderRadius = 50, 
    faceWidth = 24, 
    faceHeight = 24, 
    badgeBorderWidth = 3, 
    badgeBorderRadius = 50, 
    badgeSpacingLeading = 9, 
    badgeSpacingTrailing = 9, 
    badgeHeight = 24
};
local function _(v12) --[[ Line: 136 ]] --[[ Name: getAvatarImage ]]
    return string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", (tostring(v12)));
end;
local function v15(v14) --[[ Line: 140 ]] --[[ Name: renderCornerStroke ]]
    -- upvalues: v4 (copy)
    return v4.createElement(v4.Fragment, nil, {
        Corner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, v14.borderRadius)
        }), 
        Stroke = v4.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v14.borderColor.Color, 
            Transparency = v14.borderColor.Transparency, 
            Thickness = v14.borderWidth
        })
    });
end;
local function v23(v16, v17, v18, v19) --[[ Line: 154 ]] --[[ Name: renderEmphasisBorder ]]
    -- upvalues: v4 (copy), v15 (copy)
    local l_Theme_0 = v18.Theme;
    local v21 = v16 - 1;
    local v22 = (1 - v16) / 2;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, v22, 0, v22), 
        Size = UDim2.new(1, v21, 1, v21), 
        ZIndex = v19
    }, {
        v15({
            borderWidth = 1, 
            borderColor = l_Theme_0.ContextualPrimaryDefault, 
            borderRadius = v17.badgeBorderRadius
        })
    });
end;
local function v39(v24, v25, v26) --[[ Line: 177 ]] --[[ Name: renderBadge ]]
    -- upvalues: v4 (copy), v15 (copy), v23 (copy)
    local v27 = nil;
    v27 = if v24.usersCount > v24.maxDisplayNumber then tostring(v24.maxDisplayNumber) .. "+" else tostring(v24.usersCount);
    local l_Theme_1 = v26.Theme;
    local l_Font_0 = v26.Font;
    local v30 = v25.badgeBackgroundColor or l_Theme_1.BackgroundUIDefault;
    local l_badgeBorderWidth_0 = v25.badgeBorderWidth;
    local v32 = v25.badgeBorderColor or v26.Theme.BackgroundDefault;
    local l_badgeBorderRadius_0 = v25.badgeBorderRadius;
    local l_badgeSpacingLeading_0 = v25.badgeSpacingLeading;
    local l_badgeSpacingTrailing_0 = v25.badgeSpacingTrailing;
    local l_badgeHeight_0 = v25.badgeHeight;
    local v37 = v25.badgeContentColor or l_Theme_1.TextMuted;
    local v38 = v4.createElement("Frame", {
        LayoutOrder = v24.layoutOrder, 
        ZIndex = v24.ZIndex, 
        Size = UDim2.fromOffset(0, l_badgeHeight_0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v30.Color, 
        BackgroundTransparency = v30.Transparency, 
        AutomaticSize = Enum.AutomaticSize.X
    }, {
        v15({
            borderWidth = l_badgeBorderWidth_0, 
            borderColor = v32, 
            borderRadius = l_badgeBorderRadius_0
        }); 
        SizeConstraint = v4.createElement("UISizeConstraint", {
            MinSize = Vector2.new(l_badgeHeight_0, 0)
        }), 
        Content = v4.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            Text = v27, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Font = l_Font_0.CaptionHeader.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
            TextColor3 = v37.Color, 
            TextTransparency = v37.Transparency, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.X, 
            ZIndex = v24.ZIndex + 1
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_badgeSpacingLeading_0), 
                PaddingRight = UDim.new(0, l_badgeSpacingTrailing_0)
            })
        })
    });
    return v4.createElement("Frame", {
        LayoutOrder = v24.layoutOrder, 
        ZIndex = v24.ZIndex, 
        Size = UDim2.fromOffset(0, l_badgeHeight_0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v30.Color, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.X
    }, {
        BadgeContainer = v38, 
        emphasisBorder = if v24.showEmphasisBorder then v23(l_badgeBorderWidth_0, v25, v26, v24.ZIndex + 1) else nil
    });
end;
local function v53(v40, v41, v42) --[[ Line: 251 ]] --[[ Name: renderFaceImage ]]
    -- upvalues: v4 (copy), l_Label_0 (copy), v15 (copy), v23 (copy)
    local v43 = v41.faceBackgroundColor or v42.Theme.TextDefault;
    local l_faceBorderWidth_0 = v41.faceBorderWidth;
    local v45 = v41.faceBorderColor or v42.Theme.BackgroundDefault;
    local l_faceBorderRadius_0 = v41.faceBorderRadius;
    local l_faceWidth_0 = v41.faceWidth;
    local l_faceHeight_0 = v41.faceHeight;
    local l_createElement_0 = v4.createElement;
    local l_l_Label_0_0 = l_Label_0;
    local v51 = {
        LayoutOrder = v40.layoutOrder, 
        ZIndex = v40.ZIndex, 
        Size = UDim2.fromOffset(l_faceWidth_0, l_faceHeight_0)
    };
    local l_user_0 = v40.user;
    v51.Image = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150", (tostring(l_user_0)));
    v51.BackgroundColor3 = v43.Color;
    v51.BackgroundTransparency = v43.Transparency;
    v51.BorderSizePixel = 0;
    return l_createElement_0(l_l_Label_0_0, v51, {
        v15({
            borderWidth = l_faceBorderWidth_0, 
            borderColor = v45, 
            borderRadius = l_faceBorderRadius_0
        }); 
        emphasisBorder = if v40.showEmphasisBorder then v23(l_faceBorderWidth_0, v41, v42, v40.ZIndex + 1) else nil
    });
end;
local function v67(v54, v55, v56, v57, v58, v59) --[[ Line: 278 ]] --[[ Name: renderFaces ]]
    -- upvalues: v4 (copy), v39 (copy), v53 (copy)
    local l_users_0 = v54.users;
    local l_faceGroupGap_0 = v55.faceGroupGap;
    local l_badgeBorderWidth_1 = v55.badgeBorderWidth;
    local l_faceBorderWidth_1 = v55.faceBorderWidth;
    local v64 = math.max(l_badgeBorderWidth_1, l_faceBorderWidth_1);
    local v65 = {
        ListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_faceGroupGap_0)
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_badgeBorderWidth_1), 
            PaddingTop = UDim.new(0, v64), 
            PaddingRight = UDim.new(0, l_faceBorderWidth_1), 
            PaddingBottom = UDim.new(0, v64)
        }), 
        Badge = if v58 then v39({
            usersCount = #l_users_0, 
            layoutOrder = 0, 
            ZIndex = v57 + 1, 
            maxDisplayNumber = v54.maxBadgeDisplayNumber, 
            showEmphasisBorder = v54.showEmphasisBorder
        }, v55, v56) else nil
    };
    for v66 = 1, math.min(v59, #l_users_0) do
        v65["Face_" .. v66] = v53({
            user = l_users_0[v66], 
            layoutOrder = v66, 
            ZIndex = v57 - v66, 
            showEmphasisBorder = v54.showEmphasisBorder
        }, v55, v56);
    end;
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v65);
end;
return function(v68) --[[ Line: 332 ]] --[[ Name: CoPlayFooter ]]
    -- upvalues: v3 (copy), v10 (copy), v2 (copy), v7 (copy), v4 (copy), v11 (copy), v67 (copy), v6 (copy)
    local v69 = v3.Dictionary.join(v10, v68);
    if not v2.fixCoplayFooterConditionalHooks and (not v69.users or #v69.users == 0) then
        return nil;
    else
        local v70 = v7();
        local v71, v72 = v4.useBinding(Vector2.new(0, 0));
        local v73 = v3.Dictionary.join(v11, v69.styleProps);
        local v74 = nil;
        if v2.fixCoplayFooterConditionalHooks then
            v74 = v4.useCallback(function(v75) --[[ Line: 346 ]]
                -- upvalues: v72 (copy)
                v72(v75.AbsoluteSize);
            end, {
                v72
            });
            if not v69.users or #v69.users == 0 then
                return nil;
            end;
        end;
        local l_containerGap_0 = v73.containerGap;
        local v77 = v73.labelContentColor or v70.Theme.TextMuted;
        local l_faceGroupCount_0 = v69.faceGroupCount;
        local v79 = #v69.users > l_faceGroupCount_0 + 1;
        if not v79 then
            l_faceGroupCount_0 = l_faceGroupCount_0 + 1;
        end;
        local v80 = l_faceGroupCount_0 + 1;
        if not v2.fixCoplayFooterConditionalHooks then
            v74 = v4.useCallback(function(v81) --[[ Line: 367 ]]
                -- upvalues: v72 (copy)
                v72(v81.AbsoluteSize);
            end, {
                v72
            });
        end;
        return v4.createElement("Frame", {
            Size = v69.size, 
            Position = v69.position, 
            AnchorPoint = v69.anchorPoint, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v69.layoutOrder
        }, {
            ListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_containerGap_0)
            }), 
            FacesFrame = v4.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                [v4.Change.AbsoluteSize] = v74
            }, {
                Faces = v67(v69, v73, v70, v80, v79, l_faceGroupCount_0)
            }), 
            LabelFrame = if v69.labelText then v4.createElement("Frame", {
                LayoutOrder = 2, 
                Size = v71:map(function(v82) --[[ Line: 397 ]]
                    -- upvalues: l_containerGap_0 (copy)
                    return UDim2.new(1, -v82.X - l_containerGap_0, 1, 0);
                end), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Label = v4.createElement(v6, {
                    Size = UDim2.fromScale(1, 1), 
                    Text = v69.labelText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = false, 
                    fontStyle = v73.fontStyle or v70.Font.CaptionBody, 
                    colorStyle = v77
                })
            }) else nil
        });
    end;
end;