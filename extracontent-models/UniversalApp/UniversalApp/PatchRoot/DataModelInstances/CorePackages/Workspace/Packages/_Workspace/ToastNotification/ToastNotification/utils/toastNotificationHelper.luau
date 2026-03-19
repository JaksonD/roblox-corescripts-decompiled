local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.type);
local v4 = require(l_Parent_0.constants);
local v5 = require(l_Parent_0.dependencies);
local v6 = require(l_Parent_0.Logger);
local l_Cryo_0 = v5.Cryo;
local l_TimeTrigger_0 = v5.ToastNotificationProtocolEnums.TimeTrigger;
local function v10(v9) --[[ Line: 21 ]]
    -- upvalues: v3 (copy)
    if v9.X > v9.Y then
        return v3.DeviceOrientationEnum.Landscape;
    else
        return v3.DeviceOrientationEnum.Portrait;
    end;
end;
local function v13(v11, v12) --[[ Line: 27 ]]
    -- upvalues: v4 (copy)
    if v12 < v4.FullWidthDeviceThreshold then
        return UDim2.new(0, v12 - 24, 0, 0);
    elseif v11 then
        if v12 < v4.CompactCardThreashold then
            return UDim2.new(0, v4.InExperienceToastWidth, 0, 0);
        else
            return UDim2.new(0, v4.InAppToastWidth, 0, 0);
        end;
    else
        return UDim2.new(0, v4.InAppToastWidth, 0, 0);
    end;
end;
local function _(v14, v15) --[[ Line: 41 ]]
    if v14 then
        table.insert(v14, v15);
        return v14;
    else
        return {
            v15
        };
    end;
end;
local function _(v17) --[[ Line: 53 ]]
    if v17.button ~= nil then
        return "button";
    elseif v17.textBody ~= nil then
        return "textBody";
    elseif v17.thumbnail ~= nil then
        return "thumbnail";
    elseif v17.metaAction ~= nil then
        return "metaAction";
    elseif v17.singleMetaAction ~= nil then
        return "singleMetaAction";
    else
        return "unknown";
    end;
end;
local function v27(v19) --[[ Line: 68 ]]
    if v19 then
        local v20 = {
            button = nil, 
            textBody = nil, 
            thumbnail = nil, 
            metaAction = nil, 
            singleMetaAction = nil
        };
        for _, v22 in ipairs(v19.visualItems) do
            local v23 = v22.button ~= nil and "button" or v22.textBody ~= nil and "textBody" or v22.thumbnail ~= nil and "thumbnail" or v22.metaAction ~= nil and "metaAction" or v22.singleMetaAction ~= nil and "singleMetaAction" or "unknown";
            if v23 ~= "unknown" then
                local v24 = v20[v23];
                local v25 = v22[v23];
                local v26;
                if v24 then
                    table.insert(v24, v25);
                    v26 = v24;
                else
                    v26 = {
                        v25
                    };
                end;
                v20[v23] = v26;
            end;
        end;
        return {
            layoutKey = v19.layoutKey, 
            name = v19.name, 
            timeOnScreenMs = v19.timeOnScreenMs, 
            visualItems = v20
        };
    else
        return nil;
    end;
end;
local function v30(v28) --[[ Line: 95 ]]
    -- upvalues: v27 (copy)
    local v29 = {
        currentState = v28.content.currentState, 
        notificationType = v28.content.notificationType, 
        id = v28.content.id, 
        priority = v28.content.priority, 
        clientEventsPayload = v28.content.clientEventsPayload, 
        deliverTimestamp = v28.deliverTimestamp, 
        notificationReceivedTimestampMs = v28.notificationReceivedTimestampMs, 
        timers = v28.content.timers, 
        luaNotifInfo = v28.luaNotifInfo
    };
    if v28.content.states then
        v29.state = v27(v28.content.states[v28.content.currentState]);
    end;
    return v29;
end;
local function v32(v31) --[[ Line: 118 ]]
    -- upvalues: v3 (copy)
    if v31 == v3.DeviceOrientationEnum.Landscape then
        return true;
    else
        return false;
    end;
end;
local v33 = {
    positionX = 1, 
    positionXOffset = -5, 
    positionY = 0, 
    anchorX = 1, 
    anchorY = 0
};
local v34 = {
    positionX = 1, 
    positionXOffset = 20, 
    positionY = 0, 
    anchorX = 0, 
    anchorY = 0
};
local v35 = {
    positionX = 0.5, 
    positionXOffset = 0, 
    positionY = 0, 
    anchorX = 0.5, 
    anchorY = 0
};
local v36 = {
    positionX = 0.5, 
    positionXOffset = 0, 
    positionY = 0, 
    anchorX = 0.5, 
    anchorY = 1
};
return {
    calculateToastPosition = function(v37, v38, v39, v40) --[[ Line: 154 ]]
        -- upvalues: l_GuiService_0 (copy), l_Cryo_0 (copy), v33 (copy), v35 (copy), v34 (copy), v36 (copy)
        local v41 = if l_GuiService_0 then l_GuiService_0:GetGuiInset() else Vector2.new(0, 0);
        local v42 = if l_GuiService_0 then v41.Y + 20 else 60;
        if v37 then
            if v38 then
                return l_Cryo_0.Dictionary.union(v33, {
                    positionYOffset = v39
                });
            else
                return l_Cryo_0.Dictionary.union(v35, {
                    positionYOffset = v39 + v41.Y
                });
            end;
        elseif v38 then
            if v40 then
                return l_Cryo_0.Dictionary.union(v33, {
                    positionYOffset = v39
                });
            else
                return l_Cryo_0.Dictionary.union(v34, {
                    positionYOffset = v39
                });
            end;
        elseif v40 then
            return l_Cryo_0.Dictionary.union(v35, {
                positionYOffset = v39 + v41.Y
            });
        else
            return l_Cryo_0.Dictionary.union(v36, {
                positionYOffset = -1 * v42
            });
        end;
    end, 
    calculateTimeRemaining = function(v43, v44, v45) --[[ Line: 243 ]] --[[ Name: calculateTimeRemaining ]]
        -- upvalues: l_TimeTrigger_0 (copy)
        v44 = v44 or DateTime.now().UnixTimestampMillis;
        v45 = v45 or DateTime.now().UnixTimestampMillis;
        local v46 = 0;
        if v43.trigger == l_TimeTrigger_0.OnReceive then
            v46 = v43.timespanMs - (DateTime.now().UnixTimestampMillis - v44);
        elseif v43.trigger == l_TimeTrigger_0.OnDisplay then
            v46 = v43.timespanMs - (DateTime.now().UnixTimestampMillis - v45);
        end;
        return (math.max(v46, 0));
    end, 
    getDeviceOrientation = v10, 
    getNotificationSize = v13, 
    marshalNotificationData = v30, 
    isToastToRight = v32, 
    isDesktopDevice = function() --[[ Line: 197 ]]
        -- upvalues: l_UserInputService_0 (copy)
        local l_None_0 = Enum.Platform.None;
        pcall(function() --[[ Line: 199 ]]
            -- upvalues: l_None_0 (ref), l_UserInputService_0 (ref)
            l_None_0 = l_UserInputService_0:GetPlatform();
        end);
        local v48 = true;
        if l_None_0 ~= Enum.Platform.Windows then
            v48 = true;
            if l_None_0 ~= Enum.Platform.OSX then
                v48 = l_None_0 == Enum.Platform.UWP;
            end;
        end;
        return v48;
    end, 
    getNearestWholeNumber = function(v49) --[[ Line: 210 ]] --[[ Name: getNearestWholeNumber ]]
        if v49 % 1 < 0.5 then
            return (math.floor(v49));
        else
            return (math.ceil(v49));
        end;
    end, 
    getTimerFromCardData = function(v50, v51) --[[ Line: 225 ]] --[[ Name: getTimerFromCardData ]]
        -- upvalues: v6 (copy), l_TimeTrigger_0 (copy)
        if v50 and v50.timers and v50.timers[v51] then
            return v50.timers[v51];
        else
            v6:warning("timerKey {} not found in list of timers. Using default.", v51);
            return {
                timespanMs = 0, 
                trigger = l_TimeTrigger_0.OnDisplay
            };
        end;
    end, 
    fireEvent = function(v52, v53) --[[ Line: 191 ]]
        v52.sendEventDeferred("ToastNotification", "toastNotificationClientEvent", v53);
    end, 
    isUserThumbnail = function(v54) --[[ Line: 262 ]]
        -- upvalues: v3 (copy)
        local v55 = true;
        if v54.idType ~= v3.SENDERThumbnailTypeEnum.User then
            v55 = v54.idType == v3.SENDERThumbnailTypeEnum.AvatarImageUrl;
        end;
        return v55;
    end
};