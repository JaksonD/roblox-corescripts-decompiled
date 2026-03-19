local l_script_FirstAncestor_0 = script:FindFirstAncestor("WechatQQAuth");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_BackgroundFill_0 = require(l_Parent_0.AuthCommon).Components.BackgroundFill;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v5 = require(l_script_FirstAncestor_0.Components.WechatQQLoginContainer);
local v6 = require(l_Parent_0.Foundation);
local l_View_0 = v6.View;
local l_Image_0 = v6.Image;
local v9 = Vector2.new(0.98, 0.98);
local v10 = v2.PureComponent:extend("WechatQQLoginPage");
v10.init = function(_) --[[ Line: 20 ]] --[[ Name: init ]]

end;
v10.didMount = function(_) --[[ Line: 22 ]] --[[ Name: didMount ]]

end;
v10.willUnmount = function(_) --[[ Line: 24 ]] --[[ Name: willUnmount ]]

end;
v10.render = function(_) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_BackgroundFill_0 (copy), l_View_0 (copy), v5 (copy), v9 (copy), l_Image_0 (copy)
    return v2.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        renderFullscreenBackground = function(_) --[[ Line: 29 ]] --[[ Name: renderFullscreenBackground ]]
            -- upvalues: v2 (ref), l_BackgroundFill_0 (ref)
            return v2.createElement(l_BackgroundFill_0, {
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg", 
                AspectRatio = 1
            });
        end
    }, {
        MainWrapper = v2.createElement(l_View_0, {
            tag = "size-full-full"
        }, {
            ContentContainer = v2.createElement(v5, {}), 
            AgeRatingContainer = v2.createElement(l_View_0, {
                tag = "auto-xy anchor-bottom-right bg-system-contrast radius-small", 
                Position = UDim2.new(v9.X, 0, v9.Y, 0)
            }, {
                AgeRatingImage = v2.createElement(l_Image_0, {
                    tag = "gui-object-defaults size-1200-1600", 
                    Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/ic_aged_rating.png"
                })
            })
        })
    });
end;
return v10;