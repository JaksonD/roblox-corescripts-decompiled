local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.LinkType);
local l_default_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol.default;
local v9 = {
    {
        isLinkType = function(v4) --[[ Line: 11 ]] --[[ Name: isLinkType ]]
            return string.match(v4, "^https://") ~= nil;
        end, 
        type = v2.Http
    }, 
    {
        isLinkType = function(v5) --[[ Line: 18 ]] --[[ Name: isLinkType ]]
            -- upvalues: l_default_0 (copy)
            local v6, v7 = l_default_0:isURLRegistered(v5):await();
            return v6 and v7;
        end, 
        type = v2.LinkingProtocolRegistered
    }, 
    {
        isLinkType = function(_) --[[ Line: 26 ]] --[[ Name: isLinkType ]]
            return true;
        end, 
        type = v2.Default
    }
};
return function(v10) --[[ Line: 33 ]] --[[ Name: getLinkType ]]
    -- upvalues: v9 (copy), v2 (copy)
    for _, v12 in v9 do
        if v12.isLinkType(v10) then
            return v12.type;
        end;
    end;
    return v2.Default;
end;