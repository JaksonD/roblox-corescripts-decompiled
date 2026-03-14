local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local l_White_0 = l_Colors_0.White;
local l_Gray2_0 = l_Colors_0.Gray2;
local _ = v2.PureComponent:extend("CountryCodeSelectorButton");
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v9 = require(l_script_FirstAncestor_0.Flags.GetFFlagCountryCodeBoldPrefixEnabled);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v12) --[[ Line: 27 ]] --[[ Name: CountryCodeSelectorButton ]]
    -- upvalues: v9 (copy), l_Text_0 (copy), l_AppFonts_0 (copy), l_useStyle_0 (copy), v2 (copy), l_White_0 (copy), l_Gray2_0 (copy)
    local v13 = v12.CountryCode.localizedName or "";
    local v14 = "+" .. (v12.CountryCode.prefix or "");
    local l_TextSize_0 = v12.ListButtonProps.TextSize;
    local v16 = v9() and v12.BoldPrefixEnabled;
    local v17 = l_Text_0.GetTextWidth(v14, l_AppFonts_0.default:getDefault(), l_TextSize_0);
    local v18 = string.format("%s (%s)", v13, v14);
    local l_Size_0 = v12.Size;
    local l_LayoutOrder_0 = v12.LayoutOrder;
    local v22 = v12.ListButtonProps.SelectionCallback or function(_) --[[ Line: 36 ]]

    end;
    local v23 = l_useStyle_0();
    local v24 = if v16 then {
        FullText = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Text = v18, 
            BackgroundTransparency = 1, 
            Font = v23.Tokens.Semantic.Typography.CaptionBody.Font, 
            TextColor3 = v23.Tokens.Semantic.Color.Ui.Emphasis.Color3, 
            TextSize = l_TextSize_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    } else {
        CountryName = v2.createElement("TextLabel", {
            Size = UDim2.new(1, -v17, 1, 0), 
            Text = v13, 
            BackgroundTransparency = 1, 
            Font = l_AppFonts_0.default:getDefault(), 
            TextColor3 = l_White_0, 
            TextSize = l_TextSize_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        CountryPrefix = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Text = v14, 
            BackgroundTransparency = 1, 
            Font = l_AppFonts_0.default:getDefault(), 
            TextColor3 = l_Gray2_0, 
            TextSize = l_TextSize_0, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    };
    return v2.createElement("TextButton", {
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Text = "", 
        [v2.Event.Activated] = function() --[[ Line: 81 ]]
            -- upvalues: v22 (copy), v12 (copy)
            v22(v12.CountryCode);
        end
    }, v24);
end;