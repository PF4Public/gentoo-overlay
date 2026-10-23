// Orca resolves its packaged resources (app.asar, app.asar.unpacked, node_modules,
// the daemon template and every worker/forked child entry) relative to
// process.resourcesPath. With the system-electron layout the executable lives in
// the electron dist, so Electron reports resourcesPath as that dist's resources
// directory instead of this app's install dir, and every such lookup misses.
// Pin it to this app's directory (the sibling of app.asar) before app code runs.
Object.defineProperty(process, 'resourcesPath', {
  value: __dirname,
  configurable: true,
  writable: true
})
