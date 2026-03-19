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
local v12 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.UnibarStyle);
local v13 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.SubMenuContext);
local v14 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local l_InExperienceAppChatModal_0 = v14.App.InExperienceAppChatModal;
local l_getAppChatNavbarItemConfig_0 = v14.Utils.getAppChatNavbarItemConfig;
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local v18 = l_getAppChatNavbarItemConfig_0();
local l_off_0 = v18.icon.off;
local l_on_0 = v18.icon.on;
local v21 = {
    integrationId = "", 
    shouldShowCustomBadge = true, 
    isSquadIndicatorEnabled = false
};
return function(v22) --[[ Line: 48 ]] --[[ Name: ConnectIcon ]]
    -- upvalues: v2 (copy), v21 (copy), l_useTokens_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v12 (copy), v5 (copy), v4 (copy), l_InExperienceAppChatModal_0 (copy), l_dependencyArray_0 (copy), l_MappedSignal_0 (copy), v7 (copy), v8 (copy), l_on_0 (copy), l_off_0 (copy), v13 (copy), v3 (copy)
    local v23 = v2.Dictionary.union(v21, v22);
    local v24 = l_useTokens_0();
    local _ = nil;
    local v26 = nil;
    v26 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then v12.use().ICON_SIZE else v5.ICON_SIZE;
    local v27, v28 = v4.useState(l_InExperienceAppChatModal_0.default.unreadCount);
    if v23.shouldShowCustomBadge then
        v4.useEffect(function() --[[ Line: 63 ]]
            -- upvalues: l_InExperienceAppChatModal_0 (ref), v28 (copy)
            local v30 = l_InExperienceAppChatModal_0.default.unreadCountSignal.Event:Connect(function(v29) --[[ Line: 64 ]]
                -- upvalues: v28 (ref)
                v28(v29);
            end);
            return function() --[[ Line: 67 ]]
                -- upvalues: v30 (copy)
                v30:Disconnect();
            end;
        end, {
            v28
        });
    else
        v27 = 0;
    end;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    if v23.isSquadIndicatorEnabled then
        local v34, v35 = v4.useState(l_InExperienceAppChatModal_0.default.currentSquadId);
        v31 = v34;
        v32 = v35;
    end;
    v4.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v23 (copy), l_InExperienceAppChatModal_0 (ref), v32 (ref)
        if v23.isSquadIndicatorEnabled then
            local v37 = l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v36) --[[ Line: 83 ]]
                -- upvalues: v32 (ref)
                v32(v36);
            end);
            return function() --[[ Line: 87 ]]
                -- upvalues: v37 (copy)
                v37:Disconnect();
            end;
        else
            return function() --[[ Line: 91 ]]

            end;
        end;
    end, l_dependencyArray_0(v23.isSquadIndicatorEnabled, v32));
    if v23.isSquadIndicatorEnabled then
        if v31 ~= "" then
            v33 = v24.Color.System.Success;
        elseif v27 > 0 then
            v33 = v24.Color.System.Contrast;
        end;
    end;
    local v38 = if v23.isSquadIndicatorEnabled then v33 else v27 > 0;
    local v40 = l_MappedSignal_0.new(l_InExperienceAppChatModal_0.default.visibilitySignal.Event, function(_) --[[ Line: 104 ]]
        -- upvalues: l_InExperienceAppChatModal_0 (ref)
        return l_InExperienceAppChatModal_0:getVisible();
    end);
    local v41 = v7(v40);
    local v42 = v8(v26, 24, if v41 then l_on_0 else l_off_0);
    local v43 = v4.useContext(v13);
    local function _(v44) --[[ Line: 112 ]] --[[ Name: getTransparency ]]
        -- upvalues: v43 (copy)
        if v43 then
            return (v43:map(function(v45) --[[ Line: 114 ]]
                -- upvalues: v44 (copy)
                return v44 + (1 - v44) * (1 - v45);
            end));
        else
            return v44;
        end;
    end;
    local l_createElement_0 = v4.createElement;
    local l_View_0 = v3.View;
    local v49 = {
        Size = UDim2.new(0, v26, 0, v26)
    };
    local v50 = {};
    local l_createElement_1 = v4.createElement;
    local l_Image_0 = v3.Image;
    local v54 = {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = v42.size:map(function(v53) --[[ Line: 126 ]]
            return UDim2.fromOffset(v53, v53);
        end)
    };
    local v55;
    if v42.image.backgroundColor then
        v55 = {
            Color3 = v42.image.backgroundColor
        };
        local v56;
        if v43 then
            local v57 = 0;
            v56 = v43:map(function(v58) --[[ Line: 114 ]]
                -- upvalues: v57 (copy)
                return v57 + (1 - v57) * (1 - v58);
            end);
        else
            v56 = 0;
        end;
        v55.Transparency = v56;
    else
        v55 = v24.Color.None;
    end;
    v54.backgroundStyle = v55;
    v54.cornerRadius = UDim.new(0, v24.Radius.Circle);
    v54.Image = v42.image.thumbnail;
    v55 = {
        Color3 = v24.Color.Content.Emphasis.Color3
    };
    local l_Transparency_0 = v24.Color.Content.Emphasis.Transparency;
    local l_l_Transparency_0_0 = l_Transparency_0 --[[ copy: 25 -> 28 ]];
    v55.Transparency = if v43 then v43:map(function(v61) --[[ Line: 114 ]]
        -- upvalues: l_l_Transparency_0_0 (copy)
        return l_l_Transparency_0_0 + (1 - l_l_Transparency_0_0) * (1 - v61);
    end) else l_Transparency_0;
    v54.imageStyle = v55;
    v50.Icon = l_createElement_1(l_Image_0, v54);
    if v38 then
        l_createElement_1 = v4.createElement;
        l_Image_0 = v3.View;
        v54 = {
            Position = UDim2.new(1, -v24.Stroke.Thicker, 0, v24.Stroke.Thicker)
        };
        if v23.isSquadIndicatorEnabled then
            v55 = {
                Color3 = v33.Color3
            };
            l_Transparency_0 = v33.Transparency;
            local l_l_Transparency_0_1 = l_Transparency_0 --[[ copy: 25 -> 30 ]];
            v55.Transparency = if v43 then v43:map(function(v63) --[[ Line: 114 ]]
                -- upvalues: l_l_Transparency_0_1 (copy)
                return l_l_Transparency_0_1 + (1 - l_l_Transparency_0_1) * (1 - v63);
            end) else l_Transparency_0;
        else
            v55 = {
                Color3 = v24.Color.System.Contrast.Color3
            };
            l_Transparency_0 = v24.Color.System.Contrast.Transparency;
            local l_l_Transparency_0_2 = l_Transparency_0 --[[ copy: 25 -> 29 ]];
            v55.Transparency = if v43 then v43:map(function(v65) --[[ Line: 114 ]]
                -- upvalues: l_l_Transparency_0_2 (copy)
                return l_l_Transparency_0_2 + (1 - l_l_Transparency_0_2) * (1 - v65);
            end) else l_Transparency_0;
        end;
        v54.backgroundStyle = v55;
        v55 = {
            Color = v24.Color.Surface.Surface_0.Color3
        };
        l_Transparency_0 = v24.Color.Surface.Surface_0.Transparency;
        v55.Transparency = if v43 then v43:map(function(v66) --[[ Line: 114 ]]
            -- upvalues: l_Transparency_0 (copy)
            return l_Transparency_0 + (1 - l_Transparency_0) * (1 - v66);
        end) else l_Transparency_0;
        v55.Thickness = v24.Stroke.Thicker;
        v54.stroke = v55;
        v54.tag = "anchor-top-right radius-circle size-200 stroke-thicker";
        v54.ZIndex = 2;
        l_createElement_1 = l_createElement_1(l_Image_0, v54);
    else
        l_createElement_1 = nil;
    end;
    v50.Badge = l_createElement_1;
    return l_createElement_0(l_View_0, v49, v50);
end;