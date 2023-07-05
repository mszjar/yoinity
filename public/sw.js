importScripts('https://storage.googleapis.com/workbox-cdn/releases/6.1.5/workbox-sw.js');

if (workbox) {
  console.log(`Workbox is loaded`);

  workbox.routing.registerRoute(
    new RegExp('https://www.yoinity.com/p/'),
    new workbox.strategies.CacheFirst({
      cacheName: 'posts',
    })
  );

  workbox.routing.registerRoute(
    /^https:\/\/yoinityremixes\.s3\.eu-west-3\.amazonaws\.com\/.*/,
    new workbox.strategies.CacheFirst({
      cacheName: 'media',
      plugins: [
        new workbox.expiration.ExpirationPlugin({
          maxEntries: 100,
          maxAgeSeconds: 30 * 24 * 60 * 60, // 30 Days
        }),
      ],
    })
  );

  // FOR API CALLS
  // workbox.routing.registerRoute(
  //   new RegExp('https://your-app-domain/api/'),
  //   new workbox.strategies.NetworkFirst({
  //     cacheName: 'api',
  //   })
  // );

} else {
  console.log(`Workbox didn't load`);
}
