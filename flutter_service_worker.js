'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "8b44c3cfc6ed3e516ac86cf728a12959",
"version.json": "6d4fed07e00a8e3bdc0e96a14e1ab7c6",
"index.html": "7b8017e5195b638b6ddacb821b798043",
"/": "7b8017e5195b638b6ddacb821b798043",
"main.dart.js": "7b3211a53a658292af47aef1391a081a",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "2d98848293426571b26c4e07c1b21e50",
"icons/Icon-192.png": "53a426a1b58f56372b7a9ac32438f710",
"icons/Icon-maskable-192.png": "53a426a1b58f56372b7a9ac32438f710",
"icons/Icon-maskable-512.png": "46a24a03288d5c3486ae52262e1922e6",
"icons/Icon-512.png": "46a24a03288d5c3486ae52262e1922e6",
"manifest.json": "9d60449a110ebafe949b6abd9131d996",
"assets/images/l_par8.jpeg": "53b4b0d7bf4719602500cfdeddbae581",
"assets/images/l_par4.jpeg": "be219a91753d92d642fc89932cf19c17",
"assets/images/l_par5.jpeg": "6947231154d0bdb2ca9ff4afb1829af6",
"assets/images/l_suma.png": "c340467a881ebb262a269292486559c6",
"assets/images/l_par2.jpeg": "2f14a1458ab3fb722df6c3b79ad4a7cb",
"assets/images/l_corazon.jpeg": "24ea8ce9d0a7091c87cc82b8e52c1e11",
"assets/images/l_par3.jpeg": "9dbcf4c77de9226ba900744d4230f643",
"assets/images/test1.jpeg": "9bb4e188581240286417187e232c4b38",
"assets/images/background.png": "0564de0c80dbcae74ffce0f6a09dc3c0",
"assets/images/test2.jpeg": "11346c7dce688552f9b834067e2120d5",
"assets/images/test3.jpeg": "74e1950d7c75cce212743bfd5a0bf432",
"assets/images/l_par1.jpeg": "74ac7ebda55de2f63ccdb6734ed8639b",
"assets/images/l_par6.jpeg": "0ebc6d386f3ea7ca53162413722d8a5c",
"assets/images/l_par7.jpeg": "583cea835c012293504f2f59069c961d",
"assets/AssetManifest.json": "bd8e03d835ddafcc1ec03de45c0da2ad",
"assets/NOTICES": "a9c7678f79fc96eb4b30446c9da9fcf5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "60ba7710c8d673a1a57161467cc4055f",
"assets/background.mp4": "8e4f3184a835bea506ea0e4f94cf6567",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "b0dacd6a7f778add55a36f9333a88742",
"assets/fonts/MaterialIcons-Regular.otf": "fd36a16819423120fc17ce4e8e081d88",
"assets/assets/songs/celos.mp3": "86c50e6176c14c9d6ab51ae8af023ffb",
"assets/assets/songs/cama_y_mesa.mp3": "96251a694972f5dc3cf503f6dc71a290",
"assets/assets/songs/eres_mi_persona_favorita.mp3": "5f578c9d7a7595560c293dc3697ad7bd",
"assets/assets/songs/si_nos_dejan.mp3": "51273ee5aa785a4fc2463d6b5ae11730",
"assets/assets/songs/bendita_tu_luz.mp3": "06319a1341d0c5a8b33e63227233e11c",
"assets/assets/songs/dia_tras_dia.mp3": "a4fd3143c665719f89c29f6a964effd2",
"assets/assets/songs/aprender_a_quererte.mp3": "76c1a16da811858d4fb00ec1f34ea6a8",
"assets/assets/songs/rio.mp3": "3167618cd6d79c3c4610fcfe3d370e33",
"assets/assets/songs/imaginate.mp3": "c9727f4971acbe3d6a191c62d3a6e0f7",
"assets/assets/images/l_par8.jpeg": "53b4b0d7bf4719602500cfdeddbae581",
"assets/assets/images/l_par4.jpeg": "be219a91753d92d642fc89932cf19c17",
"assets/assets/images/l_par5.jpeg": "6947231154d0bdb2ca9ff4afb1829af6",
"assets/assets/images/l_suma.png": "c340467a881ebb262a269292486559c6",
"assets/assets/images/l_par2.jpeg": "2f14a1458ab3fb722df6c3b79ad4a7cb",
"assets/assets/images/l_corazon.jpeg": "24ea8ce9d0a7091c87cc82b8e52c1e11",
"assets/assets/images/l_par3.jpeg": "9dbcf4c77de9226ba900744d4230f643",
"assets/assets/images/test1.jpeg": "9bb4e188581240286417187e232c4b38",
"assets/assets/images/background.png": "0564de0c80dbcae74ffce0f6a09dc3c0",
"assets/assets/images/test2.jpeg": "11346c7dce688552f9b834067e2120d5",
"assets/assets/images/test3.jpeg": "74e1950d7c75cce212743bfd5a0bf432",
"assets/assets/images/l_par1.jpeg": "74ac7ebda55de2f63ccdb6734ed8639b",
"assets/assets/images/l_par6.jpeg": "0ebc6d386f3ea7ca53162413722d8a5c",
"assets/assets/images/l_par7.jpeg": "583cea835c012293504f2f59069c961d",
"assets/assets/background.mp4": "8e4f3184a835bea506ea0e4f94cf6567",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
