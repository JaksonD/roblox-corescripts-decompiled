local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v8 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_ContactList_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList;
local v10 = require(l_ContactList_0.dependencies);
local v11 = require(l_ContactList_0.Analytics.useAnalytics);
local v12 = require(l_ContactList_0.Analytics.EventNamesEnum);
local l_UIBlox_0 = v10.UIBlox;
local l_RoduxCall_0 = v10.RoduxCall;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v10.getStandardSizeAvatarHeadShotRbxthumb;
local l_teleportToRootPlace_0 = v10.teleportToRootPlace;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useLocalization_0 = v10.Hooks.useLocalization;
local l_useSelector_0 = v10.Hooks.useSelector;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v25 = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
local v26 = {
    callProtocol = v4.CallProtocol.default
};
local function v35(v27) --[[ Line: 56 ]] --[[ Name: formatDuration ]]
    local v28 = math.floor(v27 / 3600);
    local v29 = math.floor(v27 % 3600 / 60);
    local v30 = v27 % 60;
    local v31 = string.format("%02d", v28);
    local v32 = string.format("%02d", v29);
    local v33 = string.format("%02d", v30);
    local _ = "";
    if v28 > 0 then
        return v31 .. ":" .. v32 .. ":" .. v33;
    else
        return v32 .. ":" .. v33;
    end;
end;
local _ = function(v36, _) --[[ Line: 75 ]] --[[ Name: getTextFromCallStatus ]]
    -- upvalues: l_RoduxCall_0 (copy)
    if v36 == l_RoduxCall_0.Enums.Status.Connecting then
        return "Feature.Call.Label.Calling";
    elseif v36 == l_RoduxCall_0.Enums.Status.Teleporting then
        return "Feature.Call.Label.Teleporting";
    elseif v36 == l_RoduxCall_0.Enums.Status.Active then
        return "Feature.Call.Label.RobloxCall";
    elseif v36 == l_RoduxCall_0.Enums.Status.Idle then
        return "Feature.Call.Label.CallEnded";
    else
        error("Invalid status for call bar: " .. v36 .. ".");
        return;
    end;
end;
return function(v39) --[[ Line: 89 ]] --[[ Name: CallBar ]]
    -- upvalues: v3 (copy), v26 (copy), l_useStyle_0 (copy), v11 (copy), v2 (copy), l_useSelector_0 (copy), v25 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_useLocalization_0 (copy), l_RoduxCall_0 (copy), l_teleportToRootPlace_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_SoundGroups_0 (copy), v12 (copy), l_Colors_0 (copy), l_RunService_0 (copy), v35 (copy), v8 (copy), l_ImageSetLabel_0 (copy)
    local v40 = v3.Dictionary.join(v26, v39);
    local v41 = l_useStyle_0();
    local v42 = v11();
    local l_Theme_0 = v41.Theme;
    local l_Font_0 = v41.Font;
    local v45, v46 = v2.useState("00:00");
    local v48 = v2.useCallback(function(v47) --[[ Line: 98 ]]
        if v47.Call.currentCall then
            return v47.Call.currentCall.callId;
        else
            return "";
        end;
    end);
    local v49 = l_useSelector_0(v48);
    local v51 = v2.useCallback(function(v50) --[[ Line: 103 ]]
        if v50.Call.currentCall then
            return v50.Call.currentCall.callerId;
        else
            return "";
        end;
    end);
    local v52 = l_useSelector_0(v51);
    local v54 = v2.useCallback(function(v53) --[[ Line: 108 ]]
        if v53.Call.currentCall then
            return v53.Call.currentCall.calleeId;
        else
            return "";
        end;
    end);
    local v55 = l_useSelector_0(v54);
    local v57 = v2.useCallback(function(v56) --[[ Line: 113 ]]
        if v56.Call.currentCall then
            return v56.Call.currentCall.status;
        else
            return "";
        end;
    end);
    local v58 = l_useSelector_0(v57);
    local v60 = v2.useCallback(function(v59) --[[ Line: 118 ]]
        if v59.Call.currentCall ~= nil then
            return v59.Call.currentCall.instanceId;
        else
            return "";
        end;
    end);
    local v61 = l_useSelector_0(v60);
    local v64 = v2.useCallback(function(v62) --[[ Line: 123 ]]
        -- upvalues: v25 (ref)
        local l_currentCall_0 = v62.Call.currentCall;
        if l_currentCall_0 then
            if v25 == l_currentCall_0.callerId then
                return l_currentCall_0.calleeId;
            else
                return l_currentCall_0.callerId;
            end;
        else
            return nil;
        end;
    end);
    local v65 = l_useSelector_0(v64);
    local v66 = nil;
    if v65 then
        v66 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v65);
    end;
    local l_l_useLocalization_0_0 = l_useLocalization_0;
    local v68 = {};
    local v69;
    if v58 == l_RoduxCall_0.Enums.Status.Connecting then
        v69 = "Feature.Call.Label.Calling";
    elseif v58 == l_RoduxCall_0.Enums.Status.Teleporting then
        v69 = "Feature.Call.Label.Teleporting";
    elseif v58 == l_RoduxCall_0.Enums.Status.Active then
        v69 = "Feature.Call.Label.RobloxCall";
    elseif v58 == l_RoduxCall_0.Enums.Status.Idle then
        v69 = "Feature.Call.Label.CallEnded";
    else
        error("Invalid status for call bar: " .. v58 .. ".");
        v69 = nil;
    end;
    v68.callStatusLabel = v69;
    v68 = l_l_useLocalization_0_0(v68).callStatusLabel;
    v69 = false;
    if v58 == l_RoduxCall_0.Enums.Status.Idle then
        v69 = game.JobId == v61;
    end;
    local v70 = true;
    if v58 ~= l_RoduxCall_0.Enums.Status.Active then
        v70 = true;
        if v58 ~= l_RoduxCall_0.Enums.Status.Connecting then
            v70 = true;
            if v58 ~= l_RoduxCall_0.Enums.Status.Teleporting then
                v70 = v69;
            end;
        end;
    end;
    local v72 = v2.useCallback(function() --[[ Line: 154 ]]
        -- upvalues: v69 (copy), l_teleportToRootPlace_0 (ref), v58 (copy), l_RoduxCall_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v40 (copy), v49 (copy), v42 (copy), v12 (ref), v52 (copy), v55 (copy)
        local v71 = false;
        if v69 then
            l_teleportToRootPlace_0();
            v71 = true;
        elseif v58 == l_RoduxCall_0.Enums.Status.Active then
            l_SoundManager_0:PlaySound(l_Sounds_0.HangUp.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
            v40.callProtocol:finishCall(v49);
        elseif v58 == l_RoduxCall_0.Enums.Status.Connecting or v58 == l_RoduxCall_0.Enums.Status.Teleporting then
            v40.callProtocol:cancelCall(v49);
        end;
        v42.fireEvent(v12.CallBarHangUpClicked, {
            eventTimestampMs = os.time() * 1000, 
            callerUserId = v52, 
            calleeUserId = v55, 
            callId = v49, 
            callStatus = v58, 
            isRetry = v71
        });
    end, {
        v58, 
        v40.callProtocol, 
        v69
    });
    local v73 = if v69 then v41.Theme.SystemPrimaryDefault else v41.Theme.Alert;
    local v74 = v69 and "rbxassetid://15123605982" or "rbxassetid://15239778319";
    local v75 = if v69 then l_Colors_0.Slate else l_Colors_0.White;
    v2.useEffect(function() --[[ Line: 180 ]]
        -- upvalues: l_RunService_0 (ref), v40 (copy), v35 (ref), v46 (copy)
        local v78 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 181 ]]
            -- upvalues: v40 (ref), v35 (ref), v46 (ref)
            if v40.activeUtc == 0 then
                return;
            else
                local v76 = math.max(0, os.time() - v40.activeUtc / 1000);
                local v77 = v35(v76);
                v46(v77);
                return;
            end;
        end);
        return function() --[[ Line: 194 ]]
            -- upvalues: v78 (copy)
            v78:Disconnect();
        end;
    end, {
        v40.activeUtc
    });
    local v79 = v8.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v65))
        }, 
        query = v8.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v82 = v2.useCallback(function(v80) --[[ Line: 204 ]]
        -- upvalues: v25 (ref)
        local l_currentCall_1 = v80.Call.currentCall;
        if l_currentCall_1 then
            if v25 == l_currentCall_1.callerId then
                return l_currentCall_1.calleeCombinedName or "";
            else
                return l_currentCall_1.callerCombinedName or "";
            end;
        else
            return "";
        end;
    end);
    local v83 = l_useSelector_0(v82);
    local v84 = "";
    if v79.data then
        v84 = v8.Selectors.getCombinedNameFromId(v79.data, v65);
    elseif v79.error then
        v84 = v83;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromOffset(v40.size.X, v40.size.Y), 
        Position = v40.position, 
        AnchorPoint = Vector2.new(0, 0), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        BorderSizePixel = 0
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 8), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 4), 
            PaddingTop = UDim.new(0, 4), 
            PaddingRight = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 4)
        }), 
        ProfileImage = v2.createElement(l_ImageSetLabel_0, {
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.fromOffset(36, 36), 
            Image = v66, 
            LayoutOrder = 1
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        Content = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, -88, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            DisplayName = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 22), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.CaptionHeader.Font, 
                LayoutOrder = 1, 
                Text = v84, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            DetailsText = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.Footer.Font, 
                LayoutOrder = 2, 
                Text = if v58 == l_RoduxCall_0.Enums.Status.Active then v45 else v68, 
                TextColor3 = l_Colors_0.White, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                TextTransparency = 0.4, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        ActionButton = if v58 ~= l_RoduxCall_0.Enums.Status.Failed then v2.createElement("ImageButton", {
            Position = UDim2.fromOffset(0, 0), 
            Active = v70, 
            AnchorPoint = Vector2.new(1, 1), 
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(36, 36), 
            BackgroundTransparency = v73.Transparency, 
            BackgroundColor3 = v73.Color, 
            BorderSizePixel = 0, 
            Image = v74, 
            ImageColor3 = v75, 
            [v2.Event.Activated] = v72
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 36)
            })
        }) else nil
    });
end;