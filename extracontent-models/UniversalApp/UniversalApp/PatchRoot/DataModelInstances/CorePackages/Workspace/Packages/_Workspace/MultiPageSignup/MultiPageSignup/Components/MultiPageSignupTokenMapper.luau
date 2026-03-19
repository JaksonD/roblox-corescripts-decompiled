local l_Parent_0 = script:FindFirstAncestor("MultiPageSignup").Parent;
local _ = require(l_Parent_0.RobloxAppHooks);
local _ = require(l_Parent_0.Style);
return function(_, v4) --[[ Line: 16 ]]
    return {
        EnterUserIdentifier = {
            SmallPaddingPx = v4.Global.Space_100
        }
    };
end;