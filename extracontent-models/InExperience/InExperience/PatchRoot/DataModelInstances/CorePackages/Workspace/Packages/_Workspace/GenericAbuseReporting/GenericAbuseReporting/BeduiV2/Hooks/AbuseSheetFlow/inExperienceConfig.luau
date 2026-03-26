return {
    version = 1, 
    resources = {
        reportSurfaces = {
            type = "listItem", 
            value = {
                {
                    id = "voiceChat", 
                    label = {
                        ["$translate"] = "Label.SurfaceVoiceChat"
                    }, 
                    meta = {
                        routeVoiceChat = true
                    }
                }, 
                {
                    id = "textChat", 
                    label = {
                        ["$translate"] = "Label.SurfaceTextChat"
                    }, 
                    meta = {
                        routeTextChat = true
                    }
                }, 
                {
                    id = "avatarOrName", 
                    label = "Someone playing", 
                    description = "Their username, avatar, or behavior", 
                    meta = {
                        routeAvatarOrName = true
                    }
                }, 
                {
                    id = "gameOrExperience", 
                    label = "The game or experience", 
                    description = "Objects, sounds, or the whole experience", 
                    meta = {
                        routeGameOrExperience = true
                    }
                }
            }
        }, 
        temporaryUsers = {
            type = "listItem", 
            value = {
                {
                    id = "user1", 
                    label = "DisplayName1", 
                    description = "@username1"
                }, 
                {
                    id = "user2", 
                    label = "DisplayName2", 
                    description = "@username2"
                }, 
                {
                    id = "user3", 
                    label = "DisplayName3", 
                    description = "@username3"
                }
            }
        }, 
        textChatMessages = {
            type = "listItem", 
            value = {
                {
                    id = "message1", 
                    label = "[Sent privately] bigfootflow: yo mamaa a treehouse bruh"
                }, 
                {
                    id = "message2", 
                    label = "bigfootflow: bruhhh hahaha you suck at this game you should uninstall"
                }, 
                {
                    id = "message3", 
                    label = "[Sent privately] notsocialman: ugh shut up"
                }, 
                {
                    id = "message4", 
                    label = "notsocialman: YOU SUCK"
                }
            }
        }, 
        experienceTargets = {
            type = "listItem", 
            value = {
                {
                    id = "somethingInExperience", 
                    label = "Something in the experience", 
                    meta = {
                        routeHighlightMode = true
                    }
                }, 
                {
                    id = "wholeGameOrExperience", 
                    label = "The whole game or experience"
                }
            }
        }, 
        abuseTypes = {
            type = "listItem", 
            value = {
                {
                    id = "ABUSE_CATEGORY_BULLYING", 
                    label = {
                        ["$translate"] = "Label.AbuseBullying"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseBullying"
                    }, 
                    meta = {
                        showHelpline = true
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_SWEARING", 
                    label = {
                        ["$translate"] = "Label.AbuseSwearing"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseSwearing"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_SCAMMING", 
                    label = {
                        ["$translate"] = "Label.AbuseScamming"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseScamming"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_CHEATING", 
                    label = {
                        ["$translate"] = "Label.AbuseCheating"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseCheating"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_PERSONAL_QUESTION", 
                    label = {
                        ["$translate"] = "Label.AbusePersonalInformation"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbusePersonalInformation"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_HATE_SPEECH", 
                    label = {
                        ["$translate"] = "Label.AbuseDiscrimination"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseDiscrimination"
                    }, 
                    meta = {
                        showHelpline = true
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_SPAMMING", 
                    label = {
                        ["$translate"] = "Label.AbuseSpam"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseSpam"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_OFFSITE_LINKS", 
                    label = {
                        ["$translate"] = "Label.AbuseOffPlatformLinks"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseOffPlatformLinks"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_DATING_OR_SEXUAL_CONTENT", 
                    label = {
                        ["$translate"] = "Label.AbuseRomanceSex"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseRomanceSex"
                    }, 
                    meta = {
                        showHelpline = true
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_VIOLENCE_OR_TERRORISM", 
                    label = {
                        ["$translate"] = "Label.AbuseViolence"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseViolence"
                    }, 
                    meta = {
                        showHelpline = true
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_DANGEROUS_ASK", 
                    label = {
                        ["$translate"] = "Label.AbuseDangerousSuggestions"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseDangerousSuggestions"
                    }, 
                    meta = {
                        showHelpline = true
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_ASKING_OR_GIVING_PII", 
                    label = {
                        ["$translate"] = "Label.AbuseRealLifeEvents"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseRealLifeEvents"
                    }
                }, 
                {
                    id = "ABUSE_CATEGORY_SUICIDE_OR_SELF_HARM", 
                    label = {
                        ["$translate"] = "Label.AbuseInappropriateRequest"
                    }, 
                    description = {
                        ["$translate"] = "Description.AbuseInappropriateRequest"
                    }
                }
            }
        }
    }, 
    display = {
        closeButtonLabel = {
            ["$translate"] = "Action.Close"
        }, 
        titleDisclosure = {
            tooltipTitle = {
                ["$translate"] = "Title.HowReportsWork"
            }, 
            tooltipText = {
                ["$translate"] = "Description.HowReportsWork"
            }, 
            buttonLabel = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$attribute"] = "isUkRegionUser"
                        }, 
                        value = {
                            ["$translate"] = "Action.Ok"
                        }
                    }
                }
            }, 
            openByDefault = {
                ["$attribute"] = "isUkRegionUser"
            }
        }
    }, 
    nodes = {
        root = {
            type = "list", 
            variant = "chevron", 
            title = "Report issue", 
            items = {
                ["$resource"] = "reportSurfaces"
            }, 
            formKey = "surfaceId", 
            required = true, 
            storeSelectionAsContext = "selectedSurface", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$context"] = "selectedSurface.meta.routeVoiceChat"
                        }, 
                        value = "voiceChatPlayerSelection"
                    }, 
                    {
                        condition = {
                            ["$context"] = "selectedSurface.meta.routeTextChat"
                        }, 
                        value = "textChatLineSelection"
                    }, 
                    {
                        condition = {
                            ["$context"] = "selectedSurface.meta.routeGameOrExperience"
                        }, 
                        value = "experienceSubSelection"
                    }, 
                    {
                        condition = true, 
                        value = "generalUserSelection"
                    }
                }
            }
        }, 
        voiceChatPlayerSelection = {
            type = "list", 
            variant = "chevron", 
            title = "Who do you want to report?", 
            items = {
                ["$resource"] = "temporaryUsers"
            }, 
            formKey = "voiceTargetId", 
            required = true, 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = "voiceChatAbuseSelection"
        }, 
        generalUserSelection = {
            type = "list", 
            variant = "chevron", 
            title = "Who do you want to report?", 
            items = {
                ["$resource"] = "temporaryUsers"
            }, 
            formKey = "playerTargetId", 
            required = true, 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = "generalUserAbuseSelection"
        }, 
        textChatLineSelection = {
            type = "list", 
            variant = "chevron", 
            title = "Select one chat to report", 
            items = {
                ["$resource"] = "textChatMessages"
            }, 
            formKey = "textChatMessageId", 
            required = true, 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = "textChatAbuseSelection"
        }, 
        experienceSubSelection = {
            type = "list", 
            variant = "chevron", 
            title = "What do you want to report?", 
            items = {
                ["$resource"] = "experienceTargets"
            }, 
            formKey = "gameExperienceTargetId", 
            required = true, 
            storeSelectionAsContext = "selectedGameExperienceTarget", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$context"] = "selectedGameExperienceTarget.meta.routeHighlightMode"
                        }, 
                        value = "highlightMode"
                    }, 
                    {
                        condition = true, 
                        value = "experienceAndHighlightModeAbuseSelection"
                    }
                }
            }
        }, 
        highlightMode = {
            type = "paragraph", 
            title = "Highlight the problem", 
            paragraph = "Highlight placeholder", 
            nextButtonText = "Next", 
            next = "experienceAndHighlightModeAbuseSelection"
        }, 
        voiceChatAbuseSelection = {
            type = "list", 
            variant = "chevron", 
            title = {
                ["$translate"] = "Title.WhatIssue"
            }, 
            items = {
                ["$resource"] = "abuseTypes"
            }, 
            formKey = "abuseTypeId", 
            required = true, 
            storeSelectionAsContext = "selectedAbuseType", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = "socialSummary"
        }, 
        textChatAbuseSelection = {
            type = "list", 
            variant = "chevron", 
            title = {
                ["$translate"] = "Title.WhatIssue"
            }, 
            items = {
                ["$resource"] = "abuseTypes"
            }, 
            formKey = "abuseTypeId", 
            required = true, 
            storeSelectionAsContext = "selectedAbuseType", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = "socialSummary"
        }, 
        generalUserAbuseSelection = {
            type = "list", 
            variant = "chevron", 
            title = {
                ["$translate"] = "Title.WhatIssue"
            }, 
            items = {
                ["$resource"] = "abuseTypes"
            }, 
            formKey = "abuseTypeId", 
            required = true, 
            storeSelectionAsContext = "selectedAbuseType", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = "socialSummary"
        }, 
        experienceAndHighlightModeAbuseSelection = {
            type = "list", 
            variant = "chevron", 
            title = {
                ["$translate"] = "Title.WhatIssue"
            }, 
            items = {
                ["$resource"] = "abuseTypes"
            }, 
            formKey = "abuseTypeId", 
            required = true, 
            storeSelectionAsContext = "selectedAbuseType", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = "gameExperienceSummary"
        }, 
        socialSummary = {
            type = "comment", 
            title = "Report summary", 
            formKey = "comment", 
            textAreaLabel = "More details (optional)", 
            placeholder = "Tell us what happened", 
            nextButtonText = {
                ["$translate"] = "Action.Continue"
            }, 
            next = {
                type = "submitForm", 
                onSuccess = "userConfirmation", 
                onFailure = "generalError"
            }
        }, 
        gameExperienceSummary = {
            type = "comment", 
            title = "Report summary", 
            formKey = "comment", 
            textAreaLabel = "More details (optional)", 
            placeholder = "Tell us what happened", 
            nextButtonText = "Submit", 
            next = {
                type = "submitForm", 
                onSuccess = "experienceConfirmation", 
                onFailure = "generalError"
            }
        }, 
        userConfirmation = {
            type = "confirmation", 
            title = "Thanks for your report", 
            message = "Our moderation team will use it to make Roblox safer for you and everyone.", 
            blockToggle = {
                label = "Block [username]", 
                description = "You won't see them anymore", 
                errorLabel = {
                    ["$translate"] = "Label.GeneralError"
                }, 
                userId = {
                    ["$attribute"] = "targetId"
                }, 
                blockedSnackbarMessage = {
                    ["$translate"] = "Label.BlockedPerson"
                }, 
                unblockedSnackbarMessage = {
                    ["$translate"] = "Label.UnblockedPerson"
                }
            }, 
            helpline = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$context"] = "selectedAbuseType.meta.showHelpline"
                        }, 
                        value = {
                            buttonText = {
                                ["$translate"] = "Action.ViewHelplines"
                            }, 
                            heading = "If you or someone you know is struggling, please reach out for help.", 
                            href = "https://roblox.findahelpline.com/"
                        }
                    }
                }
            }, 
            nextButtonText = {
                ["$translate"] = "Action.Close"
            }, 
            next = {
                type = "close"
            }
        }, 
        experienceConfirmation = {
            type = "confirmation", 
            title = "Thanks for your report", 
            message = "Our moderation team will use it to make Roblox safer for you and everyone.", 
            helpline = {
                ["$switch"] = {
                    {
                        condition = {
                            ["$context"] = "selectedAbuseType.meta.showHelpline"
                        }, 
                        value = {
                            buttonText = {
                                ["$translate"] = "Action.ViewHelplines"
                            }, 
                            heading = "If you or someone you know is struggling, please reach out for help.", 
                            href = "https://roblox.findahelpline.com/"
                        }
                    }
                }
            }, 
            nextButtonText = {
                ["$translate"] = "Action.Close"
            }, 
            next = {
                type = "close"
            }
        }, 
        generalError = {
            type = "paragraph", 
            title = {
                ["$translate"] = "Title.SomethingWentWrong"
            }, 
            paragraph = {
                ["$translate"] = "Description.SomethingWentWrong"
            }, 
            nextButtonText = {
                ["$translate"] = "Action.Close"
            }, 
            next = {
                type = "close"
            }
        }
    }, 
    submission = {
        endpoint = "abuse-reporting/v1/abuse-report", 
        data = {
            targetType = "user", 
            abuseVector = {
                ["$attribute"] = "abuseVector"
            }, 
            targetIdStr = {
                ["$attribute"] = "targetId"
            }, 
            category = {
                ["$formData"] = "abuseTypeId"
            }, 
            comment = {
                ["$formData"] = "comment"
            }, 
            custom = {
                REPORTED_ABUSE_SURFACE = {
                    ["$formData"] = "surfaceId"
                }, 
                REPORTED_VOICE_TARGET = {
                    ["$formData"] = "voiceTargetId"
                }, 
                REPORTED_PLAYER_TARGET = {
                    ["$formData"] = "playerTargetId"
                }, 
                REPORTED_TEXT_CHAT_MESSAGE = {
                    ["$formData"] = "textChatMessageId"
                }, 
                REPORTED_GAME_EXPERIENCE_TARGET = {
                    ["$formData"] = "gameExperienceTargetId"
                }, 
                REPORT_TARGET_ASSET_ID = {
                    ["$attribute"] = "experienceTargetId"
                }
            }
        }
    }, 
    translations = {
        ["Action.Close"] = "Close", 
        ["Action.Continue"] = "Continue", 
        ["Action.Ok"] = "OK", 
        ["Action.ViewHelplines"] = "View helplines", 
        ["Description.AbuseBullying"] = "Being mean to someone or threatening them", 
        ["Description.AbuseCheating"] = "Using hacks or exploits. Breaking a game's rules to win.", 
        ["Description.AbuseDangerousSuggestions"] = "Sharing viral challenges, instructions, and other information that can hurt people in real life", 
        ["Description.AbuseDiscrimination"] = "Being mean to someone because of their race, age, or other parts of their identity", 
        ["Description.AbuseInappropriateRequest"] = "People asking you to keep secrets, meet in real life, or join harmful groups", 
        ["Description.AbuseOffPlatformLinks"] = "Sharing links to other websites and apps, trading Robux outside Roblox", 
        ["Description.AbusePersonalInformation"] = "Asking for or sending full names, phone numbers, addresses, passwords, and more", 
        ["Description.AbuseRealLifeEvents"] = "Recreating or making fun of tragedies, political demonstrations, or other events that may be upsetting", 
        ["Description.AbuseRomanceSex"] = "Wearing revealing outfits, flirting, or kissing. Sexual words or actions.", 
        ["Description.AbuseScamming"] = "Fake trading, lying to get items, and misleading people", 
        ["Description.AbuseSpam"] = "Sending the same message many times, uploading the same files many times", 
        ["Description.AbuseSwearing"] = "Using swear words, even if they're misspelled or spelled with symbols", 
        ["Description.AbuseViolence"] = "Showing a person, animal, or character that's hurt or suffering in a way that looks real", 
        ["Description.HowReportsWork"] = "We'll review your report and take appropriate action. We won't share your information with anyone you report. Reporting doesn't block the person or thing you reported. If you want to limit your interactions with someone, you can block them.", 
        ["Description.SomethingWentWrong"] = "We weren't able to submit your report. Please try again later.", 
        ["Label.AbuseBullying"] = "Bullying", 
        ["Label.AbuseCheating"] = "Cheating", 
        ["Label.AbuseDangerousSuggestions"] = "Dangerous suggestions", 
        ["Label.AbuseDiscrimination"] = "Discrimination", 
        ["Label.AbuseInappropriateRequest"] = "Asking you to do things that aren't safe", 
        ["Label.AbuseOffPlatformLinks"] = "Outside links and trading", 
        ["Label.AbusePersonalInformation"] = "Sharing personal information", 
        ["Label.AbuseRealLifeEvents"] = "Real-life events", 
        ["Label.AbuseRomanceSex"] = "Romance or sex", 
        ["Label.AbuseScamming"] = "Scams", 
        ["Label.AbuseSpam"] = "Spam", 
        ["Label.AbuseSwearing"] = "Swearing", 
        ["Label.AbuseViolence"] = "Extreme violence", 
        ["Label.BlockedPerson"] = "You blocked this person", 
        ["Label.GeneralError"] = "Something went wrong. Please try again later.", 
        ["Label.SurfaceTextChat"] = "Text chat messages", 
        ["Label.SurfaceVoiceChat"] = "Voice chat messages", 
        ["Label.UnblockedPerson"] = "You unblocked this person", 
        ["Title.HowReportsWork"] = "How reports work", 
        ["Title.SomethingWentWrong"] = "Something went wrong", 
        ["Title.WhatIssue"] = "What was the issue?"
    }
};