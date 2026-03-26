local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("VideoServerScreen").Parent;
local l_enableAudioPlaybackInApp_0 = require(l_Parent_0.MediaPlayback).enableAudioPlaybackInApp;
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.Roact);
local v8 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local function _(v14) --[[ Line: 21 ]] --[[ Name: setNativeStatusBarHidden ]]
    -- upvalues: l_GuiService_0 (copy), l_HttpService_0 (copy), l_NotificationType_0 (copy)
    l_GuiService_0:BroadcastNotification(l_HttpService_0:JSONEncode({
        hidden = v14
    }), l_NotificationType_0.SET_STATUS_BAR_STYLE);
end;
return function() --[[ Line: 25 ]] --[[ Name: VideoServerScreenContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v8 (copy), l_useAppPolicy_0 (copy), l_NavigateBack_0 (copy), l_GuiService_0 (copy), v6 (copy), l_ExperienceService_0 (copy), l_HttpService_0 (copy), l_NotificationType_0 (copy), l_RunService_0 (copy), l_enableAudioPlaybackInApp_0 (copy), v7 (copy)
    local v16 = l_useNavigation_0();
    local v17 = v16.getParam("placeId");
    local v18 = v16.getParam("launchSource");
    local v19 = v16.getParam("extraParams");
    local v20 = l_useDispatch_0();
    local v21 = v8.useRef(nil);
    local v22 = v8.useRef(nil);
    local v23 = v8.useRef(nil);
    local v24 = v8.useRef(nil);
    local v25 = v8.useRef(nil);
    local v26 = v8.useRef(nil);
    local v27 = v8.useRef(nil);
    local v28 = v8.useRef(nil);
    local v29 = v8.useRef(nil);
    local v30 = v8.useRef(0);
    local v31 = v8.useRef(nil);
    local v32 = v8.useRef(nil);
    local v34 = l_useAppPolicy_0(function(v33) --[[ Line: 49 ]]
        return v33.getThrottleFramerate();
    end);
    local v35 = v8.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v20 (copy), l_NavigateBack_0 (ref)
        v20(l_NavigateBack_0(true));
    end, {
        v20
    });
    local v36 = v8.useCallback(function() --[[ Line: 57 ]]
        -- upvalues: v25 (copy), v26 (copy)
        if v25.current then
            v25.current:Destroy();
            v25.current = nil;
        end;
        if v26.current then
            v26.current:Destroy();
            v26.current = nil;
        end;
    end, {});
    local v43 = v8.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v21 (copy), v22 (copy), v23 (copy), v24 (copy), v36 (copy), v25 (copy), v26 (copy)
        local l_current_0 = v21.current;
        local l_current_1 = v22.current;
        local l_current_2 = v23.current;
        local l_current_3 = v24.current;
        if not l_current_0 or not l_current_1 or not l_current_2 or not l_current_3 then
            return;
        else
            v36();
            local l_Wire_0 = Instance.new("Wire");
            l_Wire_0.SourceInstance = l_current_1;
            l_Wire_0.TargetInstance = l_current_2;
            l_Wire_0.SourceName = "Output";
            l_Wire_0.TargetName = "Input";
            l_Wire_0.Parent = l_current_0;
            v25.current = l_Wire_0;
            local l_Wire_1 = Instance.new("Wire");
            l_Wire_1.SourceInstance = l_current_1;
            l_Wire_1.TargetInstance = l_current_3;
            l_Wire_1.SourceName = "Output";
            l_Wire_1.TargetName = "Input";
            l_Wire_1.Parent = l_current_0;
            v26.current = l_Wire_1;
            return;
        end;
    end, {
        v36
    });
    local v44 = v8.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: v27 (copy), v28 (copy)
        if v27.current then
            v27.current:Disconnect();
            v27.current = nil;
        end;
        v28.current = nil;
    end, {});
    local v47 = v8.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v44 (copy), v22 (copy), v28 (copy), v27 (copy), v35 (copy)
        v44();
        local l_current_4 = v22.current;
        if not l_current_4 then
            return;
        else
            v28.current = l_current_4.IsConnected;
            v27.current = l_current_4:GetPropertyChangedSignal("IsConnected"):Connect(function() --[[ Line: 108 ]]
                -- upvalues: l_current_4 (copy), v28 (ref), v35 (ref)
                local l_IsConnected_0 = l_current_4.IsConnected;
                if v28.current == true and l_IsConnected_0 == false then
                    v35();
                end;
                v28.current = l_IsConnected_0;
            end);
            return;
        end;
    end, {
        v44, 
        v35
    });
    local v48 = v8.useCallback(function() --[[ Line: 117 ]]
        -- upvalues: v32 (copy)
        if v32.current then
            v32.current:Disconnect();
            v32.current = nil;
        end;
    end, {});
    local v49 = v8.useCallback(function() --[[ Line: 124 ]]
        -- upvalues: v48 (copy), v32 (copy), l_GuiService_0 (ref), v35 (copy)
        v48();
        v32.current = l_GuiService_0.ShowLeaveConfirmation:Connect(function() --[[ Line: 126 ]]
            -- upvalues: v35 (ref)
            v35();
        end);
    end, {
        v48, 
        v35
    });
    local v50 = v8.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: v31 (copy)
        if v31.current then
            task.cancel(v31.current);
            v31.current = nil;
        end;
    end, {});
    local v51 = v8.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v29 (copy), v22 (copy)
        if v29.current then
            if v22.current then
                v22.current:Disconnect();
            end;
            task.cancel(v29.current);
            v29.current = nil;
        end;
    end, {});
    local v57 = v8.useCallback(function() --[[ Line: 149 ]]
        -- upvalues: v22 (copy), v23 (copy), v43 (copy), v17 (copy), v19 (copy), v6 (ref), v51 (copy), v30 (copy), v29 (copy), v18 (copy), l_ExperienceService_0 (ref), v35 (copy), v47 (copy)
        if not v22.current or not v23.current then
            return false;
        else
            v43();
            local l_current_5 = v23.current;
            local v53 = {
                placeId = v17, 
                width = l_current_5.AbsoluteSize.X, 
                height = l_current_5.AbsoluteSize.Y
            };
            if v19 then
                v53 = v6.Dictionary.join(v53, v19);
            end;
            v51();
            local l_v30_0 = v30;
            l_v30_0.current = l_v30_0.current + 1;
            l_v30_0 = v30.current;
            v29.current = task.spawn(function() --[[ Line: 171 ]]
                -- upvalues: v22 (ref), v53 (ref), v30 (ref), l_v30_0 (copy), v29 (ref), v17 (ref), v18 (ref), v19 (ref), v6 (ref), l_ExperienceService_0 (ref), v35 (ref), v47 (ref)
                local v55 = v22.current:ConnectAsync("", v53);
                if v30.current ~= l_v30_0 then
                    return;
                else
                    v29.current = nil;
                    if not v55 then
                        local v56 = {
                            placeId = tonumber(v17), 
                            referralPage = v18
                        };
                        if v19 then
                            v56 = v6.Dictionary.join(v56, v19);
                        end;
                        l_ExperienceService_0:LaunchExperience(v56, v18);
                        v35();
                        return;
                    else
                        v47();
                        return;
                    end;
                end;
            end);
            return true;
        end;
    end, {
        v43, 
        v51, 
        v35, 
        v47, 
        v17, 
        v18, 
        v19
    });
    local v58 = v8.useCallback(function() --[[ Line: 200 ]]
        -- upvalues: v48 (copy), v50 (copy), v51 (copy), v22 (copy), l_GuiService_0 (ref), l_HttpService_0 (ref), l_NotificationType_0 (ref), v44 (copy), v36 (copy), v34 (copy), l_RunService_0 (ref)
        v48();
        v50();
        v51();
        if v22.current then
            v22.current:Disconnect();
        end;
        l_GuiService_0:BroadcastNotification(l_HttpService_0:JSONEncode({
            hidden = false
        }), l_NotificationType_0.SET_STATUS_BAR_STYLE);
        v44();
        v36();
        if v34 then
            l_RunService_0:setThrottleFramerateEnabled(true);
        end;
    end, {
        v48, 
        v50, 
        v51, 
        v44, 
        v36, 
        v34
    });
    v8.useEffect(function() --[[ Line: 222 ]]
        -- upvalues: l_enableAudioPlaybackInApp_0 (ref), v34 (copy), l_RunService_0 (ref), l_GuiService_0 (ref), l_HttpService_0 (ref), l_NotificationType_0 (ref), v49 (copy), v57 (copy), v50 (copy), v31 (copy), v58 (copy)
        l_enableAudioPlaybackInApp_0();
        if v34 then
            l_RunService_0:setThrottleFramerateEnabled(false);
        end;
        l_GuiService_0:BroadcastNotification(l_HttpService_0:JSONEncode({
            hidden = true
        }), l_NotificationType_0.SET_STATUS_BAR_STYLE);
        v49();
        if not v57() then
            v50();
            v31.current = task.defer(function() --[[ Line: 232 ]]
                -- upvalues: v31 (ref), v57 (ref)
                v31.current = nil;
                v57();
            end);
        end;
        return v58;
    end, {
        v49, 
        v57, 
        v50, 
        v58, 
        v34
    });
    return v7.createElement("ScreenGui", {
        DisplayOrder = 200, 
        IgnoreGuiInset = true, 
        ScreenInsets = Enum.ScreenInsets.None, 
        ResetOnSpawn = false, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        VideoServerScreenView = v7.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BorderSizePixel = 0, 
            ref = v21
        }, {
            RealtimeMedia = v7.createElement("RealtimeMedia", {
                ForwardInput = true, 
                ref = v22
            }), 
            VideoDisplay = v7.createElement("VideoDisplay", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                ref = v23
            }), 
            AudioDeviceOutput = v7.createElement("AudioDeviceOutput", {
                ref = v24
            }), 
            InputBlocker = v7.createElement("ImageButton", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = 3, 
                AutoButtonColor = false, 
                Modal = true
            })
        })
    });
end;