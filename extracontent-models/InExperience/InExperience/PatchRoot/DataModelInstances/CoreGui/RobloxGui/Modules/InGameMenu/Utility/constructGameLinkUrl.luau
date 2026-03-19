local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Network.Url);
return function(v2) --[[ Line: 4 ]] --[[ Name: constructGameLinkUrl ]]
    -- upvalues: v1 (copy)
    return (("%*games/%*"):format(v1.DOMAIN, v2));
end;