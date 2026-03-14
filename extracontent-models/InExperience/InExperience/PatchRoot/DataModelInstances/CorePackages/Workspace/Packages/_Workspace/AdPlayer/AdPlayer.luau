local l_AdService_0 = game:GetService("AdService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v4 = require(l_script_0.Flags);
local v5 = require(l_script_0.components.AdPlayerComponent);
local l_AdsDisplayOrder_0 = require(l_Parent_0.AdGuiInteractivity).AdsDisplayOrder;
local v7 = require(l_Parent_0.ReactRoblox);
local v8 = require(l_Parent_0.React);
local v9 = require(l_script_0.components.BaseComponent);
return {
    ["jest.config"] = l_script_0["jest.config"], 
    init = function() --[[ Line: 26 ]] --[[ Name: init ]]
        -- upvalues: l_AdsDisplayOrder_0 (copy), l_CoreGui_0 (copy), v7 (copy), l_AdService_0 (copy), v4 (copy), v8 (copy), v9 (copy), v5 (copy)
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "RewardedVideoAdPlayer";
        l_ScreenGui_0.DisplayOrder = l_AdsDisplayOrder_0.AdPlayer;
        l_ScreenGui_0.IgnoreGuiInset = true;
        l_ScreenGui_0.ResetOnSpawn = false;
        l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        l_ScreenGui_0.Parent = l_CoreGui_0;
        local v11 = v7.createRoot(l_ScreenGui_0);
        l_AdService_0.onDemandVideoPlayInUI = function(v12) --[[ Line: 37 ]]
            -- upvalues: v11 (copy), l_AdService_0 (ref), v4 (ref), v8 (ref), v9 (ref), v5 (ref)
            local function _(v13) --[[ Line: 38 ]] --[[ Name: onVideoCompleted ]]
                -- upvalues: v11 (ref), l_AdService_0 (ref), v12 (copy)
                v11:render(nil);
                l_AdService_0:onDemandVideoCompleteFromUI(v13, v12.encryptedAdTrackingData, v12.encryptionMetadata, v12.rewardDetails);
            end;
            local v15 = nil;
            if v4.GetEnableLuaRewardTimerUI() and v12.durationNeededForRewardMs and v12.durationNeededEnum == "Variable" then
                v15 = v12.durationNeededForRewardMs / 1000;
            end;
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local v17 = nil;
            v11:render(v8.createElement(v9, {}, {
                v8.createElement(v5, {
                    isEligible = v12.isEligible, 
                    creativeAssetUrl = v12.creativeAssetUrl, 
                    durationNeededForReward = if v4.GetEnableLuaRewardTimerUI() then v15 else nil, 
                    onVideoFrameLoaded = function(v18) --[[ Line: 66 ]] --[[ Name: onVideoFrameLoaded ]]
                        -- upvalues: v17 (ref), l_BindableEvent_0 (copy)
                        v17 = v18;
                        if l_BindableEvent_0 then
                            l_BindableEvent_0:Fire();
                        end;
                    end, 
                    onCancel = function() --[[ Line: 72 ]] --[[ Name: onCancel ]]
                        -- upvalues: v11 (ref), l_AdService_0 (ref), v12 (copy)
                        local l_ShowInterrupted_0 = Enum.ShowAdResult.ShowInterrupted;
                        v11:render(nil);
                        l_AdService_0:onDemandVideoCompleteFromUI(l_ShowInterrupted_0, v12.encryptedAdTrackingData, v12.encryptionMetadata, v12.rewardDetails);
                    end, 
                    onComplete = function() --[[ Line: 75 ]] --[[ Name: onComplete ]]
                        -- upvalues: v11 (ref), l_AdService_0 (ref), v12 (copy)
                        local l_ShowCompleted_0 = Enum.ShowAdResult.ShowCompleted;
                        v11:render(nil);
                        l_AdService_0:onDemandVideoCompleteFromUI(l_ShowCompleted_0, v12.encryptedAdTrackingData, v12.encryptionMetadata, v12.rewardDetails);
                    end, 
                    showWhyThisAd = function() --[[ Line: 78 ]] --[[ Name: showWhyThisAd ]]
                        -- upvalues: l_AdService_0 (ref)
                        l_AdService_0:HandleWhyThisAdClicked("advertiserName", "payerName");
                    end, 
                    getReportAdInfo = function() --[[ Line: 81 ]] --[[ Name: getReportAdInfo ]]
                        -- upvalues: v12 (copy)
                        return {
                            assetId = v12.creativeAssetUrl, 
                            adUnitName = "Rewarded Video Ad", 
                            encryptionMetadata = v12.encryptionMetadata, 
                            encryptedAdTrackingData = v12.encryptedAdTrackingData
                        };
                    end
                })
            }));
            if not v17 then
                l_BindableEvent_0.Event:Wait();
            end;
            l_BindableEvent_0:Destroy();
            return v17;
        end;
    end
};