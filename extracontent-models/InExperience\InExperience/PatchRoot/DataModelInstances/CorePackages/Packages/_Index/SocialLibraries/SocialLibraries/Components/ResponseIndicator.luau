local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
return function() --[[ Line: 6 ]]
    -- upvalues: l_UIBlox_0 (copy), l_Roact_0 (copy)
    return l_UIBlox_0.Style.withStyle(function(v4) --[[ Line: 7 ]]
        -- upvalues: l_Roact_0 (ref), l_UIBlox_0 (ref)
        return l_Roact_0.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundColor3 = v4.Theme.TextEmphasis.Color, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            visibleFrame = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = v4.Theme.BackgroundUIContrast.Transparency, 
                BackgroundColor3 = v4.Theme.BackgroundUIContrast.Color, 
                Size = UDim2.fromOffset(120, 120), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                ZIndex = 10
            }, {
                corner = l_Roact_0.createElement("UICorner"), 
                spinner = l_Roact_0.createElement(l_UIBlox_0.App.Loading.LoadingSpinner, {
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    position = UDim2.fromScale(0.5, 0.5), 
                    size = UDim2.fromOffset(48, 48)
                })
            })
        });
    end);
end;