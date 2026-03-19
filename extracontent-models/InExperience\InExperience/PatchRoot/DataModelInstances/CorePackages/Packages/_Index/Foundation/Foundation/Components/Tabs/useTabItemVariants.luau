local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local v4 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v5 = require(l_script_FirstAncestor_0.Enums.IconSize);
local function v11(_) --[[ Line: 32 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v4 (copy), v5 (copy)
    local v7 = {
        text = {
            tag = "auto-x"
        }, 
        content = {
            tag = "align-x-center align-y-center row gap-small"
        }
    };
    local v8 = {
        [v4.XSmall] = {
            text = {
                tag = "text-label-small size-0-400"
            }, 
            content = {
                tag = "padding-y-small"
            }, 
            icon = {
                size = v5.XSmall
            }
        }, 
        [v4.Small] = {
            text = {
                tag = "text-label-medium size-0-600"
            }, 
            content = {
                tag = "padding-y-small"
            }, 
            icon = {
                size = v5.Medium
            }
        }, 
        [v4.Medium] = {
            text = {
                tag = "text-label-medium size-0-600"
            }, 
            content = {
                tag = "padding-y-medium"
            }, 
            icon = {
                size = v5.Medium
            }
        }, 
        [v4.Large] = {
            text = {
                tag = "text-label-medium size-0-600"
            }, 
            content = {
                tag = "padding-y-xlarge"
            }, 
            icon = {
                size = v5.Medium
            }
        }
    };
    local v9 = {
        [v4.XSmall] = {
            content = {
                tag = "padding-x-small"
            }
        }, 
        [v4.Small] = {
            content = {
                tag = "padding-x-small"
            }
        }, 
        [v4.Medium] = {
            content = {
                tag = "padding-x-medium"
            }
        }, 
        [v4.Large] = {
            content = {
                tag = "padding-x-large"
            }
        }
    };
    local v10 = {
        [false] = {
            container = {
                tag = "auto-xy"
            }, 
            content = {
                tag = "size-0-0 auto-xy"
            }
        }, 
        [true] = {
            container = {
                tag = "auto-xy grow"
            }, 
            content = {
                tag = "size-full-0 auto-y"
            }
        }
    };
    return {
        common = v7, 
        sizes = v8, 
        isFill = v10, 
        paddings = v9
    };
end;
return function(v12, v13, v14) --[[ Line: 76 ]]
    -- upvalues: v3 (copy), v11 (copy), v1 (copy)
    local v15 = v3.useVariants("Tab", v11, v12);
    return v1(v15.common, v15.sizes[v13], v15.isFill[v14], if v14 then v15.paddings[v13] else {});
end;