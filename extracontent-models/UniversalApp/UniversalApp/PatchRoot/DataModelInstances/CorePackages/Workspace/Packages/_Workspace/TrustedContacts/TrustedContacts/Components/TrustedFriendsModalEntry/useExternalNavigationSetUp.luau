local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.NotificationModalsManager);
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_OpenAmpWizardContainer_0 = require(l_Parent_0.AmpUpsell).OpenAmpWizardContainer;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useOpenWebView_0 = require(l_Parent_0.WebViewUtils).useOpenWebView;
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v10) --[[ Line: 25 ]] --[[ Name: useExternalNavigationSetUp ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), v3 (copy), l_useOpenWebView_0 (copy), l_NavigateBack_0 (copy), l_OpenAmpWizardContainer_0 (copy), l_default_0 (copy)
    local v11 = l_useDispatch_0();
    local v13 = v2.useCallback(function(v12) --[[ Line: 28 ]]
        -- upvalues: v3 (ref)
        v3.SetUIBloxToast({
            sequenceNumber = DateTime.now().UnixTimestamp, 
            toastTitle = v12
        });
    end, {});
    local v14 = l_useOpenWebView_0();
    local v17 = v2.useCallback(function(v15) --[[ Line: 37 ]]
        -- upvalues: v11 (copy), l_NavigateBack_0 (ref), l_OpenAmpWizardContainer_0 (ref)
        local function v16() --[[ Line: 38 ]]
            -- upvalues: v11 (ref), l_NavigateBack_0 (ref), v15 (copy)
            v11(l_NavigateBack_0(true));
            v15.completionCallback();
        end;
        v11(l_OpenAmpWizardContainer_0(v15.featureName, v16, v15.recourseData, v15.entryPointEventCtx, v15.extraParameters, v15.nameSpace));
    end, {
        v11
    });
    local v18 = v2.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v10 (copy)
        if v10.onClosed then
            v10.onClosed();
            return;
        else
            if v10.navigation then
                v10.navigation.pop();
            end;
            return;
        end;
    end, {
        v10, 
        v10.navigation
    });
    local v20 = v2.useCallback(function(v19) --[[ Line: 63 ]]
        -- upvalues: l_default_0 (ref)
        l_default_0:shareUrl(v19);
    end, {});
    return {
        closeModal = v18, 
        openAmpWizard = v17, 
        showToast = v13, 
        openWebView = v14, 
        shareUrl = v20
    };
end;