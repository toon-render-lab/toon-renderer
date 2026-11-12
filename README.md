# toon-renderer

Headless frame renderer for three.js scenes on GitHub Actions (Playwright + SwiftShader, no GPU).

- Trigger: `workflow_dispatch` only (`.github/workflows/render.yml`).
- Input: an encrypted bundle on a temporary branch `job/<id>`. It must contain `render.sh <framesDir> <shard> <shards>`
  and `finish.sh <framesDir> <outDir>`.
- Output: an encrypted artifact (`out`), kept for one day.
- The only secret is the bundle key (`RENDER_KEY`).
