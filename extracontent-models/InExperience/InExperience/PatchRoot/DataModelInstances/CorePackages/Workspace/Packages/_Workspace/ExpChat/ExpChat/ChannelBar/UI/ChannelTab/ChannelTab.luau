local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Config);
local v4 = require(l_Parent_0.React);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.ExpChatShared);
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_Interactable_0 = v6.Core.Control.Interactable;
local l_useSelectionCursor_0 = v6.App.SelectionImage.useSelectionCursor;
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatFocusChannelBarSupport);
local v12 = require(l_script_FirstAncestor_0.GameLocalization);
local v13 = require(l_script_FirstAncestor_0.Localization);
local v14 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v7.Flags.GetFFlagTextChatEnableUniverseChatTabs;
local l_GetFFlagEnableExpChatUniverseChatTabNames_0 = v7.Flags.GetFFlagEnableExpChatUniverseChatTabNames;
local v17 = Color3.fromRGB(255, 255, 255);
local v18 = {
    channelName = "", 
    isDividerVisible = false, 
    isTabCollapsed = false, 
    isTabSelected = false, 
    onTabSelected = nil, 
    setTransparency = nil
};
return v12.connect(function(v19) --[[ Line: 150 ]]
    -- upvalues: l_GetFFlagEnableExpChatUniverseChatTabNames_0 (copy), l_Players_0 (copy), v14 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy)
    local l_channelName_0 = v19.channelName;
    if string.find(l_channelName_0, "RBXGeneral") then
        if l_GetFFlagEnableExpChatUniverseChatTabNames_0() then
            return {};
        else
            l_channelName_0 = "General";
        end;
    elseif string.find(l_channelName_0, "RBXSystem") then
        l_channelName_0 = "System";
    elseif string.find(l_channelName_0, "^RBXTeam") then
        l_channelName_0 = "Team";
    elseif string.find(l_channelName_0, "^RBXWhisper") then
        if v19.textChannel and l_Players_0.LocalPlayer then
            local v21 = v14(v19.textChannel, l_Players_0.LocalPlayer);
            if v21 then
                l_channelName_0 = v21;
            end;
        end;
    elseif l_GetFFlagTextChatEnableUniverseChatTabs_0() and string.find(l_channelName_0, "RBXGlobal") then
        if l_GetFFlagEnableExpChatUniverseChatTabNames_0() then
            return {};
        else
            l_channelName_0 = "Global";
        end;
    end;
    return {
        channelName = l_channelName_0
    };
end)(function(v22) --[[ Line: 55 ]] --[[ Name: ChannelTab ]]
    -- upvalues: l_Dictionary_0 (copy), v18 (copy), l_GetFFlagEnableExpChatUniverseChatTabNames_0 (copy), v13 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v4 (copy), v11 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_Interactable_0 (copy), v3 (copy), v17 (copy)
    local v23 = l_Dictionary_0.join(v18, v22);
    local l_channelName_1 = v23.channelName;
    if l_GetFFlagEnableExpChatUniverseChatTabNames_0() then
        local v25 = v13.useLocalization({
            yourServer = "CoreScripts.TextChat.ChannelTabs.Here", 
            moreServers = "CoreScripts.TextChat.ChannelTabs.Global2"
        });
        l_channelName_1 = v23.channelName;
        if string.find(v23.channelName, "RBXGeneral") then
            l_channelName_1 = v25.yourServer;
        elseif l_GetFFlagTextChatEnableUniverseChatTabs_0() and string.find(v23.channelName, "RBXGlobal") then
            l_channelName_1 = v25.moreServers;
        end;
    end;
    local v26, v27 = v4.useState(v23.channelTabsSettings.BackgroundColor3);
    local v28 = if v11 then l_useSelectionCursor_0(l_CursorKind_0.RoundedSlot) else nil;
    return v4.createElement(l_Interactable_0, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = v23.isTabCollapsed and v23.setTransparency(v23.channelTabsSettings.BackgroundTransparency) or 1, 
        BackgroundColor3 = v23.isTabCollapsed and v26 or v23.channelTabsSettings.BackgroundColor3, 
        BorderSizePixel = 0, 
        SelectionImageObject = v28, 
        onStateChanged = function() --[[ Line: 85 ]] --[[ Name: onStateChanged ]]

        end, 
        [v4.Event.Activated] = v23.onTabSelected, 
        [v4.Event.MouseEnter] = function() --[[ Line: 87 ]]
            -- upvalues: v23 (copy), v27 (copy)
            if v23.isTabCollapsed then
                v27(v23.channelTabsSettings.HoverBackgroundColor3);
            end;
        end, 
        [v4.Event.MouseLeave] = function() --[[ Line: 92 ]]
            -- upvalues: v23 (copy), v27 (copy)
            if v23.isTabCollapsed then
                v27(v23.channelTabsSettings.BackgroundColor3);
            end;
        end
    }, {
        TextLabel = v4.createElement("TextLabel", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Text = if l_GetFFlagEnableExpChatUniverseChatTabNames_0() then l_channelName_1 else v23.channelName, 
            FontFace = v23.channelTabsSettings.FontFace, 
            TextSize = v23.channelTabsSettings.TextSize, 
            TextColor3 = v23.isTabSelected and v23.channelTabsSettings.SelectedTabTextColor3 or v23.channelTabsSettings.TextColor3, 
            TextTransparency = v23.setTransparency(0), 
            TextStrokeColor3 = v23.channelTabsSettings.TextStrokeColor3, 
            TextStrokeTransparency = v23.setTransparency(v23.channelTabsSettings.TextStrokeTransparency), 
            TextXAlignment = v23.isTabCollapsed and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BorderSizePixel = 0
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 20 + (v23.isTabCollapsed and 4 or 0)), 
                PaddingRight = UDim.new(0, 20)
            })
        }), 
        UnreadDot = v23.hasUnreadMessages and v4.createElement("Frame", {
            Size = UDim2.new(0, 8, 0, 8), 
            Position = UDim2.new(0, 18, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundColor3 = v3.ChannelTabsSettings.UnreadDotColor3, 
            BackgroundTransparency = v23.setTransparency(0), 
            BorderSizePixel = 0
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        Highlight = v23.isTabSelected and v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 4), 
            Position = UDim2.new(0, 0, 1, -4), 
            BackgroundColor3 = v17, 
            BackgroundTransparency = v23.setTransparency(0), 
            BorderSizePixel = 0
        }), 
        Divider = v23.isDividerVisible and v4.createElement("Frame", {
            AnchorPoint = v23.isTabCollapsed and Vector2.new(0, 1) or Vector2.new(0, 0.5), 
            Position = v23.isTabCollapsed and UDim2.fromScale(0, 1) or UDim2.fromScale(1, 0.5), 
            Size = v23.isTabCollapsed and UDim2.new(1, 0, 0, v3.ChannelTabsSettings.DividerSize) or UDim2.new(0, v3.ChannelTabsSettings.DividerSize, 0.8, 0), 
            BackgroundTransparency = v23.setTransparency(v3.ChannelTabsSettings.DividerTransparency), 
            BackgroundColor3 = v3.ChannelTabsSettings.DividerColor3, 
            BorderSizePixel = 0
        })
    });
end);