'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"index.html": "029605c0bc275e8fd19471896752d8ef",
"/": "029605c0bc275e8fd19471896752d8ef",
"assets/NOTICES": "95677c8c472099bcaaee428b7980032b",
"assets/assets/avatars/alex.png": "a2e85118af3215f20a2047704442a5a0",
"assets/assets/avatars/andy.png": "1dec9b0a6625dc96bbd9b24ce96660c0",
"assets/assets/avatars/jackson.jpg": "97dde76b17d7f5bbd516362232f0d12f",
"assets/assets/avatars/priyanka.png": "d43bac4166d11860ae5774ea9f7e12f6",
"assets/assets/avatars/alyssa.jpg": "b3a4a4650c3fa7a1aeed1489eb62b4b8",
"assets/assets/avatars/tushar.jpg": "51b37ed8af5d1dff1efa95f2fd4465e8",
"assets/assets/avatars/wendy.jpg": "b16a1d7494222e3fabb4cbae32c691f7",
"assets/assets/pics/customer_journey.png": "8c2bba50ee2d89ae307f4c73fca93eea",
"assets/assets/pics/gestalt_principles.png": "6b74cf7b346896567ccd4f67837eb2d2",
"assets/assets/pics/user_persona.png": "76038ad822371abc92a079af6de9184c",
"assets/assets/pics/comparative_analysis.png": "47fa1156b1a148474e7227a55f0a8767",
"assets/assets/pics/customer_voice.png": "7f07deaa6e6856f2b96da8de38a3ab0e",
"assets/assets/pics/card_sorting.jpg": "afc0877901c854bdb729fa4a2d35905a",
"assets/assets/pics/tree_testing.png": "182e188e806f58f1c1e3fe035398b1d4",
"assets/assets/pics/a_b_testing.png": "de9a06b4cb77f83807eff27834a59700",
"assets/assets/pics/customer_survey.png": "372eb43a693d839e7e2fdf7b2454db38",
"assets/assets/prototype/events.png": "8a7c280d43a6eb684789aa30dfeb798b",
"assets/assets/prototype/calendar.png": "54fd7b80909aed584cf37c0fa53ecf61",
"assets/assets/prototype/donation_money.png": "1a1f81d0fcf13fad7e3d566a4e873428",
"assets/assets/prototype/contact_us.png": "eb7c424e20098ee53e204d3fb96cac9a",
"assets/assets/prototype/get_involved.png": "969b538780cf6babc98e69bac4b6cde0",
"assets/assets/prototype/summer_camp.png": "85f043d2be324ab4770a948a6b26f253",
"assets/assets/prototype/about_us.png": "01ae8dfbb4d9370c300c088273801d2e",
"assets/assets/prototype/homepage.png": "93becfc7b7890a737753e34c22917bad",
"assets/assets/prototype/after_school.png": "c6cfd0ea39e7d8a30ee22f5c4730aaae",
"assets/assets/prototype/donation_food.png": "79e3cb31f0d8a13f31e4579112ed5f15",
"assets/assets/prototype/food_pantry.png": "7e8aa13422b9e6b5e2f31493fb62d18a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "932aef9c9fc7b76b1dff06594112839e",
"assets/fonts/MaterialIcons-Regular.otf": "2ef5a459acef35275d0289f3bf90bcf8",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "eff4f9558576916de948c9dec0fc8b52",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/AssetManifest.json": "5fcabf1c94a9b0e43e9a0cd48356ddf3",
"version.json": "7f99094ce07dda291f6273ae266d5b48",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"main.dart.js": "576f7f3548b8a39a0a9709201f43aa11",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "e399257167700621ccdd9ff3bcd19b66",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "0b563bcb8d8233814cb350e6e4a3434f"};
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
