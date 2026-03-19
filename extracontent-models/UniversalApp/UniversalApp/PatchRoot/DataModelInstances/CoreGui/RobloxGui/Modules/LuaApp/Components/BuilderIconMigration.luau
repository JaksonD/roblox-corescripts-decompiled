local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.Common.Immutable);
local v4 = require(l_CorePackages_0.Packages.BuilderIcons);
local l_useTextSizeOffset_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useTextSizeOffset;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local function _(v7) --[[ Line: 10 ]]
    return v7.X.Offset ~= 0 and v7.Y.Scale ~= 0 or v7.Y.Offset ~= 0 and v7.X.Scale ~= 0;
end;
return function(v9) --[[ Line: 14 ]] --[[ Name: BuilderIconElement ]]
    -- upvalues: l_useTextSizeOffset_0 (copy), l_useTokens_0 (copy), v3 (copy), v4 (copy), v2 (copy)
    local l_fullProps_0 = v9.fullProps;
    local l_migrationLookup_0 = v9.migrationLookup;
    local l_elementType_0 = v9.elementType;
    local v13 = l_useTextSizeOffset_0();
    local v14 = l_useTokens_0();
    local v15 = v3.RemoveFromDictionary(l_fullProps_0, "Image", "ImageRectOffset", "ImageRectSize", "SliceCenter", "SliceScale", "ResampleMode", "ScaleType", "TileSize");
    local l_Size_0 = v15.Size;
    local v17 = l_Size_0.X.Offset ~= 0 and l_Size_0.Y.Scale ~= 0 or l_Size_0.Y.Offset ~= 0 and l_Size_0.X.Scale ~= 0;
    if not v17 and v15.Size.X.Offset ~= v15.Size.Y.Offset then
        l_Size_0 = math.min(v15.Size.X.Offset, v15.Size.Y.Offset);
        v15.Size = UDim2.fromOffset(l_Size_0, l_Size_0);
    end;
    v15.TextSize = v15.Size.Y.Offset;
    if v15.TextSize == 0 or v17 then
        v15.TextScaled = true;
    else
        l_Size_0 = v15.TextSize;
        local l_Size_100_0 = v14.Size.Size_100;
        v15.TextSize = math.round(l_Size_0 / l_Size_100_0) * l_Size_100_0;
    end;
    v15.Text = l_migrationLookup_0.name;
    v15.FontFace = v4.Font[l_migrationLookup_0.variant];
    v15.Image = nil;
    v15.TextColor3 = v15.ImageColor3 or v14.Color.Content.Emphasis.Color3;
    v15.TextTransparency = v15.ImageTransparency or v14.Color.Content.Emphasis.Transparency;
    v15.ImageColor3 = nil;
    v15.ImageTransparency = nil;
    if v13 > 0 then
        return v2.createElement(l_elementType_0, v15, {
            Children = v2.createElement(v2.Fragment, nil, v15.children), 
            UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                MaxTextSize = v15.TextSize
            })
        });
    else
        return v2.createElement(l_elementType_0, v15);
    end;
end;