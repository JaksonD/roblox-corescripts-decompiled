local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local function v10(v4) --[[ Line: 18 ]] --[[ Name: GenericText ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy)
    local v5 = l_useDesignTokens_0();
    local v6 = UDim.new(0, v5.Global.Space_300);
    local v7 = v5.Semantic.Typography[v4.type];
    local v8 = if v4.emphasis then v5.Semantic.Color.Text.Emphasis else v5.Semantic.Color.Text.Default;
    local v9 = v4.padding or v6;
    return v2.createElement("Frame", {
        LayoutOrder = v4.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = v9, 
            PaddingRight = v9
        }), 
        Text = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v4.text, 
            Font = v7.Font, 
            LayoutOrder = 1, 
            TextColor3 = v8.Color3, 
            TextTransparency = v8.Transparency, 
            TextSize = v7.FontSize, 
            TextWrapped = true, 
            TextXAlignment = v4.TextXAlignment or Enum.TextXAlignment.Left, 
            TextYAlignment = v4.TextYAlignment or Enum.TextYAlignment.Center, 
            Size = v4.size or UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v5.Global.Opacity_0
        })
    });
end;
return {
    HeaderText = function(v11) --[[ Line: 59 ]] --[[ Name: HeaderText ]]
        -- upvalues: v2 (copy), v10 (copy), v1 (copy)
        return v2.createElement(v10, v1.join(v11, {
            type = "Header", 
            emphasis = true, 
            padding = UDim.new(0, 0)
        }));
    end, 
    SubheaderText = function(v12) --[[ Line: 66 ]] --[[ Name: SubheaderText ]]
        -- upvalues: v2 (copy), v10 (copy), v1 (copy)
        return v2.createElement(v10, v1.join(v12, {
            type = "Subheader", 
            emphasis = true
        }));
    end, 
    BodyText = function(v13) --[[ Line: 70 ]] --[[ Name: BodyText ]]
        -- upvalues: v2 (copy), v10 (copy), v1 (copy)
        return v2.createElement(v10, v1.join(v13, {
            type = "Body", 
            emphasis = false
        }));
    end, 
    BoldBodyText = function(v14) --[[ Line: 74 ]] --[[ Name: BoldBodyText ]]
        -- upvalues: v2 (copy), v10 (copy), v1 (copy)
        return v2.createElement(v10, v1.join(v14, {
            type = "Header", 
            emphasis = false
        }));
    end
};