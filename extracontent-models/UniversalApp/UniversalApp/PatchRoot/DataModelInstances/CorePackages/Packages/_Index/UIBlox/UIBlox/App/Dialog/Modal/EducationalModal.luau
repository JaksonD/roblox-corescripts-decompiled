local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local l_FitFrameVertical_0 = require(l_Parent_3.FitFrame).FitFrameVertical;
local l_Label_0 = require(l_Parent_2.Core.ImageSet.ImageSetComponent).Label;
local v8 = require(l_Parent_2.Core.Text.GenericTextLabel.GenericTextLabel);
local v9 = require(l_Parent_2.Core.Style.withStyle);
local v10 = require(l_Parent_2.App.Button.Enum.ButtonType);
local v11 = require(l_Parent_1.ImageSet.getIconSize);
local v12 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v13 = require(l_Parent_2.App.InputButton.Checkbox);
local v14 = require(l_Parent_0.PartialPageModal);
local v15 = v4.PureComponent:extend("EducationalModal");
v15.validateProps = v5.strictInterface({
    bodyContents = v5.array(v5.strictInterface({
        icon = v5.optional(v5.union(v5.string, v5.table)), 
        text = v5.string, 
        layoutOrder = v5.optional(v5.integer), 
        isSystemMenuIcon = v5.optional(v5.boolean)
    })), 
    hasDoNotShow = v5.optional(v5.boolean), 
    cancelText = v5.string, 
    confirmText = v5.string, 
    doNotShowText = v5.optional(v5.string), 
    titleText = v5.optional(v5.string), 
    titleBackgroundImageProps = v5.strictInterface({
        image = v5.string, 
        imageHeight = v5.number, 
        text = v5.optional(v5.string)
    }), 
    screenSize = v5.Vector2, 
    onDismiss = v5.callback, 
    onCancel = v5.callback, 
    onConfirm = v5.callback
});
local function v24(v16) --[[ Line: 68 ]] --[[ Name: ContentItem ]]
    -- upvalues: v4 (copy), l_Label_0 (copy), v11 (copy), v12 (copy), v8 (copy)
    local v17 = Vector2.new(16, 16);
    local v18 = v16.isSystemMenuIcon or false;
    local v19 = v18 or v16.icon;
    local l_stylePalette_0 = v16.stylePalette;
    local l_Theme_0 = l_stylePalette_0.Theme;
    local l_Font_0 = l_stylePalette_0.Font;
    local v23 = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize;
    return v4.createElement("Frame", {
        Size = v19 and UDim2.new(0, 253, 0, v17.Y) or UDim2.new(1, 0, 0, v17.Y), 
        AutomaticSize = v19 and Enum.AutomaticSize.None or Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v16.layoutOrder
    }, {
        HorizontalLayout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = v18 and UDim.new(0, 10) or UDim.new(0, 8), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = v18 and UDim.new(0, 2) or UDim.new(0, 0)
        }), 
        Icon = v18 and v4.createElement(l_Label_0, {
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(32, 32), 
            Image = "rbxasset://textures/ui/TopBar/iconBase.png", 
            LayoutOrder = 1
        }, {
            Icon = v4.createElement(l_Label_0, {
                ZIndex = 1, 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(24, 24), 
                Image = "rbxasset://textures/ui/TopBar/coloredlogo.png"
            })
        }) or v19 and v4.createElement(l_Label_0, {
            Image = v16.icon, 
            Size = UDim2.fromOffset(v11(v12.Medium), v11(v12.Medium)), 
            ImageColor3 = l_Theme_0.IconDefault.Color, 
            ImageTransparency = l_Theme_0.IconDefault.Transparency, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }) or nil, 
        Text = v16.text and v4.createElement(v8, {
            Size = UDim2.new(1, 0, 0, v17.Y), 
            AutomaticSize = v19 and Enum.AutomaticSize.None or Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Text = v16.text, 
            TextSize = v23, 
            colorStyle = l_Theme_0.TextDefault, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            fontStyle = l_Font_0.Body, 
            TextXAlignment = v19 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
            TextWrapped = true, 
            LayoutOrder = 2
        })
    });
end;
v15.init = function(v25) --[[ Line: 133 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v25.state = {
        shouldNotShowAgain = false
    };
    local v26, v27 = v4.createBinding(Vector2.new(0, 0));
    v25.contentSize = v26;
    v25.changeContentSize = v27;
    v25.toggleDoNotShow = function() --[[ Line: 139 ]]
        -- upvalues: v25 (copy)
        v25:setState(function(v28) --[[ Line: 140 ]]
            return {
                shouldNotShowAgain = not v28.shouldNotShowAgain
            };
        end);
    end;
    v25.onDismiss = function() --[[ Line: 147 ]]
        -- upvalues: v25 (copy)
        v25.props.onDismiss(v25.state.shouldNotShowAgain);
    end;
    v25.onCancel = function() --[[ Line: 150 ]]
        -- upvalues: v25 (copy)
        v25.props.onCancel(v25.state.shouldNotShowAgain);
    end;
    v25.onConfirm = function() --[[ Line: 153 ]]
        -- upvalues: v25 (copy)
        v25.props.onConfirm(v25.state.shouldNotShowAgain);
    end;
end;
v15.render = function(v29) --[[ Line: 158 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v4 (copy), v24 (copy), v13 (copy), v14 (copy), v10 (copy), l_FitFrameVertical_0 (copy)
    local l_props_0 = v29.props;
    local l_hasDoNotShow_0 = l_props_0.hasDoNotShow;
    return v9(function(v32) --[[ Line: 162 ]]
        -- upvalues: l_props_0 (copy), v4 (ref), v24 (ref), l_hasDoNotShow_0 (copy), v13 (ref), v29 (copy), v14 (ref), v10 (ref), l_FitFrameVertical_0 (ref)
        local v33 = 0;
        local v34 = {};
        for v35, v36 in ipairs(l_props_0.bodyContents) do
            table.insert(v34, (v4.createElement(v24, {
                key = tostring(v35), 
                icon = v36.icon, 
                text = v36.text, 
                layoutOrder = v35, 
                isSystemMenuIcon = v36.isSystemMenuIcon, 
                stylePalette = v32
            })));
            v33 = v33 + 1;
        end;
        local l_Theme_1 = v32.Theme;
        if l_hasDoNotShow_0 then
            table.insert(v34, (v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 50), 
                LayoutOrder = v33 + 1, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 21), 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Divider = v4.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundColor3 = l_Theme_1.Divider.Color, 
                    BackgroundTransparency = l_Theme_1.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 1)
                }), 
                DoNotShowCheckbox = v4.createElement(v13, {
                    text = l_props_0.doNotShowText, 
                    onActivated = v29.toggleDoNotShow, 
                    isSelected = v29.state.shouldNotShowAgain, 
                    layoutOrder = 2
                })
            })));
        end;
        return v4.createElement(v14, {
            title = l_props_0.titleText, 
            titleBackgroundImageProps = l_props_0.titleBackgroundImageProps, 
            screenSize = l_props_0.screenSize, 
            bottomPadding = 50, 
            buttonStackProps = {
                buttons = {
                    {
                        props = {
                            isDisabled = false, 
                            onActivated = if l_hasDoNotShow_0 then v29.onCancel else l_props_0.onCancel, 
                            text = l_props_0.cancelText
                        }
                    }, 
                    {
                        buttonType = v10.PrimarySystem, 
                        props = {
                            isDisabled = false, 
                            onActivated = if l_hasDoNotShow_0 then v29.onConfirm else l_props_0.onConfirm, 
                            text = l_props_0.confirmText
                        }
                    }
                }
            }, 
            onCloseClicked = if l_hasDoNotShow_0 then v29.onDismiss else l_props_0.onDismiss
        }, {
            BodyContents = v4.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 28), 
                margin = {
                    top = 36, 
                    bottom = 36
                }, 
                [v4.Change.AbsoluteSize] = function(v38) --[[ Line: 244 ]]
                    -- upvalues: v29 (ref)
                    v29.changeContentSize(v38.AbsoluteSize);
                end
            }, v34)
        });
    end);
end;
return v15;