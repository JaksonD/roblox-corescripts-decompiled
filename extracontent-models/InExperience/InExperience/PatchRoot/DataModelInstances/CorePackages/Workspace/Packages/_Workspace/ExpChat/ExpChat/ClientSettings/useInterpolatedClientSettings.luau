local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent);
local v3 = require(script.Parent.ClientSettingsUtility);
local v4 = game:DefineFastFlag("ExpChatAddressFrame0Flash", false);
return function(v5) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v3 (copy)
    local v6 = v1.useContext(v2);
    local v7, v8 = v1.useState({
        BackgroundColor3 = if v4 then v3.getBackgroundColor(v5, v6) else nil, 
        BackgroundColor = if not v4 then v3.getBackgroundColor(v5, v6) else nil, 
        BackgroundTransparency = v3.getBackgroundTransparency(v5, v6)
    });
    v1.useEffect(function() --[[ Line: 24 ]]
        -- upvalues: v8 (copy), v3 (ref), v5 (copy), v6 (copy)
        v8({
            BackgroundColor3 = v3.getBackgroundColor(v5, v6), 
            BackgroundTransparency = v3.getBackgroundTransparency(v5, v6)
        });
    end, {
        v5, 
        v6
    });
    return v7;
end;