local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v3 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v5 = require(l_script_FirstAncestor_0.Utility.Flags);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v8 = require(script.Parent.useDialog);
local v9 = {
    [v2.Small] = 320, 
    [v2.Medium] = 480, 
    [v2.Large] = 640
};
local function v13(v10) --[[ Line: 45 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v5 (copy), v2 (copy), v9 (copy)
    local v11 = {
        backdrop = {
            backgroundStyle = v10.Color.Common.Backdrop
        }, 
        shadow = {
            tag = "auto-xy", 
            imageStyle = v10.Color.Extended.Black.Black_15
        }, 
        container = {
            tag = "size-full-full col align-x-center align-y-center"
        }, 
        inner = {
            tag = "size-full-0 auto-y shrink-1 bg-surface-100 clip"
        }, 
        body = {
            tag = ("size-full auto-y col padding-bottom-xlarge %*"):format(v5.FoundationDialogBodyUpdate and "gap-xlarge" or "")
        }, 
        heroMediaWrapper = {
            tag = "auto-y size-full-full position-top-center shrink"
        }, 
        title = {
            tag = "size-full-0 auto-y"
        }, 
        titleText = {
            tag = ("size-full-0 auto-y text-wrap text-align-x-left %*"):format(v5.FoundationDialogTitleEmphasisFix and "content-emphasis" or "content-emphasized")
        }, 
        content = {
            tag = "auto-y size-full fill"
        }, 
        contentText = {
            tag = "text-wrap text-align-x-left text-align-y-top auto-y size-full-0"
        }, 
        actionsLabel = {
            tag = "text-align-x-left text-wrap text-align-y-top auto-y size-full-0 text-body-small"
        }
    };
    local v12 = {
        [v2.Small] = {
            shadow = {
                tag = "padding-large"
            }, 
            inner = {
                maxWidth = v9[v2.Small], 
                tag = "radius-medium"
            }, 
            body = {
                tag = ("padding-x-large %*"):format(v5.FoundationDialogBodyUpdate and "" or "gap-large")
            }, 
            closeAffordance = {
                offset = v10.Size.Size_300
            }, 
            heroMedia = {
                tag = "radius-medium", 
                offsetX = v10.Padding.Large
            }, 
            titleText = {
                tag = "text-heading-small"
            }, 
            contentText = {
                tag = "text-body-medium"
            }, 
            actionsLabel = {
                tag = "padding-top-large"
            }
        }, 
        [v2.Medium] = {
            shadow = {
                tag = "padding-xlarge"
            }, 
            inner = {
                maxWidth = v9[v2.Medium], 
                tag = "radius-large"
            }, 
            body = {
                tag = ("padding-x-xlarge %*"):format(v5.FoundationDialogBodyUpdate and "" or "gap-xlarge")
            }, 
            closeAffordance = {
                offset = v10.Size.Size_400
            }, 
            heroMedia = {
                tag = "radius-large", 
                offsetX = v10.Padding.XLarge
            }, 
            titleText = {
                tag = "text-heading-medium"
            }, 
            contentText = {
                tag = "text-body-medium"
            }, 
            actionsLabel = {
                tag = "padding-top-xlarge"
            }
        }, 
        [v2.Large] = {
            shadow = {
                tag = "padding-xlarge"
            }, 
            inner = {
                maxWidth = v9[v2.Large], 
                tag = "radius-large"
            }, 
            body = {
                tag = ("padding-x-xlarge %*"):format(v5.FoundationDialogBodyUpdate and "" or "gap-xlarge")
            }, 
            closeAffordance = {
                offset = v10.Size.Size_400
            }, 
            heroMedia = {
                tag = "radius-large", 
                offsetX = v10.Padding.XLarge
            }, 
            titleText = {
                tag = "text-heading-large"
            }, 
            contentText = {
                tag = "text-body-large"
            }, 
            actionsLabel = {
                tag = "padding-top-xlarge"
            }
        }
    };
    return {
        common = v11, 
        size = v12
    };
end;
useDialogVariants = function() --[[ Line: 180 ]] --[[ Name: useDialogVariants ]]
    -- upvalues: v6 (copy), v7 (copy), v13 (copy), v8 (copy), v3 (copy)
    local v14 = v6();
    local v15 = v7.useVariants("Dialog", v13, v14);
    local v16 = v8();
    return v3(v15.common, v15.size[v16.responsiveSize]);
end;
return {
    useDialogVariants = useDialogVariants, 
    DIALOG_SIZES = v9
};