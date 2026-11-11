# Performance Rules

1. **Lists and grids:** Always use `ListView.builder` or `GridView.builder`, never build all items at once.
   - *Why it helps:* Lazily instantiates only visible items, saving memory and eliminating scrolling jank.

2. **Const constructors:** Use `const` constructors on every widget that never changes.
   - *Why it helps:* Allows Flutter to reuse widget instances and skip redundant element rebuilds during state updates.

3. **Remote images:** Always use `CachedNetworkImage` with a placeholder and an error widget, setting `memCacheWidth` to avoid decoding images larger than needed.
   - *Why it helps:* Caches images locally to avoid duplicate downloads and prevents memory spikes by decoding only at target resolution.

4. **Local assets:** Use WebP where possible and declare them in `pubspec.yaml`.
   - *Why it helps:* Delivers smaller asset file sizes with high visual quality, shrinking APK size and speeding up asset decoding.

5. **Image uploads:** When picking an image with `image_picker`, set `maxWidth: 1080` and `imageQuality: 80` so uploaded product photos stay small.
   - *Why it helps:* Compresses camera shots on the device before transmission, reducing upload latency and backend storage usage.

6. **Lightweight `main()`:** Initialize Supabase, then call `runApp()`; never block startup with non-critical tasks, using `unawaited()` for deferred work.
   - *Why it helps:* Minimizes time-to-first-frame so users see the UI immediately without experiencing frozen splash screens.

7. **Targeted rebuilds:** Use `Consumer` or `Selector` on the smallest widget that needs the data, not on a whole screen.
   - *Why it helps:* Limits widget subtree rebuilds strictly to components that depend on changed state, maintaining smooth 60/120 FPS.

8. **Product loading:** Fetch only the columns the screen needs, and show a loading skeleton while waiting.
   - *Why it helps:* Cuts network payload and database response times while providing a smooth perceived loading experience.
