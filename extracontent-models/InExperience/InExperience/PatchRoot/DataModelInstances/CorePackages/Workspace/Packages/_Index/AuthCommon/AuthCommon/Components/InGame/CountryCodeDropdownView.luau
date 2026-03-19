local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.React);
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local v5 = require(l_script_FirstAncestor_0.Components.FunctionalCountryCodeSelectorButton);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Graphite_0 = l_Colors_0.Graphite;
return function(v11) --[[ Line: 28 ]] --[[ Name: CountryCodeDropdownView ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), v5 (copy), l_Graphite_0 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy)
    local l_dropdownVisible_0 = v11.dropdownVisible;
    local l_countryCodeList_0 = v11.countryCodeList;
    local l_onCountryCodeSelected_0 = v11.onCountryCodeSelected;
    local l_position_0 = v11.position;
    local l_maxHeight_0 = v11.maxHeight;
    local v17 = l_useStyle_0();
    local l_Color_0 = v17.Theme.UIDefault.Color;
    local l_Transparency_0 = v17.Theme.UIDefault.Transparency;
    local v25 = (function(v20) --[[ Line: 38 ]] --[[ Name: getListButtons ]]
        -- upvalues: v3 (ref), v5 (ref), l_onCountryCodeSelected_0 (copy), l_Graphite_0 (ref)
        local v21 = {
            v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8)
            })
        };
        local v22 = 1;
        for _, v24 in ipairs(v20) do
            table.insert(v21, v3.createElement(v5, {
                CountryCode = v24, 
                Size = UDim2.new(1, 0, 0, 48), 
                LayoutOrder = v22, 
                ListButtonProps = {
                    TextSize = 14, 
                    SelectionCallback = l_onCountryCodeSelected_0
                }, 
                BoldPrefixEnabled = true
            }));
            v22 = v22 + 1;
            table.insert(v21, v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_Graphite_0, 
                LayoutOrder = v22, 
                BorderSizePixel = 0
            }));
            v22 = v22 + 1;
        end;
        return v21;
    end)(l_countryCodeList_0);
    local v26 = #l_countryCodeList_0;
    if l_dropdownVisible_0 then
        return (v3.createElement(l_ImageSetLabel_0, {
            ZIndex = 2, 
            Size = v11.size or UDim2.new(1, 0, 0, l_maxHeight_0), 
            Position = l_position_0, 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(9, 9, 9, 9), 
            Image = l_GetImageData_0("LuaApp/buttons/buttonFill"), 
            ImageColor3 = v17.Theme.BackgroundUIDefault.Color, 
            ImageTransparency = 0
        }, {
            Boundary = v3.createElement(l_ImageSetLabel_0, {
                ZIndex = 2, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(9, 9, 9, 9), 
                Image = l_GetImageData_0("LuaApp/buttons/buttonStroke"), 
                ImageColor3 = l_Color_0, 
                ImageTransparency = l_Transparency_0
            }), 
            ScrollingFrame = v3.createElement("ScrollingFrame", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                ScrollBarImageColor3 = l_Graphite_0, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                CanvasSize = UDim2.new(1, 0, 0, v26 * 49)
            }, {
                ListHolder = v3.createElement("Frame", {
                    Size = UDim2.new(1, -8, 1, l_maxHeight_0), 
                    BackgroundTransparency = 1
                }, v25)
            })
        }));
    else
        return nil;
    end;
end;