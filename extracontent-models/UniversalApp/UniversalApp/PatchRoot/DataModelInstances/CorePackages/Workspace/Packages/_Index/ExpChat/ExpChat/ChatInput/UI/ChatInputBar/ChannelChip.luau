local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.ExpChatShared);
local l_useCursor_0 = v3.App.SelectionCursor.useCursor;
local v6 = require(l_script_FirstAncestor_0.Config);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v4.Flags.GetFFlagTextChatEnableUniverseChatTabs;
return function(v9) --[[ Line: 14 ]]
    -- upvalues: v7 (copy), l_useCursor_0 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v2 (copy), v6 (copy)
    local v10 = if v7 then l_useCursor_0() else nil;
    local v11 = (v9.targetTextChannelDisplayName or "") ~= "";
    local v12 = l_GetFFlagTextChatEnableUniverseChatTabs_0() and not v9.developerChannelTabsEnabled;
    local v13 = v11 and (not v9.isChannelBarVisible or v12);
    return v2.createElement("TextButton", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Font = v6.ChatInputBarFont, 
        SelectionImageObject = v10, 
        Size = UDim2.fromScale(0, 1), 
        Text = v9.targetTextChannelDisplayName or "", 
        TextColor3 = v6.ChatInputBarTextColor3, 
        TextSize = v6.ChatInputBarTextSize, 
        TextTransparency = v9.transparency or 1, 
        TextWrapped = true, 
        Visible = v13, 
        [v2.Change.AbsoluteSize] = v9.onAbsoluteSizeChanged, 
        [v2.Event.Activated] = v9.onChannelChipActivated
    });
end;