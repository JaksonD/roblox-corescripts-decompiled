local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.mutedError);
local l_FFlagMinMaxPriceValidation_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagMinMaxPriceValidation;
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_StyledTextLabel_0 = v6.App.Text.StyledTextLabel;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v11 = require(script.Parent.FilterTextBox);
local function _(v12, v13) --[[ Line: 46 ]] --[[ Name: safeUpdateText ]]
    -- upvalues: v2 (copy)
    if v12 and v12.current then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 48 ]]
            -- upvalues: v12 (copy), v13 (copy)
            if v12.current.Text ~= v13 then
                v12.current.Text = v13;
            end;
        end);
        if not l_status_0 then
            v2("[PriceRangeInput] Failed to update text to " .. v13 .. " with error " .. tostring(l_result_0));
        end;
    end;
end;
local v17 = {
    minPrice = v10.MinPriceFilter, 
    maxPrice = v10.MaxPriceFilter
};
return function(v18) --[[ Line: 64 ]] --[[ Name: PriceRangeInput ]]
    -- upvalues: v4 (copy), v17 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v5 (copy), l_FFlagMinMaxPriceValidation_0 (copy), v10 (copy), v2 (copy), v11 (copy), l_StyledTextLabel_0 (copy)
    local v19 = v4.join(v17, v18);
    local v20 = l_useStyle_0();
    local l_Font_0 = v20.Font;
    local l_Theme_0 = v20.Theme;
    local l_Common_0 = v20.Tokens.Semantic.Color.Common;
    local v24 = l_useLocalization_0({
        min = "Feature.Catalog.Label.Filter.PriceMin", 
        max = "Feature.Catalog.Label.Filter.PriceMax"
    });
    local v25 = UDim.new(0.5, -13);
    local v26 = v5.useRef(nil);
    local v27 = v5.useRef(nil);
    if l_FFlagMinMaxPriceValidation_0 then
        local v28, v29 = v5.useState(true);
        local v30 = v5.useCallback(function() --[[ Line: 85 ]]
            -- upvalues: v26 (copy), v27 (copy), v10 (ref), v29 (copy)
            if v26.current and v27.current and (tonumber(v26.current.text) or v10.MinPriceFilter) > (tonumber(v27.current.text) or v10.MaxPriceFilter) then
                return v29(false);
            else
                return v29(true);
            end;
        end, {});
        local v38 = v5.useCallback(function(v31) --[[ Line: 96 ]]
            -- upvalues: v19 (copy), v10 (ref), v26 (copy), v2 (ref), v30 (copy)
            if v19.setMinPrice then
                local v32 = tonumber((v31:gsub("%D", "")));
                local v33 = v32 or v10.MinPriceFilter;
                v19.setMinPrice(v33);
                local v34 = if v32 then tostring(v33) else "";
                local l_v26_0 = v26;
                if l_v26_0 and l_v26_0.current then
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 48 ]]
                        -- upvalues: l_v26_0 (copy), v34 (copy)
                        if l_v26_0.current.Text ~= v34 then
                            l_v26_0.current.Text = v34;
                        end;
                    end);
                    if not l_status_1 then
                        v2("[PriceRangeInput] Failed to update text to " .. v34 .. " with error " .. tostring(l_result_1));
                    end;
                end;
            end;
            v30();
        end, {
            v19.setMinPrice, 
            v30
        });
        local v46 = v5.useCallback(function(v39) --[[ Line: 110 ]]
            -- upvalues: v19 (copy), v10 (ref), v27 (copy), v2 (ref), v30 (copy)
            if v19.setMaxPrice then
                local v40 = tonumber((v39:gsub("%D", "")));
                local v41 = v40 or v10.MaxPriceFilter;
                v19.setMaxPrice(v41);
                local v42 = if v40 then tostring(v41) else "";
                local l_v27_0 = v27;
                if l_v27_0 and l_v27_0.current then
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 48 ]]
                        -- upvalues: l_v27_0 (copy), v42 (copy)
                        if l_v27_0.current.Text ~= v42 then
                            l_v27_0.current.Text = v42;
                        end;
                    end);
                    if not l_status_2 then
                        v2("[PriceRangeInput] Failed to update text to " .. v42 .. " with error " .. tostring(l_result_2));
                    end;
                end;
            end;
            v30();
        end, {
            v19.setMaxPrice, 
            v30
        });
        return (v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -12 - v20.Tokens.Global.Size_50 * 2, 0, 30 + v20.Tokens.Global.Size_50 * 2)
        }, {
            Padding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v20.Tokens.Global.Size_50), 
                PaddingBottom = UDim.new(0, v20.Tokens.Global.Size_50), 
                PaddingLeft = UDim.new(0, v20.Tokens.Global.Size_50), 
                PaddingRight = UDim.new(0, v20.Tokens.Global.Size_50)
            }), 
            MenuLayoutFrame = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Padding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v20.Tokens.Global.Size_50), 
                    PaddingBottom = UDim.new(0, v20.Tokens.Global.Size_50), 
                    PaddingLeft = UDim.new(0, v20.Tokens.Global.Size_50), 
                    PaddingRight = UDim.new(0, v20.Tokens.Global.Size_50)
                }), 
                UIListLayout = v5.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Corner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v20.Tokens.Global.Size_50 * 100)
                }), 
                Border = v5.createElement("UIStroke", {
                    Color = l_Common_0.Alert.Color3, 
                    Transparency = v28 and 1 or l_Common_0.Alert.Transparency, 
                    Thickness = 2, 
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                }), 
                MinPriceTextBox = v5.createElement(v11, {
                    text = if v19.minPrice > v10.MinPriceFilter then tostring(v19.minPrice) else "", 
                    placeholderText = v24.min, 
                    onTextChanged = v38, 
                    onFocused = v19.onFocused, 
                    width = v25, 
                    layoutOrder = 1, 
                    textBoxRef = v26, 
                    NextSelectionRight = v27
                }), 
                Dash = v5.createElement(l_StyledTextLabel_0, {
                    size = UDim2.fromOffset(26, 30), 
                    text = "\226\128\147", 
                    colorStyle = {
                        Color = l_Theme_0.TextEmphasis.Color, 
                        Transparency = l_Theme_0.TextEmphasis.Transparency
                    }, 
                    fontStyle = l_Font_0.Header2, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    layoutOrder = 2
                }), 
                MaxPriceTextBox = v5.createElement(v11, {
                    text = if v19.maxPrice < v10.MaxPriceFilter then tostring(v19.maxPrice) else "", 
                    placeholderText = v24.max, 
                    onTextChanged = v46, 
                    onFocused = v19.onFocused, 
                    width = v25, 
                    layoutOrder = 3, 
                    textBoxRef = v27, 
                    NextSelectionLeft = v26
                })
            })
        }));
    else
        local v54 = v5.useCallback(function(v47) --[[ Line: 197 ]]
            -- upvalues: v19 (copy), v10 (ref), v26 (copy), v2 (ref)
            if v19.setMinPrice then
                local v48 = tonumber((v47:gsub("%D", "")));
                local v49 = v48 or v10.MinPriceFilter;
                v19.setMinPrice(v49);
                local v50 = if v48 then tostring(v49) else "";
                local l_v26_1 = v26;
                if l_v26_1 and l_v26_1.current then
                    local l_status_3, l_result_3 = pcall(function() --[[ Line: 48 ]]
                        -- upvalues: l_v26_1 (copy), v50 (copy)
                        if l_v26_1.current.Text ~= v50 then
                            l_v26_1.current.Text = v50;
                        end;
                    end);
                    if not l_status_3 then
                        v2("[PriceRangeInput] Failed to update text to " .. v50 .. " with error " .. tostring(l_result_3));
                    end;
                end;
            end;
        end, {
            v19.setMinPrice
        });
        local v62 = v5.useCallback(function(v55) --[[ Line: 210 ]]
            -- upvalues: v19 (copy), v10 (ref), v27 (copy), v2 (ref)
            if v19.setMaxPrice then
                local v56 = tonumber((v55:gsub("%D", "")));
                local v57 = v56 or v10.MaxPriceFilter;
                v19.setMaxPrice(v57);
                local v58 = if v56 then tostring(v57) else "";
                local l_v27_1 = v27;
                if l_v27_1 and l_v27_1.current then
                    local l_status_4, l_result_4 = pcall(function() --[[ Line: 48 ]]
                        -- upvalues: l_v27_1 (copy), v58 (copy)
                        if l_v27_1.current.Text ~= v58 then
                            l_v27_1.current.Text = v58;
                        end;
                    end);
                    if not l_status_4 then
                        v2("[PriceRangeInput] Failed to update text to " .. v58 .. " with error " .. tostring(l_result_4));
                    end;
                end;
            end;
        end, {
            v19.setMaxPrice
        });
        return (v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, -12, 0, 30)
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            MinPriceTextBox = v5.createElement(v11, {
                text = if v19.minPrice > v10.MinPriceFilter then tostring(v19.minPrice) else "", 
                placeholderText = v24.min, 
                onTextChanged = v54, 
                onFocused = v19.onFocused, 
                width = v25, 
                layoutOrder = 1, 
                textBoxRef = v26, 
                NextSelectionRight = v27
            }), 
            Dash = v5.createElement(l_StyledTextLabel_0, {
                size = UDim2.fromOffset(26, 30), 
                text = "\226\128\147", 
                colorStyle = {
                    Color = l_Theme_0.TextEmphasis.Color, 
                    Transparency = l_Theme_0.TextEmphasis.Transparency
                }, 
                fontStyle = l_Font_0.Header2, 
                textXAlignment = Enum.TextXAlignment.Center, 
                layoutOrder = 2
            }), 
            MaxPriceTextBox = v5.createElement(v11, {
                text = if v19.maxPrice < v10.MaxPriceFilter then tostring(v19.maxPrice) else "", 
                placeholderText = v24.max, 
                onTextChanged = v62, 
                onFocused = v19.onFocused, 
                width = v25, 
                layoutOrder = 3, 
                textBoxRef = v27, 
                NextSelectionLeft = v26
            })
        }));
    end;
end;