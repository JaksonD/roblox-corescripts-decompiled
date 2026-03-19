local l_Parent_0 = script:FindFirstAncestor("Components").Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineLayoutElements");
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_1.Foundation);
local v5 = require(l_Parent_1.React);
local v6 = require(l_script_FirstAncestor_0.BaseTextElement);
local v7 = require(l_Parent_0.Utils.getFontFace);
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local v10 = {};
mapProps = function(v11) --[[ Line: 24 ]] --[[ Name: mapProps ]]
    -- upvalues: v3 (copy)
    return v3.omit(v11, {
        "id", 
        "EngineTags"
    });
end;
local function v15(v12) --[[ Line: 28 ]] --[[ Name: TextElementWrapper ]]
    -- upvalues: v7 (copy), v5 (copy), l_View_0 (copy), v3 (copy), l_Text_0 (copy)
    local v13 = v7(v12.fontStyle);
    local v14 = typeof(v12.viewTags) == "string" and {
        [v12.viewTags] = true
    } or v12.viewTags or {};
    return v5.createElement(l_View_0, {
        tag = v3.join({
            ["size-0-0 auto-xy"] = true
        }, v14), 
        LayoutOrder = v12.LayoutOrder
    }, {
        Text = v5.createElement(l_Text_0, v3.join(v12, {
            RichText = false
        })), 
        SelectableText = v5.createElement("TextBox", {
            Text = v12.Text, 
            FontFace = v13, 
            TextSize = v12.fontStyle and v12.fontStyle.FontSize, 
            TextTransparency = 0.4, 
            BackgroundTransparency = 1, 
            TextEditable = false, 
            ZIndex = 0, 
            Size = UDim2.fromScale(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextWrapped = false, 
            ClearTextOnFocus = false, 
            RichText = false
        })
    });
end;
v10.new = function(v16) --[[ Line: 57 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v15 (copy), v3 (copy)
    return v6.new(v15, v3.omit(v16, {
        "EngineTags"
    }), mapProps);
end;
return v10;