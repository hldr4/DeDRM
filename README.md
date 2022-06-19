#### Break KFX:
 - _AD = Kindle app stored in AppData
 - _PF = Kindle app stored in Program Files
 - _new = A copy of PF with extra stuff

#### KFX Input = v1.49.0

#### DeDRM_plugin = latest git version with watermark removal pre-enabled

## Quick explanation
 - Load the DeDRM and optionally KFX input plugins into calibre
 - Run one of the BreakKFX scripts, this will launch the Kindle app with KFX support disabled, downloading the book in the legacy format supported by DeDRM (better launch the app via script every time in case it overwrites the registry values)
 - Download wanted book(s) via app, locate them, load into calibre, convert to desired format
 - Profit
