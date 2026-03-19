local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_IconButton_0 = v2.App.Button.IconButton;
local l_IconSize_0 = v2.App.ImageSet.Enum.IconSize;
return function(v6) --[[ Line: 10 ]] --[[ Name: makeCloseButton ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy)
    return function() --[[ Line: 11 ]]
        -- upvalues: v1 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v6 (copy)
        return v1.createElement(l_IconButton_0, {
            size = UDim2.fromOffset(0, 0), 
            iconSize = l_IconSize_0.Medium, 
            icon = l_Images_0["icons/navigation/close"], 
            onActivated = v6
        });
    end;
end;