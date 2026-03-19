local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_1.Core.Style.useStyle);
local v5 = require(l_Parent_1.App.ImageSet.Enum.IconSize);
local v6 = require(l_Parent_1.App.ImageSet.Images);
local v7 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v8 = require(l_Parent_0.Enum.ItemTileEnums);
local v9 = require(l_Parent_1.App.ImageSet.getIconSize);
local function _(v10) --[[ Line: 21 ]] --[[ Name: getIconImage ]]
    -- upvalues: v8 (copy)
    if v10 == v8.StatusStyle.PendingIcon then
        return "icons/status/pending_small";
    elseif v10 == v8.StatusStyle.AlertIcon then
        return "icons/actions/info_small";
    else
        return nil;
    end;
end;
return function(v12) --[[ Line: 31 ]] --[[ Name: ItemTileStatusIcon ]]
    -- upvalues: v4 (copy), v8 (copy), v9 (copy), v5 (copy), v3 (copy), v7 (copy), v6 (copy)
    local l_Tokens_0 = v4().Tokens;
    local l_statusStyle_0 = v12.statusStyle;
    local v15 = l_statusStyle_0 == v8.StatusStyle.PendingIcon and "icons/status/pending_small" or l_statusStyle_0 == v8.StatusStyle.AlertIcon and "icons/actions/info_small" or nil;
    if not v15 then
        return nil;
    else
        local v16 = v9(v5.Small);
        local l_Emphasis_0 = l_Tokens_0.Semantic.Color.Icon.Emphasis;
        return v3.createElement(v7.Label, {
            Position = UDim2.fromOffset(l_Tokens_0.Global.Size_100, l_Tokens_0.Global.Size_100), 
            Size = UDim2.fromOffset(v16, v16), 
            BackgroundTransparency = 1, 
            Image = v6[v15], 
            ImageColor3 = l_Emphasis_0.Color3, 
            ImageTransparency = l_Emphasis_0.Transparency
        });
    end;
end;