default["duosecurity"]["install_type"] = "source"
default["duosecurity"]["package_action"] = "upgrade"
default["duosecurity"]["source_sha256"] = "415cf02981f66ba9447df81e2fcf41e004220126640cc5f667720d46c431abf9"
default["duosecurity"]["source_version"] = "1.9.14"

default["duosecurity"]["integration_key"] = nil
default["duosecurity"]["secret_key"] = nil
default["duosecurity"]["api_hostname"] = nil

# If specified, Duo authentication is required only for users whose primary
# group or supplementary group list matches one of the space-separated pattern
# lists.
default["duosecurity"]["groups"] = nil

# On service or configuration errors that prevent Duo authentication, fail
# "safe" (allow access) or "secure" (deny access).
default["duosecurity"]["failmode"] = "safe"

# Include information such as the command to be executed in the Duo Push
# message.
default["duosecurity"]["pushinfo"] = "no"

# Use the specified HTTP proxy, same format as the HTTP_PROXY environment
# variable. (honored by wget, curl, etc.).
default["duosecurity"]["http_proxy"] = nil

# If "yes", Duo Unix will automatically send a push login request to the user's
# phone, falling back on a phone call if push is unavailable. If "no", the user
# will be prompted to choose an authentication method.  When configured with
# autopush = yes, we recommend setting prompts = 1.
default["duosecurity"]["autopush"] = "no"

# Print the contents of /etc/motd to screen after a successful login.
default["duosecurity"]["motd"] = "no"

# The maximum number of prompts that Duo Unix will display before denying
# access. Must be 1, 2, or 3. When configured with autopush = yes, we recommend
# setting prompts = 1.
default["duosecurity"]["prompts"] = "3"

# Look for factor selection or passcode in the $DUO_PASSCODE environment
# variable before prompting the user for input. When $DUO_PASSCODE is non-empty,
# it will override autopush. The SSH client will need SendEnv DUO_PASSCODE in
# its configuration, and the SSH server will similarily need AcceptEnv
# DUO_PASSCODE.
default["duosecurity"]["accept_env_factor"] = "no"

# Duo Unix reports the IP address of the authorizing user, for the purposes of
# authorization and whitelisting. If Duo Unix cannot detect the IP address of
# the client, setting fallback_local_ip = yes will cause Duo Unix to send the IP
# address of the server it is running on. If you are using IP whitelisting,
# enabling this option could cause unauthorized logins if the local IP is listed
# in the whitelist.
default["duosecurity"]["fallback_local_ip"] = "no"

# Set to the number of seconds to wait for HTTPS responses from Duo Security. If
# Duo Security takes longer than the configured number of seconds to respond to
# the preauth API call, the configured failmode is triggered. Other network
# operations such as DNS resolution, TCP connection establishment, and the SSL
# handshake have their own independent timeout and retry logic.
default["duosecurity"]["https_timeout"] = "0"
