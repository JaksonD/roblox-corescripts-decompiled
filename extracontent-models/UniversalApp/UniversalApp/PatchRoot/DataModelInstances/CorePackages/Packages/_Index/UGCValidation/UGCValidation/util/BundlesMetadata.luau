local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Parent.Promise);
local v4 = require(l_Parent_0.util.APIUtil);
return {
    fetch = function() --[[ Line: 42 ]] --[[ Name: fetch ]]
        -- upvalues: v3 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), v4 (copy)
        return v3.try(function() --[[ Line: 43 ]]
            -- upvalues: l_HttpService_0 (ref), l_HttpRbxApiService_0 (ref), v4 (ref)
            return l_HttpService_0:JSONDecode(l_HttpRbxApiService_0:GetAsyncFullUrl((("https://itemconfiguration.%*/v1/bundles/metadata"):format((v4.getBaseDomain())))));
        end);
    end, 
    mock = function() --[[ Line: 50 ]] --[[ Name: mock ]]
        return {
            isBundlesControllerEnabled = true, 
            isBundlesCreationEnabled = true, 
            isBundlesPublishingEnabled = true, 
            allowedBundleTypeSettings = {
                Body = {
                    allowedAssetTypeSettings = {
                        DynamicHead = {
                            minimumQuantity = 1, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }, 
                        EyebrowAccessory = {
                            minimumQuantity = 0, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }, 
                        EyelashAccessory = {
                            minimumQuantity = 0, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }, 
                        HairAccessory = {
                            minimumQuantity = 0, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }, 
                        LeftArm = {
                            minimumQuantity = 1, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }, 
                        LeftLeg = {
                            minimumQuantity = 1, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }, 
                        RightArm = {
                            minimumQuantity = 1, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }, 
                        RightLeg = {
                            minimumQuantity = 1, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }, 
                        Torso = {
                            minimumQuantity = 1, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }
                    }, 
                    marketplaceFeePercentage = 30, 
                    allowedPriceRange = {
                        minimumPrice = 0, 
                        maximumPrice = 10000
                    }
                }, 
                DynamicHead = {
                    allowedAssetTypeSettings = {
                        DynamicHead = {
                            minimumQuantity = 1, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }, 
                        EyebrowAccessory = {
                            minimumQuantity = 0, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }, 
                        EyelashAccessory = {
                            minimumQuantity = 0, 
                            maximumQuantity = 1, 
                            isEligibleForUpload = true, 
                            allowedFileExtensions = {
                                ".rbxm"
                            }
                        }
                    }, 
                    marketplaceFeePercentage = 30, 
                    allowedPriceRange = {
                        minimumPrice = 0, 
                        maximumPrice = 10000
                    }
                }
            }
        };
    end
};