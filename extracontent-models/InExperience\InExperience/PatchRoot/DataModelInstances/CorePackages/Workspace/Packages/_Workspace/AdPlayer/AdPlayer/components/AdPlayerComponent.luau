local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdPlayer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_View_0 = v4.View;
local l_StateLayerAffordance_0 = v4.Enums.StateLayerAffordance;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_ReportAdPopup_0 = require(l_Parent_0.AdGuiInteractivity).ReportAdPopup;
local l_components_0 = l_script_FirstAncestor_0.components;
local v10 = require(l_components_0.VideoOverlayComponent);
local v11 = require(l_components_0.ExitConfirmationModalComponent);
local v12 = require(l_script_FirstAncestor_0.Flags);
local v13 = table.freeze({
    Loading = 1, 
    Paused = 2, 
    Playing = 3
});
return function(v14) --[[ Line: 35 ]] --[[ Name: AdPlayerComponent ]]
    -- upvalues: v12 (copy), l_useTokens_0 (copy), v3 (copy), v13 (copy), l_RunService_0 (copy), l_components_0 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy), v11 (copy), l_ReportAdPopup_0 (copy), v10 (copy)
    local v15 = v12.GetEnableLuaRewardTimerUI();
    local v16 = l_useTokens_0();
    local v17, v18 = v3.useState(0);
    local v19, v20 = v3.useBinding(0);
    local v21 = nil;
    local v22 = nil;
    if v15 then
        local v23, v24 = v3.useBinding(0);
        v21 = v23;
        v22 = v24;
    end;
    local v25, v26 = v3.useState(false);
    local v27, v28 = v3.useState(false);
    local v29, v30 = v3.useState(v13.Loading);
    local v31 = nil;
    local v32 = nil;
    if v15 then
        v31 = v3.createRef();
        v32 = v3.createRef();
    else
        v31 = v3.useRef(nil);
        v32 = v3.useRef(nil);
    end;
    local l_durationNeededForReward_0 = v14.durationNeededForReward;
    local function v34() --[[ Line: 58 ]] --[[ Name: dismissParentModals ]]
        -- upvalues: v26 (copy), v28 (copy)
        v26(false);
        v28(false);
    end;
    local function _() --[[ Line: 63 ]] --[[ Name: dismissModals ]]
        -- upvalues: v26 (copy), v28 (copy), v15 (copy), v31 (ref)
        v26(false);
        v28(false);
        local v35 = nil;
        v35 = if v15 then v31.current else v31:getValue();
        if v35 then
            v35.dismissModals();
        end;
    end;
    v3.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: v15 (copy), v32 (ref), v30 (copy), v13 (ref), v18 (copy), v14 (copy), l_RunService_0 (ref), v20 (copy), l_durationNeededForReward_0 (copy), v22 (ref)
        local v37 = nil;
        v37 = if v15 then v32.current else v32:getValue();
        if not v37.IsLoaded then
            v37.Loaded:Wait();
        end;
        v30(v13.Playing);
        v18(v37.TimeLength);
        v37.Ended:Connect(v14.onComplete);
        local v38 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 93 ]]
            -- upvalues: v37 (ref), v20 (ref), v15 (ref), l_durationNeededForReward_0 (ref), v22 (ref)
            if v37.TimeLength > 0 then
                v20(v37.TimePosition / v37.TimeLength);
                if v15 and l_durationNeededForReward_0 then
                    if l_durationNeededForReward_0 == 0 then
                        v22(1);
                        return;
                    else
                        v22((math.min(v37.TimePosition / l_durationNeededForReward_0, 1)));
                    end;
                end;
            end;
        end);
        v14.onVideoFrameLoaded(v37);
        return function() --[[ Line: 111 ]]
            -- upvalues: v38 (copy)
            v38:Disconnect();
        end;
    end, {});
    local v39 = v25 or v27;
    local v40 = false;
    if v29 == v13.Playing then
        v40 = not v39;
    end;
    local v41 = nil;
    if l_RunService_0:IsStudio() then
        v41 = v3.createElement(require(l_components_0.TestAdDisclaimerComponent), {
            isEligible = v14.isEligible
        });
    end;
    return v3.createElement(l_View_0, {
        tag = "size-full", 
        onActivated = function() --[[ Line: 128 ]] --[[ Name: onActivated ]]

        end, 
        stateLayer = {
            affordance = l_StateLayerAffordance_0.None
        }, 
        backgroundStyle = v16.Color.Extended.Black.Black_100
    }, {
        videoFrame = v3.createElement("VideoFrame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Video = v14.creativeAssetUrl, 
            Playing = v40, 
            BorderSizePixel = 0, 
            Transparency = v25 and 0.4 or 0, 
            ref = v32
        }, {
            v3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1.7777777777777777, 
                AspectType = Enum.AspectType.FitWithinMaxSize
            }); 
            testAdDisclaimer = v41, 
            confirmExitModal = v3.createElement(v11, {
                Enabled = v25, 
                onCancel = function() --[[ Line: 152 ]] --[[ Name: onCancel ]]
                    -- upvalues: v26 (copy)
                    v26(false);
                end, 
                onConfirm = v14.onCancel
            }), 
            reportAdModal = v3.createElement(l_ReportAdPopup_0, {
                showReportAdPopup = v27, 
                onClose = function() --[[ Line: 159 ]] --[[ Name: onClose ]]
                    -- upvalues: v28 (copy)
                    v28(false);
                end, 
                onOpen = function() --[[ Line: 162 ]] --[[ Name: onOpen ]]
                    -- upvalues: v28 (copy)
                    v28(true);
                end, 
                adInfo = v14.getReportAdInfo()
            }), 
            videoOverlay = v3.createElement(v10, {
                ref = v31, 
                alpha = v19, 
                totalDuration = v17, 
                parentModalOpen = v39, 
                rewardWaitTime = if v15 then l_durationNeededForReward_0 else nil, 
                rewardWaitAlpha = if v15 then v21 else nil, 
                dismissModals = v34, 
                parentPaused = not v40, 
                showWhyThisAd = v14.showWhyThisAd, 
                setPaused = function(v42) --[[ Line: 177 ]] --[[ Name: setPaused ]]
                    -- upvalues: v29 (copy), v13 (ref), v30 (copy)
                    if v29 ~= v13.Loading then
                        v30(if v42 then v13.Paused else v13.Playing);
                    end;
                end, 
                showReportAdModal = function() --[[ Line: 182 ]] --[[ Name: showReportAdModal ]]
                    -- upvalues: v28 (copy)
                    v28(true);
                end, 
                showExitConfirmationModal = function() --[[ Line: 185 ]] --[[ Name: showExitConfirmationModal ]]
                    -- upvalues: v12 (ref), v21 (ref), v14 (copy), v26 (copy), v28 (copy), v15 (copy), v31 (ref)
                    if v12.GetEnableLuaRewardTimerUI() and v21:getValue() >= 1 then
                        v14.onComplete();
                        return;
                    else
                        v26(false);
                        v28(false);
                        local v43 = nil;
                        v43 = if v15 then v31.current else v31:getValue();
                        if v43 then
                            v43.dismissModals();
                        end;
                        v26(true);
                        return;
                    end;
                end
            })
        })
    });
end;