
-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
-- update $PATH
hl.env("PATH", os.getenv("HOME") .. "/.local/bin:" .. os.getenv("PATH"))
