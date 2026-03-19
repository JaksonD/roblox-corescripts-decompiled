local l_script_FirstAncestor_0 = script:FindFirstAncestor("WechatQQAuth");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Components.WechatQQButton);
local l_View_0 = v3.View;
local l_Image_0 = v3.Image;
local l_Text_0 = v3.Text;
return function(_) --[[ Line: 30 ]] --[[ Name: WechatQQLoginContainer ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy), v5 (copy)
    local v10 = l_useLocalization_0({
        antiAddictionText = "Luobu.Authentication.Login.Label.AntiAddictionText", 
        logInTextWeChat = "Authentication.Login.Action.WeChatLogin", 
        logInTextQQ = "Authentication.Login.Action.QQLogin", 
        networkLicense = "Luobu.Authentication.Login.Label.NetworkLicense"
    });
    return v2.createElement(l_View_0, {
        tag = "size-full col align-x-center align-y-center gap-xxlarge padding-large"
    }, {
        Logo = v2.createElement(l_Image_0, {
            tag = "gui-object-defaults", 
            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_luobu.png", 
            Size = UDim2.new(0.7, 0, 0.7, 0), 
            ZIndex = 1, 
            LayoutOrder = 1, 
            sizeConstraint = {
                MaxSize = Vector2.new(460, 113.44894026974951)
            }, 
            aspectRatio = 4.0546875
        }), 
        ContentContainer = v2.createElement(l_View_0, {
            tag = "col align-x-center align-y-center auto-xy gap-medium", 
            LayoutOrder = 2, 
            sizeConstraint = {
                MinSize = Vector2.new(0, 0), 
                MaxSize = Vector2.new(360, 1e999)
            }
        }, {
            AntiAddictionText = v2.createElement(l_Text_0, {
                Text = v10.antiAddictionText, 
                tag = "auto-y gui-object-defaults size-full-0 text-align-x-left text-align-y-center text-wrap text-label-small padding-bottom-large", 
                textStyle = {
                    Transparency = 0.5
                }, 
                LayoutOrder = 1
            }), 
            WechatButton = v2.createElement(v5, {
                text = v10.logInTextWeChat, 
                iconImage = "rbxasset://textures/ui/LuaApp/graphic/Auth/wechatlogo.png", 
                backgroundColor = "#00e87e", 
                onActivated = function() --[[ Line: 40 ]]

                end, 
                layoutOrder = 2
            }), 
            QQButton = v2.createElement(v5, {
                text = v10.logInTextQQ, 
                iconImage = "rbxasset://textures/ui/LuaApp/graphic/Auth/qqlogo.png", 
                backgroundColor = "#2bb1ff", 
                onActivated = function() --[[ Line: 44 ]]

                end, 
                layoutOrder = 3
            }), 
            NetworkLicense = v2.createElement(l_Text_0, {
                Text = v10.networkLicense, 
                tag = "auto-y gui-object-defaults size-full-0 text-align-x-left text-align-y-center text-wrap text-label-small padding-bottom-large", 
                textStyle = {
                    Transparency = 0.5
                }, 
                LayoutOrder = 4
            })
        })
    });
end;