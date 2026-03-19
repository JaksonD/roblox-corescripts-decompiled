return {
    getButtonTextOverrideConfig = function() --[[ Line: 2 ]] --[[ Name: getButtonTextOverrideConfig ]]
        return {
            TextWrapped = true, 
            AutomaticSize = Enum.AutomaticSize.XY
        };
    end, 
    getSmallIconButtonTextOverrideConfig = function(v0) --[[ Line: 8 ]] --[[ Name: getSmallIconButtonTextOverrideConfig ]]
        return {
            TextWrapped = true, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(0.7, 0, 0, 0), 
            TextSize = v0.Global.FontSize_75, 
            TextXAlignment = Enum.TextXAlignment.Left
        };
    end, 
    getSmallButtonSize = function(v1) --[[ Line: 17 ]] --[[ Name: getSmallButtonSize ]]
        return UDim2.new(0.5, 0, 0, v1.Global.Size_500);
    end, 
    START_DISCOVERY = "{\"magicLoginActionKey\" : \"startDiscovery\"}", 
    STOP_DISCOVERY = "{\"magicLoginActionKey\" : \"stopDiscovery\"}", 
    START_ADVERTISEMENT = "{\"magicLoginActionKey\" : \"startAdvertisement\"}", 
    STOP_ADVERTISEMENT = "{\"magicLoginActionKey\" : \"stopAdvertisement\"}", 
    ENDPOINT_FOUND = "endpointFound", 
    ENDPOINT_LOST = "endpointLost", 
    REQUEST_CONNECTION = "requestConnection", 
    CONNECTION_INIT = "connectionInit", 
    CLEAR_DEVICE_LIST = "clearDeviceList"
};