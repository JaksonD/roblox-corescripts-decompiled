local l_TextLabel_0 = Instance.new("TextLabel");
l_TextLabel_0.RichText = true;
local function _(v1) --[[ Line: 5 ]] --[[ Name: getContentText ]]
    -- upvalues: l_TextLabel_0 (copy)
    l_TextLabel_0.Text = v1;
    return l_TextLabel_0.ContentText;
end;
return function(v3) --[[ Line: 10 ]] --[[ Name: isWhitespaceOnly ]]
    -- upvalues: l_TextLabel_0 (copy)
    l_TextLabel_0.Text = v3;
    local l_ContentText_0 = l_TextLabel_0.ContentText;
    return string.find(l_ContentText_0, "%S") == nil;
end;