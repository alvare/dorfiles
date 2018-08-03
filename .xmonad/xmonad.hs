import qualified Data.Map as M
import           XMonad
import           XMonad.Actions.CopyWindow
import           XMonad.Actions.CycleRecentWS
import           XMonad.Actions.DynamicWorkspaceGroups
import           XMonad.Actions.GridSelect
import           XMonad.Actions.WindowBringer
import           XMonad.Config.Gnome
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Hooks.SetWMName
import           XMonad.Layout.NoBorders
import           XMonad.Layout.Spiral
import           XMonad.Layout.Tabbed
import           XMonad.Prompt
import qualified XMonad.StackSet as W
import           XMonad.Util.EZConfig
import           XMonad.Util.NamedScratchpad

myWorkspaces = ["1","2","3","4","5","6","7","8","9","0"]

myModKey = mod4Mask

myTerminal = "gnome-terminal"

myKeys = [ ((myModKey, xK_d), spawn "dmenu")
        -- close focused window
         , ((myModKey .|. shiftMask, xK_q), kill) ]

myManageHook = [ isFullscreen --> doFullFloat ]
        -- IntelliJ Tweaks
        -- ++
        -- [
        --         --ignore IntelliJ autocomplete
        --         appName =? "sun-awt-X11-XWindowPeer" <&&> className =? "jetbrains-idea" --> doIgnore
        -- ]

main = xmonad $ gnomeConfig
        { modMask = myModKey
        , terminal = myTerminal
        , borderWidth = 1
        , focusedBorderColor = "#d03af2"
        , normalBorderColor = "#333333"
        --, workspaces = myWorkspaces
        , layoutHook = avoidStruts $ smartBorders (layoutHook gnomeConfig)
        , manageHook = manageHook gnomeConfig <+> composeAll myManageHook
        , startupHook = do
           startupHook gnomeConfig
           setWMName "LG3D" -- for Intelli J 😂
        } `additionalKeys` myKeys
