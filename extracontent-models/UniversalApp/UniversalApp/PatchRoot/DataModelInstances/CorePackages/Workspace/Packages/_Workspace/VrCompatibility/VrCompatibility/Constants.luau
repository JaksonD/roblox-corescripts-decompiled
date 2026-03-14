local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SharedFlags);
local l_GetFIntMaquettesAppPanelDistanceMultiplierPercentage_0 = v1.GetFIntMaquettesAppPanelDistanceMultiplierPercentage;
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v1.FFlagLuaAppForceVrAppPanelWidthRollout;
local v4 = l_GetFIntMaquettesAppPanelDistanceMultiplierPercentage_0() / 100;
return {
    MainScreenResolution = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then Vector2.new(1120, 900) else Vector2.new(1600, 900), 
    MainScreenSize = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then Vector2.new(3.15, 2.7) * v4 else Vector2.new(4.5, 2.7) * v4, 
    MainScreenCurvature = l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and 0 or 70, 
    MainScreenPosition = Vector3.new(0, 4.8, -4 * v4), 
    AppSystemBarPosition = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then Vector3.new(-2.35 * v4 * 0.7 + -0.4, 4.8, -3.15 * v4 + -1.28) else Vector3.new(-2.35 * v4, 4.8, -3.15 * v4), 
    AppSystemBarSize = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then Vector2.new(0.495, 2.16) * v4 else Vector2.new(0.495, 2.7) * v4, 
    AppSystemBarResolution = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then Vector2.new(64, 288) else Vector2.new(64, 360), 
    CentralOverlayPosition = Vector3.new(0, 4.8, -3.5 * v4), 
    FoundationOverlayPosition = Vector3.new(0, 4.8, -3.9 * v4), 
    ToastSize = Vector2.new(2.5, 1.5), 
    ToastPosition = Vector3.new(0, 3.299999952316284, -2.799999952316284, 0), 
    ToastResolution = Vector2.new(650, 382), 
    ToastCurvature = 50, 
    DefaultCameraPosition = Vector3.new(0, 4.800000190734863, 0, 0), 
    FTUX = {
        UniverseId = "4510252459", 
        PlaceId = "12887241816"
    }, 
    ROUNDED_CORNER_RADIUS = 15, 
    PositionLockedPanelName = "PositionLocked"
};