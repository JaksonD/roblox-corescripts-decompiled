local l_Parent_0 = script:FindFirstAncestor("ChatLineReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.UIBlox);
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_IconButton_0 = v2.IconButton;
local l_ModalWindow_0 = v3.App.Dialog.Modal.ModalWindow;
local l_View_0 = v2.View;
return function(v9) --[[ Line: 38 ]] --[[ Name: ChatLineReportModalWindow ]]
    -- upvalues: v1 (copy), l_ModalWindow_0 (copy), l_View_0 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_ButtonStack_0 (copy)
    local v10 = not not v9.buttonStackProps;
    return v1.createElement(l_ModalWindow_0, {
        isFullHeight = false, 
        screenSize = v9.screenSize, 
        position = v9.position, 
        anchorPoint = v9.anchorPoint
    }, {
        Content = v1.createElement(l_View_0, {
            tag = {
                ["size-full-0 auto-y col"] = true, 
                ["padding-bottom-small"] = not v10, 
                ["padding-bottom-xxlarge"] = v10
            }
        }, {
            TitleContainer = v1.createElement(l_HeaderBar_0, {
                title = v9.title, 
                renderLeft = function() --[[ Line: 56 ]] --[[ Name: renderLeft ]]
                    -- upvalues: v1 (ref), l_IconButton_0 (ref), v9 (copy)
                    return v1.createElement(l_IconButton_0, {
                        icon = "icons/navigation/close", 
                        onActivated = v9.onCloseClicked
                    });
                end, 
                renderRight = function() --[[ Line: 62 ]] --[[ Name: renderRight ]]
                    -- upvalues: v1 (ref), l_IconButton_0 (ref), v9 (copy)
                    return v1.createElement(l_IconButton_0, {
                        icon = "icons/actions/info", 
                        onActivated = v9.onInfoClicked
                    });
                end, 
                backgroundTransparency = 1, 
                margin = 10
            }), 
            Underline = v1.createElement(l_View_0, {
                tag = "size-full-0 stroke-standard stroke-default", 
                LayoutOrder = 1
            }), 
            MiddleContent = v1.createElement(l_View_0, {
                tag = "size-full-0 auto-y padding-x-xxlarge", 
                LayoutOrder = 2
            }, v9.children), 
            Buttons = v10 and v1.createElement(l_View_0, {
                tag = "size-full-0 padding-x-xxlarge auto-y", 
                LayoutOrder = 3
            }, v1.createElement(l_ButtonStack_0, v9.buttonStackProps))
        })
    });
end;