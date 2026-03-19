local l_Parent_0 = script:FindFirstAncestor("GameInvite").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_PartialPageModal_0 = require(l_Parent_0.UIBlox).App.Dialog.Modal.PartialPageModal;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_GetFStringReferralRewardsTermsURL_0 = require(l_Parent_0.SharedFlags).GetFStringReferralRewardsTermsURL;
local v8 = game:DefineFastFlag("EnableRewardsWebViewOverlay", false);
local function _() --[[ Line: 27 ]]
    return workspace.CurrentCamera.ViewportSize;
end;
local function v13(v10) --[[ Line: 32 ]]
    -- upvalues: l_LocalizationService_0 (copy)
    if not v10 or v10 == "" then
        return "";
    else
        local v11 = DateTime and DateTime.fromIsoDate(v10) or nil;
        if not v11 then
            return "";
        else
            local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
            return (("%* %*"):format(v11:FormatLocalTime("LL", l_RobloxLocaleId_0), (v11:FormatLocalTime("LT", l_RobloxLocaleId_0))));
        end;
    end;
end;
return function(v14) --[[ Line: 46 ]]
    -- upvalues: v1 (copy), v2 (copy), l_PartialPageModal_0 (copy), v13 (copy), v8 (copy), l_HttpService_0 (copy), l_GetFStringReferralRewardsTermsURL_0 (copy), l_BrowserService_0 (copy)
    return v1.createElement("ScreenGui", {
        DisplayOrder = 100, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        IgnoreGuiInset = true
    }, {
        RewardsInfoModalContainer = v1.createElement(v2.View, {
            tag = "size-full-full bg-over-media-100", 
            onActivated = function() --[[ Line: 55 ]] --[[ Name: onActivated ]]
                -- upvalues: v14 (copy)
                if v14.setModalOpen then
                    v14.setModalOpen(false);
                end;
            end
        }, {
            RewardsInfoModal = v1.createElement(l_PartialPageModal_0, {
                title = v14.title, 
                screenSize = workspace.CurrentCamera.ViewportSize, 
                position = UDim2.new(0.5, 0, 0.5, 0), 
                onCloseClicked = function() --[[ Line: 65 ]] --[[ Name: onCloseClicked ]]
                    -- upvalues: v14 (copy)
                    if v14.setModalOpen then
                        v14.setModalOpen(false);
                    end;
                end
            }, {
                RewardsInfoModalContent = v1.createElement(v2.View, {
                    tag = "col size-full-0 auto-y gap-y-large padding-top-large", 
                    Size = UDim2.new(1, 0, 0, 180)
                }, {
                    RewardsInfoModalTitle = v1.createElement(v2.Text, {
                        tag = "text-title-medium auto-xy text-align-x-left text-wrap", 
                        Text = v14.rewardDetailsTitle, 
                        LayoutOrder = 0
                    }), 
                    RewardsInfoModalBody = v1.createElement(v2.Text, {
                        tag = "text-body-medium auto-xy text-align-x-left text-wrap padding-top-small", 
                        Text = v14.rewardDetailsBody, 
                        LayoutOrder = 1
                    }), 
                    RewardsInfoModalLimitsTitle = v1.createElement(v2.Text, {
                        tag = "text-title-medium auto-xy text-align-x-left text-wrap padding-top-medium", 
                        Text = v14.rewardLimitsTitle, 
                        LayoutOrder = 2
                    }), 
                    RewardInfoExpiresText = v1.createElement(v2.Text, {
                        tag = "text-body-medium auto-xy text-align-x-left text-wrap padding-top-small", 
                        Text = v14.rewardsExpiresText .. " " .. v13(v14.expiryUtc), 
                        LayoutOrder = 3
                    }), 
                    RewardsInfoModalLimitsBody = v1.createElement(v2.Text, {
                        tag = "text-body-medium auto-xy text-align-x-left text-wrap", 
                        Text = v14.rewardLimitsBody, 
                        LayoutOrder = 4
                    }), 
                    RewardsInfoModalCreatorSupportText = v1.createElement(v2.Text, {
                        tag = "text-caption-medium auto-xy text-align-x-left text-wrap padding-top-xlarge", 
                        Text = v14.rewardCreatorSupportText, 
                        LayoutOrder = 5
                    }), 
                    RewardsInfoModalTermsContainer = v1.createElement(v2.View, {
                        tag = "row grow auto-xy align-x-left padding-top-small", 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 6, 
                        onActivated = function() --[[ Line: 109 ]] --[[ Name: onActivated ]]
                            -- upvalues: v8 (ref), l_HttpService_0 (ref), l_GetFStringReferralRewardsTermsURL_0 (ref), v14 (copy), l_BrowserService_0 (ref)
                            local v15 = nil;
                            v15 = if v8 then l_HttpService_0:JSONEncode({
                                url = l_GetFStringReferralRewardsTermsURL_0(), 
                                title = v14.rewardsTerms, 
                                command = "open", 
                                visible = true, 
                                isGenericWebview = true, 
                                enableOverlayReplacement = true
                            }) else l_HttpService_0:JSONEncode({
                                url = l_GetFStringReferralRewardsTermsURL_0(), 
                                title = v14.rewardsTerms, 
                                command = "open"
                            });
                            l_BrowserService_0:SendCommand(v15);
                        end
                    }, {
                        RewardsInfoModalTermsText = v1.createElement(v2.Text, {
                            tag = "text-label-small auto-xy text-align-x-left text-wrap", 
                            Text = ("<u><b>%*</b></u>"):format(v14.rewardsTerms), 
                            RichText = true
                        })
                    })
                })
            })
        })
    });
end;