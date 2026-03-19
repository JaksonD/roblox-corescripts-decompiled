local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Components.IconTextBox);
local v7 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v8 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_Focusable_0 = v3.Focusable;
local l_Images_0 = v4.App.ImageSet.Images;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v12 = l_Images_0["icons/common/robux"];
local function _(v13, v14) --[[ Line: 25 ]] --[[ Name: shouldShowMinimumAmountMessage ]]
    if v13 then
        local v15 = tonumber(v13);
        return not v15 or v15 <= (v14 or 0);
    else
        return true;
    end;
end;
return (v2.forwardRef(function(v17, v18) --[[ Line: 45 ]]
    -- upvalues: v7 (copy), l_useStyle_0 (copy), v2 (copy), l_Focusable_0 (copy), v6 (copy), v12 (copy), v8 (copy)
    local v19 = v7({
        setPriceLabel = "Feature.Catalog.Heading.SetPrice", 
        pricePlaceholderText = "Feature.Catalog.Label.Price", 
        minAmountText = "Feature.Catalog.Label.MinimumAmount", 
        minAmountTextWithPrice = "Feature.Catalog.Label.MinimumAmountCustom"
    });
    local v20 = l_useStyle_0();
    local l_Theme_0 = v20.Theme;
    local l_Font_0 = v20.Font;
    local l_SubHeader1_0 = l_Font_0.SubHeader1;
    local l_CaptionBody_0 = l_Font_0.CaptionBody;
    local l_RelativeSize_0 = l_SubHeader1_0.RelativeSize;
    local l_RelativeSize_1 = l_CaptionBody_0.RelativeSize;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local v28 = l_RelativeSize_0 * l_BaseSize_0;
    local v29 = l_RelativeSize_1 * l_BaseSize_0;
    local l_minAmountText_0 = v19.minAmountText;
    if v17.priceFloor and v17.priceFloor > 0 then
        l_minAmountText_0 = v19.minAmountTextWithPrice:gsub("{minimumAmount}", (tostring(v17.priceFloor)));
    end;
    local l_createElement_0 = v2.createElement;
    local v32 = "Frame";
    local v33 = {
        LayoutOrder = v17.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1
    };
    local v36 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 10)
        }), 
        SetPriceSubHeader = v2.createElement("TextLabel", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v19.setPriceLabel, 
            Font = l_SubHeader1_0.Font, 
            Size = UDim2.fromScale(1, 0), 
            TextSize = v28, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextWrapped = true, 
            BackgroundTransparency = 1
        }), 
        PriceInputBox = v2.createElement(l_Focusable_0[v6], {
            LayoutOrder = 2, 
            Size = UDim2.fromScale(1, 0), 
            PlaceholderText = v19.pricePlaceholderText, 
            Image = v12, 
            TextInputType = Enum.TextInputType.Number, 
            ref = if v8() then v18 else nil, 
            NextSelectionUp = if v8() then v17.NextSelectionUp else nil, 
            NextSelectionDown = if v8() then v17.NextSelectionDown else nil, 
            NextSelectionLeft = if v8() then v17.NextSelectionLeft else nil, 
            NextSelectionRight = if v8() then v17.NextSelectionRight else nil, 
            [v2.Change.Text] = function(v34) --[[ Line: 108 ]]
                -- upvalues: v17 (copy)
                local l_Text_0 = v34.Text;
                if string.len(l_Text_0) > 10 then
                    v34.Text = v17.priceInRobux;
                    return;
                elseif l_Text_0 == nil or l_Text_0 == "" then
                    v17.setPriceInRobux("");
                    return;
                elseif string.match(l_Text_0, "^[0-9]+$") then
                    v17.setPriceInRobux(l_Text_0);
                    return;
                else
                    v34.Text = v17.priceInRobux;
                    return;
                end;
            end
        })
    };
    local l_createElement_1 = v2.createElement;
    local v38 = "Frame";
    local v39 = {
        LayoutOrder = 3, 
        Size = UDim2.new(1, 0, 0, v29 + 2), 
        BackgroundTransparency = 1
    };
    local v40 = {};
    local l_priceInRobux_0 = v17.priceInRobux;
    local l_priceFloor_0 = v17.priceFloor;
    local v43;
    if l_priceInRobux_0 then
        local v44 = tonumber(l_priceInRobux_0);
        v43 = not v44 or v44 <= (l_priceFloor_0 or 0);
    else
        v43 = true;
    end;
    if v43 then
        v43 = v2.createElement("TextLabel", {
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = l_minAmountText_0, 
            Font = l_CaptionBody_0.Font, 
            Size = UDim2.fromScale(1, 0), 
            TextSize = v29, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextWrapped = true, 
            BackgroundTransparency = 1
        });
    end;
    v40.MinAmountText = v43;
    v36.MinAmountContainer = l_createElement_1(v38, v39, v40);
    return l_createElement_0(v32, v33, v36);
end));