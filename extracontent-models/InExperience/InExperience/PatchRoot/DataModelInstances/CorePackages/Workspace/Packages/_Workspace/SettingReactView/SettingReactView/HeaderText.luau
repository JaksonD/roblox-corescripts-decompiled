local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_Text_0 = v1.Text;
return v2.memo(function(v4) --[[ Line: 15 ]] --[[ Name: HeaderText ]]
    -- upvalues: v2 (copy), l_Text_0 (copy)
    return v2.createElement(l_Text_0, {
        tag = "auto-xy content-emphasis text-heading-small", 
        Text = v4.text, 
        testId = "settings-header-text"
    });
end);