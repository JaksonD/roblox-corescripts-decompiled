local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.ProgressTile);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_IDVStep_0 = require(l_script_FirstAncestor_0.Common.Enums).IDVStep;
return function(v6) --[[ Line: 15 ]] --[[ Name: ProgressChecklist ]]
    -- upvalues: l_useLocalization_0 (copy), l_IDVStep_0 (copy), v2 (copy), v3 (copy)
    local v7 = l_useLocalization_0({
        connectedMobile = "Verification.Identity.Label.ConnectingToMobile", 
        verifyingYou = "Verification.Identity.Label.VerifyingYou", 
        waitingForResults = "Verification.Identity.Label.VerificationWaitingForResults", 
        updatingRbxProfile = "Verification.Identity.Label.UpdatingRoblox"
    });
    local v8 = v6.latestStepCompleted >= l_IDVStep_0.ConnectedMobile;
    local v9 = v6.latestStepCompleted >= l_IDVStep_0.Verified;
    local v10 = v6.latestStepCompleted >= l_IDVStep_0.GotResults;
    local v11 = v6.latestStepCompleted >= l_IDVStep_0.UpdatedRobloxProfile;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v6.entryHeight * 4), 
        BackgroundTransparency = 1, 
        LayoutOrder = v6.layoutOrder
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        MobileCheck = v2.createElement(v3, {
            frameHeight = v6.entryHeight, 
            layoutOrder = 1, 
            finished = v8, 
            progressText = v7.connectedMobile
        }), 
        VerifiedCheck = v2.createElement(v3, {
            frameHeight = v6.entryHeight, 
            layoutOrder = 2, 
            finished = v9, 
            progressText = v7.verifyingYou
        }), 
        GotResultsCheck = v2.createElement(v3, {
            frameHeight = v6.entryHeight, 
            layoutOrder = 3, 
            finished = v10, 
            progressText = v7.waitingForResults
        }), 
        UpdateProfileCheck = v2.createElement(v3, {
            frameHeight = v6.entryHeight, 
            layoutOrder = 4, 
            finished = v11, 
            progressText = v7.updatingRbxProfile
        })
    });
end;