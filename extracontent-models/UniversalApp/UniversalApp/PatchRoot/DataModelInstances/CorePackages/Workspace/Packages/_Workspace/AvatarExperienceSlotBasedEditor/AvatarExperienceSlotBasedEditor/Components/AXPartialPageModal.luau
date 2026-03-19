local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_ModalWindow_0 = v2.App.Dialog.Modal.ModalWindow;
local l_ButtonStack_0 = v2.App.Button.ButtonStack;
local v5 = require(l_Parent_0.Foundation);
local l_View_0 = v5.View;
local l_useTokens_0 = v5.Hooks.useTokens;
local function _(v8) --[[ Line: 36 ]] --[[ Name: isFullWidth ]]
    return v8.X <= 540;
end;
return function(v10) --[[ Line: 41 ]] --[[ Name: AXPartialPageModal ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_ModalWindow_0 (copy), l_View_0 (copy), l_ButtonStack_0 (copy)
    local v11 = l_useTokens_0();
    local l_screenSize_0 = v10.screenSize;
    local l_Medium_0 = v11.Margin.Medium;
    local l_Large_0 = v11.Margin.Large;
    local v15 = v10.bottomPadding or UDim.new(0, l_Medium_0);
    if not (l_screenSize_0.X <= 540) then
        v15 = UDim.new(0, l_Medium_0);
    end;
    return v1.createElement("TextButton", {
        Text = "", 
        AutoButtonColor = false, 
        Selectable = false, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v1.Event.Activated] = function() --[[ Line: 64 ]]

        end, 
        ZIndex = 3
    }, {
        PartialPageModal = v1.createElement(l_ModalWindow_0, {
            isFullHeight = false, 
            screenSize = l_screenSize_0, 
            position = v10.position, 
            anchorPoint = v10.anchorPoint
        }, {
            ContentContainer = v1.createElement(l_View_0, {
                tag = "auto-y size-full-0 align-x-left col padding-top-medium padding-x-xxlarge padding-top-xxlarge", 
                Position = UDim2.new(0, 0, 0, l_Large_0), 
                backgroundStyle = v11.Color.Surface.Surface_100, 
                padding = {
                    bottom = v15
                }
            }, {
                Content = v1.createElement(l_View_0, {
                    tag = "auto-y size-full-0"
                }, v10.children), 
                Buttons = v10.buttonStackProps and v1.createElement(l_ButtonStack_0, v10.buttonStackProps)
            })
        })
    });
end;