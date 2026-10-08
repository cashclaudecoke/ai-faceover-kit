# Troubleshooting

- **".command can't be opened"**: right-click > Open > Open. Or in Terminal: `chmod +x *.command`.
- **Black/no camera in Deep-Live-Cam**: System Settings > Privacy & Security > Camera > turn on Terminal. Quit Terminal fully and retry.
  Also close other apps using the camera (Zoom, FaceTime, Photo Booth).
- **Wrong camera picked**: Deep-Live-Cam has a camera dropdown next to Live. Pick your built-in/webcam, NOT "OBS Virtual Camera".
- **Laggy**: set the "Face Enhancer" dropdown in Deep-Live-Cam to None. Try a lower Resolution or Det size. Close Chrome tabs. Plug in your charger.
- **"E5RT encountered an STL exception … unbounded dimension" in Terminal**: harmless. CoreML is just running parts of the model on GPU/CPU instead of the Neural Engine.
- **"No module named tkinter"**: run `brew install python-tk@3.11`, delete the `Deep-Live-Cam/venv` folder, and run the installer again.
- **Swap looks off**: use a sharper, front-facing, well-lit character image with no glasses or hair over the face.
- **OBS Virtual Camera not listed in an app**: restart that app after clicking Start Virtual Camera.
- **Install failed partway**: just run `1-install.command` again. It skips finished steps.
