local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
return function(_, v3) --[[ Line: 48 ]]
    return {
        Color = {
            backgroundUiColor = v3.Semantic.Color.BackgroundUi.Default, 
            separatorColor = v3.Semantic.Color.Common.Divider, 
            textColor = v3.Semantic.Color.Text.Emphasis, 
            buttonColor = v3.Semantic.Color.Text.Emphasis, 
            buttonTextColor = v3.Semantic.Color.BackgroundUi.Default
        }, 
        Size = {
            displayWidth = 1920, 
            promptWidth = 1080, 
            imageWidth = 566, 
            imageHeight = 324, 
            buttonHeight = v3.Global.Size_600, 
            iconSize = v3.Global.Size_200
        }, 
        Space = {
            titlePadding = v3.Global.Space_150, 
            bodyPadding = v3.Global.Space_300, 
            iconPadding = v3.Global.Space_50
        }, 
        Radius = {
            cornerRadius = v3.Semantic.Radius.Medium, 
            buttonRadius = v3.Semantic.Radius.Small
        }, 
        Typography = {
            label = v3.Semantic.Typography.Subheader, 
            header = v3.Semantic.Typography.Header, 
            caption = v3.Semantic.Typography.Body
        }
    };
end;