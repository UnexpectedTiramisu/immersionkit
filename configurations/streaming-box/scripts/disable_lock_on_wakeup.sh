# I was annoyed by the fact that plasma prompted for the user password when resuming from sleep.
# This disables that functionality.
kwriteconfig6 --file kscreenlockerrc --group Daemon --key LockOnResume false