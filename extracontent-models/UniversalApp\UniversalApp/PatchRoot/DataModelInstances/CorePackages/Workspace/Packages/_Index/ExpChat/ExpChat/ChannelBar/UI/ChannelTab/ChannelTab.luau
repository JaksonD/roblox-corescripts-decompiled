local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Config);
local v4 = require(l_Parent_0.React);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v6 = require(l_Parent_0.UIBlox);
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_Interactable_0 = v6.Core.Control.Interactable;
local l_useSelectionCursor_0 = v6.App.SelectionImage.useSelectionCursor;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatFocusChannelBarSupport);
local v11 = require(l_script_FirstAncestor_0.GameLocalization);
local v12 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v13 = Color3.fromRGB(255, 255, 255);
local v14 = {
    channelName = "", 
    isDividerVisible = false, 
    isTabCollapsed = false, 
    isTabSelected = false, 
    onTabSelected = nil, 
    setTransparency = nil
};
return v11.connect(function(v15) --[[ Line: 130 ]]
    -- upvalues: l_Players_0 (copy), v12 (copy)
    local l_channelName_0 = v15.channelName;
    if string.find(l_channelName_0, "RBXGeneral") then
        l_channelName_0 = "General";
    elseif string.find(l_channelName_0, "RBXSystem") then
        l_channelName_0 = "System";
    elseif string.find(l_channelName_0, "^RBXTeam") then
        l_channelName_0 = "Team";
    elseif string.find(l_channelName_0, "^RBXWhisper") and v15.textChannel and l_Players_0.LocalPlayer then
        local v17 = v12(v15.textChannel, l_Players_0.LocalPlayer);
        if v17 then
            l_channelName_0 = v17;
        end;
    end;
    return {
        channelName = l_channelName_0
    };
end)(function(v18) --[[ Line: 51 ]] --[[ Name: ChannelTab ]]
    -- upvalues: l_Dictionary_0 (copy), v14 (copy), v4 (copy), v10 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_Interactable_0 (copy), v3 (copy), v13 (copy)
    local v19 = l_Dictionary_0.join(v14, v18);
    local v20, v21 = v4.useState(v19.channelTabsSettings.BackgroundColor3);
    local v22 = if v10 then l_useSelectionCursor_0(l_CursorKind_0.RoundedSlot) else nil;
    return v4.createElement(l_Interactable_0, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = v19.isTabCollapsed and v19.setTransparency(v19.channelTabsSettings.BackgroundTransparency) or 1, 
        BackgroundColor3 = v19.isTabCollapsed and v20 or v19.channelTabsSettings.BackgroundColor3, 
        BorderSizePixel = 0, 
        SelectionImageObject = v22, 
        onStateChanged = function() --[[ Line: 65 ]] --[[ Name: onStateChanged ]]

        end, 
        [v4.Event.Activated] = v19.onTabSelected, 
        [v4.Event.MouseEnter] = function() --[[ Line: 67 ]]
            -- upvalues: v19 (copy), v21 (copy)
            if v19.isTabCollapsed then
                v21(v19.channelTabsSettings.HoverBackgroundColor3);
            end;
        end, 
        [v4.Event.MouseLeave] = function() --[[ Line: 72 ]]
            -- upvalues: v19 (copy), v21 (copy)
            if v19.isTabCollapsed then
                v21(v19.channelTabsSettings.BackgroundColor3);
            end;
        end
    }, {
        TextLabel = v4.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Text = v19.channelName, 
            FontFace = v19.channelTabsSettings.FontFace, 
            TextSize = v19.channelTabsSettings.TextSize, 
            TextColor3 = v19.isTabSelected and v19.channelTabsSettings.SelectedTabTextColor3 or v19.channelTabsSettings.TextColor3, 
            TextTransparency = v19.setTransparency(0), 
            TextStrokeColor3 = v19.channelTabsSettings.TextStrokeColor3, 
            TextStrokeTransparency = v19.setTransparency(v19.channelTabsSettings.TextStrokeTransparency), 
            TextXAlignment = v19.isTabCollapsed and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BorderSizePixel = 0
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 20 + (v19.isTabCollapsed and 4 or 0)), 
                PaddingRight = UDim.new(0, 20)
            })
        }), 
        UnreadDot = v19.hasUnreadMessages and v4.createElement("Frame", {
            Size = UDim2.new(0, 8, 0, 8), 
            Position = UDim2.new(0, 18, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundColor3 = v3.ChannelTabsSettings.UnreadDotColor3, 
            BackgroundTransparency = v19.setTransparency(0), 
            BorderSizePixel = 0
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        Highlight = v19.isTabSelected and v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 4), 
            Position = UDim2.new(0, 0, 1, -4), 
            BackgroundColor3 = v13, 
            BackgroundTransparency = v19.setTransparency(0), 
            BorderSizePixel = 0
        }), 
        Divider = v19.isDividerVisible and v4.createElement("Frame", {
            AnchorPoint = v19.isTabCollapsed and Vector2.new(0, 1) or Vector2.new(0, 0.5), 
            Position = v19.isTabCollapsed and UDim2.fromScale(0, 1) or UDim2.fromScale(1, 0.5), 
            Size = v19.isTabCollapsed and UDim2.new(1, 0, 0, v3.ChannelTabsSettings.DividerSize) or UDim2.new(0, v3.ChannelTabsSettings.DividerSize, 0.8, 0), 
            BackgroundTransparency = v19.setTransparency(v3.ChannelTabsSettings.DividerTransparency), 
            BackgroundColor3 = v3.ChannelTabsSettings.DividerColor3, 
            BorderSizePixel = 0
        })
    });
end);