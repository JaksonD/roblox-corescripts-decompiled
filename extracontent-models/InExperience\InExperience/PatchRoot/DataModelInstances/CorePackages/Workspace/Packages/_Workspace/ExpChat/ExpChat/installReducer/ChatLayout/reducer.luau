local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
return v2.combineReducers({
    Alignment = require(script.Parent.alignment), 
    ChatWindowSettings = require(script.Parent.windowSettings), 
    ChatInputBarSettings = require(script.Parent.inputBarSettings), 
    ChannelTabsSettings = v3() and require(script.Parent.channelTabsSettings) or nil
});