local v0 = require(script.Parent.NavigationSymbol);
local v1 = v0("WILL_FOCUS");
local v2 = v0("DID_FOCUS");
local v3 = v0("WILL_BLUR");
local v4 = v0("DID_BLUR");
local v5 = v0("ACTION");
local v6 = v0("REFOCUS");
return {
    WillFocus = v1, 
    DidFocus = v2, 
    WillBlur = v3, 
    DidBlur = v4, 
    Action = v5, 
    Refocus = v6
};