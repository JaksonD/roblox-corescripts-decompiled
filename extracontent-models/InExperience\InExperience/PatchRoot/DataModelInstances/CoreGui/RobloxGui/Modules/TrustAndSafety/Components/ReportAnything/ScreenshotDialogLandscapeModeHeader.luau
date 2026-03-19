local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local l_IconButton_0 = v1.App.Button.IconButton;
local l_IconSize_0 = v1.App.ImageSet.Enum.IconSize;
local l_Images_0 = v1.App.ImageSet.Images;
local l_withStyle_0 = v1.Style.withStyle;
local function _(v13) --[[ Line: 31 ]] --[[ Name: renderWrappingCenter ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy)
    return function() --[[ Line: 32 ]]
        -- upvalues: l_withStyle_0 (ref), v2 (ref), v13 (copy)
        return l_withStyle_0(function(v14) --[[ Line: 33 ]]
            -- upvalues: v2 (ref), v13 (ref)
            local l_Theme_0 = v14.Theme;
            local l_Font_0 = v14.Font;
            return v2.createElement("TextLabel", {
                Text = v13, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextSize = 20, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            });
        end);
    end;
end;
local function _(v18, v19, v20, v21, v22) --[[ Line: 53 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v2 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    local v23 = v21 or v22;
    return function() --[[ Line: 55 ]]
        -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v18 (copy), v23 (copy), v22 (copy), v19 (copy), v21 (copy), v20 (copy)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
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
                onActivated = v18
            }), 
            UndoButton = v23 and v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not v22, 
                layoutOrder = 2, 
                onActivated = v19
            }), 
            RedoButton = v23 and v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not v21, 
                layoutOrder = 3, 
                onActivated = v20
            })
        });
    end;
end;
local function _(v25, v26) --[[ Line: 90 ]] --[[ Name: renderHeaderBarRight ]]
    -- upvalues: v2 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v5 (copy), v3 (copy)
    return function() --[[ Line: 91 ]]
        -- upvalues: v2 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), v25 (copy), v26 (copy), v5 (ref), v3 (ref)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v2.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 106 ]] --[[ Name: onActivated ]]
                                -- upvalues: v25 (ref), v26 (ref)
                                v25(v26);
                            end, 
                            text = if v5() then v3:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
                        }
                    }
                }
            })
        });
    end;
end;
return function(v28) --[[ Line: 119 ]] --[[ Name: LandscapeModeHeader ]]
    -- upvalues: v2 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v5 (copy), v3 (copy), l_withStyle_0 (copy)
    local l_createElement_0 = v2.createElement;
    local v30 = "Frame";
    local v31 = {
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 47), 
        ZIndex = 2
    };
    local v32 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_HeaderBar_0_0 = l_HeaderBar_0;
    local v35 = {
        backgroundTransparency = 1, 
        barHeight = 48
    };
    local l_backAction_0 = v28.backAction;
    local l_undoAnnotationPoints_0 = v28.undoAnnotationPoints;
    local l_redoAnnotationPoints_0 = v28.redoAnnotationPoints;
    local l_isRedoEnabled_0 = v28.isRedoEnabled;
    local l_isUndoEnabled_0 = v28.isUndoEnabled;
    local v41 = l_isRedoEnabled_0 or l_isUndoEnabled_0;
    local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 9 -> 15 ]];
    local l_l_undoAnnotationPoints_0_0 = l_undoAnnotationPoints_0 --[[ copy: 10 -> 16 ]];
    v35.renderLeft = function() --[[ Line: 55 ]]
        -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_l_backAction_0_0 (copy), v41 (copy), l_isUndoEnabled_0 (copy), l_l_undoAnnotationPoints_0_0 (copy), l_isRedoEnabled_0 (copy), l_redoAnnotationPoints_0 (copy)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
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
            }), 
            UndoButton = v41 and v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/undo"], 
                isDisabled = not l_isUndoEnabled_0, 
                layoutOrder = 2, 
                onActivated = l_l_undoAnnotationPoints_0_0
            }), 
            RedoButton = v41 and v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/actions/edit/redo"], 
                isDisabled = not l_isRedoEnabled_0, 
                layoutOrder = 3, 
                onActivated = l_redoAnnotationPoints_0
            })
        });
    end;
    l_backAction_0 = v28.reportAction;
    l_undoAnnotationPoints_0 = v28.annotationPoints;
    local l_l_backAction_0_1 = l_backAction_0 --[[ copy: 9 -> 17 ]];
    v35.renderRight = function() --[[ Line: 91 ]]
        -- upvalues: v2 (ref), l_ButtonStack_0 (ref), l_ButtonType_0 (ref), l_l_backAction_0_1 (copy), l_undoAnnotationPoints_0 (copy), v5 (ref), v3 (ref)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Buttons = v2.createElement(l_ButtonStack_0, {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 106 ]] --[[ Name: onActivated ]]
                                -- upvalues: l_l_backAction_0_1 (ref), l_undoAnnotationPoints_0 (ref)
                                l_l_backAction_0_1(l_undoAnnotationPoints_0);
                            end, 
                            text = if v5() then v3:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
                        }
                    }
                }
            })
        });
    end;
    v35.title = if v5() then nil else v28.titleText;
    local v45;
    if v5() then
        l_backAction_0 = v28.titleText;
        v45 = function() --[[ Line: 32 ]]
            -- upvalues: l_withStyle_0 (ref), v2 (ref), l_backAction_0 (copy)
            return l_withStyle_0(function(v46) --[[ Line: 33 ]]
                -- upvalues: v2 (ref), l_backAction_0 (ref)
                local l_Theme_1 = v46.Theme;
                local l_Font_1 = v46.Font;
                return v2.createElement("TextLabel", {
                    Text = l_backAction_0, 
                    Font = l_Font_1.Header2.Font, 
                    TextColor3 = l_Theme_1.TextEmphasis.Color, 
                    TextTransparency = l_Theme_1.TextEmphasis.Transparency, 
                    TextSize = 20, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                });
            end);
        end;
    else
        v45 = nil;
    end;
    v35.renderCenter = v45;
    v32.Bar = l_createElement_1(l_l_HeaderBar_0_0, v35);
    return l_createElement_0(v30, v31, v32);
end;