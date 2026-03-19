local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v1.App.ImageSet.Images;
local l_IconButton_0 = v1.App.Button.IconButton;
local v4 = require(l_CorePackages_0.Packages.React);
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local v6 = l_Images_0["icons/navigation/pushBack"];
local function v9(v7) --[[ Line: 22 ]]
    -- upvalues: v4 (copy), l_IconButton_0 (copy), v6 (copy)
    return v4.createElement(l_IconButton_0, {
        anchorPoint = Vector2.new(0, 0), 
        icon = v6, 
        onActivated = function() --[[ Line: 26 ]] --[[ Name: onActivated ]]
            -- upvalues: v7 (copy)
            local l_navigation_0 = v7.navigation;
            v7.closeFocusedScreen(l_navigation_0);
        end
    });
end;
return function(v10) --[[ Line: 34 ]]
    -- upvalues: v4 (copy), l_HeaderBar_0 (copy), v9 (copy)
    return v4.createElement(l_HeaderBar_0, {
        backgroundTransparency = 1, 
        barHeight = v10.topBarHeight, 
        renderLeft = function() --[[ Line: 38 ]] --[[ Name: renderLeft ]]
            -- upvalues: v4 (ref), v9 (ref), v10 (copy)
            return v4.createElement(v9, {
                navigation = v10.navigation, 
                closeFocusedScreen = v10.closeFocusedScreen
            });
        end, 
        title = v10.title
    });
end;