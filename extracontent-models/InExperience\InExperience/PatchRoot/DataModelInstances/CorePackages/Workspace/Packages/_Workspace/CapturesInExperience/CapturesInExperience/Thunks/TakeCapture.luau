local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v6 = require(l_Parent_0.Enums.CapturesToastType);
local v7 = require(l_Parent_0.Utils.getAvatarAssets);
local v8 = require(l_Parent_0.Utils.getScreenshotHud);
local v9 = require(l_Parent_0.Utils.getUserMetadata);
local l_IXPServiceWrapper_0 = require(l_Parent_1.IXPServiceWrapper).IXPServiceWrapper;
local v11 = require(l_Parent_0.Actions.OverlayActivated);
local v12 = require(l_Parent_0.Actions.OverlayDeactivated);
local v13 = require(l_Parent_0.Actions.OverlayFlashActivated);
local v14 = require(l_Parent_0.Actions.OverlayFlashDeactivated);
local v15 = require(l_Parent_0.Utils.removeCoreUI);
local v16 = require(l_Parent_0.Actions.ToastTriggered);
local l_FStringSocialCaptureTakenIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringSocialCaptureTakenIXPLayer;
local function _(v18) --[[ Line: 23 ]] --[[ Name: hideGui ]]
    -- upvalues: l_GuiService_0 (copy)
    if l_GuiService_0:GetGuiIsVisible(v18) then
        l_GuiService_0:ToggleGuiIsVisibleForCaptures(v18);
    end;
end;
local function _(v20) --[[ Line: 29 ]] --[[ Name: showGui ]]
    -- upvalues: l_GuiService_0 (copy)
    if not l_GuiService_0:GetGuiIsVisible(v20) then
        l_GuiService_0:ToggleGuiIsVisibleForCaptures(v20);
    end;
end;
local function _() --[[ Line: 35 ]] --[[ Name: hidePlayerGui ]]
    -- upvalues: l_GuiService_0 (copy)
    if l_GuiService_0:GetGuiIsVisible(Enum.GuiType.Custom) then
        l_GuiService_0:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom);
    end;
end;
local function _() --[[ Line: 41 ]] --[[ Name: showPlayerGui ]]
    -- upvalues: l_GuiService_0 (copy)
    if not l_GuiService_0:GetGuiIsVisible(Enum.GuiType.Custom) then
        l_GuiService_0:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom);
    end;
end;
return function() --[[ Line: 47 ]]
    -- upvalues: v16 (copy), v6 (copy), l_UserInputService_0 (copy), v8 (copy), l_GuiService_0 (copy), v15 (copy), v11 (copy), l_CaptureService_0 (copy), v7 (copy), v9 (copy), l_HttpService_0 (copy), v13 (copy), v14 (copy), v12 (copy), l_IXPServiceWrapper_0 (copy), l_FStringSocialCaptureTakenIXPLayer_0 (copy)
    return function(v24) --[[ Line: 48 ]]
        -- upvalues: v16 (ref), v6 (ref), l_UserInputService_0 (ref), v8 (ref), l_GuiService_0 (ref), v15 (ref), v11 (ref), l_CaptureService_0 (ref), v7 (ref), v9 (ref), l_HttpService_0 (ref), v13 (ref), v14 (ref), v12 (ref), l_IXPServiceWrapper_0 (ref), l_FStringSocialCaptureTakenIXPLayer_0 (ref)
        local v25 = false;
        local v26 = false;
        v24:dispatch(v16(v6.None));
        local l_OverrideMouseIconBehavior_0 = l_UserInputService_0.OverrideMouseIconBehavior;
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
        local v28 = v8();
        if not v28 or v28.HidePlayerGuiForCaptures then
            if l_GuiService_0:GetGuiIsVisible(Enum.GuiType.Custom) then
                l_GuiService_0:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom);
            end;
            v26 = true;
        end;
        local v29 = nil;
        if not v28 or v28.HideCoreGuiForCaptures then
            v29 = v15();
            v25 = true;
        end;
        local l_CustomBillboards_0 = Enum.GuiType.CustomBillboards;
        if l_GuiService_0:GetGuiIsVisible(l_CustomBillboards_0) then
            l_GuiService_0:ToggleGuiIsVisibleForCaptures(l_CustomBillboards_0);
        end;
        l_CustomBillboards_0 = Enum.GuiType.PlayerNameplates;
        if l_GuiService_0:GetGuiIsVisible(l_CustomBillboards_0) then
            l_GuiService_0:ToggleGuiIsVisibleForCaptures(l_CustomBillboards_0);
        end;
        v24:dispatch(v11());
        l_CaptureService_0:OnCaptureBegan();
        task.wait(0.1);
        l_CustomBillboards_0 = v7();
        local v31 = v9();
        if next(l_CustomBillboards_0) == nil and next(v31) == nil then
            l_CaptureService_0:SaveScreenshotCapture();
        else
            local v32 = {
                avatarItems = if next(l_CustomBillboards_0) ~= nil then l_CustomBillboards_0 else nil, 
                userMetadata = if next(v31) ~= nil then v31 else nil
            };
            l_CaptureService_0:SaveScreenshotCapture(l_HttpService_0:JSONEncode(v32));
        end;
        task.wait();
        v24:dispatch(v13());
        task.wait(0.5);
        l_CaptureService_0:OnCaptureEnded();
        v24:dispatch(v14());
        v24:dispatch(v12());
        l_UserInputService_0.OverrideMouseIconBehavior = l_OverrideMouseIconBehavior_0;
        if v26 and not l_GuiService_0:GetGuiIsVisible(Enum.GuiType.Custom) then
            l_GuiService_0:ToggleGuiIsVisibleForCaptures(Enum.GuiType.Custom);
        end;
        if v25 then
            v29();
        end;
        local l_CustomBillboards_1 = Enum.GuiType.CustomBillboards;
        if not l_GuiService_0:GetGuiIsVisible(l_CustomBillboards_1) then
            l_GuiService_0:ToggleGuiIsVisibleForCaptures(l_CustomBillboards_1);
        end;
        l_CustomBillboards_1 = Enum.GuiType.PlayerNameplates;
        if not l_GuiService_0:GetGuiIsVisible(l_CustomBillboards_1) then
            l_GuiService_0:ToggleGuiIsVisibleForCaptures(l_CustomBillboards_1);
        end;
        l_IXPServiceWrapper_0:LogUserLayerExposure(l_FStringSocialCaptureTakenIXPLayer_0);
    end;
end;