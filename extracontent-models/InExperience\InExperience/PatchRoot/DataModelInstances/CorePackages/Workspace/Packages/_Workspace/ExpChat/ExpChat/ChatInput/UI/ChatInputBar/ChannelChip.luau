local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useCursor_0 = require(l_Parent_0.UIBlox).App.SelectionCursor.useCursor;
local v4 = require(l_script_FirstAncestor_0.Config);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
return function(v6) --[[ Line: 11 ]]
    -- upvalues: v5 (copy), l_useCursor_0 (copy), v2 (copy), v4 (copy)
    local v7 = if v5 then l_useCursor_0() else nil;
    return v2.createElement("TextButton", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        Font = v4.ChatInputBarFont, 
        SelectionImageObject = v7, 
        Size = UDim2.fromScale(0, 1), 
        Text = v6.targetTextChannelDisplayName or "", 
        TextColor3 = v4.ChatInputBarTextColor3, 
        TextSize = v4.ChatInputBarTextSize, 
        TextTransparency = v6.transparency or 1, 
        TextWrapped = true, 
        Visible = not v6.isChannelBarVisible and v6.targetTextChannelDisplayName ~= "", 
        [v2.Change.AbsoluteSize] = v6.onAbsoluteSizeChanged, 
        [v2.Event.Activated] = v6.onChannelChipActivated
    });
end;