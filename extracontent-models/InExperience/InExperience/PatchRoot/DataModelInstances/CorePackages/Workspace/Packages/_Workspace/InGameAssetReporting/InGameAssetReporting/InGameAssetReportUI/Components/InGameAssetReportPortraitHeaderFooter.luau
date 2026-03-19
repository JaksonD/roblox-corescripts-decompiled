local l_Parent_0 = script:FindFirstAncestor("InGameAssetReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_Images_0 = v2.App.ImageSet.Images;
local l_withStyle_0 = v2.Style.withStyle;
local _ = function(v10, _, _) --[[ Line: 30 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    return function() --[[ Line: 31 ]]
        -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v10 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 30, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = v10
            })
        });
    end;
end;
local function _(v14) --[[ Line: 52 ]] --[[ Name: renderHeaderBarCenter ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy)
    return function() --[[ Line: 53 ]]
        -- upvalues: l_withStyle_0 (ref), v1 (ref), v14 (copy)
        return l_withStyle_0(function(v15) --[[ Line: 54 ]]
            -- upvalues: v1 (ref), v14 (ref)
            local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
            local v17 = 300;
            if l_CurrentCamera_0 ~= nil then
                v17 = l_CurrentCamera_0.ViewportSize.X - 150;
            end;
            local l_Theme_0 = v15.Theme;
            local l_Font_0 = v15.Font;
            return v1.createElement("TextLabel", {
                Text = v14, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(0, v17, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
end;
local _ = function(_, v22, v23, v24, v25) --[[ Line: 81 ]] --[[ Name: renderHeaderBarRight ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    return function() --[[ Line: 88 ]]
        -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v24 (copy), v22 (copy), v25 (copy), v23 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 60, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            UndoButton = v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not v24, 
                layoutOrder = 1, 
                onActivated = v22
            }), 
            RedoButton = v1.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v25, 
                layoutOrder = 2, 
                onActivated = v23
            })
        });
    end;
end;
return {
    PortraitModeHeader = function(v27) --[[ Line: 117 ]] --[[ Name: PortraitModeHeader ]]
        -- upvalues: v1 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_withStyle_0 (copy)
        local v28 = v27.isRedoEnabled or v27.isUndoEnabled;
        local l_createElement_0 = v1.createElement;
        local v30 = "Frame";
        local v31 = {
            BorderSizePixel = 0, 
            BackgroundTransparency = 0.1, 
            BackgroundColor3 = Color3.fromHex("#000000"), 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 72), 
            ZIndex = 2
        };
        local v32 = {};
        local l_createElement_1 = v1.createElement;
        local l_l_HeaderBar_0_0 = l_HeaderBar_0;
        local v35 = {
            backgroundTransparency = 1, 
            barHeight = 72, 
            margin = 12
        };
        local l_backAction_0 = v27.backAction;
        local l_isRedoEnabled_0 = v27.isRedoEnabled;
        local l_isUndoEnabled_0 = v27.isUndoEnabled;
        local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 10 -> 15 ]];
        v35.renderLeft = function() --[[ Line: 31 ]]
            -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_l_backAction_0_0 (copy)
            return v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 30, 1, 0)
            }, {
                Layout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                BackButton = v1.createElement(l_IconButton_0, {
                    iconSize = l_IconSize_0.Medium, 
                    icon = l_Images_0["icons/navigation/pushBack"], 
                    layoutOrder = 1, 
                    onActivated = l_l_backAction_0_0
                })
            });
        end;
        local v40;
        if v28 then
            l_backAction_0 = v27.annotationPoints;
            l_isRedoEnabled_0 = v27.undoAnnotationPoints;
            l_isUndoEnabled_0 = v27.redoAnnotationPoints;
            local l_isUndoEnabled_1 = v27.isUndoEnabled;
            local l_isRedoEnabled_1 = v27.isRedoEnabled;
            v40 = function() --[[ Line: 88 ]]
                -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_isUndoEnabled_1 (copy), l_isRedoEnabled_0 (copy), l_isRedoEnabled_1 (copy), l_isUndoEnabled_0 (copy)
                return v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 60, 1, 0)
                }, {
                    Layout = v1.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    UndoButton = v1.createElement(l_IconButton_0, {
                        iconSize = l_IconSize_0.Medium, 
                        icon = l_Images_0["icons/actions/edit/undo"], 
                        isDisabled = not l_isUndoEnabled_1, 
                        layoutOrder = 1, 
                        onActivated = l_isRedoEnabled_0
                    }), 
                    RedoButton = v1.createElement(l_IconButton_0, {
                        iconSize = l_IconSize_0.Medium, 
                        icon = l_Images_0["icons/actions/edit/redo"], 
                        isDisabled = not l_isRedoEnabled_1, 
                        layoutOrder = 2, 
                        onActivated = l_isUndoEnabled_0
                    })
                });
            end;
        else
            v40 = function() --[[ Line: 141 ]]

            end;
        end;
        v35.renderRight = v40;
        l_backAction_0 = v27.titleText;
        v35.renderCenter = function() --[[ Line: 53 ]]
            -- upvalues: l_withStyle_0 (ref), v1 (ref), l_backAction_0 (copy)
            return l_withStyle_0(function(v43) --[[ Line: 54 ]]
                -- upvalues: v1 (ref), l_backAction_0 (ref)
                local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
                local v45 = 300;
                if l_CurrentCamera_1 ~= nil then
                    v45 = l_CurrentCamera_1.ViewportSize.X - 150;
                end;
                local l_Theme_1 = v43.Theme;
                local l_Font_1 = v43.Font;
                return v1.createElement("TextLabel", {
                    Text = l_backAction_0, 
                    Font = l_Font_1.Header2.Font, 
                    TextColor3 = l_Theme_1.TextEmphasis.Color, 
                    TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                    TextSize = 20, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Size = UDim2.new(0, v45, 1, 0), 
                    BackgroundTransparency = 1
                });
            end);
        end;
        v35.isSecondary = true;
        v32.Bar = l_createElement_1(l_l_HeaderBar_0_0, v35);
        return l_createElement_0(v30, v31, v32);
    end, 
    PortraitModeFooter = function(v48) --[[ Line: 148 ]] --[[ Name: PortraitModeFooter ]]
        -- upvalues: v1 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy)
        return v1.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 0.1, 
            Size = UDim2.new(1, 0, 0, 60), 
            BackgroundColor3 = Color3.fromHex("#000000"), 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            LayoutOrder = 4
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            Container = v1.createElement("Frame", {
                Size = UDim2.new(0, 400, 1, 0), 
                BackgroundTransparency = 1
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 12), 
                    PaddingLeft = UDim.new(0, 32), 
                    PaddingRight = UDim.new(0, 32)
                }), 
                ActionButtons = v1.createElement(l_ButtonStack_0, {
                    marginBetween = 8, 
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v48.nextAction, 
                                text = v48.nextText
                            }
                        }
                    }
                })
            })
        });
    end
};