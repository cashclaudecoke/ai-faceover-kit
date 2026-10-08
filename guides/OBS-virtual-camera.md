# Send the faceover into Zoom / Meet / websites (OBS Virtual Camera)

One-time setup:
1. Open OBS (the installer added it to Applications).
   First launch: allow Screen Recording in System Settings > Privacy & Security, then reopen OBS.
2. Start the faceover (`2-start-faceover.command`, then Live) so its preview window is open.
3. In OBS under **Sources**, click **+** > **macOS Screen Capture** > Method: **Window Capture**,
   and pick the Deep-Live-Cam preview window.
4. Right-click the source > **Transform > Fit to screen**. Crop the edges with Alt/Option+drag if needed.
5. Click **Start Virtual Camera** (bottom right). The first time, macOS asks to allow
   the OBS system extension: approve it in System Settings > General > Login Items & Extensions.

Every time after:
1. Start the faceover and click Live.
2. Open OBS and click Start Virtual Camera.
3. In your call app, set the camera to **OBS Virtual Camera**.
   - Zoom: Settings > Video > Camera
   - Chrome sites: click the camera icon in the address bar, or the site's camera menu
   - FaceTime: Video menu > OBS Virtual Camera (works on recent macOS; if it doesn't show, use Zoom/Chrome)

Audio stays your normal mic. Only video changes.
