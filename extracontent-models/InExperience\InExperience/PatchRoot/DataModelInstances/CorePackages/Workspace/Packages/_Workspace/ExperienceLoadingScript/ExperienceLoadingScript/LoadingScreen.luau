local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v16 = require(l_Parent_0.React);
local v17 = require(l_Parent_0.InGameMenuDependencies);
local l_Cryo_0 = v17.Cryo;
local l_Roact_0 = v17.Roact;
local l_RoactRodux_0 = v17.RoactRodux;
local l_ExternalEventConnection_0 = require(l_Parent_0.RoactUtils).ExternalEventConnection;
local v22 = require(l_script_FirstAncestor_0.Thunks.GetGameProductInfo);
local v23 = require(l_script_FirstAncestor_0.Thunks.GetIsSubjectToChinaPolicies);
local v24 = require(l_script_FirstAncestor_0.Thunks.GetUniverseId);
local v25 = require(l_Parent_0.VerifiedBadges);
local v26 = require(l_Parent_0.LoggingProtocol);
local v27 = require(l_Parent_0.UIBlox);
local l_LoadingSpinner_0 = v27.App.Loading.LoadingSpinner;
local l_withStyle_0 = v27.Style.withStyle;
local v30 = require(l_Parent_0.Responsive);
local v31 = require(l_Parent_0.Foundation);
local l_FoundationProvider_0 = v31.FoundationProvider;
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v35 = require(l_script_FirstAncestor_0.AutoTranslateBadge);
local v36 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local l_requestInternalWrapper_0 = require(l_Parent_0.Http).NetworkLayers.requestInternalWrapper;
local v38 = require(l_script_FirstAncestor_0.Flags.GetFFlagReportFirstExperienceCancelled);
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagAddAutoTranslateToLoadingScreen);
local v40 = game:DefineFastFlag("EnableLoadingScreenBButtonNonTenFoot", false);
local v41 = if v39 then require(l_script_FirstAncestor_0.createNetworking) else l_requestInternalWrapper_0(l_HttpService_0);
local v42 = 7;
game:DefineFastFlag("IncreaseLoadingScreenOrder", false);
if game:GetFastFlag("IncreaseLoadingScreenOrder") then
    v42 = 8;
end;
local v43 = Vector2.new(768, 432);
local v44 = Color3.fromRGB(101, 102, 104);
local v45 = {
    MOBILE_PORTRAIT = {
        TOP = 44, 
        BOTTOM = 44, 
        LEFT = 24, 
        RIGHT = 24
    }, 
    MOBILE_LANDSCAPE = {
        TOP = 24, 
        BOTTOM = 24, 
        LEFT = 44, 
        RIGHT = 44
    }, 
    DESKTOP = {
        TOP = 24, 
        BOTTOM = 24, 
        LEFT = 24, 
        RIGHT = 24
    }, 
    CONSOLE = {
        TOP = 64, 
        BOTTOM = 64, 
        LEFT = 64, 
        RIGHT = 64
    }
};
local v46 = l_GuiService_0:IsTenFootInterface();
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v48 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v48 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v49 = {
    150, 
    256
};
local v50 = nil;
local v51 = 0;
local v52 = 1e999;
local function _(v53) --[[ Line: 89 ]] --[[ Name: getPadding ]]
    -- upvalues: v48 (copy), v45 (copy), v46 (copy)
    if v48 then
        return v53 and v45.MOBILE_PORTRAIT or v45.MOBILE_LANDSCAPE;
    elseif v46 then
        return v45.CONSOLE;
    else
        return v45.DESKTOP;
    end;
end;
local function _(v55, v56) --[[ Line: 99 ]] --[[ Name: lerp ]]
    if type(v55) == "table" and #v55 >= 2 then
        local v57 = math.clamp(v56, 0, 1);
        return v55[1] * (1 - v57) + v55[2] * v57;
    else
        return 0;
    end;
end;
local v95 = {
    FadeIn = function(v59, _, v61, v62) --[[ Line: 108 ]] --[[ Name: FadeIn ]]
        local v63 = {
            1, 
            1
        };
        local v64 = {
            1, 
            0
        };
        local v65 = {
            1, 
            0.2
        };
        if v59 <= 0.6 then
            local v66 = v59 / 0.6;
            local l_iconTransparency_0 = v61.iconTransparency;
            local v68;
            if type(v64) == "table" and #v64 >= 2 then
                local v69 = math.clamp(v66, 0, 1);
                v68 = v64[1] * (1 - v69) + v64[2] * v69;
            else
                v68 = 0;
            end;
            l_iconTransparency_0(v68);
            l_iconTransparency_0 = v61.iconSize;
            if type(v63) == "table" and #v63 >= 2 then
                local v70 = math.clamp(v66, 0, 1);
                v68 = v63[1] * (1 - v70) + v63[2] * v70;
            else
                v68 = 0;
            end;
            l_iconTransparency_0(v68);
            l_iconTransparency_0 = v61.infoFrameTransparency;
            if type(v65) == "table" and #v65 >= 2 then
                local v71 = math.clamp(v66, 0, 1);
                v68 = v65[1] * (1 - v71) + v65[2] * v71;
            else
                v68 = 0;
            end;
            l_iconTransparency_0(v68);
            l_iconTransparency_0 = v61.thumbnailTransparency;
            if type(v64) == "table" and #v64 >= 2 then
                local v72 = math.clamp(v66, 0, 1);
                v68 = v64[1] * (1 - v72) + v64[2] * v72;
            else
                v68 = 0;
            end;
            l_iconTransparency_0(v68);
            l_iconTransparency_0 = v61.placeTextTransparency;
            if type(v64) == "table" and #v64 >= 2 then
                local v73 = math.clamp(v66, 0, 1);
                v68 = v64[1] * (1 - v73) + v64[2] * v73;
            else
                v68 = 0;
            end;
            l_iconTransparency_0(v68);
            l_iconTransparency_0 = v61.placeTextSize;
            if type(v63) == "table" and #v63 >= 2 then
                local v74 = math.clamp(v66, 0, 1);
                v68 = v63[1] * (1 - v74) + v63[2] * v74;
            else
                v68 = 0;
            end;
            l_iconTransparency_0(v68);
            l_iconTransparency_0 = v61.creatorTextTransparency;
            if type(v64) == "table" and #v64 >= 2 then
                local v75 = math.clamp(v66, 0, 1);
                v68 = v64[1] * (1 - v75) + v64[2] * v75;
            else
                v68 = 0;
            end;
            l_iconTransparency_0(v68);
            l_iconTransparency_0 = v61.creatorTextSize;
            if type(v63) == "table" and #v63 >= 2 then
                local v76 = math.clamp(v66, 0, 1);
                v68 = v63[1] * (1 - v76) + v63[2] * v76;
            else
                v68 = 0;
            end;
            l_iconTransparency_0(v68);
            return;
        else
            v61.iconTransparency(if type(v64) == "table" and #v64 >= 2 then v64[1] * 0 + v64[2] * 1 else 0);
            v61.iconSize(if type(v63) == "table" and #v63 >= 2 then v63[1] * 0 + v63[2] * 1 else 0);
            v61.infoFrameTransparency(if type(v65) == "table" and #v65 >= 2 then v65[1] * 0 + v65[2] * 1 else 0);
            v61.thumbnailTransparency(if type(v64) == "table" and #v64 >= 2 then v64[1] * 0 + v64[2] * 1 else 0);
            v61.placeTextTransparency(if type(v64) == "table" and #v64 >= 2 then v64[1] * 0 + v64[2] * 1 else 0);
            v61.placeTextSize(if type(v63) == "table" and #v63 >= 2 then v63[1] * 0 + v63[2] * 1 else 0);
            v61.creatorTextTransparency(if type(v64) == "table" and #v64 >= 2 then v64[1] * 0 + v64[2] * 1 else 0);
            v61.creatorTextSize(if type(v63) == "table" and #v63 >= 2 then v63[1] * 0 + v63[2] * 1 else 0);
            v62();
            return;
        end;
    end, 
    FadeOut = function(v77, _, v79, v80) --[[ Line: 137 ]] --[[ Name: FadeOut ]]
        -- upvalues: l_RunService_0 (copy)
        local v81 = {
            1, 
            0.6
        };
        local v82 = {
            0, 
            1
        };
        local v83 = {
            0.2, 
            1
        };
        if v77 <= 0.6 then
            local v84 = v77 / 0.6;
            local l_iconTransparency_1 = v79.iconTransparency;
            local v86;
            if type(v82) == "table" and #v82 >= 2 then
                local v87 = math.clamp(v84, 0, 1);
                v86 = v82[1] * (1 - v87) + v82[2] * v87;
            else
                v86 = 0;
            end;
            l_iconTransparency_1(v86);
            l_iconTransparency_1 = v79.iconSize;
            if type(v81) == "table" and #v81 >= 2 then
                local v88 = math.clamp(v84, 0, 1);
                v86 = v81[1] * (1 - v88) + v81[2] * v88;
            else
                v86 = 0;
            end;
            l_iconTransparency_1(v86);
            l_iconTransparency_1 = v79.infoFrameTransparency;
            if type(v83) == "table" and #v83 >= 2 then
                local v89 = math.clamp(v84, 0, 1);
                v86 = v83[1] * (1 - v89) + v83[2] * v89;
            else
                v86 = 0;
            end;
            l_iconTransparency_1(v86);
            l_iconTransparency_1 = v79.thumbnailTransparency;
            if type(v82) == "table" and #v82 >= 2 then
                local v90 = math.clamp(v84, 0, 1);
                v86 = v82[1] * (1 - v90) + v82[2] * v90;
            else
                v86 = 0;
            end;
            l_iconTransparency_1(v86);
            l_iconTransparency_1 = v79.placeTextTransparency;
            if type(v82) == "table" and #v82 >= 2 then
                local v91 = math.clamp(v84, 0, 1);
                v86 = v82[1] * (1 - v91) + v82[2] * v91;
            else
                v86 = 0;
            end;
            l_iconTransparency_1(v86);
            l_iconTransparency_1 = v79.placeTextSize;
            if type(v81) == "table" and #v81 >= 2 then
                local v92 = math.clamp(v84, 0, 1);
                v86 = v81[1] * (1 - v92) + v81[2] * v92;
            else
                v86 = 0;
            end;
            l_iconTransparency_1(v86);
            l_iconTransparency_1 = v79.creatorTextTransparency;
            if type(v82) == "table" and #v82 >= 2 then
                local v93 = math.clamp(v84, 0, 1);
                v86 = v82[1] * (1 - v93) + v82[2] * v93;
            else
                v86 = 0;
            end;
            l_iconTransparency_1(v86);
            l_iconTransparency_1 = v79.creatorTextSize;
            if type(v81) == "table" and #v81 >= 2 then
                local v94 = math.clamp(v84, 0, 1);
                v86 = v81[1] * (1 - v94) + v81[2] * v94;
            else
                v86 = 0;
            end;
            l_iconTransparency_1(v86);
            return;
        else
            l_RunService_0:SetRobloxGuiFocused(false);
            v79.iconTransparency(if type(v82) == "table" and #v82 >= 2 then v82[1] * 0 + v82[2] * 1 else 0);
            v79.iconSize(if type(v81) == "table" and #v81 >= 2 then v81[1] * 0 + v81[2] * 1 else 0);
            v79.infoFrameTransparency(if type(v83) == "table" and #v83 >= 2 then v83[1] * 0 + v83[2] * 1 else 0);
            v79.thumbnailTransparency(if type(v82) == "table" and #v82 >= 2 then v82[1] * 0 + v82[2] * 1 else 0);
            v79.placeTextTransparency(if type(v82) == "table" and #v82 >= 2 then v82[1] * 0 + v82[2] * 1 else 0);
            v79.placeTextSize(if type(v81) == "table" and #v81 >= 2 then v81[1] * 0 + v81[2] * 1 else 0);
            v79.creatorTextTransparency(if type(v82) == "table" and #v82 >= 2 then v82[1] * 0 + v82[2] * 1 else 0);
            v79.creatorTextSize(if type(v81) == "table" and #v81 >= 2 then v81[1] * 0 + v81[2] * 1 else 0);
            v80();
            return;
        end;
    end
};
local function _() --[[ Line: 170 ]] --[[ Name: disconnectAndCloseHealthStat ]]
    -- upvalues: v50 (ref), l_GuiService_0 (copy)
    if v50 then
        v50:disconnect();
        v50 = nil;
        l_GuiService_0:CloseStatsBasedOnInputString("ConnectionHealth");
    end;
end;
local v97 = l_Roact_0.Component:extend("LoadingScreen");
v97.playAnimation = function(v98, v99, v100, v101) --[[ Line: 181 ]] --[[ Name: playAnimation ]]
    -- upvalues: l_RunService_0 (copy)
    v98.animationStartTime = tick();
    v98.animationFunction = v99;
    if not v98.renderSteppedConnection then
        v98.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 186 ]]
            -- upvalues: v98 (copy), v100 (copy), v101 (copy)
            v98.animationFunction(tick() - v98.animationStartTime, v100, v98.updateBindings, function() --[[ Line: 187 ]]
                -- upvalues: v98 (ref), v101 (ref)
                v98:stopAnimation();
                if v101 then
                    v101();
                end;
            end);
        end);
    end;
end;
v97.stopAnimation = function(v102) --[[ Line: 197 ]] --[[ Name: stopAnimation ]]
    if v102.renderSteppedConnection then
        v102.renderSteppedConnection:Disconnect();
        v102.renderSteppedConnection = nil;
    end;
end;
v97.renderBackground = function(v103, v104) --[[ Line: 204 ]] --[[ Name: renderBackground ]]
    -- upvalues: l_Roact_0 (copy), v42 (ref), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    local l_thumbnailScaledWidth_0 = v103.state.thumbnailScaledWidth;
    local l_thumbnailScaledHeight_0 = v103.state.thumbnailScaledHeight;
    local l_thumbnailPositionX_0 = v103.state.thumbnailPositionX;
    local v108 = "";
    if v103.props.placeId and v103.props.placeId > 0 then
        v108 = ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(v103.props.placeId);
    end;
    local l_ReducedMotion_0 = v104.Settings.ReducedMotion;
    return l_Roact_0.createElement("ScreenGui", {
        DisplayOrder = v42, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        l_Roact_0.createElement("Frame", {
            Name = "BackgroundFrame", 
            [l_Roact_0.Change.AbsoluteSize] = v103.onAbsoluteSizeChange, 
            BackgroundColor3 = v104.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Active = true
        }, {
            ThumbnailImage = l_Roact_0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v108, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(l_thumbnailPositionX_0, 0.5), 
                Size = UDim2.fromOffset(l_thumbnailScaledWidth_0, l_thumbnailScaledHeight_0), 
                ImageTransparency = v103.bindings.thumbnailTransparency
            }), 
            renderStepped = not l_ReducedMotion_0 and l_Roact_0.createElement(l_ExternalEventConnection_0, {
                event = l_RunService_0.renderStepped, 
                callback = v103.renderBackgroundSteppedCallback
            })
        })
    });
end;
v97.showConnnectionHealthDebugMenu = function(_, _) --[[ Line: 246 ]] --[[ Name: showConnnectionHealthDebugMenu ]]
    -- upvalues: v51 (ref), v52 (ref), v48 (copy), l_GuiService_0 (copy)
    if v51 == 0 then
        v51 = 1;
        v52 = tick();
        return;
    else
        if v48 and tick() - v52 <= 0.5 then
            l_GuiService_0:ShowStatsBasedOnInputString("ConnectionHealth");
        end;
        v51 = 0;
        v52 = 1e999;
        return;
    end;
end;
v97.renderPlaceIcon = function(v112, v113) --[[ Line: 263 ]] --[[ Name: renderPlaceIcon ]]
    -- upvalues: l_Roact_0 (copy), v44 (copy), l_ExternalEventConnection_0 (copy), l_RunService_0 (copy)
    local l_shimPos_0 = v112.state.shimPos;
    local v115 = v112.bindings.iconTransparency:getValue();
    local v116 = "";
    if v112.props.universeId and v112.props.universeId > 0 then
        v116 = ("rbxthumb://type=GameIcon&id=%d&w=256&h=256"):format(v112.props.universeId);
    end;
    local l_ReducedMotion_1 = v113.Settings.ReducedMotion;
    local l_createElement_0 = l_Roact_0.createElement;
    local v119 = "Frame";
    local v120 = {
        Name = "IconFrame", 
        BackgroundTransparency = v112.bindings.iconTransparency, 
        BackgroundColor3 = v44, 
        BorderSizePixel = 0, 
        Size = v112.bindings.iconSize, 
        Position = UDim2.fromScale(0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Active = true
    };
    local v121 = {};
    local v122 = not l_ReducedMotion_1;
    if v122 then
        v122 = l_Roact_0.createElement;
        local v123 = "Frame";
        local v124 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 0, 
            ZIndex = 2
        };
        local v125 = {
            Corner = l_Roact_0.createElement("UICorner")
        };
        local l_createElement_1 = l_Roact_0.createElement;
        local v127 = "UIGradient";
        local v128 = {
            Rotation = 25, 
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0.5, 0.5, 0.5)), 
                ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)), 
                ColorSequenceKeypoint.new(1, Color3.new(0.5, 0.5, 0.5))
            })
        };
        local l_new_0 = NumberSequence.new;
        local v130 = {};
        local l_new_1 = NumberSequenceKeypoint.new;
        local v132 = 0;
        local v133 = {
            0.7, 
            1
        };
        local v134;
        if type(v133) == "table" and #v133 >= 2 then
            local v135 = math.clamp(v115, 0, 1);
            v134 = v133[1] * (1 - v135) + v133[2] * v135;
        else
            v134 = 0;
        end;
        l_new_1 = l_new_1(v132, v134);
        v132 = NumberSequenceKeypoint.new;
        v134 = 0.5;
        local v136 = {
            0.3, 
            1
        };
        if type(v136) == "table" and #v136 >= 2 then
            local v137 = math.clamp(v115, 0, 1);
            v133 = v136[1] * (1 - v137) + v136[2] * v137;
        else
            v133 = 0;
        end;
        v132 = v132(v134, v133);
        v134 = NumberSequenceKeypoint.new;
        v133 = 1;
        local v138 = {
            0.7, 
            1
        };
        if type(v138) == "table" and #v138 >= 2 then
            local v139 = math.clamp(v115, 0, 1);
            v136 = v138[1] * (1 - v139) + v138[2] * v139;
        else
            v136 = 0;
        end;
        v6(v130, 1, l_new_1, v132, v134(v133, v136));
        v128.Transparency = l_new_0(v130);
        v128.Offset = Vector2.new(l_shimPos_0, 0);
        v125.Gradient = l_createElement_1(v127, v128);
        v125.renderStepped = l_Roact_0.createElement(l_ExternalEventConnection_0, {
            event = l_RunService_0.renderStepped, 
            callback = v112.renderShimmerCallback
        });
        v122 = v122(v123, v124, v125);
    end;
    v121.LoadingOverlay = v122;
    v121.GameIconImage = l_Roact_0.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        Image = v116, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromScale(1, 1), 
        ImageTransparency = v112.bindings.iconTransparency
    }, {
        Corner = l_Roact_0.createElement("UICorner")
    });
    v121.Corner = l_Roact_0.createElement("UICorner");
    return l_createElement_0(v119, v120, v121);
end;
v97.renderInfoFrame = function(v140, v141) --[[ Line: 324 ]] --[[ Name: renderInfoFrame ]]
    -- upvalues: v25 (copy), v49 (copy), l_Roact_0 (copy), v39 (copy), v48 (copy)
    local l_productInfo_0 = v140.props.productInfo;
    local v143 = l_productInfo_0 and l_productInfo_0.Name or "";
    local v144 = l_productInfo_0 and l_productInfo_0.Creator.Name or "";
    if l_productInfo_0 and l_productInfo_0.Creator.HasVerifiedBadge then
        v144 = v25.appendVerifiedBadge(v144);
    end;
    local v145 = math.clamp(math.max(v140.state.absoluteSize.X, v140.state.absoluteSize.Y) / 1024 * v49[1], v49[1], v49[2]);
    return l_Roact_0.createElement("Frame", {
        Name = "InfoFrame", 
        BackgroundColor3 = v141.Theme.BackgroundMuted.Color, 
        BackgroundTransparency = v140.bindings.infoFrameTransparency, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = v140.isPortrait and UDim2.fromScale(1, 0) or UDim2.fromScale(0.6, 0), 
        Active = true, 
        [l_Roact_0.Change.AbsoluteSize] = v39 and function(v146) --[[ Line: 348 ]]
            -- upvalues: v140 (copy)
            v140.updateBindings.updateInfoFrameAbsoluteSize(v146.AbsoluteSize);
        end or nil
    }, {
        PlaceIcon = v140:renderPlaceIcon(v141), 
        TextLayoutFrame = l_Roact_0.createElement("Frame", {
            Name = "TextLayout", 
            BackgroundColor3 = v141.Theme.BackgroundMuted.Color, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0.5, 0, 0, v145 / 2), 
            Size = UDim2.fromScale(1, 0), 
            Active = true
        }, {
            PlaceLabel = l_Roact_0.createElement("TextLabel", {
                Name = "PlaceLabel", 
                BackgroundTransparency = 1, 
                TextTransparency = v140.bindings.placeTextTransparency, 
                Size = UDim2.fromScale(0.8, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v141.Font.Title.Font, 
                TextSize = v140.bindings.placeTextSize, 
                TextScaled = false, 
                TextWrapped = true, 
                TextColor3 = v141.Theme.TextEmphasis.Color, 
                TextStrokeTransparency = 1, 
                Text = v143, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                LayoutOrder = 1, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                RichText = false
            }), 
            CreatorLabel = l_Roact_0.createElement("TextLabel", {
                Name = "CreatorLabel", 
                BackgroundTransparency = 1, 
                TextTransparency = v140.bindings.creatorTextTransparency, 
                Size = UDim2.fromScale(0.6, 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v141.Font.CaptionBody.Font, 
                TextSize = v140.bindings.creatorTextSize, 
                TextWrapped = true, 
                TextScaled = false, 
                TextColor3 = v141.Theme.TextDefault.Color, 
                TextStrokeTransparency = 1, 
                Text = v144, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                LayoutOrder = 2, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                RichText = false
            }), 
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, v48 and 12 or 36)
            }), 
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v48 and 12 or 36), 
                PaddingBottom = UDim.new(0, v48 and 12 or 36)
            })
        }), 
        Corner = l_Roact_0.createElement("UICorner")
    });
end;
v97.renderMain = function(v147, v148) --[[ Line: 422 ]] --[[ Name: renderMain ]]
    -- upvalues: v48 (copy), v45 (copy), v46 (copy), l_Roact_0 (copy), v42 (ref), l_LoadingSpinner_0 (copy), v39 (copy), v40 (copy)
    local l_isPortrait_0 = v147.isPortrait;
    local v150 = if v48 then l_isPortrait_0 and v45.MOBILE_PORTRAIT or v45.MOBILE_LANDSCAPE else if v46 then v45.CONSOLE else v45.DESKTOP;
    l_isPortrait_0 = v148.Settings.ReducedMotion;
    return l_Roact_0.createElement("ScreenGui", {
        DisplayOrder = v42 + 1, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        OnTopOfCoreBlur = true
    }, {
        DarkGradient = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            Gradient = l_Roact_0.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(0.5, Color3.new(0, 0, 0)), 
                    ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(0.5, 1), 
                    NumberSequenceKeypoint.new(1, 0.5)
                })
            }), 
            Spinner = l_isPortrait_0 and l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 20
            }, {
                l_Roact_0.createElement(l_LoadingSpinner_0, {
                    size = UDim2.fromOffset(30, 30), 
                    position = UDim2.new(1, 0, 1, 0), 
                    anchorPoint = Vector2.new(1, 1), 
                    rotationRate = 180
                })
            }), 
            infoFrame = v147:renderInfoFrame(v148), 
            AutoTranslate = v39 and v147:renderAutoTranslate() or nil, 
            serverFrame = v147:renderServerFrame(v148), 
            closeBtn = v147:renderCloseBtn(v148), 
            gamepadCancelBtn = v40 and v147:renderGamepadCancelBtn(v148), 
            tenfootCancelBtn = not v40 and v147:renderTenFootCancelBtn(v148), 
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v150.LEFT), 
                PaddingRight = UDim.new(0, v150.RIGHT), 
                PaddingTop = UDim.new(0, v150.TOP), 
                PaddingBottom = UDim.new(0, v150.BOTTOM)
            })
        })
    });
end;
v97.renderCloseBtn = function(v151, _) --[[ Line: 481 ]] --[[ Name: renderCloseBtn ]]
    -- upvalues: v40 (copy), v30 (copy), v46 (copy), l_Roact_0 (copy), v38 (copy), v26 (copy)
    if v40 then
        if v151.props.preferredInputRef.current ~= v30.Input.Directional and not v151.state.showCloseBtn and tick() - v151.startTime > 5 then
            v151:setState({
                showCloseBtn = true
            });
        end;
    elseif not v151.state.showCloseBtn and tick() - v151.startTime > 5 and not v46 then
        v151:setState({
            showCloseBtn = true
        });
    end;
    return v151.state.showCloseBtn and l_Roact_0.createElement("ImageButton", {
        Name = "CloseButton", 
        Image = "rbxasset://textures/loading/cancelButton.png", 
        ImageTransparency = 0, 
        BackgroundTransparency = 1, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromOffset(32, 32), 
        Active = false, 
        ZIndex = 10, 
        [l_Roact_0.Event.MouseButton1Click] = function() --[[ Line: 513 ]]
            -- upvalues: v38 (ref), v26 (ref)
            if v38 then
                v26.default:logEventOnce("first_experience_cancelled");
            end;
            game:Shutdown();
        end
    });
end;
v97.renderServerFrame = function(v153, v154) --[[ Line: 522 ]] --[[ Name: renderServerFrame ]]
    -- upvalues: v46 (copy), l_Roact_0 (copy), v36 (copy), l_CoreGui_0 (copy)
    local l_serverStatusText_0 = v153.state.serverStatusText;
    local l_isSubjectToChinaPolicies_0 = v153.props.isSubjectToChinaPolicies;
    local v157 = v46 and 16 or 12;
    local v158 = v46 and 16 or 12;
    return l_Roact_0.createElement("Frame", {
        Name = "ServerFrame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.fromScale(0.5, 1), 
        Size = UDim2.new(1, -48, 0.2, 0), 
        Active = true
    }, {
        PolicyLabel = l_isSubjectToChinaPolicies_0 and l_Roact_0.createElement("TextLabel", {
            Name = "PolicyLabel", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 2 * v158), 
            Position = UDim2.new(0, 0, 1, -4 * v157 - 2 * v158), 
            Font = v154.Font.Footer.Font, 
            TextSize = v158, 
            TextWrapped = true, 
            TextScaled = false, 
            TextColor3 = v154.Theme.TextDefault.Color, 
            TextStrokeTransparency = 1, 
            Text = v36:Format("Authentication.Login.WeChat.AntiAddictionText"), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2
        }), 
        JoinServerLabel = l_Roact_0.createElement("TextLabel", {
            Name = "JoinText", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 4 * v157), 
            Position = UDim2.new(0, 0, 1, -2 * v157), 
            Font = v154.Font.Footer.Font, 
            TextSize = v157, 
            TextWrapped = true, 
            TextScaled = false, 
            TextColor3 = v154.Theme.TextDefault.Color, 
            TextStrokeTransparency = 1, 
            Text = l_serverStatusText_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2, 
            RootLocalizationTable = l_CoreGui_0.CoreScriptLocalization, 
            [l_Roact_0.Event.InputBegan] = not v153.props.isSubjectToChinaPolicies and v153.showConnnectionHealthDebugMenu or nil
        })
    });
end;
v97.renderGamepadCancelBtn = function(v159, v160) --[[ Line: 575 ]] --[[ Name: renderGamepadCancelBtn ]]
    -- upvalues: v30 (copy), l_Roact_0 (copy), v36 (copy)
    local v161 = false;
    if v159.props.preferredInputRef.current == v30.Input.Directional then
        v161 = not v159.state.gamepadCancelPressed and l_Roact_0.createElement("Frame", {
            Name = "GamepadCancelFrame", 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            Size = UDim2.fromOffset(150, 48), 
            Active = true
        }, {
            CancelIcon = l_Roact_0.createElement("ImageLabel", {
                Name = "GamepadCancel", 
                Image = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(24, 24), 
                Active = false, 
                ZIndex = 10, 
                LayoutOrder = 0
            }), 
            CancelLabel = l_Roact_0.createElement("TextLabel", {
                Name = "CancelText", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Font = v160.Font.SubHeader1.Font, 
                TextSize = 24, 
                TextWrapped = true, 
                TextColor3 = v160.Theme.TextEmphasis.Color, 
                TextStrokeTransparency = 1, 
                Text = v36:Format("CoreScripts.TopBar.Back"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                LayoutOrder = 1
            }), 
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 5)
            })
        });
    end;
    return v161;
end;
v97.renderTenFootCancelBtn = function(v162, v163) --[[ Line: 621 ]] --[[ Name: renderTenFootCancelBtn ]]
    -- upvalues: l_Roact_0 (copy), v36 (copy)
    return v162.state.showTenFootCancelBtn and l_Roact_0.createElement("Frame", {
        Name = "TenfootCancelFrame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        Size = UDim2.fromOffset(150, 48), 
        Active = true
    }, {
        CancelIcon = l_Roact_0.createElement("ImageLabel", {
            Name = "TenfootCancel", 
            Image = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(24, 24), 
            Active = false, 
            ZIndex = 10, 
            LayoutOrder = 0
        }), 
        CancelLabel = l_Roact_0.createElement("TextLabel", {
            Name = "CancelText", 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Font = v163.Font.SubHeader1.Font, 
            TextSize = 24, 
            TextWrapped = true, 
            TextColor3 = v163.Theme.TextEmphasis.Color, 
            TextStrokeTransparency = 1, 
            Text = v36:Format("CoreScripts.TopBar.Back"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 2, 
            LayoutOrder = 1
        }), 
        UIListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 5)
        })
    });
end;
v97.init = function(v164) --[[ Line: 666 ]] --[[ Name: init ]]
    -- upvalues: v43 (copy), v46 (copy), l_ContextActionService_0 (copy), v95 (copy), l_Roact_0 (copy), v39 (copy), v49 (copy), v48 (copy), l_GuiService_0 (copy), v40 (copy)
    v164.thumbnailMoveSpd = 0.05;
    v164.fadeinComplete = false;
    v164.isPortrait = false;
    v164.startTime = tick();
    v164.numberOfTaps = 0;
    v164.lastTapTime = 1e999;
    v164:setState({
        visible = true, 
        absoluteSize = Vector2.new(0, 0), 
        thumbnailPositionX = 0.5, 
        thumbnailScaledWidth = v43.x, 
        thumbnailScaledHeight = v43.y, 
        shimPos = 0, 
        serverStatusText = "", 
        showCloseBtn = false, 
        showTenFootCancelBtn = v46, 
        gamepadCancelPressed = false
    });
    v164.onAbsoluteSizeChange = function(v165) --[[ Line: 691 ]]
        -- upvalues: v164 (copy)
        v164:setState({
            absoluteSize = v165.AbsoluteSize
        });
        v164.isPortrait = v165.AbsoluteSize.X < v165.AbsoluteSize.Y;
        v164.updateBindings.iconSize(1);
    end;
    game.Loaded:Connect(function() --[[ Line: 700 ]]
        -- upvalues: v46 (ref), l_ContextActionService_0 (ref), v164 (copy), v95 (ref)
        if v46 then
            l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
        end;
        while not v164.fadeinComplete do
            wait();
        end;
        v164:stopAnimation();
        v164:playAnimation(v95.FadeOut, {}, function() --[[ Line: 708 ]]
            -- upvalues: v164 (ref)
            v164:setState({
                visible = false
            });
        end);
    end);
    local v166, v167 = l_Roact_0.createBinding(1);
    local v168, v169 = l_Roact_0.createBinding(1);
    local v170, v171 = l_Roact_0.createBinding(0);
    local v172, v173 = l_Roact_0.createBinding(1);
    local v174, v175 = l_Roact_0.createBinding(0);
    local v176, v177 = l_Roact_0.createBinding(1);
    local v178, v179 = l_Roact_0.createBinding(0);
    local v180, v181 = l_Roact_0.createBinding(1);
    local v182 = nil;
    local v183 = nil;
    if v39 then
        local v184, v185 = l_Roact_0.createBinding(Vector2.new(0, 0));
        v182 = v184;
        v183 = v185;
    end;
    v164.bindings = {
        thumbnailTransparency = v166, 
        iconTransparency = v168, 
        iconSize = v170:map(function(v186) --[[ Line: 732 ]]
            -- upvalues: v164 (copy), v49 (ref)
            local v187 = math.clamp(math.max(v164.state.absoluteSize.X, v164.state.absoluteSize.Y) / 1024 * v49[1], v49[1], v49[2]);
            return UDim2.fromOffset(v187 * v186, v187 * v186);
        end), 
        placeTextTransparency = v172, 
        placeTextSize = v174:map(function(v188) --[[ Line: 738 ]]
            -- upvalues: v48 (ref)
            return (v48 and 20 or 36) * v188;
        end), 
        creatorTextTransparency = v176, 
        creatorTextSize = v178:map(function(v189) --[[ Line: 742 ]]
            return 20 * v189;
        end), 
        infoFrameTransparency = v180, 
        infoFrameAbsoluteSize = if v39 then v182 else nil
    };
    v164.updateBindings = {
        thumbnailTransparency = v167, 
        iconTransparency = v169, 
        iconSize = v171, 
        placeTextTransparency = v173, 
        placeTextSize = v175, 
        creatorTextTransparency = v177, 
        creatorTextSize = v179, 
        infoFrameTransparency = v181, 
        updateInfoFrameAbsoluteSize = if v39 then v183 else nil
    };
    v164.renderBackgroundSteppedCallback = function(v190) --[[ Line: 762 ]]
        -- upvalues: v164 (copy), v43 (ref)
        local l_absoluteSize_0 = v164.state.absoluteSize;
        local v192 = l_absoluteSize_0.x * 1.5;
        local v193 = v192 / v43.x * v43.y;
        if v193 < l_absoluteSize_0.y then
            v192 = l_absoluteSize_0.y / v43.y * v43.x;
            v193 = l_absoluteSize_0.y;
        end;
        local v194 = v192 / l_absoluteSize_0.x / 2;
        local v195 = math.max(v194, 1 - v194);
        local v196 = math.min(v194, 1 - v194);
        local v197 = v164.state.thumbnailPositionX + v164.thumbnailMoveSpd * v190;
        if v195 <= v197 or v197 <= v196 then
            v164.thumbnailMoveSpd = -v164.thumbnailMoveSpd;
            v197 = math.clamp(v197, v196, v195);
        end;
        v164:setState({
            thumbnailPositionX = v197, 
            thumbnailScaledHeight = v193, 
            thumbnailScaledWidth = v192
        });
    end;
    v164.renderShimmerCallback = function(v198) --[[ Line: 789 ]]
        -- upvalues: v164 (copy)
        local v199 = v164.state.shimPos + v198 * 1;
        if v199 > 1 then
            v199 = -1;
        end;
        v164:setState({
            shimPos = v199
        });
    end;
    if l_GuiService_0:GetUiMessage() ~= "" then
        v164:setState({
            serverStatusText = l_GuiService_0:GetUiMessage()
        });
    end;
    l_GuiService_0.UiMessageChanged:Connect(function(v200, v201) --[[ Line: 806 ]]
        -- upvalues: v164 (copy)
        if v200 == Enum.UiMessageType.UiMessageInfo then
            v164:setState({
                serverStatusText = v201
            });
        end;
    end);
    if v40 or v46 then
        local v202 = false;
        do
            local l_v202_0 = v202;
            l_ContextActionService_0:BindCoreAction("CancelGameLoad", function(_, v205, _) --[[ Line: 816 ]]
                -- upvalues: l_v202_0 (ref), v164 (copy), v40 (ref), l_ContextActionService_0 (ref)
                if v205 == Enum.UserInputState.Begin then
                    l_v202_0 = true;
                    return;
                else
                    if v205 == Enum.UserInputState.End and l_v202_0 then
                        v164:setState({
                            showTenFootCancelBtn = false
                        });
                        if v40 then
                            v164:setState({
                                gamepadCancelPressed = true
                            });
                        end;
                        l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
                        if not game:IsLoaded() then
                            game:Shutdown();
                        end;
                    end;
                    return;
                end;
            end, false, Enum.KeyCode.ButtonB);
        end;
    end;
end;
v97.renderAutoTranslate = function(v207) --[[ Line: 840 ]] --[[ Name: renderAutoTranslate ]]
    -- upvalues: l_Roact_0 (copy), v35 (copy)
    return l_Roact_0.createElement(v35, {
        universeId = v207.props.universeId, 
        positionBinding = v207.bindings.infoFrameAbsoluteSize, 
        transparencyBinding = v207.bindings.infoFrameTransparency
    });
end;
v97.renderMainWithProviders = function(v208, v209) --[[ Line: 848 ]] --[[ Name: renderMainWithProviders ]]
    -- upvalues: l_Roact_0 (copy), l_FoundationProvider_0 (copy), v31 (copy), l_LocalizationProvider_0 (copy), v36 (copy)
    return l_Roact_0.createElement(l_FoundationProvider_0, {
        theme = v31.Enums.Theme.Dark
    }, {
        l_Roact_0.createElement(l_LocalizationProvider_0, {
            localization = v36
        }, v208:renderMain(v209))
    });
end;
v97.render = function(v210) --[[ Line: 858 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), v39 (copy)
    return l_withStyle_0(function(v211) --[[ Line: 861 ]]
        -- upvalues: v210 (copy), l_Roact_0 (ref), v39 (ref)
        return v210.state.visible and l_Roact_0.createElement("Folder", {}, {
            BackgroundScreen = v210:renderBackground(v211), 
            MainScreen = if v39 then v210:renderMainWithProviders(v211) else v210:renderMain(v211)
        });
    end);
end;
v97.willUpdate = function(_, _, _) --[[ Line: 872 ]] --[[ Name: willUpdate ]]

end;
v97.didMount = function(v215) --[[ Line: 874 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy), v95 (copy)
    l_RunService_0:SetRobloxGuiFocused(true);
    v215.props.fetchUniverseId(v215.props.placeId);
    v215.props.fetchGameProductInfo(v215.props.placeId);
    v215.props.fetchSubjectToChinaPolicies();
    v215:playAnimation(v95.FadeIn, {}, function() --[[ Line: 883 ]]
        -- upvalues: v215 (copy)
        v215.fadeinComplete = true;
    end);
end;
v97.willUnmount = function(_) --[[ Line: 888 ]] --[[ Name: willUnmount ]]
    -- upvalues: v40 (copy), v46 (copy), l_ContextActionService_0 (copy), l_RunService_0 (copy), v50 (ref), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if v40 or v46 then
        l_ContextActionService_0:UnbindCoreAction("CancelGameLoad");
    end;
    l_RunService_0:SetRobloxGuiFocused(false);
    if not v50 then
        v50 = l_UserInputService_0.InputBegan:Connect(function() --[[ Line: 895 ]]
            -- upvalues: v50 (ref), l_GuiService_0 (ref)
            if v50 then
                v50:disconnect();
                v50 = nil;
                l_GuiService_0:CloseStatsBasedOnInputString("ConnectionHealth");
            end;
        end);
    end;
end;
v97 = l_RoactRodux_0.connect(function(v217, v218) --[[ Line: 901 ]]
    return {
        productInfo = v217.productInfo, 
        isSubjectToChinaPolicies = v217.isSubjectToChinaPolicies, 
        placeId = v217.gameIds and v217.gameIds.placeId or v218.placeId, 
        universeId = v217.gameIds and v217.gameIds.universeId or 0, 
        settings = v217.settings
    };
end, function(v219) --[[ Line: 909 ]]
    -- upvalues: v22 (copy), v23 (copy), v24 (copy), v41 (copy)
    return {
        fetchGameProductInfo = function(v220) --[[ Line: 911 ]] --[[ Name: fetchGameProductInfo ]]
            -- upvalues: v219 (copy), v22 (ref)
            v219(v22(v220));
        end, 
        fetchSubjectToChinaPolicies = function() --[[ Line: 914 ]] --[[ Name: fetchSubjectToChinaPolicies ]]
            -- upvalues: v219 (copy), v23 (ref)
            v219(v23());
        end, 
        fetchUniverseId = function(v221) --[[ Line: 917 ]] --[[ Name: fetchUniverseId ]]
            -- upvalues: v219 (copy), v24 (ref), v41 (ref)
            v219(v24(v41, v221));
        end
    };
end)(v97);
if v40 then
    return function(v222) --[[ Line: 924 ]]
        -- upvalues: v16 (copy), v30 (copy), v97 (ref), l_Cryo_0 (copy)
        local v223 = v16.useRef(nil);
        v223.current = v30.usePreferredInput();
        return v16.createElement(v97, l_Cryo_0.Dictionary.join(v222, {
            preferredInputRef = v223
        }));
    end;
else
    return v97;
end;