local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v10 = require(l_ContactList_0.Actions.OpenOrUpdateDialog);
local v11 = require(l_ContactList_0.dependencies);
local l_UIBlox_0 = v11.UIBlox;
local l_useSelector_0 = v11.Hooks.useSelector;
local l_useDispatch_0 = v11.Hooks.useDispatch;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v18 = require(l_ContactList_0.Enums.ErrorType);
local v19 = require(l_ContactList_0.Actions.CloseDialog);
local v20 = require(l_ContactList_0.Analytics.useAnalytics);
local v21 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v22 = game:DefineFastFlag("EnablePlatformNotSupportedError", false);
local v23 = {
    callProtocol = v6.CallProtocol.default
};
return function(v24) --[[ Line: 44 ]] --[[ Name: CallDialogContainer ]]
    -- upvalues: v5 (copy), v23 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v20 (copy), v3 (copy), l_useSelector_0 (copy), v6 (copy), v18 (copy), v10 (copy), v8 (copy), v21 (copy), v22 (copy), l_RunService_0 (copy), v4 (copy), l_CoreGui_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), v19 (copy)
    local v25 = v5.Dictionary.join(v23, v24);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v27 = l_useDispatch_0();
    local v28 = v20();
    local v29, v30 = v3.useState(Vector2.new(0, 0));
    local v34 = l_useSelector_0(function(v31) --[[ Line: 55 ]]
        return v31.Dialog.title;
    end, function(v32, v33) --[[ Line: 57 ]]
        return v32 == v33;
    end);
    local v38 = l_useSelector_0(function(v35) --[[ Line: 61 ]]
        return v35.Dialog.bodyText;
    end, function(v36, v37) --[[ Line: 63 ]]
        return v36 == v37;
    end);
    local v42 = l_useSelector_0(function(v39) --[[ Line: 67 ]]
        return v39.Dialog.dismissCallback;
    end, function(v40, v41) --[[ Line: 69 ]]
        return v40 == v41;
    end);
    local v46 = l_useSelector_0(function(v43) --[[ Line: 73 ]]
        return v43.Dialog.isOpen;
    end, function(v44, v45) --[[ Line: 75 ]]
        return v44 == v45;
    end);
    v3.useEffect(function() --[[ Line: 79 ]]
        -- upvalues: v25 (copy), v6 (ref), v18 (ref), v27 (copy), v10 (ref), v8 (ref), v28 (copy), v21 (ref), v22 (ref), l_RunService_0 (ref)
        local v49 = v25.callProtocol:listenToHandleCallMessage(function(v47) --[[ Line: 80 ]]
            -- upvalues: v6 (ref), v18 (ref), v27 (ref), v10 (ref), v8 (ref), v28 (ref), v21 (ref), v22 (ref), l_RunService_0 (ref)
            if v47.messageType == v6.Enums.MessageType.CallError.rawValue() then
                if v47.errorType == v18.CallerIsInAnotherCall then
                    v27(v10(v8:FormatByKey("Feature.Call.Error.Title.CouldntMakeCall"), v8:FormatByKey("Feature.Call.Error.Description.AlreadyInCall")));
                elseif v47.errorType == v18.CalleeIsInAnotherCall then
                    local l_calleeCombinedName_0 = v47.callInfo.calleeCombinedName;
                    v27(v10(v8:FormatByKey("Feature.Call.Error.Title.FriendBusy"), v8:FormatByKey("Feature.Call.Error.Description.FriendBusy", {
                        calleeCombinedName = l_calleeCombinedName_0
                    })));
                elseif v47.errorType == v18.UniverseIsNotVoiceEnabled or v47.errorType == v18.PlaceIsNotVoiceEnabled then
                    v27(v10(v8:FormatByKey("Feature.Call.Error.Title.ExperienceError"), v8:FormatByKey("Feature.Call.Description.ExperienceError")));
                    v28.fireEvent(v21.PhoneBookCallFriendFailed, {
                        eventTimestampMs = os.time() * 1000, 
                        calleeUserId = v47.callInfo.calleeId, 
                        callerUserId = v47.callInfo.callerId, 
                        errorMsg = "Universe or place is not voice enabled."
                    });
                elseif v47.errorType == v18.CallerIsNotVoiceEnabled then
                    v27(v10(v8:FormatByKey("Feature.Call.Modal.EnableChatVoiceTitle"), v8:FormatByKey("Feature.Call.Modal.EnableChatVoiceBody")));
                    v28.fireEvent(v21.PhoneBookCallFriendFailed, {
                        eventTimestampMs = os.time() * 1000, 
                        calleeUserId = v47.callInfo.calleeId, 
                        callerUserId = v47.callInfo.callerId, 
                        errorMsg = "User is not voice enabled."
                    });
                else
                    v27(v10(v8:FormatByKey("Feature.Call.Error.Label.OhNo"), v8:FormatByKey("Feature.Call.Error.Description.Generic")));
                end;
                if v47.errorType == v18.UniverseAgeIsNotValid then
                    warn("Experience must be at least one week old to place a call");
                    return;
                elseif v47.errorType == v18.ReservedServerAccessCodeIsNotProvided then
                    warn("Reserved server access code was not provided via OnCallInviteInvoked callback");
                    return;
                elseif v22 and v47.errorType == v18.PlatformIsNotSupported and l_RunService_0:IsStudio() then
                    warn("Roblox Studio requires Team Test to place a call.");
                end;
            end;
        end);
        return function() --[[ Line: 155 ]]
            -- upvalues: v49 (copy)
            v49:Disconnect();
        end;
    end, {
        v25.callProtocol
    });
    return v3.createElement(v4.Portal, {
        target = l_CoreGui_0
    }, {
        CallDialogScreen = v3.createElement("ScreenGui", {
            Enabled = v46, 
            IgnoreGuiInset = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            DisplayOrder = 8, 
            [v3.Change.AbsoluteSize] = function(v50) --[[ Line: 170 ]]
                -- upvalues: v30 (copy)
                v30(v50.AbsoluteSize);
            end
        }, {
            Overlay = v3.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = ""
            }), 
            CallDialog = v3.createElement(l_InteractiveAlert_0, {
                screenSize = v29, 
                title = v34, 
                bodyText = v38, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                text = v8:FormatByKey("InGame.CommonUI.Button.Ok"), 
                                onActivated = function() --[[ Line: 192 ]] --[[ Name: onActivated ]]
                                    -- upvalues: v42 (copy), v27 (copy), v19 (ref)
                                    if v42 then
                                        v42();
                                    end;
                                    v27(v19());
                                end
                            }
                        }
                    }
                }
            })
        })
    });
end;