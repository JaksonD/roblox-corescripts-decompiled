local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Dash);
return v1.createContext({
    fireEvent = v2.noop
});