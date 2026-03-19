local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_SoundService_0 = game:GetService("SoundService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_t_0 = v4.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Components.DropDownSelection);
local v9 = require(l_Parent_0.Components.ThemedTextLabel);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v11 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v12 = l_Roact_0.PureComponent:extend("DeviceSelectionEntry");
local l_Flags_0 = l_Parent_0.Flags;
local v14 = require(l_Flags_0.GetFFlagTruncateDeviceSelection);
local v15 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
v12.DeviceType = {
    Input = "Input", 
    Output = "Output"
};
v12.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    deviceType = l_t_0.string, 
    isMenuOpen = l_t_0.boolean, 
    canOpen = l_t_0.optional(l_t_0.boolean), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean)
});
v12.defaultProps = {
    canOpen = true
};
v12.init = function(v16) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: l_default_0 (copy), l_SoundService_0 (copy), v15 (copy), v11 (copy)
    v16:setState({
        deviceNames = {}, 
        deviceGuids = {}, 
        selectedIndex = 0, 
        ready = false
    });
    l_default_0:asyncInit():andThen(function() --[[ Line: 50 ]]
        -- upvalues: v16 (copy), l_default_0 (ref), l_SoundService_0 (ref)
        v16:setState({
            ready = true
        });
        l_default_0:SetupParticipantListeners();
        if l_SoundService_0.DeviceListChanged then
            l_SoundService_0.DeviceListChanged:Connect(function() --[[ Line: 56 ]]
                -- upvalues: v16 (ref)
                if v16.props.isMenuOpen then
                    v16:pollDevices(v16.props.deviceType);
                end;
            end);
        end;
    end):catch(function() --[[ Line: 63 ]]
        -- upvalues: v15 (ref), v11 (ref)
        if v15() then
            v11:warning("Failed to init VoiceChatServiceManager");
        end;
    end);
end;
v12.render = function(v17) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v9 (copy), v12 (copy), v8 (copy), v14 (copy), l_default_0 (copy)
    if not v17.state.ready or v17.state.deviceNames == nil or #v17.state.deviceNames == 0 then
        return nil;
    else
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 120), 
            BackgroundTransparency = 1, 
            LayoutOrder = v17.props.LayoutOrder, 
            ZIndex = 2
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            InputLabel = l_Roact_0.createElement(v9, {
                fontKey = "Body", 
                themeKey = "TextDefault", 
                Size = UDim2.new(1, 0, 0, 56), 
                Position = UDim2.new(0, 0, 0, 0), 
                AnchorPoint = Vector2.new(0, 0), 
                Text = v17.props.deviceType == v12.DeviceType.Input and "Input Device" or "Output Device", 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Dropdown = l_Roact_0.createElement(v8, {
                Size = UDim2.new(1, 0, 0, 44), 
                Position = UDim2.new(0, 0, 0, 56), 
                truncate = v14(), 
                selections = v17.state.deviceNames, 
                selectedIndex = v17.state.selectedIndex, 
                placeHolderText = "", 
                enabled = true, 
                localize = false, 
                selectionParentName = v17.props.deviceType .. "DeviceSelectionEntryDropdown", 
                canOpen = v17.props.canOpen, 
                canCaptureFocus = v17.props.canCaptureFocus, 
                selectionChanged = function(v18) --[[ Line: 107 ]] --[[ Name: selectionChanged ]]
                    -- upvalues: l_default_0 (ref), v17 (copy)
                    l_default_0:SwitchDevice(v17.props.deviceType, v17.state.deviceNames[v18], v17.state.deviceGuids[v18]);
                    v17:setState({
                        selectedIndex = v18
                    });
                end
            })
        });
    end;
end;
v12.pollDevices = function(v19, v20) --[[ Line: 122 ]] --[[ Name: pollDevices ]]
    -- upvalues: l_default_0 (copy), v15 (copy), v11 (copy)
    spawn(function() --[[ Line: 123 ]]
        -- upvalues: l_default_0 (ref), v20 (copy), v19 (copy), v15 (ref), v11 (ref)
        local l_l_default_0_Devices_0, v22, v23, v24 = l_default_0:GetDevices(v20);
        if l_l_default_0_Devices_0 then
            v19:setState({
                deviceNames = v22, 
                deviceGuids = v23, 
                selectedIndex = v24
            });
            return;
        else
            if v15() then
                v11:warning("Errors in get {} Device info", v20);
            end;
            v19:setState({
                deviceNames = {}, 
                deviceGuids = {}, 
                selectedIndex = 0
            });
            return;
        end;
    end);
end;
v12.willUpdate = function(v25, v26) --[[ Line: 144 ]] --[[ Name: willUpdate ]]
    if not v25.props.isMenuOpen and v26.isMenuOpen then
        v25:pollDevices(v26.deviceType);
    end;
end;
return v12;