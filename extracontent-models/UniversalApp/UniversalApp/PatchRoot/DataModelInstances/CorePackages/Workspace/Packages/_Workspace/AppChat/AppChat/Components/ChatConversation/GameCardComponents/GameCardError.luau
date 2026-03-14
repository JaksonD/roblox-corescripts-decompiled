local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6, _ = require(l_script_FirstAncestor_0.Utils.loadFoundationCloudAsset)("pictograms/alert");
GameCardError = function() --[[ Line: 14 ]] --[[ Name: GameCardError ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v3 (copy), v2 (copy), v6 (copy)
    local v8 = l_useTokens_0();
    local v9 = l_useLocalization_0({
        contentLoadingFailed = "Feature.Chat.Label.ContentLoadingFailed"
    });
    return v3.createElement(v2.View, {
        tag = "size-full-0 auto-xy bg-action-subtle align-x-center col padding-xxlarge"
    }, {
        LoadingFailedImage = v3.createElement(v2.Image, {
            Image = v6, 
            imageStyle = v8.Color.System.Contrast, 
            tag = "size-1600", 
            ScaleType = Enum.ScaleType.Fit
        }), 
        LoadingFailedText = v3.createElement(v2.Text, {
            tag = "auto-xy text-wrap", 
            Text = v9.contentLoadingFailed, 
            textStyle = v8.Color.System.Contrast, 
            fontStyle = v8.Typography.BodyLarge, 
            LayoutOrder = 2
        })
    });
end;
return v3.memo(GameCardError);