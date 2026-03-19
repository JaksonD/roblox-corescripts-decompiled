local v0 = require(script.DeviceOrientationMode);
local v1 = require(script.DeviceTypeEnum);
local v2 = require(script.UiMode);
local v3 = require(script.LoginStatus);
local v4 = require(script.AppPage);
local v5 = require(script.SwitchTab);
local v6 = require(script.CentralOverlayType);
local v7 = require(script.LayoutConfig);
return {
    DeviceOrientationMode = v0, 
    DeviceType = v1, 
    UiMode = v2, 
    LoginStatus = v3, 
    AppPage = v4, 
    SwitchTab = v5, 
    CentralOverlayType = v6, 
    LayoutConfig = v7, 
    MemStorageKeys = require(script.MemStorageKeys), 
    NotificationType = require(script.NotificationType), 
    OtaPatchName = require(script.OtaPatchName), 
    SearchTypes = require(script.SearchTypes)
};