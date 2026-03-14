local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Parent_4 = l_Parent_3.Parent;
local v5 = require(l_Parent_4.React);
local v6 = require(l_Parent_4.LuauPolyfill);
local _ = require(l_Parent_0.Types);
local v8 = require(l_Parent_2.Text.StyledTextLabel);
local l_Label_0 = require(l_Parent_3.Core.ImageSet.ImageSetComponent).Label;
local v10 = require(l_Parent_2.Button.Button);
local v11 = require(l_Parent_2.Button.Enum.ButtonType);
local v12 = require(l_Parent_3.Core.Button.Enum.StandardButtonSize);
local l_KeyLabel_0 = l_Parent_2.Menu.KeyLabel;
local v14 = require(l_KeyLabel_0.KeyLabel);
local _ = require(l_KeyLabel_0.Types);
local l_getKeyLabelWidth_0 = require(l_KeyLabel_0.Utilities).getKeyLabelWidth;
local v17 = require(l_Parent_3.Core.Style.useStyle);
local v18 = require(l_Parent_0.Constants);
local v19 = require(l_Parent_3.Core.Text.GetTextSize);
local v20 = require(l_Parent_1.Tooltip.Enum.TooltipOrientation);
local v21 = require(l_Parent_3.App.Button.IconButton);
local v22 = require(l_Parent_3.App.ImageSet.Enum.IconSize);
local v23 = require(l_Parent_3.App.ImageSet.Images);
local v24 = require(l_Parent_3.UIBloxConfig);
local function _(v25, v26) --[[ Line: 32 ]] --[[ Name: product ]]
    return Vector2.new(v25.X * v26.X, v25.Y * v26.Y);
end;
getOffsetPosition = function(v28, v29, v30, v31) --[[ Line: 37 ]] --[[ Name: getOffsetPosition ]]
    -- upvalues: v18 (copy)
    local v32 = v18.ORIENTATION_VECTOR[v30];
    local v33 = v29 + Vector2.new(v31, v31);
    return v28 + Vector2.new(v32.X * v33.X, v32.Y * v33.Y);
end;
local function _(v34) --[[ Line: 44 ]] --[[ Name: vectorToPosition ]]
    return UDim2.fromOffset(v34.X, v34.Y);
end;
local function _(v36) --[[ Line: 50 ]] --[[ Name: getContentAnchorPoint ]]
    -- upvalues: v18 (copy)
    return Vector2.new(0.5, 0.5) - 0.5 * v18.ORIENTATION_VECTOR[v36];
end;
local function _(v38, v39) --[[ Line: 55 ]] --[[ Name: convertPadding ]]
    return UDim.new(0, v38 or v39);
end;
local function _(v41, v42) --[[ Line: 60 ]] --[[ Name: addOffsets ]]
    -- upvalues: v20 (copy)
    return v41 + Vector2.new(v42[v20.Left] + v42[v20.Right], v42[v20.Top] + v42[v20.Bottom]);
end;
local function v51(v44, v45, v46) --[[ Line: 68 ]] --[[ Name: getHotkeysAndWidth ]]
    -- upvalues: v5 (copy), v14 (copy), l_getKeyLabelWidth_0 (copy), v18 (copy)
    if not v44 or #v44 == 0 then
        return nil, v45;
    else
        local v47 = {};
        local v48 = 0;
        for v49, v50 in ipairs(v44) do
            v47[v49] = v5.createElement(v14, {
                keyCode = v50, 
                LayoutOrder = v49
            });
            v48 = v48 + l_getKeyLabelWidth_0(v50, v46);
        end;
        v48 = math.max(v48 + v18.HOTKEY_PADDING * (#v44 - 1), v45);
        v47.Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v18.HOTKEY_PADDING)
        });
        return v5.createElement("Frame", {
            Name = "Hotkeys", 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromOffset(v48, 0), 
            LayoutOrder = 3
        }, v47), v48;
    end;
end;
return v5.forwardRef(function(v52, v53) --[[ Line: 104 ]] --[[ Name: TooltipWithRef ]]
    -- upvalues: v5 (copy), v17 (copy), v18 (copy), v19 (copy), v24 (copy), v51 (copy), v6 (copy), v11 (copy), v12 (copy), v10 (copy), v20 (copy), l_Label_0 (copy), v8 (copy), v21 (copy), v23 (copy), v22 (copy)
    assert(v52.headerText or v52.bodyText, "Must supply either header or body");
    assert(not (v52.renderCustomComponents and v52.buttonProps), "renderCustomComponents and buttonProps are not compatible");
    local v54, v55 = v5.useState(Vector2.zero);
    local v56 = v17();
    local v57 = v52.textAlignment or Enum.TextXAlignment.Left;
    local v58 = Enum.HorizontalAlignment[v57.Name];
    local l_Theme_0 = v56.Theme;
    local l_Font_0 = v56.Font;
    local l_Settings_0 = v56.Settings;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local l_CaptionHeader_0 = l_Font_0.CaptionHeader;
    local v64 = l_BaseSize_0 * l_CaptionHeader_0.RelativeSize;
    local v65 = v18.MAX_WIDTH - (v52.PaddingLeft or v18.DEFAULT_PADDING) - (v52.PaddingRight or v18.DEFAULT_PADDING);
    local v66 = Vector2.new(v65, 1e999);
    local v67 = 0;
    local v68 = nil;
    if v52.headerText then
        local v69 = Vector2.new(v65, 2 * v64);
        local l_v69_0 = v69;
        if v52.onClose then
            l_v69_0 = l_v69_0 - Vector2.new(v18.CLOSE_BUTTON_SIZE, 0);
        end;
        v68 = v19(v52.headerText, v64, l_CaptionHeader_0.Font, l_v69_0):Min(v69);
        v67 = math.max(v67, v68.X);
    end;
    local v71 = nil;
    v71 = if v24.enableTooltipV2BodyFontFix then l_Font_0.BodySmall else l_Font_0.CaptionBody;
    local v72 = nil;
    if v52.bodyText then
        v72 = v19(v52.bodyText, l_BaseSize_0 * v71.RelativeSize, v71.Font, v66);
        v67 = math.max(v67, v72.X);
    end;
    if v52.minContentWidth then
        v67 = math.max(v67, v52.minContentWidth);
    end;
    local v73 = nil;
    local v74, v75 = v51(v52.hotkeyCodes, v67, l_Font_0);
    v73 = v74;
    v67 = v75;
    v74 = nil;
    if v52.renderCustomComponents then
        v74 = {
            Content = v52.renderCustomComponents(v67), 
            SizeConstraint = v5.createElement("UISizeConstraint", {
                MaxSize = v66
            })
        };
    elseif v52.buttonProps then
        v75 = v6.Object.assign({}, v52.buttonProps, {
            buttonType = v11.PrimarySystem, 
            standardSize = v12.XSmall, 
            fontStyle = l_CaptionHeader_0
        });
        v74 = {
            Layout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }), 
            SizeContraint = v5.createElement("UISizeConstraint", {
                MinSize = Vector2.new(0, 28)
            }), 
            Button = v5.createElement(v10, v75)
        };
    end;
    v75 = v74 and v5.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(0, v67, 0, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 4, 
        Name = v52.renderCustomComponents and "CustomComponents" or "ButtonFrame"
    }, v74);
    local v76;
    if v73 and v75 then
        v76 = v5.createElement;
        local v77 = "Frame";
        local v78 = {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(0, v67, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        };
        local v79 = {};
        local l_createElement_0 = v5.createElement;
        local v81 = "UIListLayout";
        local v82 = {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        };
        local l_listPadding_0 = v52.listPadding;
        local l_DEFAULT_LIST_PADDING_0 = v18.DEFAULT_LIST_PADDING;
        v82.Padding = UDim.new(0, l_listPadding_0 or l_DEFAULT_LIST_PADDING_0);
        v82.SortOrder = Enum.SortOrder.LayoutOrder;
        v79.Layout = l_createElement_0(v81, v82);
        v79.Hotkeys = v73;
        v79.CustomContent = v75;
        v76 = v76(v77, v78, v79);
    else
        v76 = v73 or v75;
    end;
    local v85 = if v52.useLargeDropShadow then v18.DropShadow.Large else v18.DropShadow.Small;
    local v86 = v18.OPPOSITE_ORIENTATION[v52.orientation];
    local l_OFFSET_0 = v85.OFFSET;
    local v88 = v54 + Vector2.new(l_OFFSET_0[v20.Left] + l_OFFSET_0[v20.Right], l_OFFSET_0[v20.Top] + l_OFFSET_0[v20.Bottom]);
    l_OFFSET_0 = table.clone(v85.OFFSET);
    local v89 = v18.CONTENT_TO_CARET_TIP - l_OFFSET_0[v86];
    local v90 = math.max(0, v89);
    l_OFFSET_0[v86] = l_OFFSET_0[v86] + v90;
    local v91 = Vector2.new(l_OFFSET_0[v20.Left], l_OFFSET_0[v20.Top]);
    local v92 = Vector2.zero:Max(v18.ORIENTATION_VECTOR[v52.orientation] * v90);
    local l_orientation_0 = v52.orientation;
    local v94 = Vector2.new(0.5, 0.5) - 0.5 * v18.ORIENTATION_VECTOR[l_orientation_0];
    local v95 = v91 + Vector2.new(v54.X * v94.X, v54.Y * v94.Y) - v52.contentOffsetVector + v18.ORIENTATION_VECTOR[v86] * v18.CONTENT_TO_CARET_CENTER;
    local v96 = v54 + Vector2.new(l_OFFSET_0[v20.Left] + l_OFFSET_0[v20.Right], l_OFFSET_0[v20.Top] + l_OFFSET_0[v20.Bottom]);
    local v97 = math.floor(v52.distanceOffset + 0.5);
    local v98 = getOffsetPosition(v52.triggerPointCenter, v52.triggerPointRadius, v52.orientation, v18.CARET_DISTANCE + math.min(0, v89) + v97) + v52.contentOffsetVector;
    v94 = l_Theme_0.BackgroundUIDefault;
    l_orientation_0 = v52.backgroundColor or v94.Color;
    local v99 = (v52.backgroundTransparency or v94.Transparency) * l_Settings_0.PreferredTransparency;
    local l_createElement_1 = v5.createElement;
    local v101 = "CanvasGroup";
    local v102 = {
        GroupTransparency = v52.transparency, 
        Position = UDim2.fromOffset(v98.X, v98.Y), 
        Size = UDim2.fromOffset(v96.X, v96.Y)
    };
    local l_orientation_1 = v52.orientation;
    v102.AnchorPoint = Vector2.new(0.5, 0.5) - 0.5 * v18.ORIENTATION_VECTOR[l_orientation_1];
    v102.BackgroundTransparency = if v52.canvasBackground then v52.canvasBackground.Transparency else 1;
    v102.BackgroundColor3 = if v52.canvasBackground then v52.canvasBackground.Color else nil;
    v102.BorderSizePixel = 0;
    local v104 = {
        Caret = v5.createElement(l_Label_0, {
            Image = v18.CARET_IMAGE, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromOffset(v95.X, v95.Y), 
            BackgroundTransparency = 1, 
            Size = v18.CARET_SIZE, 
            Rotation = v18.CARET_ROTATION[v52.orientation], 
            ImageColor3 = l_orientation_0, 
            ImageTransparency = v99, 
            ZIndex = 2
        }), 
        DropShadow = v5.createElement(l_Label_0, {
            Image = v85.IMAGE, 
            ImageColor3 = l_Theme_0.DropShadow.Color, 
            ImageTransparency = l_Theme_0.DropShadow.Transparency, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(v92.X, v92.Y), 
            Size = UDim2.fromOffset(v88.X, v88.Y), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v85.SLICE_CENTER, 
            ZIndex = 1
        })
    };
    l_orientation_1 = v5.createElement;
    local v105 = "Frame";
    local v107 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.fromOffset(v91.X, v91.Y), 
        BackgroundColor3 = l_orientation_0, 
        BackgroundTransparency = v99, 
        [v5.Change.AbsoluteSize] = function(v106) --[[ Line: 293 ]]
            -- upvalues: v55 (copy), v52 (copy)
            v55(v106.AbsoluteSize);
            if v52.onContentSizeChanged then
                v52.onContentSizeChanged(v106.AbsoluteSize);
            end;
        end, 
        ref = v53, 
        ZIndex = 2
    };
    local v108 = {};
    local l_createElement_2 = v5.createElement;
    local v110 = "UIListLayout";
    local v111 = {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = v58, 
        SortOrder = Enum.SortOrder.LayoutOrder
    };
    local l_listPadding_1 = v52.listPadding;
    local l_DEFAULT_LIST_PADDING_1 = v18.DEFAULT_LIST_PADDING;
    v111.Padding = UDim.new(0, l_listPadding_1 or l_DEFAULT_LIST_PADDING_1);
    v108.Layout = l_createElement_2(v110, v111);
    l_createElement_2 = v5.createElement;
    v110 = "UIPadding";
    v111 = {};
    l_listPadding_1 = v52.PaddingTop;
    l_DEFAULT_LIST_PADDING_1 = v18.DEFAULT_PADDING;
    v111.PaddingTop = UDim.new(0, l_listPadding_1 or l_DEFAULT_LIST_PADDING_1);
    l_listPadding_1 = v52.PaddingBottom;
    l_DEFAULT_LIST_PADDING_1 = v18.DEFAULT_PADDING;
    v111.PaddingBottom = UDim.new(0, l_listPadding_1 or l_DEFAULT_LIST_PADDING_1);
    l_listPadding_1 = v52.PaddingLeft;
    l_DEFAULT_LIST_PADDING_1 = v18.DEFAULT_PADDING;
    v111.PaddingLeft = UDim.new(0, l_listPadding_1 or l_DEFAULT_LIST_PADDING_1);
    l_listPadding_1 = v52.PaddingRight;
    l_DEFAULT_LIST_PADDING_1 = v18.DEFAULT_PADDING;
    v111.PaddingRight = UDim.new(0, l_listPadding_1 or l_DEFAULT_LIST_PADDING_1);
    v108.Padding = l_createElement_2(v110, v111);
    v108.Corner = v5.createElement("UICorner", {
        CornerRadius = v18.CORNER_RADIUS
    });
    l_createElement_2 = v52.headerText;
    if l_createElement_2 then
        l_createElement_2 = v5.createElement;
        v110 = v8;
        v111 = {
            text = v52.headerText, 
            fontStyle = l_CaptionHeader_0, 
            colorStyle = l_Theme_0.TextEmphasis, 
            textYAlignment = Enum.TextYAlignment.Center, 
            textXAlignment = v57, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            layoutOrder = 1
        };
        l_listPadding_1 = v68;
        v111.size = UDim2.fromOffset(l_listPadding_1.X, l_listPadding_1.Y);
        v111.fluidSizing = false;
        v111.richText = if v24.enableTooltipRichText then v52.enableHeaderRichText else false;
        v111.lineHeight = 1;
        l_createElement_2 = l_createElement_2(v110, v111);
    end;
    v108.Header = l_createElement_2;
    l_createElement_2 = v52.bodyText;
    if l_createElement_2 then
        l_createElement_2 = v5.createElement;
        v110 = v8;
        v111 = {
            text = v52.bodyText, 
            fontStyle = v71, 
            colorStyle = l_Theme_0.TextEmphasis, 
            textYAlignment = Enum.TextYAlignment.Center, 
            textXAlignment = v57, 
            textTruncate = Enum.TextTruncate.None, 
            layoutOrder = 2
        };
        l_listPadding_1 = v72;
        v111.size = UDim2.fromOffset(l_listPadding_1.X, l_listPadding_1.Y);
        v111.fluidSizing = false;
        v111.richText = if v24.enableTooltipRichText then v52.enableBodyRichText else false;
        v111.lineHeight = 1;
        l_createElement_2 = l_createElement_2(v110, v111);
    end;
    v108.Body = l_createElement_2;
    v108.Additional = v76;
    v104.Box = l_orientation_1(v105, v107, v108);
    l_orientation_1 = false;
    if v52.onClose ~= nil then
        l_orientation_1 = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            ZIndex = 3, 
            Size = UDim2.fromOffset(v18.CLOSE_BUTTON_SIZE, v18.CLOSE_BUTTON_SIZE), 
            Position = UDim2.new(1, -(v18.CLOSE_BUTTON_SIZE + v18.CLOSE_BUTTON_PADDING * 2), 0, v18.CLOSE_BUTTON_SIZE / 2)
        }, {
            Button = v5.createElement(v21, {
                backgroundTransparency = 1, 
                icon = v23["icons/navigation/close"], 
                iconSize = v22.Small, 
                size = UDim2.new(1, 0, 1, 0), 
                onActivated = v52.onClose
            })
        });
    end;
    v104.CloseButton = l_orientation_1;
    return l_createElement_1(v101, v102, v104);
end);