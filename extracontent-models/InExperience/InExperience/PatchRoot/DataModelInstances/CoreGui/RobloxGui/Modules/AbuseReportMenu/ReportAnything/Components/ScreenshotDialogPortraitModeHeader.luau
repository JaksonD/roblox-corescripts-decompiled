local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local l_IconButton_0 = v1.App.Button.IconButton;
local l_IconSize_0 = v1.App.ImageSet.Enum.IconSize;
local l_Images_0 = v1.App.ImageSet.Images;
local l_withStyle_0 = v1.Style.withStyle;
local _ = function(v8, _, _) --[[ Line: 25 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v2 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    return function() --[[ Line: 26 ]]
        -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v8 (copy)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 30, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = v8
            })
        });
    end;
end;
local function _(v12) --[[ Line: 47 ]] --[[ Name: renderCenter ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy)
    return function() --[[ Line: 48 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), v12 (copy)
        return l_withStyle_0(function(v13) --[[ Line: 49 ]]
            -- upvalues: v2 (ref), v12 (ref)
            local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
            local v15 = 300;
            if l_CurrentCamera_0 ~= nil then
                v15 = l_CurrentCamera_0.ViewportSize.X - 150;
            end;
            local l_Theme_0 = v13.Theme;
            local l_Font_0 = v13.Font;
            return v2.createElement("TextLabel", {
                Text = v12, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(0, v15, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
end;
local _ = function(_, v20, v21, v22, v23) --[[ Line: 76 ]] --[[ Name: renderHeaderBarRight ]]
    -- upvalues: v2 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    return function() --[[ Line: 83 ]]
        -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v22 (copy), v20 (copy), v23 (copy), v21 (copy)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 60, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            UndoButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not v22, 
                layoutOrder = 1, 
                onActivated = v20
            }), 
            RedoButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v23, 
                layoutOrder = 2, 
                onActivated = v21
            })
        });
    end;
end;
return function(v25) --[[ Line: 111 ]] --[[ Name: ScreenshotDialogPortraitModeHeader ]]
    -- upvalues: v2 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_withStyle_0 (copy)
    local v26 = v25.isRedoEnabled or v25.isUndoEnabled;
    local l_createElement_0 = v2.createElement;
    local v28 = "Frame";
    local v29 = {
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 48), 
        ZIndex = 2
    };
    local v30 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_HeaderBar_0_0 = l_HeaderBar_0;
    local v33 = {
        backgroundTransparency = 1, 
        barHeight = 48, 
        margin = 12
    };
    local l_backAction_0 = v25.backAction;
    local l_isRedoEnabled_0 = v25.isRedoEnabled;
    local l_isUndoEnabled_0 = v25.isUndoEnabled;
    local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 10 -> 15 ]];
    v33.renderLeft = function() --[[ Line: 26 ]]
        -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_l_backAction_0_0 (copy)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 30, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            BackButton = v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/pushBack"], 
                layoutOrder = 1, 
                onActivated = l_l_backAction_0_0
            })
        });
    end;
    local v38;
    if v26 then
        l_backAction_0 = v25.annotationPoints;
        l_isRedoEnabled_0 = v25.undoAnnotationPoints;
        l_isUndoEnabled_0 = v25.redoAnnotationPoints;
        local l_isUndoEnabled_1 = v25.isUndoEnabled;
        local l_isRedoEnabled_1 = v25.isRedoEnabled;
        v38 = function() --[[ Line: 83 ]]
            -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_isUndoEnabled_1 (copy), l_isRedoEnabled_0 (copy), l_isRedoEnabled_1 (copy), l_isUndoEnabled_0 (copy)
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 60, 1, 0)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                UndoButton = v2.createElement(l_IconButton_0, {
                    iconSize = l_IconSize_0.Medium, 
                    icon = l_Images_0["icons/actions/edit/undo"], 
                    isDisabled = not l_isUndoEnabled_1, 
                    layoutOrder = 1, 
                    onActivated = l_isRedoEnabled_0
                }), 
                RedoButton = v2.createElement(l_IconButton_0, {
                    iconSize = l_IconSize_0.Medium, 
                    icon = l_Images_0["icons/actions/edit/redo"], 
                    isDisabled = not l_isRedoEnabled_1, 
                    layoutOrder = 2, 
                    onActivated = l_isUndoEnabled_0
                })
            });
        end;
    else
        v38 = function() --[[ Line: 134 ]]

        end;
    end;
    v33.renderRight = v38;
    l_backAction_0 = v25.titleText;
    v33.renderCenter = function() --[[ Line: 48 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), l_backAction_0 (copy)
        return l_withStyle_0(function(v41) --[[ Line: 49 ]]
            -- upvalues: v2 (ref), l_backAction_0 (ref)
            local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
            local v43 = 300;
            if l_CurrentCamera_1 ~= nil then
                v43 = l_CurrentCamera_1.ViewportSize.X - 150;
            end;
            local l_Theme_1 = v41.Theme;
            local l_Font_1 = v41.Font;
            return v2.createElement("TextLabel", {
                Text = l_backAction_0, 
                Font = l_Font_1.Header2.Font, 
                TextColor3 = l_Theme_1.TextEmphasis.Color, 
                TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(0, v43, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
    v33.isSecondary = true;
    v30.Bar = l_createElement_1(l_l_HeaderBar_0_0, v33);
    return l_createElement_0(v28, v29, v30);
end;