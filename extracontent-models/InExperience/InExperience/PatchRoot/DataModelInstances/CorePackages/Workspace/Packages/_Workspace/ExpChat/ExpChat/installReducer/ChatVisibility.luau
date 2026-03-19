local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
return require(l_Parent_0.Rodux).combineReducers({
    isChatInputBarEnabled = require(script.isChatInputBarEnabled), 
    isChatWindowEnabled = require(script.isChatWindowEnabled), 
    isChatHotkeyEnabled = require(script.isChatHotkeyEnabled), 
    isChannelBarEnabled = require(script.isChannelBarEnabled), 
    transparency = require(script.transparency)
});