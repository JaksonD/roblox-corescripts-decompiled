local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_context_0 = l_Parent_1.context;
local v3 = require(l_Parent_1.dependencies);
local v4 = require(l_Parent_0.NotificationStyledText);
local v5 = require(l_Parent_0.NotificationThumbnail);
local v6 = require(l_Parent_0.ToastHoldButton);
local v7 = require(l_Parent_1.type);
local l_UIBlox_0 = v3.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local v12 = require(l_Parent_1.constants);
local v13 = require(l_context_0.useNotificationCardState);
local v14 = require(l_context_0.useNotificationCardData);
local l_Parent_2 = l_Parent_1.Parent;
local v16 = require(l_Parent_2.React);
local l_DefaultContentPadding_0 = v12.DefaultContentPadding;
local l_DefaultTextContentPadding_0 = v12.DefaultTextContentPadding;
local v19 = Vector2.new(36, 36);
local l_utils_0 = l_Parent_1.utils;
local l_isUserThumbnail_0 = require(l_utils_0.toastNotificationHelper).isUserThumbnail;
return function(v22) --[[ Line: 35 ]]
    -- upvalues: l_useStyle_0 (copy), v14 (copy), l_isUserThumbnail_0 (copy), v13 (copy), v16 (copy), v12 (copy), l_DefaultContentPadding_0 (copy), v19 (copy), v5 (copy), l_DefaultTextContentPadding_0 (copy), v4 (copy), v6 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), v7 (copy)
    local v23 = l_useStyle_0();
    local v24 = v23.Font.BaseSize * v23.Font.CaptionHeader.RelativeSize;
    local v25 = v23.Font.BaseSize * v23.Font.CaptionBody.RelativeSize;
    local l_cardSize_0 = v14().cardSize;
    local v27 = nil;
    if l_isUserThumbnail_0 then
        local v28 = v13("thumbnail");
        local l_v28_0 = v28 --[[ copy: 6 -> 15 ]];
        v27 = v16.useMemo(function() --[[ Line: 46 ]]
            -- upvalues: l_v28_0 (copy), l_isUserThumbnail_0 (ref), v23 (copy), l_cardSize_0 (ref), v12 (ref)
            local v30 = false;
            if l_v28_0 then
                for _, v32 in l_v28_0 do
                    if not l_isUserThumbnail_0(v32) then
                        v30 = true;
                        break;
                    end;
                end;
            end;
            if not v30 then
                return v23.Tokens.Global.Size_500;
            else
                return l_cardSize_0 and l_cardSize_0.thumbnail or v12.CardSizeDefault.thumbnail;
            end;
        end, {
            v28, 
            v23.Tokens.Global.Size_500, 
            l_cardSize_0
        });
    else
        v27 = l_cardSize_0 and l_cardSize_0.thumbnail or v12.CardSizeDefault.thumbnail;
    end;
    local l_Size_350_0 = v23.Tokens.Global.Size_350;
    local v34 = v13("textBody");
    local v35 = v34 and v34[1];
    local v36 = v35 and v35.title and {
        Text = v35.title, 
        MaxSize = Vector2.new(1e999, v24 * 2), 
        Size = UDim2.new(1, 0, 0, 0), 
        TextSize = v24, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        LayoutOrder = 1, 
        Font = v23.Font.CaptionHeader.Font, 
        TextColor3 = v23.Theme.TextEmphasis.Color
    };
    local v37 = v35 and v35.label and {
        Text = v35.label, 
        MaxSize = Vector2.new(1e999, v25 * 2), 
        Size = UDim2.new(1, 0, 0, 0), 
        TextSize = v25, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        LayoutOrder = 2, 
        Font = v23.Font.CaptionBody.Font
    };
    local v38 = v14();
    l_cardSize_0 = v38.cardSize;
    local l_handleActions_0 = v38.handleActions;
    local v40 = v13("singleMetaAction");
    local v41 = v40 and v40[1];
    return v16.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        UIListLayout = v16.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_DefaultContentPadding_0)
        }), 
        ThumbnailTextContainer = v16.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = if v41 then UDim2.new(1, -(l_DefaultContentPadding_0 + v19.X), 0, 0) else UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v16.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, l_DefaultContentPadding_0)
            }), 
            NotificationThumbnailFrame = v16.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(0, v27, 0, v27)
            }, {
                NotificationThumbnail = v16.createElement(v5)
            }), 
            ToastTextFrame = v16.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = if v22.showHoldButton then UDim2.new(1, -(v27 + l_DefaultContentPadding_0 * 2 + l_Size_350_0), 0, 0) else UDim2.new(1, -(v27 + l_DefaultContentPadding_0), 0, 0)
            }, {
                UIPadding = v16.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 2)
                }), 
                UIListLayout = v16.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, l_DefaultTextContentPadding_0)
                }), 
                ToastTitle = v36 and v16.createElement(v4, v36), 
                ToastSubtitle = v37 and v16.createElement(v4, v37)
            }), 
            ToastHoldButton = v16.createElement(v6, {
                iconSize = l_Size_350_0, 
                visible = v22.showHoldButton, 
                layoutOrder = 3, 
                iconTransparency = v22.shouldAutoFocus and 0.5 or 0, 
                progress = v22.holdProgress
            })
        }), 
        SingleMetaAction = if v41 then v16.createElement(l_Interactable_0, {
            AutoButtonColor = false, 
            BackgroundColor3 = v23.Theme.UIMuted.Color, 
            BackgroundTransparency = 0.9, 
            LayoutOrder = 2, 
            onStateChanged = function() --[[ Line: 171 ]] --[[ Name: onStateChanged ]]

            end, 
            [v16.Event.Activated] = function() --[[ Line: 172 ]]
                -- upvalues: l_handleActions_0 (copy), v41 (copy)
                if l_handleActions_0 then
                    l_handleActions_0(v41);
                end;
            end, 
            Size = UDim2.fromOffset(v19.X, v19.Y)
        }, {
            UICorner = v16.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            Icon = v16.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v7.MetaActionIcons[v41.actionIcon], 
                ImageColor3 = v23.Theme.IconEmphasis.Color, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(28, 28)
            })
        }) else nil
    });
end;