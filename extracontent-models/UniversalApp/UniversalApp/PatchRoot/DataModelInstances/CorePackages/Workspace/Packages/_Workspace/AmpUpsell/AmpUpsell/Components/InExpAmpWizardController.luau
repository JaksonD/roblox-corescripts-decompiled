local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactRoblox);
local v5 = require(l_Parent_0.Roact);
local l_SetScreenSize_0 = require(l_Parent_0.InExperienceContainer).SetScreenSize;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local _ = require(l_script_FirstAncestor_0.Components.WizardContainer);
local v9 = require(l_script_FirstAncestor_0.Components.InExpWizardNavigator);
local l_InExperienceProviderContainer_0 = require(l_Parent_0.InExperienceContainer).InExperienceProviderContainer;
game:DefineFastString("DummyAMPWizardAccessResponse", "Granted");
game:DefineFastString("DummyAMPWizardActionsTakenJSON", "{}");
local v11 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableDummyAMPWizard);
local l_GetFFlagInExperienceContainerScreenSizeReducer_0 = require(l_Parent_0.SharedFlags).GetFFlagInExperienceContainerScreenSizeReducer;
local l_GetFFlagMoveAmpUpsellOffNavigateDown_0 = require(l_Parent_0.SharedFlags).GetFFlagMoveAmpUpsellOffNavigateDown;
local v14 = game:DefineFastInt("InExpAmpWizardDisplayOrder", 6);
local v15 = nil;
local function v19(v16) --[[ Line: 28 ]] --[[ Name: WizardScreenGui ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v14 (copy), v5 (copy), l_SetScreenSize_0 (copy), v9 (copy)
    local v17 = l_useDispatch_0();
    return v3.createElement("ScreenGui", {
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        ResetOnSpawn = false, 
        DisplayOrder = v14, 
        Enabled = true, 
        [v5.Change.AbsoluteSize] = function(v18) --[[ Line: 36 ]]
            -- upvalues: v17 (copy), l_SetScreenSize_0 (ref)
            v17(l_SetScreenSize_0(v18.AbsoluteSize));
        end
    }, {
        v3.createElement(v9, {
            screenProps = {
                extraProps = v16
            }
        })
    });
end;
local function v23(v20) --[[ Line: 48 ]] --[[ Name: renderAmpWizard ]]
    -- upvalues: v15 (ref), v4 (copy), v3 (copy), l_InExperienceProviderContainer_0 (copy), v19 (copy)
    if v15 == nil then
        local l_CoreGui_0 = game:GetService("CoreGui");
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "AmpWizard";
        l_Folder_0.Parent = l_CoreGui_0;
        v15 = v4.createRoot(l_Folder_0);
    end;
    v15:render(v3.createElement(l_InExperienceProviderContainer_0, {}, v3.createElement(v19, v20)));
end;
return {
    OpenAmpWizardContainerInExp = function(v24, v25, v26, v27, v28, v29) --[[ Line: 63 ]] --[[ Name: OpenAmpWizardContainerInExp ]]
        -- upvalues: v11 (copy), l_HttpService_0 (copy), l_GetFFlagInExperienceContainerScreenSizeReducer_0 (copy), l_GetFFlagMoveAmpUpsellOffNavigateDown_0 (copy), v15 (ref), v23 (copy)
        if v11() then
            task.delay(0.5, function() --[[ Line: 72 ]]
                -- upvalues: v25 (copy), l_HttpService_0 (ref)
                if v25 then
                    local l_game_FastString_0 = game:GetFastString("DummyAMPWizardAccessResponse");
                    local l_game_FastString_1 = game:GetFastString("DummyAMPWizardActionsTakenJSON");
                    local v32 = {};
                    if pcall(function() --[[ Line: 78 ]]
                        -- upvalues: l_HttpService_0 (ref), l_game_FastString_1 (copy)
                        l_HttpService_0:JSONDecode(l_game_FastString_1);
                    end) then
                        v32 = l_HttpService_0:JSONDecode(l_game_FastString_1);
                        v25(l_game_FastString_0, v32);
                    else
                        print("Failed to decode DummyWizardActionsTakenJSON, not calling completionCallback");
                        return;
                    end;
                end;
            end);
            return;
        elseif l_GetFFlagInExperienceContainerScreenSizeReducer_0() and l_GetFFlagMoveAmpUpsellOffNavigateDown_0() then
            local v35 = {
                nameSpace = v29, 
                featureName = v24, 
                completionCallback = function(v33, v34) --[[ Line: 94 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v15 (ref), v25 (copy)
                    if v15 then
                        v15:render(nil);
                    end;
                    if v25 then
                        v25(v33, v34);
                    end;
                end, 
                recourseData = v26, 
                entryPointEventCtx = v27, 
                extraParameters = v28
            };
            v23(v35);
            return;
        else
            print("InExpAmpWizardController: OpenAmpWizardContainerInExp called without necessary flags");
            return;
        end;
    end
};