local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v6 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local v7 = require(l_script_FirstAncestor_0.ChromeShared.Hooks.useMappedSignal);
local v8 = require(l_script_FirstAncestor_0.Integrations.Party.usePartyIcon);
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local l_MappedSignal_0 = v6.MappedSignal;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_UnibarStyle_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).UnibarStyle;
local v13 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.SubMenuContext);
local v14 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local l_InExperienceAppChatModal_0 = v14.App.InExperienceAppChatModal;
local l_getAppChatNavbarItemConfig_0 = v14.Utils.getAppChatNavbarItemConfig;
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v19 = l_getAppChatNavbarItemConfig_0();
local l_off_0 = v19.icon.off;
local l_on_0 = v19.icon.on;
local v22 = {
    integrationId = "", 
    shouldShowCustomBadge = true, 
    isSquadIndicatorEnabled = false
};
return function(v23) --[[ Line: 51 ]] --[[ Name: ConnectIcon ]]
    -- upvalues: v2 (copy), v22 (copy), l_useTokens_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v5 (copy), v4 (copy), l_InExperienceAppChatModal_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_MappedSignal_0 (copy), v7 (copy), v8 (copy), l_on_0 (copy), l_off_0 (copy), v13 (copy), v3 (copy)
    local v24 = v2.Dictionary.union(v22, v23);
    local v25 = l_useTokens_0();
    local _ = nil;
    local v27 = nil;
    v27 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_SIZE else v5.ICON_SIZE;
    local v28, v29 = v4.useState(l_InExperienceAppChatModal_0.default.unreadCount);
    if v24.shouldShowCustomBadge then
        v4.useEffect(function() --[[ Line: 66 ]]
            -- upvalues: l_InExperienceAppChatModal_0 (ref), v29 (copy)
            local v31 = l_InExperienceAppChatModal_0.default.unreadCountSignal.Event:Connect(function(v30) --[[ Line: 67 ]]
                -- upvalues: v29 (ref)
                v29(v30);
            end);
            return function() --[[ Line: 70 ]]
                -- upvalues: v31 (copy)
                v31:Disconnect();
            end;
        end, {
            v29
        });
    else
        v28 = 0;
    end;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    if v24.isSquadIndicatorEnabled then
        local v35, v36 = v4.useState(l_InExperienceAppChatModal_0.default.currentSquadId);
        v32 = v35;
        v33 = v36;
    end;
    v4.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v24 (copy), l_InExperienceAppChatModal_0 (ref), v33 (ref)
        if v24.isSquadIndicatorEnabled then
            local v38 = l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v37) --[[ Line: 87 ]]
                -- upvalues: v33 (ref)
                v33(v37);
            end);
            return function() --[[ Line: 91 ]]
                -- upvalues: v38 (copy)
                v38:Disconnect();
            end;
        else
            return function() --[[ Line: 95 ]]

            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v24.isSquadIndicatorEnabled, 
        v33
    } else l_dependencyArray_0(v24.isSquadIndicatorEnabled, v33));
    if v24.isSquadIndicatorEnabled then
        if v32 ~= "" then
            v34 = v25.Color.System.Success;
        elseif v28 > 0 then
            v34 = v25.Color.System.Contrast;
        end;
    end;
    local v39 = if v24.isSquadIndicatorEnabled then v34 else v28 > 0;
    local v41 = l_MappedSignal_0.new(l_InExperienceAppChatModal_0.default.visibilitySignal.Event, function(_) --[[ Line: 112 ]]
        -- upvalues: l_InExperienceAppChatModal_0 (ref)
        return l_InExperienceAppChatModal_0:getVisible();
    end);
    local v42 = v7(v41);
    local v43 = v8(v27, 24, if v42 then l_on_0 else l_off_0);
    local v44 = v4.useContext(v13);
    local function _(v45) --[[ Line: 120 ]] --[[ Name: getTransparency ]]
        -- upvalues: v44 (copy)
        if v44 then
            return (v44:map(function(v46) --[[ Line: 122 ]]
                -- upvalues: v45 (copy)
                return v45 + (1 - v45) * (1 - v46);
            end));
        else
            return v45;
        end;
    end;
    local l_createElement_0 = v4.createElement;
    local l_View_0 = v3.View;
    local v50 = {
        Size = UDim2.new(0, v27, 0, v27)
    };
    local v51 = {};
    local l_createElement_1 = v4.createElement;
    local l_Image_0 = v3.Image;
    local v55 = {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = v43.size:map(function(v54) --[[ Line: 134 ]]
            return UDim2.fromOffset(v54, v54);
        end)
    };
    local v56;
    if v43.image.backgroundColor then
        v56 = {
            Color3 = v43.image.backgroundColor
        };
        local v57;
        if v44 then
            local v58 = 0;
            v57 = v44:map(function(v59) --[[ Line: 122 ]]
                -- upvalues: v58 (copy)
                return v58 + (1 - v58) * (1 - v59);
            end);
        else
            v57 = 0;
        end;
        v56.Transparency = v57;
    else
        v56 = v25.Color.None;
    end;
    v55.backgroundStyle = v56;
    v55.cornerRadius = UDim.new(0, v25.Radius.Circle);
    v55.Image = v43.image.thumbnail;
    v56 = {
        Color3 = v25.Color.Content.Emphasis.Color3
    };
    local l_Transparency_0 = v25.Color.Content.Emphasis.Transparency;
    local l_l_Transparency_0_0 = l_Transparency_0 --[[ copy: 25 -> 28 ]];
    v56.Transparency = if v44 then v44:map(function(v62) --[[ Line: 122 ]]
        -- upvalues: l_l_Transparency_0_0 (copy)
        return l_l_Transparency_0_0 + (1 - l_l_Transparency_0_0) * (1 - v62);
    end) else l_Transparency_0;
    v55.imageStyle = v56;
    v51.Icon = l_createElement_1(l_Image_0, v55);
    if v39 then
        l_createElement_1 = v4.createElement;
        l_Image_0 = v3.View;
        v55 = {
            Position = UDim2.new(1, -v25.Stroke.Thicker, 0, v25.Stroke.Thicker)
        };
        if v24.isSquadIndicatorEnabled then
            v56 = {
                Color3 = v34.Color3
            };
            l_Transparency_0 = v34.Transparency;
            local l_l_Transparency_0_1 = l_Transparency_0 --[[ copy: 25 -> 30 ]];
            v56.Transparency = if v44 then v44:map(function(v64) --[[ Line: 122 ]]
                -- upvalues: l_l_Transparency_0_1 (copy)
                return l_l_Transparency_0_1 + (1 - l_l_Transparency_0_1) * (1 - v64);
            end) else l_Transparency_0;
        else
            v56 = {
                Color3 = v25.Color.System.Contrast.Color3
            };
            l_Transparency_0 = v25.Color.System.Contrast.Transparency;
            local l_l_Transparency_0_2 = l_Transparency_0 --[[ copy: 25 -> 29 ]];
            v56.Transparency = if v44 then v44:map(function(v66) --[[ Line: 122 ]]
                -- upvalues: l_l_Transparency_0_2 (copy)
                return l_l_Transparency_0_2 + (1 - l_l_Transparency_0_2) * (1 - v66);
            end) else l_Transparency_0;
        end;
        v55.backgroundStyle = v56;
        v56 = {
            Color = v25.Color.Surface.Surface_0.Color3
        };
        l_Transparency_0 = v25.Color.Surface.Surface_0.Transparency;
        v56.Transparency = if v44 then v44:map(function(v67) --[[ Line: 122 ]]
            -- upvalues: l_Transparency_0 (copy)
            return l_Transparency_0 + (1 - l_Transparency_0) * (1 - v67);
        end) else l_Transparency_0;
        v56.Thickness = v25.Stroke.Thicker;
        v55.stroke = v56;
        v55.tag = "anchor-top-right radius-circle size-200 stroke-thicker";
        v55.ZIndex = 2;
        l_createElement_1 = l_createElement_1(l_Image_0, v55);
    else
        l_createElement_1 = nil;
    end;
    v51.Badge = l_createElement_1;
    return l_createElement_0(l_View_0, v50, v51);
end;