local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local _ = require(l_Parent_0.type);
return (v2.createContext({
    notificationPayload = nil, 
    state = nil, 
    cardSize = nil, 
    handleActions = nil, 
    openMetaActions = nil, 
    readOnly = nil, 
    cardTransparency = nil
}));