local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local l_useStyle_0 = require(l_script_FirstAncestor_0.Parent.UIBlox).Core.Style.useStyle;
return function(v4) --[[ Line: 15 ]] --[[ Name: SelectableTextLabel ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), v2 (copy)
    local l_BaseSize_0 = l_useStyle_0().Font.BaseSize;
    local v6 = v4.fontStyle.RelativeMinSize * l_BaseSize_0;
    local v7 = v4.fontStyle.RelativeSize * l_BaseSize_0;
    local v8 = v1.Dictionary.join({
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        ClearTextOnFocus = false, 
        Font = v4.fontStyle.Font, 
        TextColor3 = v4.colorStyle.Color, 
        TextEditable = false, 
        TextTransparency = v4.colorStyle.Transparency, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        ClipsDescendants = true
    }, v4, {
        fontStyle = v1.None, 
        colorStyle = v1.None
    });
    return v2.createElement("TextBox", v8, {
        TextSizeConstraint = v2.createElement("UITextSizeConstraint", {
            MaxTextSize = v7, 
            MinTextSize = v6
        })
    });
end;