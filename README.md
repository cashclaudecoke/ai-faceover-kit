# AI Faceover Kit (Mac, Apple Silicon)

Puts an AI character over your face live, then sends it to Zoom, Google Meet,
Discord, browser video-chat sites, and (usually) FaceTime.

How it works:
  Webcam -> Deep-Live-Cam (swaps your face with a character image) -> OBS Virtual Camera -> your call app

## Steps (do in order)
1. Double-click `1-install.command`. It takes 10-20 min the first time.
   If macOS blocks it: right-click > Open > Open.
2. Drop a character image into `characters/`. Use a clear, front-facing face.
   Generate one in Higgsfield or any image tool.
3. Double-click `2-start-faceover.command`.
   - Click "Select a face" and pick your character image.
   - Click "Live". Allow camera access when macOS asks (for Terminal).
4. Set up OBS once: follow `guides/OBS-virtual-camera.md`.
5. In Zoom / Meet / the website, choose **OBS Virtual Camera** as your camera.

## What's in here
- `1-install.command`: installs everything (Homebrew stuff, Deep-Live-Cam, AI models)
- `2-start-faceover.command`: launches the face swap
- `characters/`: put your character face images here
- `guides/OBS-virtual-camera.md`: route the output into any call app
- `guides/troubleshooting.md`: fixes for common problems
- `guides/no-faceswap-option.md`: lighter avatar option (cartoon / VTuber style)

## Tips
- Good front lighting on your face makes the biggest difference.
- Keep your head mostly facing the camera. Big side turns can glitch.
- Expect ~10-25 fps on an M-series Mac. That's fine for calls.

## Use it right
Use original or fictional characters. Don't use a real person's face without
their permission, and don't use it to pass yourself off as someone else.
