local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Components.DividerWithText);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Image_0 = v3.Image;
local l_useTokens_0 = v3.Hooks.useTokens;
return function(v11) --[[ Line: 21 ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_ThirdPartyUserService_0 (copy), l_useLocalization_0 (copy), l_View_0 (copy), v4 (copy), l_Image_0 (copy), l_Text_0 (copy)
    local v12 = l_useTokens_0();
    local v13 = v2.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: l_ThirdPartyUserService_0 (ref)
        if l_ThirdPartyUserService_0 then
            l_ThirdPartyUserService_0:ShowAccountPicker();
        end;
    end, {});
    local v14 = l_useLocalization_0({
        dividerText = v11.dividerTextKey
    });
    local v15 = nil;
    local v16 = nil;
    if v11.isDisabled then
        v15 = "stroke-muted";
        v16 = "content-inverse-default";
    else
        v15 = "stroke-action-subtle";
        v16 = "content-default";
    end;
    return v2.createElement(l_View_0, {
        LayoutOrder = v11.layoutOrder, 
        tag = "col gap-xxlarge align-x-center auto-xy size-full-0"
    }, {
        Divider = v2.createElement(v4, {
            layoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            size = UDim2.new(1, 0, 0, 0), 
            width = 0, 
            height = 0, 
            font = v12.Semantic.Typography.Footer.Font, 
            fontSize = v12.Semantic.Typography.Footer.FontSize, 
            color3 = v12.Semantic.Color.Text.Muted.Color3, 
            transparency = v12.Semantic.Color.Text.Muted.Transparency, 
            text = if v14 then v14.dividerText else "", 
            padding = v12.Size.Size_800
        }), 
        SwitchAccountButton = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, v12.Size.Size_1200), 
            tag = "row gap-medium align-y-center align-x-center radius-medium " .. v15, 
            selection = {
                Selectable = not v11.isDisabled
            }, 
            isDisabled = v11.isDisabled, 
            onActivated = v13
        }, {
            Image = v2.createElement(l_Image_0, {
                LayoutOrder = 0, 
                Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png", 
                Size = UDim2.fromOffset(v12.Semantic.Icon.Size.Small, v12.Semantic.Icon.Size.Small), 
                tag = "align-x-center align-x-left align-y-center " .. v16
            }), 
            Text = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v11.thirdPartyUserName, 
                tag = "auto-xy " .. v16
            })
        })
    });
end;