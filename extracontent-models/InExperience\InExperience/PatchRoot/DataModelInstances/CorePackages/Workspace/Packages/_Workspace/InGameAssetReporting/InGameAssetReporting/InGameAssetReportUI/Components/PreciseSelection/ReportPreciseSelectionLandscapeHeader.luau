local l_Parent_0 = script:FindFirstAncestor("InGameAssetReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Foundation);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_InputSize_0 = v3.Enums.InputSize;
local l_HeaderBar_0 = v2.App.Bar.HeaderBar;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
local l_Images_0 = v2.App.ImageSet.Images;
local l_withStyle_0 = v2.Style.withStyle;
local function _(v12) --[[ Line: 32 ]] --[[ Name: renderHeaderBarCenter ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy)
    return function() --[[ Line: 33 ]]
        -- upvalues: l_withStyle_0 (ref), v1 (ref), v12 (copy)
        return l_withStyle_0(function(v13) --[[ Line: 34 ]]
            -- upvalues: v1 (ref), v12 (ref)
            local l_Theme_0 = v13.Theme;
            local l_Font_0 = v13.Font;
            return v1.createElement("TextLabel", {
                Text = v12, 
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
local function _(v17) --[[ Line: 54 ]] --[[ Name: renderHeaderBarLeft ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    return function() --[[ Line: 55 ]]
        -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v17 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
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
                onActivated = v17
            })
        });
    end;
end;
local function _(v19, v20, v21, v22, v23, v24) --[[ Line: 76 ]] --[[ Name: renderHeaderBarRight ]]
    -- upvalues: v1 (copy), v3 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    return function() --[[ Line: 84 ]]
        -- upvalues: v1 (ref), v3 (ref), v21 (copy), v22 (copy), v23 (copy), v24 (copy), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_InputSize_0 (ref), v19 (copy), v20 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            CoachmarkWrapper = v1.createElement(v3.Coachmark, {
                title = v21, 
                text = v22, 
                isOpen = v23 or false, 
                side = v3.Enums.PopoverSide.Bottom, 
                align = v3.Enums.PopoverAlign.End, 
                onClose = v24
            }, {
                NextButton = v1.createElement(l_Button_0, {
                    variant = l_ButtonVariant_0.Emphasis, 
                    inputSize = l_InputSize_0.Large, 
                    onActivated = v19, 
                    text = v20, 
                    width = UDim.new(0, 144)
                })
            })
        });
    end;
end;
return function(v26) --[[ Line: 114 ]] --[[ Name: LandscapeModeHeader ]]
    -- upvalues: v1 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v3 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_withStyle_0 (copy)
    local l_createElement_0 = v1.createElement;
    local v28 = "Frame";
    local v29 = {
        BorderSizePixel = 0, 
        BackgroundTransparency = 0.1, 
        BackgroundColor3 = Color3.fromHex("#000000"), 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 71), 
        ZIndex = 2
    };
    local v30 = {};
    local l_createElement_1 = v1.createElement;
    local l_l_HeaderBar_0_0 = l_HeaderBar_0;
    local v33 = {
        backgroundTransparency = 1, 
        barHeight = 72
    };
    local l_backAction_0 = v26.backAction;
    local l_l_backAction_0_0 = l_backAction_0 --[[ copy: 9 -> 15 ]];
    v33.renderLeft = function() --[[ Line: 55 ]]
        -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), l_l_backAction_0_0 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 120, 1, 0)
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
    l_backAction_0 = v26.nextAction;
    local l_nextText_0 = v26.nextText;
    local l_coachmarkTitle_0 = v26.coachmarkTitle;
    local l_coachmarkText_0 = v26.coachmarkText;
    local l_isCoachmarkOpen_0 = v26.isCoachmarkOpen;
    local l_onCoachmarkClose_0 = v26.onCoachmarkClose;
    local l_l_backAction_0_1 = l_backAction_0 --[[ copy: 9 -> 16 ]];
    v33.renderRight = function() --[[ Line: 84 ]]
        -- upvalues: v1 (ref), v3 (ref), l_coachmarkTitle_0 (copy), l_coachmarkText_0 (copy), l_isCoachmarkOpen_0 (copy), l_onCoachmarkClose_0 (copy), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_InputSize_0 (ref), l_l_backAction_0_1 (copy), l_nextText_0 (copy)
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 144, 1, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            CoachmarkWrapper = v1.createElement(v3.Coachmark, {
                title = l_coachmarkTitle_0, 
                text = l_coachmarkText_0, 
                isOpen = l_isCoachmarkOpen_0 or false, 
                side = v3.Enums.PopoverSide.Bottom, 
                align = v3.Enums.PopoverAlign.End, 
                onClose = l_onCoachmarkClose_0
            }, {
                NextButton = v1.createElement(l_Button_0, {
                    variant = l_ButtonVariant_0.Emphasis, 
                    inputSize = l_InputSize_0.Large, 
                    onActivated = l_l_backAction_0_1, 
                    text = l_nextText_0, 
                    width = UDim.new(0, 144)
                })
            })
        });
    end;
    l_backAction_0 = v26.titleText;
    v33.renderCenter = function() --[[ Line: 33 ]]
        -- upvalues: l_withStyle_0 (ref), v1 (ref), l_backAction_0 (copy)
        return l_withStyle_0(function(v42) --[[ Line: 34 ]]
            -- upvalues: v1 (ref), l_backAction_0 (ref)
            local l_Theme_1 = v42.Theme;
            local l_Font_1 = v42.Font;
            return v1.createElement("TextLabel", {
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
    v30.Bar = l_createElement_1(l_l_HeaderBar_0_0, v33);
    return l_createElement_0(v28, v29, v30);
end;