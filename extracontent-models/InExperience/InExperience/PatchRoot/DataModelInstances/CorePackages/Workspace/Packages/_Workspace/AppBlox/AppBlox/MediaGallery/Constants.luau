local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local _ = require(l_Parent_0.UIBlox);
return {
    getDefaultStyleProps = function(v2) --[[ Line: 19 ]] --[[ Name: getDefaultStyleProps ]]
        return {
            borderRadius = UDim.new(0, v2.Tokens.Component.VerticalTile.Base.Container.BorderRadius.LeadingTop), 
            contentGap = v2.Tokens.Global.Space_150, 
            gutter = v2.Tokens.Global.Space_300, 
            titleFont = v2.Font.Header1, 
            titleTextColor = {
                Color = v2.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                Transparency = v2.Tokens.Semantic.Color.Text.Emphasis.Transparency
            }
        };
    end
};