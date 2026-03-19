local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Constants);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v8 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailNotificationsButtonHint);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_IconSize_0 = v9.App.ImageSet.Enum.IconSize;
local l_TooltipOrientation_0 = v9.App.Dialog.Enum.TooltipOrientation;
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableNotificationsEDPTooltip);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFIntNotificationsEDPTooltipTimeLimit);
local v16 = l_Images_0["icons/common/notificationOn"];
local v17 = l_Images_0["icons/common/notificationOff"];
return function(v18) --[[ Line: 35 ]]
    -- upvalues: v14 (copy), l_AppStorageService_0 (copy), v4 (copy), v3 (copy), v15 (copy), l_useSelector_0 (copy), v6 (copy), l_IconButton_0 (copy), v16 (copy), v17 (copy), l_IconSize_0 (copy), v8 (copy), l_TooltipOrientation_0 (copy)
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    if v14() then
        local function _() --[[ Line: 38 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 39 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                return l_AppStorageService_0:GetItem("ShowNotificationsOptInTooltip");
            end);
            if l_status_0 then
                return l_result_0 == "true";
            else
                return false;
            end;
        end;
        local l_useRef_0 = v4.useRef;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 39 ]]
            -- upvalues: l_AppStorageService_0 (ref)
            return l_AppStorageService_0:GetItem("ShowNotificationsOptInTooltip");
        end);
        l_useRef_0 = l_useRef_0(if l_status_1 then l_result_1 == "true" else false);
        local v29;
        v29, l_status_1 = v4.useState(l_useRef_0.current);
        v19 = v29;
        v20 = l_status_1;
        v29, l_status_1 = v4.useState(false);
        local l_l_status_1_0 = l_status_1 --[[ copy: 8 -> 11 ]];
        l_result_1 = function() --[[ Line: 53 ]]
            -- upvalues: v20 (ref), l_l_status_1_0 (copy)
            v20(false);
            l_l_status_1_0(true);
        end;
        local l_l_useRef_0_0 = l_useRef_0 --[[ copy: 6 -> 12 ]];
        v4.useEffect(function() --[[ Line: 58 ]]
            -- upvalues: l_l_useRef_0_0 (copy), l_AppStorageService_0 (ref), v3 (ref), v15 (ref), v20 (ref), l_l_status_1_0 (copy)
            if l_l_useRef_0_0.current then
                l_AppStorageService_0:SetItem("ShowNotificationsOptInTooltip", "false");
                l_AppStorageService_0:Flush();
            end;
            v3.delay(v15()):andThen(function() --[[ Line: 64 ]]
                -- upvalues: v20 (ref), l_l_status_1_0 (ref)
                v20(false);
                l_l_status_1_0(true);
            end);
        end, {});
        local v33 = l_useSelector_0(function(v32) --[[ Line: 69 ]]
            return v32.TopBar.statusBarHeight;
        end);
        local l_v29_0 = v29 --[[ copy: 7 -> 13 ]];
        v22 = v4.useCallback(function(v35) --[[ Line: 73 ]]
            -- upvalues: l_l_useRef_0_0 (copy), v33 (copy), v6 (ref), v20 (ref), l_v29_0 (copy)
            if v35 ~= nil and l_l_useRef_0_0.current then
                if v35.AbsolutePosition.Y < v33 + v6.NAV_BAR_SIZE then
                    v20(false);
                    return;
                elseif not l_v29_0 then
                    v20(true);
                end;
            end;
        end, {
            v29
        });
        v21 = v4.useCallback(function() --[[ Line: 88 ]]
            -- upvalues: v20 (ref), l_l_status_1_0 (copy), v18 (copy)
            v20(false);
            l_l_status_1_0(true);
            if v18.toggleFollowExperience then
                v18.toggleFollowExperience();
            end;
        end, {});
    end;
    local v36 = v18.gameFollowings and v18.gameFollowings.isFollowed;
    local l_position_0 = v18.position;
    local l_layoutOrder_0 = v18.layoutOrder;
    local l_anchorPoint_0 = v18.anchorPoint;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        AutomaticSize = if v14() then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0
    }, {
        IconButton = v4.createElement(l_IconButton_0, {
            icon = if v36 then v16 else v17, 
            iconSize = l_IconSize_0.Medium, 
            onActivated = if v14() then v21 else v18.toggleFollowExperience
        }, {
            Tooltip = if v14() then v4.createElement(v8, {
                onPositionChanged = v22, 
                isActive = v19, 
                preferredOrientation = l_TooltipOrientation_0.Top
            }) else nil
        })
    });
end;