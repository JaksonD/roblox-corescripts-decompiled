local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local _ = require(l_Parent_0.gameInviteModalType);
return (v2.createContext({
    isFullHeight = false, 
    isFullWidth = false, 
    modalSize = UDim2.new(0, 0, 0, 0), 
    modalMode = "default"
}));