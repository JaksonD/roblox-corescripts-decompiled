local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotificationsCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.type);
local v6 = require(l_script_FirstAncestor_0.constants);
local v7 = game:DefineFastFlag("FFlagLuaAppFixToastNotificationClosePosition", false);
return {
    calculateToastPosition = function(v8, v9, v10) --[[ Line: 67 ]]
        -- upvalues: v7 (copy), l_GuiService_0 (copy)
        local v11 = 60;
        if v7 and l_GuiService_0 then
            v11 = l_GuiService_0:GetGuiInset().Y + 20;
        end;
        if v8 then
            if v9 then
                return {
                    positionX = 1, 
                    positionXOffset = -20, 
                    positionY = 0, 
                    positionYOffset = v10, 
                    anchorX = 1, 
                    anchorY = 0
                };
            else
                return {
                    positionX = 0.5, 
                    positionXOffset = 0, 
                    positionY = 0, 
                    positionYOffset = v10, 
                    anchorX = 0.5, 
                    anchorY = 0
                };
            end;
        elseif v9 then
            return {
                positionX = 1, 
                positionXOffset = 20, 
                positionY = 0, 
                positionYOffset = v10, 
                anchorX = 0, 
                anchorY = 0
            };
        else
            return {
                positionX = 0.5, 
                positionXOffset = 0, 
                positionY = 0, 
                positionYOffset = if v7 then v11 * -1 else -50, 
                anchorX = 0.5, 
                anchorY = 1
            };
        end;
    end, 
    getDeviceOrientation = function(v12) --[[ Line: 22 ]]
        -- upvalues: v5 (copy)
        if v12.X > v12.Y then
            return v5.DeviceOrientationEnum.Landscape;
        else
            return v5.DeviceOrientationEnum.Portrait;
        end;
    end, 
    getNotificationSize = function(v13, v14) --[[ Line: 28 ]]
        -- upvalues: v6 (copy)
        if v14 < v6.FullWidthDeviceThreshold then
            return UDim2.new(0, v14 - 24, 0, 0);
        elseif v13 then
            if v14 < v6.CompactCardThreashold then
                return UDim2.new(0, v6.InExperienceToastWidth, 0, 0);
            else
                return UDim2.new(0, v6.InAppToastWidth, 0, 0);
            end;
        else
            return UDim2.new(0, v6.InAppToastWidth, 0, 0);
        end;
    end, 
    marshalStreamNotificationData = function(v15, _) --[[ Line: 42 ]]
        local v17 = {
            currentState = v15.content.currentState, 
            notificationType = v15.content.notificationType, 
            id = v15.id
        };
        if v15.content.states then
            local v18 = v15.content.states[v15.content.currentState];
            v17.state = {
                layoutKey = v18.layoutKey, 
                name = v18.name, 
                visualItems = v18.visualItems
            };
        end;
        return v17;
    end, 
    isToastToRight = function(v19) --[[ Line: 63 ]]
        -- upvalues: v5 (copy)
        if v19 == v5.DeviceOrientationEnum.Landscape then
            return true;
        else
            return false;
        end;
    end, 
    isDesktopDevice = function() --[[ Line: 141 ]]
        -- upvalues: l_UserInputService_0 (copy)
        local l_None_0 = Enum.Platform.None;
        pcall(function() --[[ Line: 143 ]]
            -- upvalues: l_None_0 (ref), l_UserInputService_0 (ref)
            l_None_0 = l_UserInputService_0:GetPlatform();
        end);
        local v21 = true;
        if l_None_0 ~= Enum.Platform.Windows then
            v21 = true;
            if l_None_0 ~= Enum.Platform.OSX then
                v21 = l_None_0 == Enum.Platform.UWP;
            end;
        end;
        return v21;
    end, 
    fireEvent = function(v22, v23, v24, v25) --[[ Line: 121 ]]
        -- upvalues: v6 (copy), v4 (copy)
        local v26 = {
            streamContext = "InApp"
        };
        if v24 == nil or v24 == "" then
            v24 = v6.NotificationsClientEventNameDefault;
        end;
        v22.sendEventDeferred(v23, v24, v4.Dictionary.join(v25, v26));
    end
};