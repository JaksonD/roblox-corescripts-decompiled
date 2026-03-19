local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.SetDetailsInformation);
local v6 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v7 = require(l_Parent_0.Components.InspectAndBuyContext);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v9 = require(l_Modules_0.Settings.Theme);
local v10 = v2.PureComponent:extend("CloseButton");
v10.render = function(v11) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy), v9 (copy), l_GuiService_0 (copy)
    local l_view_0 = v11.props.view;
    local l_viewingDetails_0 = v11.props.detailsInformation.viewingDetails;
    local l_closeDetails_0 = v11.props.closeDetails;
    local l_setTryingOnInfo_0 = v11.props.setTryingOnInfo;
    return v2.createElement(v7.Consumer, {
        render = function(v16) --[[ Line: 26 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v9 (ref), v2 (ref), l_viewingDetails_0 (copy), l_closeDetails_0 (copy), l_setTryingOnInfo_0 (copy), l_GuiService_0 (ref)
            local v17 = v16[l_view_0];
            local v18 = UDim2.new(0, 0, 0, 0);
            local v19 = 26;
            if v9.UseInspectAndBuyPanel() then
                v19 = 18;
                v18 = UDim2.new(0, v17.BorderPaddingSize, 0, 0);
            end;
            return v2.createElement("ImageButton", {
                Size = UDim2.new(0, v19, 0, v19), 
                Position = v17.CloseButtonPosition + v18, 
                BackgroundTransparency = 1, 
                Selectable = false, 
                Image = l_viewingDetails_0 and "rbxasset://textures/ui/InspectMenu/caret_tail_left.png" or "rbxasset://textures/ui/InspectMenu/x.png", 
                ZIndex = 2, 
                [v2.Event.Activated] = function() --[[ Line: 42 ]]
                    -- upvalues: l_viewingDetails_0 (ref), l_closeDetails_0 (ref), l_setTryingOnInfo_0 (ref), l_GuiService_0 (ref)
                    if l_viewingDetails_0 then
                        l_closeDetails_0();
                        l_setTryingOnInfo_0(false, nil);
                        return;
                    else
                        l_GuiService_0:CloseInspectMenu();
                        return;
                    end;
                end
            });
        end
    });
end;
return v3.UNSTABLE_connect2(function(v20, _) --[[ Line: 55 ]]
    return {
        view = v20.view, 
        detailsInformation = v20.detailsInformation
    };
end, function(v22) --[[ Line: 60 ]]
    -- upvalues: v5 (copy), v6 (copy)
    return {
        closeDetails = function() --[[ Line: 62 ]] --[[ Name: closeDetails ]]
            -- upvalues: v22 (copy), v5 (ref)
            v22(v5(false, nil));
        end, 
        setTryingOnInfo = function(v23, v24) --[[ Line: 65 ]] --[[ Name: setTryingOnInfo ]]
            -- upvalues: v22 (copy), v6 (ref)
            v22(v6(v23, v24));
        end
    };
end)(v10);