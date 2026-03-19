local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v6 = require(l_Modules_0.LuaApp.Components.OnScreenKeyboardWindow);
local v7 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_PartialPageModal_0 = v4.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = v4.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local v12 = v2.PureComponent:extend(script.Name);
v12.defaultProps = {
    makeBodyFragment = function() --[[ Line: 23 ]] --[[ Name: makeBodyFragment ]]
        return nil;
    end
};
v12.init = function(v13) --[[ Line: 28 ]] --[[ Name: init ]]
    v13.closeModal = function() --[[ Line: 29 ]]
        -- upvalues: v13 (copy)
        v13.props.closeOverlay();
        if v13.props.closeCallback then
            v13.props.closeCallback();
        end;
    end;
    v13.getAdjustedTitleToScreenString = function(v14, v15, v16) --[[ Line: 37 ]]
        -- upvalues: v13 (copy)
        if v14 == nil then
            return v14;
        else
            local v17 = math.floor(0.85 * (v15 / (v16.Font.Body.RelativeSize * v16.Font.BaseSize * 0.6)));
            if string.len(v14) <= v17 then
                return v14;
            elseif v14:find(" ") == nil then
                return v14;
            else
                v13.adjustedTitle = "";
                v13.remainingTitleToAnalyze = v14;
                for v18 = 1, 2 do
                    if v17 < string.len(v13.remainingTitleToAnalyze) then
                        local v19 = string.sub(v13.remainingTitleToAnalyze, 1, v17);
                        local v20 = v19:reverse():find(" ");
                        if v20 ~= nil then
                            local v21 = string.len(v19) - v20;
                            v13.remainingTitleToAnalyze = string.sub(v13.remainingTitleToAnalyze, v21 + 2);
                            v13.adjustedTitle = v13.adjustedTitle .. string.sub(v19, 0, v21);
                        else
                            v13.adjustedTitle = v13.adjustedTitle .. v19;
                            v13.remainingTitleToAnalyze = string.sub(v13.remainingTitleToAnalyze, v17 + 1);
                        end;
                        if v18 ~= 2 then
                            v13.adjustedTitle = v13.adjustedTitle .. "\n";
                        end;
                    else
                        v13.adjustedTitle = v13.adjustedTitle .. v13.remainingTitleToAnalyze;
                        break;
                    end;
                end;
                return v13.adjustedTitle;
            end;
        end;
    end;
end;
v12.render = function(v22) --[[ Line: 107 ]] --[[ Name: render ]]
    -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (copy), l_withStyle_0 (copy), v2 (copy), v6 (copy), l_PartialPageModal_0 (copy)
    local l_screenSize_0 = v22.props.screenSize;
    local v24 = l_getPartialPageModalMiddleContentWidth_0(l_screenSize_0.X);
    local l_buttonConfig_0 = v22.props.buttonConfig;
    local l_makeBodyFragment_0 = v22.props.makeBodyFragment;
    local v27 = not v22.props.hideCloseButton;
    local l_title_0 = v22.props.title;
    return l_withStyle_0(function(v29) --[[ Line: 117 ]]
        -- upvalues: v22 (copy), l_title_0 (copy), v24 (copy), v2 (ref), v6 (ref), l_PartialPageModal_0 (ref), l_screenSize_0 (copy), l_buttonConfig_0 (copy), v27 (copy), l_makeBodyFragment_0 (copy)
        local v30 = v22.getAdjustedTitleToScreenString(l_title_0, v24, v29);
        return v2.createElement(v6, {
            Contents = {
                Modal = v2.createElement(l_PartialPageModal_0, {
                    title = v30, 
                    screenSize = l_screenSize_0, 
                    buttonStackProps = l_buttonConfig_0, 
                    onCloseClicked = v27 and v22.closeModal
                }, {
                    Middle = v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromScale(1, 0)
                    }, {
                        ContentPadding = v2.createElement("UIPadding", {
                            PaddingBottom = l_buttonConfig_0 and UDim.new(0, 24), 
                            PaddingTop = UDim.new(0, 24)
                        }), 
                        ListLayout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, 24), 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        BodyFragment = l_makeBodyFragment_0(v24)
                    })
                })
            }
        });
    end);
end;
v12 = v3.connect(function(v31, _) --[[ Line: 149 ]]
    return {
        screenSize = v31.ScreenSize
    };
end, function(v33) --[[ Line: 153 ]]
    -- upvalues: v5 (copy)
    return {
        closeOverlay = function() --[[ Line: 155 ]] --[[ Name: closeOverlay ]]
            -- upvalues: v33 (copy), v5 (ref)
            return v33(v5());
        end
    };
end)(v12);
return (l_RoactServices_0.connect({
    analytics = v7
})(v12));