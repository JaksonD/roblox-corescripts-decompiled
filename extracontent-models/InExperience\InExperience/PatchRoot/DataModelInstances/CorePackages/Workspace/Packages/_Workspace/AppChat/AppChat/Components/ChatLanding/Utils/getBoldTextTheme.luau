local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local v3 = {
        TextDefault = {
            Color = v2.Theme.TextEmphasis.Color, 
            Transparency = v2.Theme.TextEmphasis.Transparency
        }
    };
    local v4 = {
        Body = {
            Font = v2.Font.Header1.Font, 
            RelativeSize = v2.Font.Body.RelativeSize, 
            RelativeMinSize = v2.Font.Body.RelativeMinSize
        }, 
        CaptionBody = {
            Font = v2.Font.Header1.Font, 
            RelativeSize = v2.Font.CaptionBody.RelativeSize, 
            RelativeMinSize = v2.Font.CaptionBody.RelativeMinSize
        }
    };
    return {
        Theme = v1.Dictionary.join(v2.Theme, v3), 
        Font = v1.Dictionary.join(v2.Font, v4), 
        Settings = nil, 
        Tokens = v2.Tokens
    };
end;